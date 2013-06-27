<?php

class Cp_Model_User extends Zend_Db_Table_Abstract
{

    protected $_name = 'kn_user';

    public function create ($fields = array())
    {
        $row = $this->createRow();
        if (count($fields)) {
            foreach ($fields as $key => $value) {
                    
                $row->$key = $value;
                
            }
            $row->password = md5($fields['password']);
        }
        return $row->save();
    }
    
    public function edit ($id, $data = array())
    {
        $row = $this->find($id)->current();
        if ($row) {
            if (isset($data['password'])) {
                $data['password'] = md5($data['password']);
            }
            foreach ($data as $key => $value) {                
                $row->$key = $value;
            }
        } else {
            throw new Zend_Exception('Could not select row user.');
        }
        return $row->save();
    }
    
    public function updatePassword ($id, $password)
    {
        // fetch the user's row
        $rowUser = $this->find($id)->current();
        
        if ($rowUser) {
            // update the password
            $rowUser->password = md5($password);
            $rowUser->save();
        } else {
            throw new Zend_Exception("Password update failed.  User not found!");
        }
    }

    
    
    public function gettall ($filters = array(), $order = array())
    {
        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array('p' => $this->_name));
    
        $select->order($order['field'] . ' ' . $order['dir']);
    
        if (is_array($filters)) {
            foreach ($filters as $field => $value) {
                if ($field == 'username') {
                    $select->where("p.username LIKE ?", '%' . $value . '%');
                } else {
                    $select->where("p." . $field . " = ?", $value);
                }
            }
        }
        return $select;
    }
    
    
    public static function getUsers ()
    {
        $userModel = new self();
        $select = $userModel->select();
        $select->order(array('last_name', 'first_name'));
        return $userModel->fetchAll($select);
    }

    public function deleteUser ($id)
    {
        // fetch the user's row
        $rowUser = $this->find($id)->current();
        if ($rowUser) {
            $rowUser->delete();
        } else {
            throw new Zend_Exception("Could not delete user.  User not found!");
        }
    }
    
    public function selectAll ()
    {
        $select = $this->select();
        return $this->fetchAll($select);
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