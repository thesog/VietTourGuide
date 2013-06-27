<?php

class Cp_Model_Meta extends Zend_Db_Table_Abstract
{

    protected $_name = 'kn_meta';

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
            throw new Zend_Exception('Could not select row.');
        }
        return $row->save();
    }

}