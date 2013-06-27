<?php

class Cp_UserController extends Zend_Controller_Action
{

    public $model;

    public $form;

    public function init ()
    {
        
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/cp");
        Zend_Layout::startMvc($option);
        
        $this->model = new Cp_Model_User();
        $this->form = new Cp_Form_User();
    }

    public function indexAction ()
    {
        $this->_helper->redirector('list', 'user', 'cp');
    }

    public function loginAction ()
    {
        $this->_helper->layout()->disableLayout();
        
        $fields = array();
        $formLogin = new Cp_Form_UserLogin();
        
        if ($this->_request->isPost() && $formLogin->isValid($_POST)) {
            
            $fields['username'] = $formLogin->getValue('username');
            $fields['password'] = $formLogin->getValue('password');
            
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
                return $this->_redirect('cp/');
            } else {
                $this->view->loginMessage = "Sorry, your username or 
                password was incorrect";
            }
        }
        
        $this->view->form = $formLogin;
    }

    public function logoutAction ()
    {
        $authAdapter = Zend_Auth::getInstance();
        $authAdapter->clearIdentity();
        return $this->_redirect('cp/user/login');
    }

    public function listAction ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            $this->_helper->redirector('login', 'user', 'cp');
        }
        
        $this->view->headTitle("Thành viên - KunaViet CMS");
        
        $order = array();
        $filter = array();
        
        $filter_keywords = isset($_SESSION['user']['filter']['keywords']) ? $_SESSION['user']['filter']['keywords'] : '';
        $filter_keywords = isset($_POST['filter_key']) ? $_POST['filter_key'] : $filter_keywords;
        $_SESSION['user']['filter']['keywords'] = $filter_keywords;
        $filter['user']['username'] = $_SESSION['user']['filter']['keywords'];
        
        $order_field = isset($_SESSION['user']['filter']['order_field']) ? $_SESSION['user']['filter']['order_field'] : 'date_create';
        $order_dir = isset($_SESSION['user']['filter']['order_dir']) ? $_SESSION['user']['filter']['order_dir'] : 'DESC';
        if (isset($_POST['order_field']) && $_POST['order_field'] != '') {
            $order_field = $_POST['order_field'];
            $order_dir = $_POST['order_dir'];
        }
        $_SESSION['user']['filter']['order_field'] = $order_field;
        $_SESSION['user']['filter']['order_dir'] = $order_dir;
        
        $order['field'] = $_SESSION['user']['filter']['order_field'];
        $order['dir'] = $_SESSION['user']['filter']['order_dir'];
        
        $this->view->next_order_dir = ($order_dir == 'ASC') ? 'DESC' : 'ASC';
        $this->view->keysearch = $filter['user']['username'];
        
        $adapter = new Zend_Paginator_Adapter_DbSelect(
                $this->model->gettall($filter['user'], $order));
        
        $paginator = new Zend_Paginator($adapter);
        $paginator->setItemCountPerPage(36);
        $page = $this->_request->getParam('page', 1);
        $paginator->setCurrentPageNumber($page);
        
        $this->view->paginator = $paginator;
        $this->view->curPageCount = $paginator->getCurrentItemCount();
        
        if (isset($_POST['submit_option'])) {
            if ('ordering' == $_POST['submit_option']) {
                $this->ordering($paginator, $_POST['ordering']);
            } else 
                if ('delete' == $_POST['submit_option']) {
                    $this->deleteItem($_POST['cid']);
                    return $this->_redirect('cp/user/list');
                } else 
                    if ('reset' == $_POST['submit_option']) {
                        unset($_SESSION['user']);
                        return $this->_redirect('cp/user/list');
                    }
        
        }
    }

    public function deleteItem ($ids)
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            $this->_helper->redirector('login', 'user', 'cp');
        }
        
        if (is_array($ids)) {
            foreach ($ids as $id) {
                if ($id != 1) {
                    $this->model->deleteUser($id);
                
                }
            }
        } else {
            $this->model->deleteUser($ids);
        }
    }

    public function checkOrUncheckAction ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            $this->_helper->redirector('login', 'user', 'cp');
        }
        
        $id = $this->_request->getParam('id');
        $field_label = $this->_request->getParam('field_label');
        $result = $this->model->checkOrUncheck($id, $field_label);
        
        $this->_helper->layout()->disableLayout();
        $this->view->result = $result;
    }

    public function addAction ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            $this->_helper->redirector('login', 'user', 'cp');
        }
        
        $this->view->headTitle("Thêm thành viên - KunaViet CMS");
        $this->view->message = array();
        
        $vnnHelpers = new VNN_Helpers();
        
        $fields = array();
        
        if ($this->_request->isPost() && $this->form->isValid($_POST)) {
            
            $errors = true;
            
            $fields['username'] = $this->form->getValue('username');
            $fields['password'] = $this->form->getValue('password');
            $password_confirm = $this->form->getValue('password_confirm');
            
            if ($fields['password'] != $password_confirm) {
                $errors = false;
                $this->view->message[] = 'Xác nhận mật khẩu không đúng.';
            }
            
            $fields['email'] = $this->form->getValue('email');
            $fields['firstname'] = $this->form->getValue('firstname');
            $fields['lastname'] = $this->form->getValue('lastname');
            $fields['phone'] = $this->form->getValue('phone');
            $fields['address'] = $this->form->getValue('address');
            $fields['user_group_id'] = $this->form->getValue('user_group_id');
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            
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
                
                if ('save_and_new' == $_POST['submit_option']) {
                    
                    $this->view->message = array();
                    $this->view->message[] = 'Đã thêm mới thành công!';
                } else {
                    if ('save' == $_POST['submit_option']) {
                        return $this->_redirect('cp/user/list');
                    }
                }
            }
        
        }
        
        $user_group = new Cp_Model_UserGroup();
        $user_groups = $user_group->selectAll();
        
        $user_group_id = $this->form->getElement('user_group_id');
        
        foreach ($user_groups as $ug) {
            
            $user_group_id->addMultiOption($ug['id'], $ug['name']);
        
        }
        
        $this->view->form = $this->form;
    
    }

    public function editAction ()
    {
        
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            $this->_helper->redirector('login', 'user', 'cp');
        }
        
        $this->view->headTitle("Sửa thành viên - KunaViet CMS");
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $this->view->message = array();
        $vnnHelpers = new VNN_Helpers();
        $fields = array();
        
        $this->form->getElement('password')->setRequired(false);
        $this->form->getElement('password_confirm')->setRequired(false);
        
        if ($this->_request->isPost() && $this->form->isValid($_POST)) {
            
            $errors = true;
            // get the posted data
            
            $metaModel = new Cp_Model_Meta();
            
            $fields['username'] = $this->form->getValue('username');
            if ($this->form->getValue('password') != '') {
                $fields['password'] = $this->form->getValue('password');
                $password_confirm = $this->form->getValue('password_confirm');
                
                if ($fields['password'] != $password_confirm) {
                    $errors = false;
                    $this->view->message[] = '- Xác nhận mật khẩu không đúng.';
                }
            }
            $fields['email'] = $this->form->getValue('email');
            $fields['firstname'] = $this->form->getValue('firstname');
            $fields['lastname'] = $this->form->getValue('lastname');
            $fields['phone'] = $this->form->getValue('phone');
            $fields['address'] = $this->form->getValue('address');
            $fields['user_group_id'] = $this->form->getValue('user_group_id');
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            
            /* Kiểm tra trùng tên đăng nhập và email */
            $userscheck = $this->model->selectAll();
            foreach ($userscheck as $user) {
                if ($user['username'] == $fields['username'] &&
                         $fields['username'] != $row['username']) {
                            $errors = false;
                            $this->view->message[] = 'Tên đăng nhập đã tồn tại.';
                            break;
                        }
                        if ($user['email'] == $fields['email'] &&
                                 $fields['email'] != $row['email']) {
                                    $errors = false;
                                    $this->view->message[] = 'Email đã tồn tại.';
                                    break;
                                }
                            }
                            
                            if ($errors == true) {
                                $this->model->edit($id, $fields);
                                
                                if ('save_and_new' == $_POST['submit_option']) {
                                    
                                    $this->view->message = array();
                                    $this->view->message[] = 'Đã sửa thành công!';
                                } else {
                                    if ('save' == $_POST['submit_option']) {
                                        return $this->_redirect('cp/user/list');
                                    }
                                }
                            }
                        
                        }
                        
                        $this->form->populate($row->toArray());
                        
                        $this->form->getElement('password')->setValue('');
                        $this->form->getElement('password_confirm')->setValue(
                                '');
                        
                        $user_group = new Cp_Model_UserGroup();
                        $user_groups = $user_group->selectAll();
                        
                        $user_group_id = $this->form->getElement(
                                'user_group_id');
                        
                        foreach ($user_groups as $ug) {
                            if ($row['user_group_id'] == $ug['id']) {
                                
                                $user_group_id->addMultiOption($ug['id'], 
                                        $ug['name']);
                                $user_group_id->setValue($ug['id']);
                            
                            } else {
                                $user_group_id->addMultiOption($ug['id'], 
                                        $ug['name']);
                            }
                        }
                        
                        $this->view->form = $this->form;
                    
                    }
                }