<?php

class UserController extends Zend_Controller_Action
{

    public $model;

    public $form;

    public function init ()
    {
        
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/viettourguide");
        Zend_Layout::startMvc($option);
        
        $this->model = new Cp_Model_User();
        $this->form = new Cp_Form_User();
    }

    public function registerAction ()
    {
        $form_userRegister = new Cp_Form_UserRegister();
        $this->view->form_register = $form_userRegister;
        
        $this->view->message = array();
        
        if ($this->_request->isPost() && $form_userRegister->isValid($_POST)) {
            $errors = true;
            
            $fields['username'] = $form_userRegister->getValue('username');
            $fields['password'] = $form_userRegister->getValue('password');
            $password_confirm = $form_userRegister->getValue('password_confirm');
            
            if ($fields['password'] != $password_confirm) {
                $errors = false;
                $this->view->message[] = 'Xác nhận mật khẩu không đúng.';
            }
            
            $fields['email'] = $form_userRegister->getValue('email');
            $fields['firstname'] = $form_userRegister->getValue('firstname');
            $fields['lastname'] = $form_userRegister->getValue('lastname');
            $fields['phone'] = $form_userRegister->getValue('phone');
            $fields['address'] = $form_userRegister->getValue('address');
            $fields['user_group_id'] = 1;
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            $fields['publish'] = 0;
            
            /* Kiểm tra trùng tên đăng nhập và email */
            $userscheck = $this->model->selectAll();
            
            foreach ($userscheck as $user) {
                if ($user['username'] == $fields['username']) {
                    $errors = false;
                    $this->view->message[] = 'Tên đăng nhập đã tồn tại.';
                    break;
                }
                if ($user['email'] == $fields['email']) {
                    $errors = false;
                    $this->view->message[] = 'Email đã tồn tại.';
                    break;
                }
            }
            
            if ($errors == true) {
                $this->model->create($fields);
                
                // load the template
                $message = '<h1>Xác nhận đăng ký tài khoản</h1>
                    <p>VUi lòng nhấn vào link bên dưới để xác nhận đăng ký tài khoản tại website BĐS:</p>
                    <a href="http://www.canhohcm.net/essay.local/public/user/confirm/id/' 
                . md5($fields['password']) . '">' 
                        . 'http://www.canhohcm.net/essay.local/public/user/confirm/id/' . md5($fields['password']) . '</a>';
                
                // send mail
                $mail = new Zend_Mail('UTF-8');
                // set the subject
                $mail->setSubject('Xác nhận đăng ký tài khoản');
                // set the message's from address to the person who submitted the
                // form
                $mail->setFrom($fields['email'], $fields['firstname']);
                // for the sake of this example you can hardcode the recipient
                $mail->addTo('vuongngocnam@gmail.com', 'webmaster');
                $mail->setBodyHtml($message);
                $result = $mail->send();
                // inform the view with the status
                $this->view->messageProcessed = true;
                if ($result) {
                    $this->view->message[] = 'Đăng ký thành công! Kiểm tra email để kích hoạt tài khoản!';
                }
                else {
                    $this->view->message[] = 'Gửi mail kích hoạt không thành công. Thử lại!';
                }
                
            }
        }
        
        $this->view->headTitle('Đăng ký tài khoản', 'SET');
    }
    
    public function confirmAction() {
        $id = $this->_request->getParam('id');
        $userconfirm = $this->model->fetchRow($this->model->select()->where('password = ?', $id));
        if ($userconfirm) {
            $data['publish'] = 1;
            
            $this->model->edit($userconfirm['id'], $data);
            echo 'Xác nhận thành công. Xin mời đăng nhập';
        }
        else {
            echo 'Mã xác nhận không chính xác';
        }
    }
    
