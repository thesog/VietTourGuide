<?php

class Cp_Form_District extends Zend_Form
{

    public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $name = $this->createElement("text", "name", 
                array('class' => 'textbox'));
        $name->setRequired(true);
        
        $alias = $this->createElement("text", "alias", 
                array("class" => "textbox"));
        
        $ordering = $this->createElement("text", "ordering",
                array("class" => "textbox"));
        
        $publish = $this->createElement("radio", "publish");
        $publish->addMultiOption('0', 'Không');
        $publish->addMultiOption('1', 'Có');
        $publish->setValue('0');
        
        
        $name->removeDecorator('HtmlTag')->removeDecorator('Label');
        $alias->removeDecorator('HtmlTag')->removeDecorator('Label');
        $ordering->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
           
        $this->addElements(
                array($name, $alias, $ordering, $publish));
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array('viewScript' => 'district/_form_add.phtml'))));
    
    }
}