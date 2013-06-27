<?php

class Cp_Bootstrap extends Zend_Application_Module_Bootstrap
{

    protected function _initDoctype ()
    {  
        defined('MODULE_NAME') || define('MODULE_NAME', 'cp');
        
        //print_r($view->baseUrl('essay.local/public/cp'));
        //defined('BASE_PATH') || define('BASE_PATH', $this->baseUrl() . '/cp/');
    }

}