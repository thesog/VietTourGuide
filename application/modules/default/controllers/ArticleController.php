<?php

class ArticleController extends Zend_Controller_Action
{

    public $model;

    public function init ()
    {
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/viettourguide");
        Zend_Layout::startMvc($option);
        
        $this->model = new Cp_Model_Article();
    
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

    public function viewAction ()
    {
        
        $vnnHelpers = new VNN_Helpers();
        
        
        $id = $this->_request->getParam('id');
        $row = $this->model->find($id)->current();
        
        $cur_images_arr = $vnnHelpers->toImgArr($row['image_arr']);
        $this->view->cur_images_arr = $cur_images_arr;
        
        $this->view->headTitle($row['name'], 'SET');
        $this->view->item = $row;
        
    }

}