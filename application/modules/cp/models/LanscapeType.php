<?php

class Cp_Model_LanscapeType extends Zend_Db_Table_Abstract {
	protected $db;
	protected $_name="dbo_lanscape_type";
    protected $_primary="type_name";
    public function __construct(){
        $this->db=Zend_Registry::get('db');
    }
	
	public function getall() {
		$sql=$this->db->query("select * from dbo_lanscape_type");
        return $sql->fetchAll();
	}

}
