<?php

class Cp_Model_Place extends Zend_Db_Table_Abstract {
	protected $db;
	protected $_name="dbo_travel_place";
    protected $_primary="place_id";
    public function __construct(){
        $this->db=Zend_Registry::get('db');
    }
	
	public function getall() {
		$sql=$this->db->query("select * from dbo_travel_place");
        return $sql->fetchAll();
	}

}
