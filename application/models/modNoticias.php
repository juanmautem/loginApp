<?php 
class modNoticias extends CI_Model 
{
	
	public function init($dataBase){
		$this->db = $this->load->database($database, TRUE);
	}

	
	/* API's POST*/
	public function getNotices($data){
		$query = "SELECT * FROM noticias";
		if($this->db->query($query))
			return true;
		else
			return false;
	}
}