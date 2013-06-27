<?php

class Cp_Form_ProductSearchItem extends Zend_Form
{

    public function init ()
    {
        $this->setAction("")->setMethod('post');
       
        
        $arearange = $this->createElement("select", "arearange", 
                array('class' => 'select'));
        $arearange->setRegisterInArrayValidator(false);
        $arearange->setRequired(true);
        
        $pricerange = $this->createElement("select", "pricerange", 
                array('class' => 'select'));
        $pricerange->setRegisterInArrayValidator(false);
        $pricerange->setRequired(true);
        
        $district = $this->createElement("select", "district", 
                array('class' => 'select'));
        $district->setRegisterInArrayValidator(false);
        $district->setRequired(true);
        
        
        $this->addElements(
                array($district, $pricerange, $arearange));
        
        $district->removeDecorator('HtmlTag')->removeDecorator('Label');
        $pricerange->removeDecorator('HtmlTag')->removeDecorator('Label');
        $arearange->removeDecorator('HtmlTag')->removeDecorator('Label');
       
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array(
                                        'viewScript' => 'product/_form_search_item.phtml'))));
    }
}