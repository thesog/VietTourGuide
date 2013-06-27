<?php

class Cp_IndexController extends Zend_Controller_Action
{

    public function init ()
    {
        $option = array("layout" => "layout", 
                "layoutPath" => APPLICATION_PATH . "/layouts/scripts/cp");
        Zend_Layout::startMvc($option);
        $this->view->headTitle("KunaViet CMS");
    }

    public function indexAction ()
    {
        $auth = Zend_Auth::getInstance();
        
        if ($auth->getIdentity() == NULL) {
            return $this->_redirect('cp/user/login');
        }
        
        
        if ($auth->hasIdentity()) {
            //$this->view->identity = $auth->getIdentity();
            
        }
    }

}