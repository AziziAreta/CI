<?php
defined('BASEPATH') OR exit('No Direct Script access allowed');

class M_jurusan extends CI_Model {

	public function tampil()
	{
		return $this->db->get('dosen');
	}

	public function save($data)
	{
		return $this->db->insert('dosen', $data);
	}

	public function getnik($nik)
	{
		$param= array('nik' =>$nik);
		return $this->db->get_where('dosen', $param);
	}

	public function update($data,$kode)
	{
		$this->db->where('kode_jurusan', $kode); //Parameter
		$this->db->update('dosen', $data); //data yang di update
	}
}