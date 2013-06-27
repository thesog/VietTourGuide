<?php

class ProductController extends Zend_Controller_Action
{

    public $model;

    public function init ()
    {
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/viettourguide");
        Zend_Layout::startMvc($option);
        
        $this->model = new Cp_Model_Product();
    
    }

    public function listAction ()
    {
        
        $order = array();
        $filter = array();
        $orWhere = array();
        
        $cid = $this->_request->getParam('cid');
        $district = $this->_request->getParam('district');
        
        
        $order['field'] = 'date_create';
        $order['dir'] = 'DESC';
        
        $filter['publish'] = 1;
        
        if ($cid != '') {
            $filter['product_group_id'] = $cid;
        }
        
        if ($district != '') {
            unset($filter['product_group_id']);
            $filter['district_id'] = $district;
        }
        
         
        $pg = new Cp_Model_Productgroup();
        $cur_pg = $pg->find($cid)->current();
        
        
        if (isset($filter['product_group_id']) && $pg->_modelNested->hasChilds($cid)) {
            $pg_childs = $pg->_modelNested->listItem($cid);
            foreach ($pg_childs as $r) {
                $orWhere['product_group_id'][] = $r['id'];
            }
            
        }
        
        $adapter = new Zend_Paginator_Adapter_DbSelect(
                $this->model->gettall($filter, $order, $orWhere));
        
        $paginator = new Zend_Paginator($adapter);
        $paginator->setItemCountPerPage(10);
        $page = $this->_request->getParam('page', 1);
        $paginator->setCurrentPageNumber($page);
        
        $this->view->paginator = $paginator;
        $this->view->curPageCount = $paginator->getCurrentItemCount();
        $this->view->district = $this->_request->getParam('district');
        
        
        $this->view->headTitle('BĐS', 'SET');
    }
    
    
    public function searchAction ()
    {
    
        $order = array();
        $filter = array();
        $orWhere = array();
        
//         $key = $this->_request->getParam('key');
//         $district_id = $this->_request->getParam('district_id');
//         $pricerange_id = $this->_request->getParam('pricerange_id');
//         $arearange_id = $this->_request->getParam('arearange_id');
//         $product_group_id = $this->_request->getParam('product_group_id');
       
    
        $filter['publish'] = 1;
            
        $key = isset($_SESSION['search']['key']) ? $_SESSION['search']['key'] : '';
        $key = isset($_POST['key']) ? $_POST['key'] : $key;        
        $_SESSION['search']['key'] = $key;
        $filter['name'] = $_SESSION['search']['key'];
        
        $district_id = isset($_SESSION['search']['district_id']) ? $_SESSION['search']['district_id'] : '';
        $district_id = isset($_POST['district_id']) ? $_POST['district_id'] : $district_id;
        $_SESSION['search']['district_id'] = $district_id;
        $filter['district_id'] = $_SESSION['search']['district_id'];
        
        
        $pricerange_id = isset($_SESSION['search']['pricerange_id']) ? $_SESSION['search']['pricerange_id'] : '';
        $pricerange_id = isset($_POST['pricerange_id']) ? $_POST['pricerange_id'] : $pricerange_id;
        $_SESSION['search']['pricerange_id'] = $pricerange_id;
        $filter['pricerange_id'] = $_SESSION['search']['pricerange_id'];
        
        $arearange_id = isset($_SESSION['search']['arearange_id']) ? $_SESSION['search']['arearange_id'] : '';
        $arearange_id = isset($_GET['arearange_id']) ? $_GET['arearange_id'] : $arearange_id;
        $_SESSION['search']['arearange_id'] = $arearange_id;
        $filter['arearange_id'] = $_SESSION['search']['arearange_id'];
        
        $product_group_id = isset($_SESSION['search']['product_group_id']) ? $_SESSION['search']['product_group_id'] : 1;
        $product_group_id = isset($_POST['product_group_id']) ? $_POST['product_group_id'] : $product_group_id;
        $_SESSION['search']['product_group_id'] = $product_group_id;
        $filter['product_group_id'] = $_SESSION['search']['product_group_id'];
       
        
        if (    $filter['name'] == '' &&
                $filter['district_id'] == '' &&
                $filter['pricerange_id'] == '' &&
               @$filter['arearange_id'] == '' &&
                $filter['product_group_id'] == 1) {
                    return;
        }
        if (isset($filter['name']) && $filter['name'] == '') unset($filter['name'] );
        if (isset($filter['district_id']) && $filter['district_id'] == '') unset($filter['district_id'] );
        if (isset($filter['pricerange_id']) && $filter['pricerange_id'] == '') unset($filter['pricerange_id'] );
        if (isset($filter['arearange_id']) && $filter['arearange_id'] == '') unset($filter['arearange_id'] );
        if (isset($filter['product_group_id']) && $filter['product_group_id'] == 1) unset($filter['product_group_id'] );
        
       
        $pg = new Cp_Model_Productgroup();
        $cur_pg = $pg->find($product_group_id)->current();
    
        
        if (isset($filter['product_group_id']) && ($filter['product_group_id'] != 1) && $pg->_modelNested->hasChilds($product_group_id)) {
            $pg_childs = $pg->_modelNested->listItem($product_group_id);
            
            $filter['product_group_id'] = $_SESSION['search']['product_group_id'];
            foreach ($pg_childs as $r) {
                $orWhere['product_group_id'][] = $r['id'];
            }
        }
        else if (!$pg->_modelNested->hasChilds($product_group_id)) {
            $filter['product_group_id'] = $_SESSION['search']['product_group_id'];
        }
    
        if (isset($filter['product_group_id']) && $filter['product_group_id'] == 1) {
            empty($orWhere);            
            unset($filter['product_group_id']);
        }
        
        $adapter = new Zend_Paginator_Adapter_DbSelect(
                $this->model->gettall($filter, $order, $orWhere));
    
        $paginator = new Zend_Paginator($adapter);
        $paginator->setItemCountPerPage(10);
        $page = $this->_request->getParam('page', 1);
        $paginator->setCurrentPageNumber($page);
    
        $this->view->paginator = $paginator;
        $this->view->curPageCount = $paginator->getCurrentItemCount();
        $this->view->district = $this->_request->getParam('district');
    
    
        $this->view->headTitle('BĐS', 'SET');
    }

