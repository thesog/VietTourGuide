<?php

class Cp_Form_Article extends Zend_Form
{

    public function init ()
    {
        
        $this->setAction('')->setMethod('post');
        
        $name = $this->createElement("text", "name", 
                array('class' => 'textbox'));
        $name->setRequired(true);
        
        $alias = $this->createElement("text", "alias", 
                array("class" => "textbox"));
        
        $code = $this->createElement("text", "code", 
                array("class" => "textbox"));
        
        $b_summarize = $this->createElement("textarea", "b_summarize",
                array("class" => "mceeditor",
                        'style' => 'height:150px; width: 300px;'));
        $b_content = $this->createElement("textarea", "b_content",
                array("class" => "mceeditor",
                        'style' => 'height:300px; width: 300px;'));
        
        $article_group = $this->createElement("select", "article_group", 
                array('class' => 'select'));
        $article_group->setRegisterInArrayValidator(false);
        
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
                array($code, $name, $alias, $article_group, $publish, $b_summarize, $b_content));
        
        $code->removeDecorator('HtmlTag')->removeDecorator('Label');
        $name->removeDecorator('HtmlTag')->removeDecorator('Label');
        $alias->removeDecorator('HtmlTag')->removeDecorator('Label');
        $article_group->removeDecorator('HtmlTag')->removeDecorator('Label');
        $publish->removeDecorator('HtmlTag')->removeDecorator('Label');
        $b_summarize->removeDecorator('HtmlTag')->removeDecorator('Label');
        $b_content->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $attachment->removeDecorator('HtmlTag')->removeDecorator('Label');
        
        $this->setDecorators(
                array(
                        array('viewScript', 
                                array('viewScript' => 'article/_form_add.phtml'))));
    
    }
}