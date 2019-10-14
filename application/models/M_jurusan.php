<?php
defined('BASEPATH') OR exit('No Direct Script access allowed');

class M_jurusan extends CI_Model {

	public function tampil()
	{
		return $this->db->get('jurusan');
	}

	public function save($data)
	{
		$this->db->insert('jurusan', $data);
	}

	public function getid($id)
	{
		$param= array('kode_jurusan' =>$id);
		return $this->db->get_where('jurusan', $param);
	}

	public function update($data,$kode)
	{
		$this->db->where('kode_jurusan', $kode); //Parameter
		$this->db->update('jurusan', $data); //data yang di update
	}
}