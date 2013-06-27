<?php

class Cp_ProductGroupController extends Zend_Controller_Action
{

    public $model;

    public function init ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            return $this->_redirect('cp/user/login');
        }
        
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/cp");
        Zend_Layout::startMvc($option);
        $this->view->headTitle("KunaViet CMS");
        
        $this->model = new Cp_Model_Productgroup();
    }

    public function indexAction ()
    {
        // $proGroupModel = new Cp_Model_Productgroup();
        // $proGroupModel->create('Top Cat');
        
        $this->_helper->redirector('list', 'productgroup', 'cp');
    
    }

    public function listTestAction ()
    {
        
        $model = new Cp_Model_Productgroup();
        
        $adapter = new Zend_Paginator_Adapter_DbSelect($model->listall());
        $paginator = new Zend_Paginator($adapter);
        $paginator->setItemCountPerPage(6);
        $page = $this->_request->getParam('page', 1);
        $paginator->setCurrentPageNumber($page);
        $this->view->data = $paginator;
    }

    public function listAction ()
    {
        // /* Filter form */
        // $listToolsForm = new Form_BugReportListToolsForm();
        // $listToolsForm->setAction('bug/list');
        // $listToolsForm->setMethod('post');
        // $sort = $this->_request->getParam('sort', NULL);
        // $filterField = $this->_request->getParam('filter_field', NULL);
        // $filterValue = $this->_request->getParam('filter');
        // if (! empty($filterField)) {
        // $filter[$filterField] = $filterValue;
        // }
        // else {
        // $filter = NULL;
        // }
        /* Manual set controls value */
        // $listToolsForm->getElement('sort')->setValue($sort);
        // $listToolsForm->getElement('filter_field')->setValue($filterField);
        // $listToolsForm->getElement('filter')->setValue($filterValue);
        /* Fetch the bug paginator adapter */
        
        $model = new Cp_Model_Productgroup();
        
        $filter_keywords = isset($_SESSION['filter']['keywords']) ? $_SESSION['filter']['keywords'] : '';
        
        $filter_keywords = isset($_POST['filter_key']) ? $_POST['filter_key'] : $filter_keywords;
        
        $_SESSION['filter']['keywords'] = $filter_keywords;
        
        $adapter = new Zend_Paginator_Adapter_DbSelect(
                $model->listall(0, 
                        array('name' => $_SESSION['filter']['keywords'])));
        
                               
        $paginator = new Zend_Paginator($adapter);
        $paginator->setItemCountPerPage(36);
        $page = $this->_request->getParam('page', 1);
        $paginator->setCurrentPageNumber($page);
        echo '<pre>';
        
        foreach ($paginator as $r) {
            
            print_r($r);
        }
        echo '</pre>';
        $this->view->paginator = $paginator;
        $this->view->curPageCount = $paginator->getCurrentItemCount();
        
        if (isset($_POST['submit_option'])) {
            if ('ordering' == $_POST['submit_option']) {
                $this->ordering($paginator, $_POST['ordering']);
            } else 
                if ('delete' == $_POST['submit_option']) {
                    $this->deleteAction($_POST['cid']);
                } else 
                    if ('reset' == $_POST['submit_option']) {
                        unset($_SESSION['filter']);
                        return $this->_redirect('cp/productgroup/list');
                    }
        
        }
    }

    public function ordering ($data, $orderArr)
    {
        
        $nestedModel = new Cp_Model_Productgroup();
        $nestedModel = $nestedModel->_modelNested;
        $nestedModel->orderTree($data, $orderArr);
        return $this->_redirect('cp/productgroup/list');
    }

    public function addAction ()
    {
        $vnnHelper = new VNN_Helpers();
        $form = new Cp_Form_Productgroup();
        $form->setMethod('post');
        
        $fields = array();
        $meta = array();
        
        if ($this->_request->isPost() && $form->isValid($_POST)) {
            // get the posted data
            $fields['name'] = $form->getValue('name');
            $fields['alias'] = ($form->getValue('alias') != '') ? $form->getValue(
                    'alias') : $vnnHelper->filterUrlParam($fields['name']);
            $fields['parents'] = $form->getValue('parents');
            $fields['publish'] = $form->getValue('publish');
            
            $meta['title'] = $form->getValue('meta_title');
            $meta['keywords'] = $form->getValue('meta_keywords');
            $meta['description'] = $form->getValue('meta_description');
            $meta['robots'] = $form->getValue('meta_robots');
            
            if ('save_and_new' == $_POST['submit_option']) {
                $metaModel = new Cp_Model_Meta();
                $meta_id = $metaModel->create($meta);
                
                $proGroupModel = new Cp_Model_Productgroup();
                $fields['meta_id'] = $meta_id;
                $proGroupModel->create($fields);
                
                $form->getElement('name')->setValue('');
                $form->getElement('alias')->setValue('');
                $form->getElement('meta_title')->setValue('');
                $form->getElement('meta_keywords')->setValue('');
                $form->getElement('meta_description')->setValue('');
                
                $this->view->message = array();
                $this->view->message[] = 'Đã thêm mới thành công!';
            } else 
                if ('save' == $_POST['submit_option']) {
                    $metaModel = new Cp_Model_Meta();
                    $meta_id = $metaModel->create($meta);
                    
                    $proGroupModel = new Cp_Model_Productgroup();
                    $fields['meta_id'] = $meta_id;
                    $proGroupModel->create($fields);
                    return $this->_redirect('cp/productgroup/list');
                }
        
        }
        
        $model = new Cp_Model_Productgroup();
        $adapter = new Zend_Paginator_Adapter_DbSelect($model->listall());
        $parents_list = new Zend_Paginator($adapter);
        $parents_list->setItemCountPerPage();
        
        // $this->view->parents_list = $parents_list;
        $parents = $form->getElement('parents');
        
        foreach ($parents_list as $parent) {
            
            $temp = '';
            for ($i = 1; $i <= $parent['level']; ++ $i) {
                $temp .= '.---';
            }
            $parents->addMultiOption($parent['id'], $temp . $parent['name']);
        
        }
        
        $this->view->form = $form;
    }

    public function editAction ()
    {
        $vnnHelper = new VNN_Helpers();
        $form = new Cp_Form_Productgroup();
        $metaModel = new Cp_Model_Meta();
        $form->setMethod('post');
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        if ($this->_request->isPost() && $form->isValid($_POST)) {
            
            $fields = array();
            $meta = array();
            // get the posted data
            $fields['name'] = $form->getValue('name');
            $fields['alias'] = ($form->getValue('alias') != '') ? $form->getValue(
                    'alias') : $vnnHelper->filterUrlParam($fields['name']);
            $fields['parents'] = $form->getValue('parents');
            $fields['publish'] = $form->getValue('publish');
            
            $meta['title'] = $form->getValue('meta_title');
            $meta['keywords'] = $form->getValue('meta_keywords');
            $meta['description'] = $form->getValue('meta_description');
            $meta['robots'] = $form->getValue('meta_robots');
            
            if ('apply' == $_POST['submit_option']) {
                
                $metaModel->edit($row['meta_id'], $meta);
                
                $this->model->_modelNested->updateNode($fields, $row['id'], 
                        $fields['parents']);
                
                $this->view->message = array();
                $this->view->message[] = 'Đã cập nhật thành công!';
            } else 
                if ('save' == $_POST['submit_option']) {
                    $metaModel->edit($row['meta_id'], $meta);
                    $this->model->_modelNested->updateNode($fields, $row['id'], 
                            $fields['parents']);
                    return $this->_redirect('cp/productgroup/list');
                }
        } 
            
            $form->populate($row->toArray());
            
            $rowMeta = $metaModel->find($row['meta_id'])->current();
            $form->getElement('meta_title')->setValue($rowMeta['title']);
            $form->getElement('meta_keywords')->setValue($rowMeta['keywords']);
            $form->getElement('meta_description')->setValue(
                    $rowMeta['description']);
            $form->getElement('meta_robots')->setValue($rowMeta['robots']);
            
            $model = new Cp_Model_Productgroup();
            $adapter = new Zend_Paginator_Adapter_DbSelect($model->listall());
            $parents_list = new Zend_Paginator($adapter);
            $parents_list->setItemCountPerPage();
            
            $parents = $form->getElement('parents');
            foreach ($parents_list as $parent) {
                
                $temp = '';
                for ($i = 1; $i <= $parent['level']; ++ $i) {
                    $temp .= '.---';
                }
                if ($row['parents'] == $parent['id']) {
                    $parents->addMultiOption($parent['id'], 
                            $temp . $parent['name']);
                    $parents->setValue($parent['id']);
                } else {
                    $parents->addMultiOption($parent['id'], 
                            $temp . $parent['name']);
                }
            }
            $publish = $form->getElement('publish');
            if ($row['publish'] == 1) {
                $publish->setValue('1');
            } else {
                $publish->setValue('0');
            }
        
        
        $this->view->form = $form;
    }

    public function deleteAction ($ids)
    {
        $vnnHelper = new VNN_Helpers();
        $product_model = new Cp_Model_Product();
        foreach ($ids as $id) {
            $product_rows = $product_model->fetchAll(
                    'product_group_id = ' . $id);
            if (count($product_rows) > 0) {
                $this->model->deleteItem($ids);
                // $vnnHelper->jsAlert('Xóa sản phẩm trước khi xóa nhóm!');
            } else {
                $this->model->deleteItem($ids);
                return $this->_redirect('cp/productgroup/list');
            }
        }
    
    }

    public function checkOrUncheckAction ()
    {
        $id = $this->_request->getParam('id');
        $field_label = $this->_request->getParam('field_label');
        $model = new Cp_Model_Productgroup();
        $result = $model->checkOrUncheck($id, $field_label);
        
        $this->_helper->layout()->disableLayout();
        $this->view->result = $result;
    }
}