    public function viewAction ()
    {
        
        $this->view->headScript()->appendFile(
                $this->view->baseUrl('templates/canhosaigon/') .
                         'js/jquery.min.js', 'text/javascript');
        $this->view->headScript()->appendFile(
                $this->view->baseUrl('/templates/canhosaigon/') .
                         'js/jquery.lightbox-0.5.js', 'text/javascript');
        $this->view->headLink()->appendStylesheet(
                $this->view->baseUrl('/templates/canhosaigon/') .
                         'css/jquery.lightbox-0.5.css');
        
        
        $this->view->headScript()->appendFile(
                $this->view->baseUrl('/templates/canhosaigon/') .
                         'js/organictabs.jquery.js', 'text/javascript');
        $this->view->headLink()->appendStylesheet(
                $this->view->baseUrl('/templates/canhosaigon/') . 'css/tab.css');
        
        
        /* Map */
        $this->view->headScript()->appendFile('http://maps.google.com/maps/api/js?sensor=true&hl=vi-VN', 'text/javascript');
        $this->view->headScript()->appendFile(
                $this->view->baseUrl('/plugin/maps/plugins/jquery.ui.map.js'), 'text/javascript');
        $this->view->headScript()->appendFile(
                $this->view->baseUrl('/plugin/maps/plugins/jquery.ui.map.services.js'), 'text/javascript');
        
        
        $vnnHelpers = new VNN_Helpers();
        $pd = new Cp_Model_ProductDetail();
        $model_user = new Cp_Model_User();
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $cur_images_arr = $vnnHelpers->toImgArr($row['image_arr']);
        $this->view->cur_images_arr = $cur_images_arr;
        
        $rowDetail = $pd->fetchRow('product_id = ' . $row['id']);
        
        $rowUser = $model_user->find($row['id'])->current();
        
        $this->view->item = $row;
        $this->view->pd = $rowDetail;
        $this->view->user = $rowUser;
        $this->view->headTitle($row['name'], 'SET');
        
        $model_article = new Cp_Model_Article();
        $rowlienhenhanh = $model_article->find(20)->current();
        $this->view->lienhenhanh = $rowlienhenhanh;
        
    }
    
    public function postAction ()
    {
        $fields = array();
        $meta = array();
        $product_detail = array();
        $this->view->message = array();
        $this->view->headTitle("Đăng tin");
    
        $auth = Zend_Auth::getInstance();       
        $infoUser = $auth->getIdentity();
        if ($auth->getIdentity() == NULL) {
            $this->view->message[] = '- Mời đăng nhập trước khi đăng tin.';
            return;
        }
    
        $form_main = new Cp_Form_ProductMainPost();
        $form_product_detail = new Cp_Form_ProductDetail();
        
        $form_search_item = new Cp_Form_ProductSearchItem();
        $form_meta = new Cp_Form_Meta();        
        $vnnHelpers = new VNN_Helpers();
    
        if ($this->_request->isPost() && $form_main->isValid($_POST) &&
                $form_product_detail->isValid($_POST)) {
    
            // get the posted data
            $metaModel = new Cp_Model_Meta();
            $productDetailModel = new Cp_Model_ProductDetail();
    
            $filesUploaded = $vnnHelpers->upload(UPLOAD_PATH . '/@FILES');
    
            $strFilesName = $vnnHelpers->toImgStr($filesUploaded);
    
            $meta['title'] = '';
            $meta['keywords'] = '';
            $meta['description'] = '';
            $meta['robots'] = '';
    
            // $product_detail['area'] = $form_product_detail->getValue('area');
            // $product_detail['bedroom'] = $form_product_detail->getValue(
            // 'bedroom');
            $product_detail['price'] = $form_product_detail->getValue('price');
            $product_detail['description'] = $form_product_detail->getValue(
                    'description');
            $product_detail['facility'] = $form_product_detail->getValue(
                    'facility');
            $product_detail['intro'] = '';
            $product_detail['address'] = $form_product_detail->getValue(
                    'address');
    
            $fields['name'] = $form_main->getValue('name');
            $fields['code'] = '';
            $fields['alias'] = ($form_main->getValue('alias') != '') ? $form_main->getValue(
                    'alias') : $vnnHelpers->filterUrlParam($fields['name']);
            $fields['date_create'] = mktime();
            $fields['date_update'] = $fields['date_create'];
            $fields['image_arr'] = $strFilesName;
            $fields['product_group_id'] = $form_main->getValue('product_group');
            $fields['publish'] = 0;
            $fields['hits'] = 0;
            $fields['user_id'] = $infoUser->id;
            $fields['district_id'] = 0;
            $fields['pricerange_id'] = 0;
            $fields['arearange_id'] = 0;
    
            $fields['meta_id'] = $metaModel->create($meta);
    
            $product_detail['product_id'] = $this->model->create($fields);
            $productDetailModel->create($product_detail);
    
            $this->view->message[] = 'Đăng tin thành công!';
            $this->view->message[] = '<a href="product/post">Tiếp tục đăng tin</a> - <a href="">Về trang chủ</a>';
            
            
            return;
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

}