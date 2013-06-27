<?php

class Cp_Model_Articlegroup extends Zend_Db_Table_Abstract
{

    protected $_name = 'kn_article_group';
    protected $_dependentTables = array ('Cp_Model_Article');
    protected $_referenceMap = array(
            'Parents' => array('columns' => array('parent_id'),
                    'refTableClass' => 'Cp_Model_Articlegroup',
                    'refColumns' => array('id'),
                    'onDelete' => self::CASCADE,
                    'onUpdate' => self::RESTRICT));
    
    public $_modelNested;
    
    public function init() {
        $this->_modelNested = new VNN_Model_Nested($this->_name);
    }

    public function create ($fields = array())
    {
     
        $this->_modelNested->insertNode($fields, $fields['parents']);
            
    }
        
    public function deleteItem ($ids) {
        if (is_array($ids)) {
            foreach ($ids as $id) {
                if ($id != 1) {
                    
                    $this->_modelNested->removeNode ($id, 'node');
                    
                }                
            }
        } 
        else {
            $this->_modelNested->removeNode ($ids, 'node');
        }
    }
    
    public function selectAllProductGroup ()
    {
        $select = $this->select();
        return $this->fetchAll($select);
    }

    public function selectProductGroup ($filters = array(), $sortField = NULL, 
        $limit = NULL, $page = 1)
    {
        $select = $this->select();
        
        if (count($filters) > 0) {
            foreach ($filters as $field => $filter) {
                $select->where($field . ' = ?', $filter);
            }
        }
        
        if (NULL != $sortField) {
            $select->order($sortField);
        }
        return $this->fetchAll($select);
    }
    
    public function fetchPaginatorAdapter ($filters = array(), $sortField = NULL)
    {
        $select = $this->select();
        
        if (count($filters) > 0) {
            foreach ($filters as $field => $filter) {
                $select->where($field . ' = ?', $filter);
            }
        }
        if (NULL != $sortField) {
            $select->order($sortField);
        }
        $adapter = new Zend_Paginator_Adapter_DbSelect($select);
        return $adapter;
    }
    
    public function listAll($parents = 0, $filters = array(), $sortField = NULL) {
             
        return $this->_modelNested->listAll($parents, $filters, $sortField);
    }
    
    public function checkOrUncheck($id, $field_label) {
        // fetch the user's row
        $row = $this->find($id)->current();
        
        if ($row) {
            
            $tmp = ($row->$field_label == 1) ? 0 : 1;
            $row->$field_label = $tmp;            
            $row->save();
            //return the updated user ID
            return $tmp;
        }
        else {
            throw new Zend_Exception("User update failed.  User not found!");
        }
    }
}