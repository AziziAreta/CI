<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Dosen extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_dosen');
	}
	public function index()
	{
		$data['judul']="Data Dosen";
		$data['dosen']=$this->M_dosen->tampil()->result();
		$this->load->view('dosen/tampil', $data, FALSE);
	}
	public function input(){
		$data['judul']="Input Data Dosen";
		$this->load->view('dosen/input', $data, FALSE);
	}
	public function save()
	{
		$data=array(
			'nik'=>$this->input->post('nik'),
			'kode_dosen'=>$this->input->post('kode_dosen'),
			'nama_dosen'=>$this->input->post('nama_dosen'),
			'jk'=>$this->input->post('jk'),
			'email'=>$this->input->post('email'),
			'status'=>$this->input->post('status')
		);
		$this->M_dosen->save($data);
		redirect('dosen','refresh');
	}
	public function edit()
	{
		$nik=$this->uri->segment(3);
		$data['judul']="Edit Data Dosen";
		$data['edit']=$this->M_dosen->getnik($nik)->row_array();
		$this->load->view('dosen/edit', $data, FALSE);
	}
	public function update(){
		$nik=$this->input->post('nik');
		$data=array(
			'nik'=>$this->input->post('nik'),
			'kode_dosen'=>$this->input->post('kode_dosen'),
			'nama_dosen'=>$this->input->post('nama_dosen'),
			'jk'=>$this->input->post('jk'),
			'email'=>$this->input->post('email'),
			'status'=>$this->input->post('status')
		);
		$this->M_dosen->update($data,$nik);
		redirect('dosen','refresh');
	}
	public function hapus()
	{
		$nik=$this->uri->segment(3);
		$this->db->where('nik', $nik);
		$this->db->delete('dosen');
		redirect('dosen','refresh');
	}
}
/* End of file Agama.php */
/* Location: ./application/controllers/Agama.php */