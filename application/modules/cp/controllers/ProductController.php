<?php

class Cp_ProductController extends Zend_Controller_Action
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
        
        $this->model = new Cp_Model_Product();
        $this->form = new Cp_Form_Product();
    }

    public function indexAction ()
    {
        $this->_helper->redirector('list', 'product', 'cp');
    
    }

    public function listAction ()
    {
        $this->view->headTitle("Danh sách SP - KunaViet CMS");
        
        $order = array();
        $filter = array();
        
        $filter_keywords = isset($_SESSION['filter']['keywords']) ? $_SESSION['filter']['keywords'] : '';
        $filter_keywords = isset($_POST['filter_key']) ? $_POST['filter_key'] : $filter_keywords;
        $_SESSION['filter']['keywords'] = $filter_keywords;
        $filter['name'] = $_SESSION['filter']['keywords'];
        
        // unset($_SESSION['filter']);
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
                    return $this->_redirect('cp/product/list');
                } else 
                    if ('reset' == $_POST['submit_option']) {
                        unset($_SESSION['filter']);
                        return $this->_redirect('cp/product/list');
                    }
        
        }
    }

    public function deleteItem ($ids)
    {
        if (is_array($ids)) {
            foreach ($ids as $id) {
                if ($id != 1) {
                    $this->model->deleteProduct($id);
                
                }
            }
        } else {
            $this->model->deleteProduct($ids);
        }
    }

    public function editAction ()
    {
        $this->view->headTitle("Sửa sản phẩm - KunaViet CMS");
        
        $vnnHelpers = new VNN_Helpers();
        $form_main = new Cp_Form_ProductMain();
        $form_meta = new Cp_Form_Meta();
        $form_product_detail = new Cp_Form_ProductDetail();
        $form_search_item = new Cp_Form_ProductSearchItem();
        
        $meta_model = new Cp_Model_Meta();
        $pg_model = new Cp_Model_Productgroup();
        $pdetail_model = new Cp_Model_ProductDetail();
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $modelUser = new Cp_Model_User();
        $rowUser = $modelUser->find($row['user_id'])->current();
        
        $fields = array();
        $meta = array();
        $product_detail = array();
        
        if ($this->_request->isPost() && 
                 $form_main->isValid($_POST) &&
                 $form_search_item->isValid($_POST) &&
                 $form_meta->isValid($_POST) &&
                 $form_product_detail->isValid($_POST)) {
                    
                    // get the posted data
                    
                    $productDetailModel = new Cp_Model_ProductDetail();
            
            $filesUploaded = $vnnHelpers->upload(UPLOAD_PATH . '/@FILES');
            
            $strFilesName = $vnnHelpers->toImgStr($filesUploaded);
            $strFilesName .= $row['image_arr'];
            
            $meta['title'] = $form_meta->getValue('meta_title');
            $meta['keywords'] = $form_meta->getValue('meta_keywords');
            $meta['description'] = $form_meta->getValue('meta_description');
            $meta['robots'] = $form_meta->getValue('meta_robots');
            
//             $product_detail['area'] = $form_product_detail->getValue('area');
//             $product_detail['bedroom'] = $form_product_detail->getValue(
//                     'bedroom');
            $product_detail['product_id'] = $id;
            $product_detail['price'] = $form_product_detail->getValue('price');
            $product_detail['description'] = $form_product_detail->getValue(
                    'description');
            $product_detail['facility'] = $form_product_detail->getValue(
                    'facility');
            $product_detail['intro'] = $form_product_detail->getValue(
                    'intro');
            $product_detail['address'] = $form_product_detail->getValue(
                    'address');
            
            $fields['name'] = $form_main->getValue('name');
            $fields['code'] = $form_main->getValue('code');
            $fields['alias'] = ($form_main->getValue('alias') != '') ? $form_main->getValue(
                    'alias') : $vnnHelpers->filterUrlParam($fields['name']);
            
            $fields['date_update'] = mktime();
            $fields['image_arr'] = $strFilesName;
            $fields['product_group_id'] = $form_main->getValue('product_group');
            $fields['publish'] = $form_main->getValue('publish');
            $fields['hits'] = 0;            
            $fields['district_id'] = $form_search_item->getValue('district');
            $fields['pricerange_id'] = $form_search_item->getValue('pricerange');
            $fields['arearange_id'] = $form_search_item->getValue('arearange');
            
            
            $meta_model->edit($row['meta_id'], $meta);
            
            $this->model->edit($id, $fields);
            $product_detail_row = $productDetailModel->fetchRow(
                    'product_id = ' . $id);
            if ($product_detail_row) {
                $productDetailModel->edit($product_detail_row['id'], 
                    $product_detail);
            }
            else {
                $productDetailModel->create($product_detail);
            }
            
            
            if ('save_and_new' == $_POST['submit_option']) {
                
                $vnnHelpers->jsAlert("Sửa thành công.");
                return $this->_redirect('cp/product/edit/id/' . $id);
            
            } else 
                if ('save' == $_POST['submit_option']) {
                    return $this->_redirect('cp/product/list');
                }
        
        }
        
        $form_main->populate($row->toArray());
        
        $pg_adapter = new Zend_Paginator_Adapter_DbSelect($pg_model->listall());
        $pg_list = new Zend_Paginator($pg_adapter);
        $pg_list->setItemCountPerPage();
        $product_group = $form_main->getElement('product_group');
        
        foreach ($pg_list as $pg_item) {
            
            $temp = '';
            for ($i = 1; $i <= $pg_item['level']; ++ $i) {
                $temp .= '.---';
            }
            if ($row['product_group_id'] == $pg_item['id']) {
                
                $product_group->addMultiOption($pg_item['id'], 
                        $temp . $pg_item['name']);
                $product_group->setValue($pg_item['id']);
            
            } else {
                $product_group->addMultiOption($pg_item['id'], 
                        $temp . $pg_item['name']);
            }
        }
        
        $publish = $form_main->getElement('publish');
        if ($row['publish'] == 1) {
            $publish->setValue('1');
        } else {
            $publish->setValue('0');
        }
        
        $rowDetail = $pdetail_model->fetchRow('product_id = ' . $row['id']);
        $form_product_detail->getElement('price')->setValue($rowDetail['price']);
        $form_product_detail->getElement('bedroom')->setValue(
                $rowDetail['bedroom']);
        $form_product_detail->getElement('area')->setValue($rowDetail['area']);
        $form_product_detail->getElement('description')->setValue(
                $rowDetail['description']);
        $form_product_detail->getElement('intro')->setValue(
                $rowDetail['intro']);
        $form_product_detail->getElement('facility')->setValue(
                $rowDetail['facility']);
        $form_product_detail->getElement('address')->setValue(
                $rowDetail['address']);
        
        $rowMeta = $meta_model->find($row['meta_id'])->current();
        $form_meta->getElement('meta_title')->setValue($rowMeta['title']);
        $form_meta->getElement('meta_keywords')->setValue($rowMeta['keywords']);
        $form_meta->getElement('meta_description')->setValue(
                $rowMeta['description']);
        $form_meta->getElement('meta_robots')->setValue($rowMeta['robots']);
        
        /* Tìm kiếm */
        $model_district = new Cp_Model_District();
        $adapter_district = new Zend_Paginator_Adapter_DbSelect(
                $model_district->gettall());
        $districts = new Zend_Paginator($adapter_district);
        $districts->setItemCountPerPage();
        $district = $form_search_item->getElement('district');
        foreach ($districts as $d) {
            if ($row['district_id'] == $d['id']) {
                $district->addMultiOption($d['id'], $d['name']);
                $district->setValue($d['id']);
            }
            else {
                $district->addMultiOption($d['id'], $d['name']);
            }
            
        }
        
        $model_pricerange = new Cp_Model_PriceRange();
        $adapter_pricerange = new Zend_Paginator_Adapter_DbSelect(
                $model_pricerange->gettall());
        $priceranges = new Zend_Paginator($adapter_pricerange);
        $priceranges->setItemCountPerPage();
        $pricerange = $form_search_item->getElement('pricerange');
        foreach ($priceranges as $d) {
            if ($row['pricerange_id'] == $d['id']) {
                $pricerange->addMultiOption($d['id'], $d['name']);
                $pricerange->setValue($d['id']);
            }
            else {
                $pricerange->addMultiOption($d['id'], $d['name']);
            }
            
        }
        
        $model_arearange = new Cp_Model_AreaRange();
        $adapter_arearange = new Zend_Paginator_Adapter_DbSelect(
                $model_arearange->gettall());
        $arearanges = new Zend_Paginator($adapter_arearange);
        $arearanges->setItemCountPerPage();
        $arearange = $form_search_item->getElement('arearange');
        foreach ($arearanges as $d) {
            if ($row['arearange_id'] == $d['id']) {
                $arearange->addMultiOption($d['id'], $d['name']);
                $arearange->setValue($d['id']);
            }
            else {
                $arearange->addMultiOption($d['id'], $d['name']);
            }
            
        }
        
        $cur_images_arr = $vnnHelpers->toImgArr($row['image_arr']);
        
        $images = $form_main->getElement('attachment');
        
        $this->view->id = $id;
        $this->view->form_main = $form_main;
        $this->view->form_meta = $form_meta;
        $this->view->form_product_detail = $form_product_detail;
        $this->view->form_images = $images;
        $this->view->cur_images_arr = $cur_images_arr;
        $this->view->search_item = $form_search_item;
        $this->view->user = $rowUser;
    }

    public function addAction ()
    {
        
        $this->view->headTitle("Thêm sản phẩm - KunaViet CMS");
        
        $auth = Zend_Auth::getInstance();
        $infoUser = $auth->getIdentity();
        
        $form_main = new Cp_Form_ProductMain();
        $form_search_item = new Cp_Form_ProductSearchItem();
        $form_meta = new Cp_Form_Meta();
        $form_product_detail = new Cp_Form_ProductDetail();
        $vnnHelpers = new VNN_Helpers();
        
        $fields = array();
        $meta = array();
        $product_detail = array();
        
        if ($this->_request->isPost() && 
                 $form_main->isValid($_POST) &&
                 $form_search_item->isValid($_POST) &&
                 $form_meta->isValid($_POST) &&
                 $form_product_detail->isValid($_POST)) {
                    
                    // get the posted data
                    
                    $metaModel = new Cp_Model_Meta();
            $productDetailModel = new Cp_Model_ProductDetail();
            
            $filesUploaded = $vnnHelpers->upload(UPLOAD_PATH . '/@FILES');
            
            $strFilesName = $vnnHelpers->toImgStr($filesUploaded);
            
            $meta['title'] = $form_meta->getValue('meta_title');
            $meta['keywords'] = $form_meta->getValue('meta_keywords');
            $meta['description'] = $form_meta->getValue('meta_description');
            $meta['robots'] = $form_meta->getValue('meta_robots');
            
//             $product_detail['area'] = $form_product_detail->getValue('area');
//             $product_detail['bedroom'] = $form_product_detail->getValue(
//                     'bedroom');
            $product_detail['price'] = $form_product_detail->getValue('price');
            $product_detail['description'] = $form_product_detail->getValue(
                    'description');
            $product_detail['facility'] = $form_product_detail->getValue(
                    'facility');
            $product_detail['intro'] = $form_product_detail->getValue(
                    'intro');
            $product_detail['address'] = $form_product_detail->getValue(
                    'address');
            
            $fields['name'] = $form_main->getValue('name');
            $fields['code'] = $form_main->getValue('code');
            $fields['alias'] = ($form_main->getValue('alias') != '') ? $form_main->getValue(
                    'alias') : $vnnHelpers->filterUrlParam($fields['name']);
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            $fields['image_arr'] = $strFilesName;
            $fields['product_group_id'] = $form_main->getValue('product_group');
            $fields['publish'] = $form_main->getValue('publish');
            $fields['hits'] = 0;
            $fields['user_id'] = $infoUser->id;
            $fields['district_id'] = $form_search_item->getValue('district');
            $fields['pricerange_id'] = $form_search_item->getValue('pricerange');
            $fields['arearange_id'] = $form_search_item->getValue('arearange');
            
            $fields['meta_id'] = $metaModel->create($meta);
            
            $product_detail['product_id'] = $this->model->create($fields);
            $productDetailModel->create($product_detail);
            
            if ('save_and_new' == $_POST['submit_option']) {
                
//                 $form_main->getElement('name')->setValue('');
//                 $form_main->getElement('alias')->setValue('');
//                 $form_meta->getElement('meta_title')->setValue('');
//                 $form_meta->getElement('meta_keywords')->setValue('');
//                 $form_meta->getElement('meta_description')->setValue('');
                
                $this->view->message = array();
                $this->view->message[] = 'Đã thêm mới thành công!';
            } else 
                if ('save' == $_POST['submit_option']) {
                    return $this->_redirect('cp/product/list');
                }
        
        }
        
        /* Nhóm sản phẩm */
        $model = new Cp_Model_Productgroup();
        $adapter = new Zend_Paginator_Adapter_DbSelect($model->listall());
        $product_groups = new Zend_Paginator($adapter);
        $product_groups->setItemCountPerPage();
        
        $product_group = $form_main->getElement('product_group');
        
        foreach ($product_groups as $d) {
            
            $temp = '';
            for ($i = 1; $i <= $d['level']; ++ $i) {
                $temp .= '.--- ';
            }
            $product_group->addMultiOption($d['id'], $temp . $d['name']);
        
        }
        
        /* Hình ảnh */
        $images = $form_main->getElement('attachment');
        
        /* Tìm kiếm */
        $model_district = new Cp_Model_District();
        $adapter_district = new Zend_Paginator_Adapter_DbSelect(
                $model_district->gettall());
        $districts = new Zend_Paginator($adapter_district);
        $districts->setItemCountPerPage();
        $district = $form_search_item->getElement('district');
        foreach ($districts as $d) {
            $district->addMultiOption($d['id'], $d['name']);
        }
        
        $model_pricerange = new Cp_Model_PriceRange();
        $adapter_pricerange = new Zend_Paginator_Adapter_DbSelect(
                $model_pricerange->gettall());
        $priceranges = new Zend_Paginator($adapter_pricerange);
        $priceranges->setItemCountPerPage();
        $pricerange = $form_search_item->getElement('pricerange');
        foreach ($priceranges as $d) {
            $pricerange->addMultiOption($d['id'], $d['name']);
        }
        
        $model_arearange = new Cp_Model_AreaRange();
        $adapter_arearange = new Zend_Paginator_Adapter_DbSelect(
                $model_arearange->gettall());
        $arearanges = new Zend_Paginator($adapter_arearange);
        $arearanges->setItemCountPerPage();
        $arearange = $form_search_item->getElement('arearange');
        foreach ($arearanges as $d) {
            $arearange->addMultiOption($d['id'], $d['name']);
        }
        
        $this->view->form_main = $form_main;
        $this->view->form_meta = $form_meta;
        $this->view->form_product_detail = $form_product_detail;
        $this->view->form_images = $images;
        $this->view->search_item = $form_search_item;
    }

    public function checkOrUncheckAction ()
    {
        $id = $this->_request->getParam('id');
        $field_label = $this->_request->getParam('field_label');
        $model = new Cp_Model_Product();
        $result = $model->checkOrUncheck($id, $field_label);
        
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