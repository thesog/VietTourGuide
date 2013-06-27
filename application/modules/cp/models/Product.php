<?php

class Cp_Model_Product extends Zend_Db_Table_Abstract
{

    protected $_name = 'kn_product';

    protected $_referenceMap = array(
            'Detail' => array('columns' => array('product_group_id'), 
                    'refTableClass' => 'Cp_Model_Productgroup', 
                    'refColumns' => array('id'), 'onDelete' => self::CASCADE, 
                    'onUpdate' => self::RESTRICT));

    public function gettall ($filters = array(), $order = array(), $orWhere = array())
    {
        $select = $this->select();
        $select->setIntegrityCheck(false);
        $select->from(array('p' => 'kn_product'));
        
        if (count($order)) {
            $select->order($order['field'] . ' ' . $order['dir']);
        }
        
        if (isset($filters)) {
            foreach ($filters as $field => $value) {
                if ($field == 'name') {
                    
                    $select->where("p.name LIKE ?", '%' . $value . '%');
                } else {
                    $select->where("p." . $field . " = ?", $value);
                    
                
                }
            }
        }
        if (isset($orWhere['product_group_id']) &&
                 is_array($orWhere['product_group_id'])) {
                    $i = 1;
                    foreach ($orWhere['product_group_id'] as $field => $value) {
                        
                        if ($i == 1) {
                            $select->orWhere("p.product_group_id = ?", $value);
                        } else {
                            $select->orWhere("p.product_group_id = ?", $value);
                        }
                        $i ++;
                    }
                }
                return $select;
            }

            public function gettall2 ($filters = array(), $order = array(), $orWhere = array())
            {
                $select = $this->select();
                $select->setIntegrityCheck(false);
                $select->from(array('p' => 'kn_product'));
                
                $selectOr = $this->select();
                
                if (isset($orWhere['product_group_id']) && is_array($orWhere['product_group_id'])) {
                    
                            $i = 1;
                            $c = count($orWhere['product_group_id']);
                           
                            $str = '';
                            foreach ($orWhere['product_group_id'] as $field => $value) {
                                
                                if ($i < $c) {
                                    $str .= 'product_group_id = ' . $value . ' OR ';
                                }
                                else {
                                    $str .= 'product_group_id = ' . $value;
                                }
                                $i++;
                            }
                           
                        }
                        echo $str;
                        if (isset($filters)) {
                            foreach ($filters as $field => $value) {
                                if ($field == 'name') {
                                    
                                    $select->where("p.name LIKE ?", 
                                            '%' . $value . '%');
                                } else {
                                    $select->where("p." . $field . " = ?", 
                                            $value);
                                    
                                
                                }
                            }
                        }
                        $select->where($str);
                        return $select;
                    }

                    public function deleteProduct ($id)
                    {
                        // fetch the user's row
                        $rowUser = $this->find($id)->current();
                        if ($rowUser) {
                            $vnnHelper = new VNN_Helpers();
                            $imgarr = $vnnHelper->toImgArr(
                                    $rowUser['image_arr']);
                            foreach ($imgarr as $img) {
                                $path = UPLOAD_PATH . '/@FILES/' . $img;
                                if (file_exists($path)) {
                                    unlink($path);
                                }
                            }
                            $rowUser->delete();
                        } else {
                            throw new Zend_Exception(
                                    "Could not delete row.  Row not found!");
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
                            throw new Zend_Exception(
                                    "User update failed.  User not found!");
                        }
                    }
                }