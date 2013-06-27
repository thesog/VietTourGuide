<?php

class Cp_AreaRangeController extends Zend_Controller_Action
{

    public $model;

    public $form;

    public function init ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            return $this->_redirect('cp/user/login');
        }
        
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/cp");
        Zend_Layout::startMvc($option);
                        
        $this->model = new Cp_Model_AreaRange();
        $this->form = new Cp_Form_AreaRange();
    }

    public function indexAction ()
    {
        $this->_helper->redirector('list', 'article', 'cp');
    
    }

    public function listAction ()
    {
        $this->view->headTitle("Khoản giá - KunaViet CMS");
        
        $order = array();
        $filter = array();
        
        $filter_keywords = isset($_SESSION['arearange']['filter']['keywords']) ? $_SESSION['arearange']['filter']['keywords'] : '';
        $filter_keywords = isset($_POST['filter_key']) ? $_POST['filter_key'] : $filter_keywords;
        $_SESSION['arearange']['filter']['keywords'] = $filter_keywords;
        $filter['name'] = $_SESSION['arearange']['filter']['keywords'];
        
        $order_field = isset($_SESSION['arearange']['filter']['order_field']) ? $_SESSION['arearange']['filter']['order_field'] : 'name';
        $order_dir = isset($_SESSION['arearange']['filter']['order_dir']) ? $_SESSION['arearange']['filter']['order_dir'] : 'DESC';
        if (isset($_POST['order_field']) && $_POST['order_field'] != '') {
            $order_field = $_POST['order_field'];
            $order_dir = $_POST['order_dir'];
        }
        $_SESSION['arearange']['filter']['order_field'] = $order_field;
        $_SESSION['arearange']['filter']['order_dir'] = $order_dir;
        
        $order['field'] = $_SESSION['arearange']['filter']['order_field'];
        $order['dir'] = $_SESSION['arearange']['filter']['order_dir'];
        
        $this->view->next_order_dir = ($order_dir == 'ASC') ? 'DESC' : 'ASC';
        $this->view->keysearch = $filter['name'];
        
        $adapter = new Zend_Paginator_Adapter_DbSelect(
                $this->model->gettall($filter, $order));
        
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
                    return $this->_redirect('cp/area-range/list');
                } else 
                    if ('reset' == $_POST['submit_option']) {
                        unset($_SESSION['arearange']);
                        return $this->_redirect('cp/area-range/list');
                    }
        
        }
    }

    public function deleteItem ($ids)
    {
        if (is_array($ids)) {
            foreach ($ids as $id) {
                if ($id != 1) {
                    $this->model->deleteItem($id);
                
                }
            }
        } else {
            $this->model->deleteItem($ids);
        }
    }

    public function editAction ()
    {
        $this->view->headTitle("Sửa khoản khoản diện tích - KunaViet CMS");
        
        $vnnHelpers = new VNN_Helpers();
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $fields = array();
        
        if ($this->_request->isPost() && $this->form->isValid($_POST)) {
            
            $fields['name'] = $this->form->getValue('name');
            
            $fields['alias'] = ($this->form->getValue('alias') != '') ? $this->form->getValue(
                    'alias') : $vnnHelpers->filterUrlParam($fields['name']);
            
            $fields['publish'] = $this->form->getValue('publish');
            
            $this->model->edit($id, $fields);
            
            if ('save_and_new' == $_POST['submit_option']) {
                $this->view->message = array();
                $this->view->message[] = 'Đã sửa thành công!';
                
            
            } else 
                if ('save' == $_POST['submit_option']) {
                    return $this->_redirect('cp/area-range/list');
                }
        
        }
        
        $this->form->populate($row->toArray());
        
        $publish = $this->form->getElement('publish');
        if ($row['publish'] == 1) {
            $publish->setValue('1');
        } else {
            $publish->setValue('0');
        }
        $this->view->id = $id;
        $this->view->form = $this->form;
        
    }

    public function addAction ()
    {
        
        $this->view->headTitle("Thêm khoản diện tích - KunaViet CMS");
        
        $vnnHelpers = new VNN_Helpers();
        
        $fields = array();
        
        if ($this->_request->isPost() && $this->form->isValid($_POST)) {
            
            // get the posted data
            
            $fields['name'] = $this->form->getValue('name');
            $fields['alias'] = ($this->form->getValue('alias') != '') ? $this->form->getValue(
                    'alias') : $vnnHelpers->filterUrlParam($fields['name']);
            $fields['publish'] = $this->form->getValue('publish');
            $fields['ordering'] = 0;
            
            $this->model->create($fields);
            
            if ('save_and_new' == $_POST['submit_option']) {
                
                $this->view->message = array();
                $this->view->message[] = 'Đã thêm mới thành công!';
            } else 
                if ('save' == $_POST['submit_option']) {
                    return $this->_redirect('cp/area-range/list');
                }
        
        }
        
        $this->view->form = $this->form;
    }

    public function checkOrUncheckAction ()
    {
        $id = $this->_request->getParam('id');
        $field_label = $this->_request->getParam('field_label');
        $result = $this->model->checkOrUncheck($id, $field_label);
        
        $this->_helper->layout()->disableLayout();
        $this->view->result = $result;
    }

    public function imgAjaxDelAction ()
    {
        $vnnHelpers = new VNN_Helpers();
        $id = $this->_request->getParam('id');
        $img_name = $this->_request->getParam('img_name');
        $row = $this->model->find($id)->current();
        
        $imgArr = $vnnHelpers->toImgArr($row['image_arr']);
        $imgArr_temp = array();
        foreach ($imgArr as $img) {
            if ($img != $img_name) {
                $imgArr_temp[] = $img;
            } else 
                if (file_exists(UPLOAD_PATH . '/@FILES/' . $img)) {
                    unlink(UPLOAD_PATH . '/@FILES/' . $img);
                }
        }
        
        $new_imgStr = $vnnHelpers->toImgStr($imgArr_temp);
        
        $fields = array();
        $fields['image_arr'] = $new_imgStr;
        $this->model->edit($id, $fields);
        
        $this->_helper->layout()->disableLayout();
        $this->view->result = null;
    }
    
    public function orderingChangeAction() {
        $vnnHelpers = new VNN_Helpers();
        $id = $this->_request->getParam('id');
        $value = (int)$this->_request->getParam('value');
        $row = $this->model->find($id)->current();
    
        $fields = array();
        $fields['ordering'] = $value;
        $this->model->edit($id, $fields);
    
        $this->_helper->layout()->disableLayout();
        $this->view->result = $fields['ordering'];
    }
}