<?php

/**
 * PHP Class
 *
 * LICENSE
 *
 * Processing Nested Set Model
 *
 * @category   	PHP classes
 * @package    	Database
 * @copyright  	Copyright (c) 2007-2012 Professional World company(http://www.worldprovn.com/)  
 *									   & Vietnam Zend Framework community (http://www.zend.vn/)
 * @author		KhanhPham (khanhpham@worldprovn.com)
 * @license    	GNU General Public License Version 2 or later (the "GPL")
 * @version     v1.0 5:46:57 PM Feb 20, 2012
 */

class VNN_Model_Nested extends VNN_Nested
{

    public $_parent = 0;

    public $_data;

    public $_orderArr;

    public $_sqlItem;

    public $_alias = 'node';

    public function __construct ($tbname)
    {
        parent::__construct($tbname);
        $this->_sqlItem = $this->_db->select()->from(
                $this->_name . ' AS ' . $this->_alias);
    
    }

    public function updateNode ($data, $id = null, $newParentId = 0, $options = null)
    {
        if ($id != null && $id != 0) {
            $nodeInfo = $this->getNodeInfo($id);
            $where = "id = " . $id;
            $this->_db->update($this->_name, $data, $where);
        }
        if ($newParentId != null && $newParentId > 0) {
            if ($nodeInfo['parents'] != $newParentId) {
                $this->moveNode($id, $newParentId, $options);
            }
        }
    }

    public function moveNode ($id, $parent = 0, $options = null)
    {
        $this->_id = $id;
        $this->_parent = $parent;
        if ($options['position'] == 'right' || $options == null)
            $this->moveRight();
        if ($options['position'] == 'left')
            $this->moveLeft();
        if ($options['position'] == 'after')
            $this->movetAfter($options['brother_id']);
        if ($options['position'] == 'before')
            $this->moveBefore($options['brother_id']);
    }

    public function moveUp ($id)
    {
        $nodeInfo = $this->getNodeInfo($id);
        $parentInfo = $this->getNodeInfo($nodeInfo['parents']);
        $select = $this->_db->select()
            ->from($this->_name)
            ->where("lft < ?", $nodeInfo['lft'])
            ->where('parents = ?', $nodeInfo['parents'])
            ->order("lft DESC");
        $nodeBrother = $this->_db->fetchRow($select);
        if (! empty($nodeBrother)) {
            $options = array('position' => 'before', 
                    'brother_id' => $nodeBrother['id']);
            $this->moveNode($id, $parentInfo['id'], $options);
        }
    }

    public function moveDown ($id)
    {
        $nodeInfo = $this->getNodeInfo($id);
        $parentInfo = $this->getNodeInfo($nodeInfo['parents']);
        
        $select = $this->_db->select()
            ->from($this->_name)
            ->where("lft > ?", $nodeInfo['lft'])
            ->where('parents = ?', $nodeInfo['parents'])
            ->order("lft ASC");
        $nodeBrother = $this->_db->fetchRow($select);
        if (! empty($nodeBrother)) {
            $options = array('position' => 'after', 
                    'brother_id' => $nodeBrother['id']);
            $this->moveNode($id, $parentInfo['id'], $options);
        }
    }

    public function getParentNode ($id)
    {
        $infoNode = $this->getNodeInfo($id);
        $parentId = $infoNode['parents'];
        $infoParentNode = $this->getNodeInfo($parentId);
        return $infoParentNode;
    }

    public function orderTree ($data, $orderArr)
    {
        $orderGroup = $this->orderGroup($data);
        echo '<pre>';
        print_r($orderGroup);
        echo '</pre>';
        echo '<pre>';
        print_r($orderArr);
        echo '</pre>';
        
        $newOrderGroup = array();
        
        foreach ($orderGroup as $key => $val) {
            $tmpVal = array();
            foreach ($val as $key2 => $val2) {
                $tmpVal[$key2] = $orderArr[$key2];
            }
            natsort($tmpVal);
            $orderGroup[$key] = $tmpVal;
        }
        
        foreach ($orderGroup as $key => $val) {
            $tmpVal = array();
            foreach ($val as $key2 => $val2) {
                $info = $this->getNodeByLeft($key2);
                $tmpVal[$info['id']] = $val2;
            }
            $orderGroup[$key] = $tmpVal;
        }
        
        foreach ($orderGroup as $key => $val) {
            foreach ($val as $key2 => $val2) {
                $nodeID = $key2;
                $parent = $key;
                $this->moveNode($nodeID, $parent);
            }
        }
    }

