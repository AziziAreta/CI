<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class dosen extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_dosen');
	}

	public function index() //Menampilkan data dosen
	{
		$data['judul']="Tampil Data Dosen";
		$data['tampil']=$this->M_dosen->tampil()->result(); // ambil data dari model
		//tampil diatas sini adalah model yang nanti kita gunakan
		$this->load->view('dosen/tampil', $data, FALSE);
	} 

	public function input() // Menambah data
	{
		$data['judul']="Tambah dosen Baru";
		$this->load->view('dosen/input', $data, FALSE);
	}

	public function save() // Menyimpan data
	{
		$data=array(
				'nik'=>$this->input->post('nik'),
				'kode_dosen'=>$this->input->post('kode_dosen'),
				'nama_dosen'=>$this->input->post('nama_dosen'),
				'jk'=>$this->input->post('jk'),
				'email'=>$this->input->post('email'),
				'status'=>$this->input->post(status)
		);

		$this->M_dosen->save($data);
		redirect('dosen','refresh');
	}

	public function edit() // Meng Edit data yang dipilih
	{
		$nik=$this->uri->segment(3); //Mengambil parameter
		$data['judul']="Edit Data Dosen"; //Judul
		$data['edit']=$this->M_dosen->getnik($nik)->row_array();
		$this->load->view('dosen/edit', $data, FALSE);
	}

	public function update() // menambah data
	{
		$data=array(
				'nik'=>$this->input->post('nik'),
				'kode_dosen'=>$this->input->post('kode_dosen'),
				'nama_dosen'=>$this->input->post('nama_dosen'),
				'jk'=>$this->input->post('jk'),
				'email'=>$this->input->post('email'),
				'status'=>$this->input->post(status)
		);

		$this->M_dosen->save($data, $nik);
		redirect('dosen','refresh');
	}

	public function delete() // delete data
	{
			$nik=$this->uri->segment(3);
			$this->db->where('nik',$nik);
			$this->db->delete('dosen');
			redirect('dosen','refresh');
	}

}
