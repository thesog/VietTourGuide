<?php

class Cp_Form_ProductDetail extends Zend_Form
{

    public function init ()
    {
        $this->setAction("")->setMethod('post');
        
        $price = $this->createElement("text", "price", 
                array("class" => "textbox"));
        $bedroom = $this->createElement("text", "bedroom", 
                array("class" => "textbox"));
        $area = $this->createElement("text", "area", 
                array("class" => "textbox"));
        
        $description = $this->createElement("textarea", "description", 
                array("class" => "mceeditor", 
                        'style' => 'height:200px; width: 300px;'));
        $description->setValue('Mô tả chi tiết...');
        
        $intro = $this->createElement("textarea", "intro",
                array('style' => 'height:50px; width: 482px;'));
        
        $facility = $this->createElement("textarea", "facility",
                array("class" => "mceeditor",
                        'style' => 'height:200px; width: 300px;'));
        $facility->setValue('Tiện ích. cấu trúc...');
        
        $address = $this->createElement("text", "address",
                array("class" => "textbox"));
        
        $this->addElements(array($price, $bedroom, $area, $description, $intro, $facility, $address));
        
        $price->removeDecorator('HtmlTag')->removeDecorator('Label');
        $bedroom->removeDecorator('HtmlTag')->removeDecorator('Label');
        $area->removeDecorator('HtmlTag')->removeDecorator('Label');
        $description->removeDecorator('HtmlTag')->removeDecorator('Label');
        $intro->removeDecorator('HtmlTag')->removeDecorator('Label');
        $facility->removeDecorator('HtmlTag')->removeDecorator('Label');
        $address->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array(
                                        'viewScript' => 'product/_form_product_detail.phtml'))));
    }
}