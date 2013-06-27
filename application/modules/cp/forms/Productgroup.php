<?php

class Cp_Form_Productgroup extends Zend_Form
{

    public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $name = $this->createElement("text", "name", 
            array('class' => 'textbox'));
        $name->setRequired(true);
        
        $alias = $this->createElement("text", "alias", 
            array("class" => "textbox"));
        
        $parents = $this->createElement("select", "parents",
            array('class' => 'select'));
        $parents->setRegisterInArrayValidator(false);
        
        $publish = $this->createElement("radio", "publish");
        $publish->addMultiOption('0', 'Không');        
        $publish->addMultiOption('1', 'Có');
        $publish->setValue('0');
        
        
        /*
         * META INFORMATION
         */
        $meta_title = $this->createElement("text", "meta_title", 
            array('class' => 'textbox', 'id' => 'meta_title', 
                'onkeyup' => "document.getElementById('count_title').innerHTML=
                                document.getElementById('meta_title').value.length"));
        
        $meta_keywords = $this->createElement("text", "meta_keywords", 
            array('class' => 'textbox', 'id' => 'meta_keywords', 
                'onkeyup' => "document.getElementById('count_keywords').innerHTML=
                document.getElementById('meta_keywords').value.length"));
        
        $meta_robots = $this->createElement("select", "meta_robots", 
            array('class' => 'select',
                "multioptions" => array("" => "Cấu hình chung", 
                    "index, follow" => "index, follow", "noindex, nofollow" => "noindex, nofollow")));
        
        $meta_description = $this->createElement("textarea", "meta_description", 
            array('class' => 'textarea', 'cols' => 45, 'rows' => 3));
        
        $this->addElements(
            array($name, $alias, $parents, $publish, $meta_title, 
                $meta_description, $meta_keywords, $meta_robots));
        
        $name->removeDecorator('HtmlTag')->removeDecorator('Label');
        $alias->removeDecorator('HtmlTag')->removeDecorator('Label');
        $parents->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_title->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_keywords->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_robots->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_description->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
            array(
                array('viewScript', 
                    array('viewScript' => 'productgroup/_form_add.phtml'))));
    
    }
} 