    /**
     * Create node groups
     *
     * @author KhanhPham
     *        
     * @param
     *            array An array store info tree
     *            
     * @return array of node groups
     *        
     */
    public function orderGroup ($data = null)
    {
        
        if ($data != null) {
            $orderArr = array();
            if (count($data) > 0) {
                foreach ($data as $key => $val) {
                    
                    $orderArr[$val['id']] = array();
                    if (isset($orderArr[$val['parents']])) {
                        $orderArr[$val['parents']][] = $val['lft'];
                    }
                }
                $orderArr2 = array();
                foreach ($orderArr as $key => $val) {
                    $tmp = array();
                    $tmp = $orderArr[$key];
                    if (count($tmp) > 0) {
                        $orderArr2[$key] = array_flip($val);
                    }
                }
            }
        }
        $this->_orderArr = $orderArr2;
        return $this->_orderArr;
    }

    /**
     * Create ordering of node by left value
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of parent of current node
     * @param
     *            int Letf value of current node
     *            
     * @return int An value of ordering
     *        
     */
    public function getNodeOrdering ($parent, $left)
    {
        if (isset($this->_orderArr[$parent][$left])) {
            $ordering = $this->_orderArr[$parent][$left] + 1;
        } else {
            $ordering = 1;
        }
        return $ordering;
    }

    /**
     * Create breadcrumbs for nodes of tree
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of current node
     * @param
     *            int level of parent where you want get info
     *            
     * @return array An array store info of breadcrumbs
     *        
     */
    public function breadcrumbs ($id, $level_stop = null)
    {
        $select = $this->_db->select()
            ->from($this->_name . " AS " . $this->_alias)
            ->from($this->_name . " AS parent")
            ->where($this->_alias . ".lft >= parent.lft")
            ->where($this->_alias . ".lft <= parent.rgt")
            ->where($this->_alias . '.id  = ?', $id);
        
        if (isset($level_stop)) {
            $select->where("parent.level > ?", $level_stop);
        }
        $select->order($this->_alias . ".lft ASC");
        $arrData = $this->_db->fetchAll($select);
        return $arrData;
    }

    /**
     * Insert a new node to tree (move: left - right - before - after)
     *
     * @author KhanhPham
     *        
     * @param
     *            array An array store info of new node
     * @param
     *            int ID of parent node which you want insert new node
     * @param
     *            array Case when you apply new node (apply: left position -
     *            right position - before position - after position)
     *            
     * @return Change tree structure.
     */
    public function insertNode ($data, $parent = 0, $options = null)
    {
        $this->_data = $data;
        $this->_parent = $parent;
        
        if ($options['position'] == 'right' || $options == null)
            $this->insertRight();
        
        if ($options['position'] == 'left')
            $this->insertLeft();
        
        if ($options['position'] == 'after')
            $this->insertAfter($options['brother_id']);
        
        if ($options['position'] == 'before')
            $this->insertBefore($options['brother_id']);
    
    }

    /**
     * Calculate total nodes
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of parent node
     *            
     * @return int Total nodes
     *        
     */
    public function totalNode ($parents = 0)
    {
        $select = $this->_db->select()
            ->from($this->_name, array("lft", "rgt"))
            ->where('parents = ?', $parents);
        $result = $this->_db->fetchRow($select);
        $total = ($result['rgt'] - $result['lft'] + 1) / 2;
        return $total;
    }

    /**
     * Width of a branch of tree
     *
     * @author KhanhPham
     *        
     * @param
     *            int Left value of node
     * @param
     *            int Right value of node
     *            
     * @return int width of node
     *        
     */
    public function widthNode ($lft, $rgt)
    {
        $width = $rgt - $lft + 1;
        return $width;
    }

    /**
     * Remove a node of tree
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of node which you want remove
     * @param
     *            string. If it is 'branch', delete a branch of tree
     *            If it is 'node', delete a node of tree and update all nodes of
     *            branch
     *            
     * @return Change tree structure
     *        
     */
    
    public function removeNode ($id, $options = 'branch')
    {
        $this->_id = $id;
        if ($options == 'branch')
            $this->removeBranch();
        if ($options == 'node')
            $this->removeOne();
    }

