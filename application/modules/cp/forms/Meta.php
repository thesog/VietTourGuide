<?php

class Cp_Form_Meta extends Zend_Form
{

    public function init ()
    {
        $this->setAction('')->setMethod('post');
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
                                "index, follow" => "index, follow", 
                                "noindex, nofollow" => "noindex, nofollow")));
        
        $meta_description = $this->createElement("textarea", "meta_description", 
                array('class' => 'textarea', 'cols' => 45, 'rows' => 3));
        
        $this->addElements(
                array($meta_title, $meta_description, $meta_keywords, 
                        $meta_robots));
        
        $meta_title->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_keywords->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_robots->removeDecorator('HtmlTag')->removeDecorator('Label');
        $meta_description->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array(
                                        'viewScript' => 'product/_form_meta.phtml'))));
    }
}