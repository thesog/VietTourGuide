<?php

// session_start();

date_default_timezone_set('Asia/Ho_Chi_Minh');

defined('APPLICATION_PATH') || define('APPLICATION_PATH', 
        realpath(dirname(__FILE__) . '/../application'));

defined('APPLICATION_ENV') ||
         define('APPLICATION_ENV', 
                (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development'));
        
        defined('UPLOAD_FOLDER') || define('UPLOAD_FOLDER', 'upload');
        
        defined('IMAGE_PLACE_FOLDER') || define('IMAGE_PLACE_FOLDER', 'upload/place/');
        
        defined('UPLOAD_PATH') ||
                 define('UPLOAD_PATH', 
                        realpath(dirname(__FILE__) . '/' . UPLOAD_FOLDER . '/'));
                
                /**
                 * Phân cách giữa các giá trị nếu giá trị là mảng
                 */
                //defined('VAR_BREAK') || define('VAR_BREAK', '&varbreak;');
                defined('VAR_BREAK');
                
                /**
                 * Phân cách giữa các field giá trị
                 */
                defined('FIELD_BREAK') || define('FIELD_BREAK', '&fieldbreak;');
                
                /**
                 * Tương đương dấu : phần giữa định nghĩa và giá trị.
                 */
                defined('IS') || define('IS', '&:;');
                
                set_include_path(
                        implode(PATH_SEPARATOR, 
                                array(
                                        dirname(dirname(__FILE__)) . '/library', 
                                        get_include_path(), 
                                        realpath(
                                                APPLICATION_PATH . '/models'))));
                
                require_once 'Zend/Application.php';
                
                $application = new Zend_Application(APPLICATION_ENV, 
                        APPLICATION_PATH . '/configs/application.ini');
                
                $FrontController = Zend_Controller_Front::getInstance();
                $application->bootstrap()->run();
                
                
                
