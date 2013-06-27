<?php

class Cp_ArticleController extends Zend_Controller_Action
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
        
        $this->model = new Cp_Model_Article();
        $this->form = new Cp_Form_Article();
    }

    public function indexAction ()
    {
        $this->_helper->redirector('list', 'article', 'cp');
    
    }

    public function listAction ()
    {
        $this->view->headTitle("Bài viết - KunaViet CMS");
        
        $order = array();
        $filter = array();
        
        $filter_keywords = isset($_SESSION['filter']['keywords']) ? $_SESSION['filter']['keywords'] : '';
        $filter_keywords = isset($_POST['filter_key']) ? $_POST['filter_key'] : $filter_keywords;
        $_SESSION['filter']['keywords'] = $filter_keywords;
        $filter['name'] = $_SESSION['filter']['keywords'];
        
        $order_field = isset($_SESSION['filter']['order_field']) ? $_SESSION['filter']['order_field'] : 'date_create';
        $order_dir = isset($_SESSION['filter']['order_dir']) ? $_SESSION['filter']['order_dir'] : 'DESC';
        if (isset($_POST['order_field']) && $_POST['order_field'] != '') {
            $order_field = $_POST['order_field'];
            $order_dir = $_POST['order_dir'];
        }
        $_SESSION['filter']['order_field'] = $order_field;
        $_SESSION['filter']['order_dir'] = $order_dir;
        
        $order['field'] = $_SESSION['filter']['order_field'];
        $order['dir'] = $_SESSION['filter']['order_dir'];
        
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
                    return $this->_redirect('cp/article/list');
                } else 
                    if ('reset' == $_POST['submit_option']) {
                        unset($_SESSION['filter']);
                        return $this->_redirect('cp/article/list');
                    }
        
        }
    }

    public function deleteItem ($ids)
    {
        if (is_array($ids)) {
            foreach ($ids as $id) {
                if ($id != 1) {
                    $this->model->deleteArticle($id);
    
                }
            }
        } else {
            $this->model->deleteArticle($ids);
        }
    }
    
    public function editAction ()
    {
        $this->view->headTitle("Sửa bài viết - KunaViet CMS");
        
        $vnnHelpers = new VNN_Helpers();
        $form_meta = new Cp_Form_Meta();
        
        $meta_model = new Cp_Model_Meta();
        $pg_model = new Cp_Model_Articlegroup();
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $fields = array();
        $meta = array();
        $product_detail = array();
        
        if ($this->_request->isPost() && $this->form->isValid($_POST) &&
                 $form_meta->isValid($_POST)) {
                    
                    // get the posted data
                    
                    $productDetailModel = new Cp_Model_ProductDetail();
                    
                    $filesUploaded = $vnnHelpers->upload(
                            UPLOAD_PATH . '/@FILES');
                    
                    $strFilesName = $vnnHelpers->toImgStr($filesUploaded);
                    $strFilesName .= $row['image_arr'];
                    
                    $meta['title'] = $form_meta->getValue('meta_title');
                    $meta['keywords'] = $form_meta->getValue('meta_keywords');
                    $meta['description'] = $form_meta->getValue(
                            'meta_description');
                    $meta['robots'] = $form_meta->getValue('meta_robots');
                    
                    $fields['name'] = $this->form->getValue('name');
                    $fields['code'] = $this->form->getValue('code');
                    $fields['alias'] = ($this->form->getValue('alias') != '') ? $this->form->getValue(
                            'alias') : $vnnHelpers->filterUrlParam(
                            $fields['name']);
                    
                    $fields['date_update'] = mktime();
                    $fields['image_arr'] = $strFilesName;
                    $fields['b_summarize'] = $this->form->getValue(
                            'b_summarize');
                    $fields['b_content'] = $this->form->getValue('b_content');
                    $fields['article_group_id'] = $this->form->getValue(
                            'article_group');
                    $fields['publish'] = $this->form->getValue('publish');
                    $fields['hits'] = 0;
                    $meta_model->edit($row['meta_id'], $meta);
                    
                    $this->model->edit($id, $fields);
                    
                    if ('save_and_new' == $_POST['submit_option']) {
                        
                        $vnnHelpers->jsAlert("Sửa thành công.");
                        return $this->_redirect('cp/article/edit/id/' . $id);
                    
                    } else 
                        if ('save' == $_POST['submit_option']) {
                            return $this->_redirect('cp/article/list');
                        }
                
                }
                
                $this->form->populate($row->toArray());
                
                $pg_adapter = new Zend_Paginator_Adapter_DbSelect(
                        $pg_model->listall());
                $pg_list = new Zend_Paginator($pg_adapter);
                $pg_list->setItemCountPerPage();
                $product_group = $this->form->getElement('article_group');
                
                foreach ($pg_list as $pg_item) {
                    
                    $temp = '';
                    for ($i = 1; $i <= $pg_item['level']; ++ $i) {
                        $temp .= '.---';
                    }
                    if ($row['article_group_id'] == $pg_item['id']) {
                        
                        $product_group->addMultiOption($pg_item['id'], 
                                $temp . $pg_item['name']);
                        $product_group->setValue($pg_item['id']);
                    
                    } else {
                        $product_group->addMultiOption($pg_item['id'], 
                                $temp . $pg_item['name']);
                    }
                }
                
                $publish = $this->form->getElement('publish');
                if ($row['publish'] == 1) {
                    $publish->setValue('1');
                } else {
                    $publish->setValue('0');
                }
                
                $rowMeta = $meta_model->find($row['meta_id'])->current();
                $form_meta->getElement('meta_title')->setValue(
                        $rowMeta['title']);
                $form_meta->getElement('meta_keywords')->setValue(
                        $rowMeta['keywords']);
                $form_meta->getElement('meta_description')->setValue(
                        $rowMeta['description']);
                $form_meta->getElement('meta_robots')->setValue(
                        $rowMeta['robots']);
                
                $cur_images_arr = $vnnHelpers->toImgArr($row['image_arr']);
                
                $images = $this->form->getElement('attachment');
                
                $this->view->id = $id;
                $this->view->form = $this->form;
                $this->view->form_meta = $form_meta;
                $this->view->form_images = $images;
                $this->view->cur_images_arr = $cur_images_arr;
            }

            public function addAction ()
            {
                
                $this->view->headTitle("Thêm bài viết - KunaViet CMS");
                
                $form = new Cp_Form_Article();
                $form_meta = new Cp_Form_Meta();
                $vnnHelpers = new VNN_Helpers();
                
                $fields = array();
                $meta = array();
                
                if ($this->_request->isPost() && $form->isValid($_POST) &&
                         $form_meta->isValid($_POST)) {
                            
                            // get the posted data
                            
                            $metaModel = new Cp_Model_Meta();
                            
                            $filesUploaded = $vnnHelpers->upload(
                                    UPLOAD_PATH . '/@FILES');
                            
                            $strFilesName = $vnnHelpers->toImgStr(
                                    $filesUploaded);
                            
                            $meta['title'] = $form_meta->getValue('meta_title');
                            $meta['keywords'] = $form_meta->getValue(
                                    'meta_keywords');
                            $meta['description'] = $form_meta->getValue(
                                    'meta_description');
                            $meta['robots'] = $form_meta->getValue(
                                    'meta_robots');
                            
                            $fields['name'] = $form->getValue('name');
                            $fields['code'] = $form->getValue('code');
                            $fields['alias'] = ($form->getValue('alias') != '') ? $form->getValue(
                                    'alias') : $vnnHelpers->filterUrlParam(
                                    $fields['name']);
                            $fields['date_create'] = mktime();
                            $fields['date_update'] = $fields['date_create'];
                            $fields['image_arr'] = $strFilesName;
                            $fields['b_summarize'] = $form->getValue(
                                    'b_summarize');
                            $fields['b_content'] = $form->getValue('b_content');
                            $fields['article_group_id'] = $form->getValue(
                                    'article_group');
                            $fields['publish'] = $form->getValue('publish');
                            $fields['hits'] = 0;
                            
                            $fields['meta_id'] = $metaModel->create($meta);
                            
                            $this->model->create($fields);
                            
                            if ('save_and_new' == $_POST['submit_option']) {
                                
                                $this->view->message = array();
                                $this->view->message[] = 'Đã thêm mới thành công!';
                            } else 
                                if ('save' == $_POST['submit_option']) {
                                    return $this->_redirect('cp/article/list');
                                }
                        
                        }
                        
                        $model = new Cp_Model_Articlegroup();
                        $adapter = new Zend_Paginator_Adapter_DbSelect(
                                $model->listall());
                        $product_groups = new Zend_Paginator($adapter);
                        $product_groups->setItemCountPerPage();
                        
                        $product_group = $form->getElement('article_group');
                        
                        foreach ($product_groups as $pg) {
                            
                            $temp = '';
                            for ($i = 1; $i <= $pg['level']; ++ $i) {
                                $temp .= '.--- ';
                            }
                            $product_group->addMultiOption($pg['id'], 
                                    $temp . $pg['name']);
                        
                        }
                        
                        $images = $form->getElement('attachment');
                        
                        $this->view->form = $form;
                        $this->view->form_meta = $form_meta;
                        $this->view->form_images = $images;
                    }

                    public function checkOrUncheckAction ()
                    {
                        $id = $this->_request->getParam('id');
                        $field_label = $this->_request->getParam('field_label');
                        $result = $this->model->checkOrUncheck($id, 
                                $field_label);
                        
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
                }