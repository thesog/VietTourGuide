<?php

class Cp_Form_UserRegister extends Zend_Form
{

public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $username = $this->createElement("text", "username", 
                array('class' => 'textbox'));
        $username->setRequired(true);
        $username->addFilter('StripTags');
        $username->addErrorMessage('Tên đăng nhập thiếu!');
        
        $password = $this->createElement("password", "password", 
                array("class" => "textbox"));
        $password->setRequired(true);
        $password->addFilter('StripTags');
        
        $password_confirm = $this->createElement("password", "password_confirm",
                array("class" => "textbox"));
        $password_confirm->setRequired(true);
        $password_confirm->addFilter('StripTags');
        
        $email = $this->createElement("text", "email", 
                array("class" => "textbox"));
        $email->setRequired(true);
        $email->addValidator ( new Zend_Validate_EmailAddress () );
        $email->addFilters ( array (new Zend_Filter_StringTrim (), new Zend_Filter_StringToLower () ) );
        
        $firstname = $this->createElement("text", "firstname",
                array("class" => "textbox"));
        $firstname->setRequired(true);
        
        $lastname = $this->createElement("text", "lastname",
                array("class" => "textbox"));
        $lastname->setRequired(true);
        
        $phone = $this->createElement("text", "phone", 
                array("class" => "textbox"));
        $phone->setRequired(true);
        $address = $this->createElement("text", "address",
                array("class" => "textbox"));
        
        $user_group_id = $this->createElement("select", "user_group_id", 
                array('class' => 'select'));
        $user_group_id->setRegisterInArrayValidator(false);
        
        $publish = $this->createElement("radio", "publish");
        $publish->addMultiOption('0', 'Không');
        $publish->addMultiOption('1', 'Có');
        $publish->setValue('0');
        
        
        
        $this->addElements(
                array($username, $password,$password_confirm, $email, $firstname, $lastname, 
                        $phone, $address, $user_group_id, $publish));
        
        $username->removeDecorator('HtmlTag')->removeDecorator('Label');
        $password->removeDecorator('HtmlTag')->removeDecorator('Label');
        $password_confirm->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
        $email->removeDecorator('HtmlTag')->removeDecorator('Label');
        $firstname->removeDecorator('HtmlTag')->removeDecorator('Label');
        $lastname->removeDecorator('HtmlTag')->removeDecorator('Label');
        $phone->removeDecorator('HtmlTag')->removeDecorator('Label');
        $address->removeDecorator('HtmlTag')->removeDecorator('Label');        
        $user_group_id->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array('viewScript' => 'user/_form_register.phtml'))));
    
    }
}
