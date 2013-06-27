<?php
class Cp_Form_ProductImgProc extends Cp_Form_Product {
    
    public function init ()
    {
        parent::init();
        $this->setDecorators(
                array(
                        array('viewScript',
                                array('viewScript' => 'product/_form_img.phtml'))));
    }
    
}