<?php

class Cp_Form_Product extends Zend_Form
{

    public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $formTask = $this->createElement("hidden", "form_task");
        $formTask->setValue('create');
        
        $name = $this->createElement("text", "name", 
                array('class' => 'textbox'));
        $name->setRequired(true);
        
        $alias = $this->createElement("text", "alias", 
                array("class" => "textbox"));
        
        $code = $this->createElement("text", "code", 
                array("class" => "textbox"));
        
        $product_group = $this->createElement("select", "product_group", 
                array('class' => 'select'));
        $product_group->setRegisterInArrayValidator(false);
        
        $publish = $this->createElement("radio", "publish");
        $publish->addMultiOption('0', 'Không');
        $publish->addMultiOption('1', 'Có');
        $publish->setValue('0');
        
        // create new element
        $attachment = $this->createElement('file', 'attachment');
        // element options
        $attachment->setLabel('Attach a file');
        $attachment->setRequired(FALSE);
        // specify the path to the upload folder. this should not be publicly
        // accessible!
        $attachment->setDestination(UPLOAD_PATH);
        // ensure that only 1 file is uploaded
        // ensure minimum 1, maximum 3 files
        $attachment->addValidator('Count', false, 
                array('min' => 0, 'max' => 10));
        $attachment->setMultiFile(10);
        // limit to 100K
        $attachment->addValidator('Size', false, 204800);
        // only allow images to be uploaded
        $attachment->addValidator('Extension', false, 'jpg,png,gif');
        // add the element to the form
        $this->addElement($attachment);
        // set the enctype attribute for the form so it can upload files
        $this->setAttrib('enctype', 'multipart/form-data');
        
        $this->addElements(
                array($code, $name, $alias, $product_group, $publish));
        
        $code->removeDecorator('HtmlTag')->removeDecorator('Label');
        $name->removeDecorator('HtmlTag')->removeDecorator('Label');
        $alias->removeDecorator('HtmlTag')->removeDecorator('Label');
        $product_group->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $attachment->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array('viewScript' => 'product/_form_add.phtml'))));
    
    }
}