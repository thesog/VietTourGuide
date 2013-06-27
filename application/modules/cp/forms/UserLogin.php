<?php

class Cp_Form_UserLogin extends Zend_Form
{

    public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $username = $this->createElement("text", "username", 
                array('class' => 'inputText'));
        $username->setRequired(true);
        $username->addFilter('StripTags');
        $username->addErrorMessage('Tên đăng nhập thiếu!');
        
        $password = $this->createElement("password", "password", 
                array("class" => "inputText"));
        $password->setRequired(true);
        $password->addFilter('StripTags');
        
        $this->addElements(
                array($username, $password));
        $username->removeDecorator('HtmlTag')->removeDecorator('Label');
        $password->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array('viewScript' => 'user/_form_login.phtml'))));
    
    }
}
