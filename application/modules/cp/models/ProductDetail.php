<?php
class Cp_Model_ProductDetail extends Zend_Db_Table_Abstract
{
    protected $_name = 'kn_product_detail';
    protected $_referenceMap = array(
        'Product' => array('columns' => array('id'),
            'refTableClass' => 'Cp_Form_Product',
            'refColumns' => array('product_id'),
            'onDelete' => self::CASCADE,
            'onUpdate' => self::RESTRICT));
    
    public function create ($fields = array())
    {
        $row = $this->createRow();
        if (count($fields)) {
            foreach ($fields as $key => $value) {
    
                $row->$key = $value;
            }
        }
        return $row->save();
    }
    
    public function edit ($id, $data = array())
    {
        $row = $this->find($id)->current();
        if ($row) {
            foreach ($data as $key => $value) {
                $row->$key = $value;
            }
        } else {
            //throw new Zend_Exception('Could not select row.');
            return false;
        }
        return $row->save();
    }
}