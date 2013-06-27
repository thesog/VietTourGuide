<?php

class ErrorController extends Zend_Controller_Action
{

    public function init ()
    {
        $option = array("layout" => "layout",
                    "layoutPath" => APPLICATION_PATH . "/layouts/scripts/cp");
        Zend_Layout::startMvc($option);
        $this->view->headTitle("KunaViet CMS");
    }
    
    public function errorAction ()
    {
        $errors = $this->_getParam('error_handler');
        switch ($errors->type)
        {
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ROUTE:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_CONTROLLER:
            case Zend_Controller_Plugin_ErrorHandler::EXCEPTION_NO_ACTION :

                /*Không tìm thấy Controller và action*/
                $this->getResponse()->setHttpResponseCode(404);
                $this->view->message = 'Page not found';
                break;
            
            default:
                /*App error */
                $this->getResponse()->getHttpResponseCode(500);
                $this->view->message = 'App error 500';
                break;
        
        }
        $this->view->exception = $errors->exception;
        $this->view->request = $errors->request;
    }

    public function noauthAction ()
    {

    }
}