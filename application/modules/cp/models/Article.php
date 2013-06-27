<?php

class Cp_Model_Article extends Zend_Db_Table_Abstract
{

    protected $_name = 'kn_article';

    protected $_referenceMap = array(
            'Detail' => array('columns' => array('article_group_id'), 
                    'refTableClass' => 'Cp_Model_Articlegroup', 
                    'refColumns' => array('id'), 
                    'onDelete' => self::CASCADE, 
                    'onUpdate' => self::RESTRICT));

    public function gettall ($filters = array(), $order = array())
    {
        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array('p' => 'kn_article'));
        
        if (isset($order['field'])) {
            $select->order($order['field'] . ' ' . $order['dir']);
        }
        
        if (isset($filters)) {
            foreach ($filters as $field => $value) {
                if ($field == 'name') {
                    $select->where("p.name LIKE ?", '%' . $value . '%');
                } else {
                    $select->where("p." . $field ." = ?", $value);
                }
            }
        }
        return $select;
    }
    public function deleteArticle ($id)
    {
        // fetch the user's row
        $rowUser = $this->find($id)->current();
        if ($rowUser) {
            $rowUser->delete();
        } else {
            throw new Zend_Exception("Could not delete row.  Row not found!");
        }
    }
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

    public function checkOrUncheck ($id, $field_label)
    {
        // fetch the user's row
        $row = $this->find($id)->current();
        
        if ($row) {
            
            $tmp = ($row->$field_label == 1) ? 0 : 1;
            $row->$field_label = $tmp;
            $row->save();
            // return the updated user ID
            return $tmp;
        } else {
            throw new Zend_Exception("User update failed.  User not found!");
        }
    }
}