    public function updateAction ()
    {
        $this->view->message = array();
        
        $auth = Zend_Auth::getInstance();
        $infoUser = $auth->getIdentity();
        if ($auth->getIdentity() == NULL) {
            $this->view->message[] = '- Chưa đăng nhập.';
            return;
        }
        
        $id = $infoUser->id;
        $row = $this->model->find($id)->current();
        
        
        
        $form_userRegister = new Cp_Form_UserRegister();
        $this->view->form_register = $form_userRegister;
        
        $form_userRegister->populate($row->toArray());
        $form_userRegister->getElement('password')->setValue('');
        $form_userRegister->getElement('password_confirm')->setValue(
                '');
    
        if ($this->_request->isPost() && $form_userRegister->isValid($_POST)) {
            
            $errors = true;
    
            $fields['username'] = $form_userRegister->getValue('username');
            $fields['password'] = $form_userRegister->getValue('password');
            $password_confirm = $form_userRegister->getValue('password_confirm');
    
            if ($fields['password'] != $password_confirm) {
                $errors = false;
                $this->view->message[] = 'Xác nhận mật khẩu không đúng.';
            }
    
            $fields['email'] = $form_userRegister->getValue('email');
            $fields['firstname'] = $form_userRegister->getValue('firstname');
            $fields['lastname'] = $form_userRegister->getValue('lastname');
            $fields['phone'] = $form_userRegister->getValue('phone');
            $fields['address'] = $form_userRegister->getValue('address');
            $fields['user_group_id'] = 1;
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            $fields['publish'] = 0;
    
            /* Kiểm tra trùng tên đăng nhập và email */
            $userscheck = $this->model->fetchAll($this->model->select()->where('id != ?', $row['id']));
            foreach ($userscheck as $user) {
                if ($user['username'] == $fields['username']) {
                    $errors = false;
                    $this->view->message[] = 'Tên đăng nhập đã tồn tại.';
                    break;
                }
                if ($user['email'] == $fields['email']) {
                    $errors = false;
                    $this->view->message[] = 'Email đã tồn tại.';
                    break;
                }
            }
            if ($errors == true) {
                $this->model->edit($id, $fields);
                $this->view->message[] = 'Thông tin đã được sửa. Kiểm tra Email để xác nhận sửa thông tin!';
            }
        }
    
        $this->view->headTitle('Chỉnh sửa thông tin', 'SET');
    }

    public function logoutAction ()
    {
        $authAdapter = Zend_Auth::getInstance();
        $authAdapter->clearIdentity();
        return $this->_redirect('/');
    }

    public function loginAction ()
    {
        
        $fields = array();
        $formLogin = new Cp_Form_UserLogin();
        
        if ($this->_request->isPost() && $formLogin->isValid($_POST)) {
            
            $fields['username'] = $formLogin->getValue('username');
            $fields['password'] = $formLogin->getValue('password');
                        
            $usercheck = $this->model->fetchRow($this->model->select()->where('username = ?', $fields['username']));
            
            if ($usercheck->publish == 1) {
                // set up the auth adapter
                // get the default db adapter
                $db = Zend_Db_Table::getDefaultAdapter();
                // create the auth adapter
                $authAdapter = new Zend_Auth_Adapter_DbTable($db, 'kn_user', 
                        'username', 'password');
                // set the username and password
                $authAdapter->setIdentity($fields['username']);
                $authAdapter->setCredential(md5($fields['password']));
                
                // authenticate
                $result = $authAdapter->authenticate();
                if ($result->isValid()) {
                    // store the username, first and last names of the user
                    $auth = Zend_Auth::getInstance();
                    $storage = $auth->getStorage();
                    $storage->write(
                            $authAdapter->getResultRowObject(
                                    array('id', 'username', 'firstname', 'lastname', 
                                            'role')));
                    return $this->_redirect('/');
                } else {
                    $this->view->loginMessage = "Sai tên đăng nhập hoặc mật khẩu";
                }
            }
            else {
                $this->view->loginMessage = "Chưa kích hoạt tài khoản. Kiểm tra email để kích hoạt tài khoản.";
            }
        }
        
        $this->view->form = $formLogin;
    }

    
}