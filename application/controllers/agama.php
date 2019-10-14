<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class agama extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_agama');
	}

	public function index() //Menampilkan data agama
	{
		$data['judul']="Tampil Data Agama";
		$data['tampil']=$this->M_agama->tampil()->result(); //ngambil data dari model
		$this->load->view('agama/tampil', $data, FALSE);
	}

	public function input() //menambah data
	{
		$data['judul']="Tambah agama baru";
		$this->load->view('agama/input', $data, FALSE);
	}

	public function save() // Menyimpan data
	{
		$kode=$this->input->post('id_agama');
		$nama=$this->input->post('nama_agama');

		$data=array(
			'id_agama'=>$kode,
			'nama_agama'=>$nama
		);

		$this->M_agama->save($data);
		redirect('agama','refresh');
	}

	public function edit()
	{
		$id=$this->uri->segment(3);
		$data['judul']="EDIT DATA";
		$data['edit']=$this->M_agama->getid($id)->row_array();
		$this->load->view('agama/edit', $data, FALSE);
	}

	public function update()
	{
		$kode=$this->input->post('id_agama');
		$nama=$this->input->post('nama_agama');

		$data=array(
			'nama_agama'=>$nama
		);

		$this->M_agama->update($data,$kode);
		redirect('agama','refresh');
	}

	public function delete()
	{
		$id=$this->uri->segment(3);
		$this->db->where('id_agama', $id);
		$this->db->delete('agama');
		redirect('agama','refresh');
	}


}