    /**
     * Get info node of tree
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of node which you want get info
     *            
     * @return Change tree structure
     *        
     */
    public function getNodeInfo ($id)
    {
        $select = $this->_db->select()
            ->from($this->_name)
            ->where("id = ?", $id);
        $row = $this->_db->fetchRow($select);
        return $row;
    }

    /**
     * Get tree
     *
     * @author KhanhPham
     *        
     * @param
     *            int ID of parent node
     * @param
     *            string A case of get node list
     * @param
     *            int ID of node which you don't want get info
     * @param
     *            int level of tree
     *            
     * @return array Node list
     *        
     */
    
    public function listItem ($parents = 0, $items = 'all', $exclude_id = null, $level = 0, 
            $options = null)
    {
        $this->_db = $this->getDefaultAdapter();
        
        $sqlItem = $this->_db->select()
            ->from($this->_name, array('MIN(lft) as lft', 'MAX(rgt) as rgt'))
            ->where('parents = ?', $parents);
        $result = $this->_db->fetchRow($sqlItem);
        
        if ($items == 'all') {
            $this->_sqlItem->where($this->_alias . '.lft >= ?', $result['lft'])->where(
                    $this->_alias . '.rgt <= ?', $result['rgt']);
        } else {
            $this->_sqlItem->where($this->_alias . '.lft > ?', $result['lft'])->where(
                    $this->_alias . '.rgt < ?', $result['rgt']);
        }
        
        if ($level != 0) {
            $this->_sqlItem->where($this->_alias . '.level <= ?', $level);
        }
        $this->_sqlItem->order($this->_alias . '.lft');
        
        if ($exclude_id != null && (int) $exclude_id > 0) {
            $sqlExclude = $this->_db->select()
                ->from($this->_name, array("lft", "rgt"))
                ->where('id = ?', $exclude_id);
            
            $rowExclude = $this->_db->fetchRow($sqlExclude);
            
            $lftExclude = $rowExclude['lft'];
            $rgtExclude = $rowExclude['rgt'];
        }
        $result = $this->_db->fetchAll($this->_sqlItem);
        
        if (! empty($result)) {
            foreach ($result as $row) {
                if ($row['lft'] < @$lftExclude || $row['lft'] > @$rgtExclude) {
                    $dataArr[] = $row;
                }
            }
        }
        return $dataArr;
    }

    /**
     *
     * @param unknown_type $parents            
     * @param unknown_type $items            
     * @param unknown_type $exclude_id            
     * @param unknown_type $level            
     * @param unknown_type $options            
     * @return Data array (Param for Zend_Paginator_Adapter_DbSelect)
     */
    public function listAll ($parents = 0, $filters = array(), $sortField = NULL, 
            $items = 'all', $exclude_id = null, $level = 0, $options = null)
    {
        
        $this->_db = $this->getDefaultAdapter();
        
        /* Get min left, max right */
        $sqlItem = $this->_db->select()
            ->from($this->_name, array('MIN(lft) as lft', 'MAX(rgt) as rgt'))
            ->where('parents = ?', $parents);
        $result = $this->_db->fetchRow($sqlItem);
        
        $a = $this->select();
        
        $a->where($this->_name . '.lft >= ?', $result['lft']);
        $a->where($this->_name . '.rgt <= ?', $result['rgt']);
        
        if ($parents != 0) {
            $a->where('parents = ?', $parents);
        }
        
        if (count($filters) > 0) {
            foreach ($filters as $filter => $filter_val) {
                $a->where("name LIKE ?", '%' . $filter_val . '%');
            
            }
        }
        if ($sortField != NULL) {
            $a->order($this->_name . '.' . $sortField);
        } else {
            $a->order($this->_name . '.lft');
        }
        
        return $a;
    }

    public function getMaxLevel ()
    {
        /* Get min left, max right */
        $sqlItem = $this->_db->select()->from($this->_name, 
                array('MAX(level) as maxlevel'));
        $result = $this->_db->fetchRow($sqlItem);
        return $result['maxlevel'];
    }

    public function hasChilds ($id)
    {
        $select = $this->_db->select()
            ->from($this->_name)
            ->where("parents = ?", $id);
        $row = $this->_db->fetchRow($select);
        if ($row) {
            return true;
        } else {
            return false;
        }
    }

}