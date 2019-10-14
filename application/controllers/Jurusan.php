<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Jurusan extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_jurusan');
	}

	public function index() //Menampilkan data jurusan
	{
		$data['judul']="Tampil Data Jurusan";
		$data['tampil']=$this->M_jurusan->tampil()->result(); // ambil data dari model
		//tampil diatas sini adalah model yang nanti kita gunakan
		$this->load->view('jurusan/tampil', $data, FALSE);
	} 
	public function input() // Menambah data
	{
		$data['judul']="Tambah Jurusan Baru";
		$this->load->view('jurusan/input', $data, FALSE);
	}
	public function save() // Menyimpan data
	{
		$kode=$this->input->post('kode_jurusan');
		$nama=$this->input->post('nama_jurusan');

		$data=array(
			'kode_jurusan'=>$kode,
			'nama_jurusan'=>$nama
		);

		$this->M_jurusan->save($data);
		redirect('jurusan','refresh');
	}

	public function edit() // Meng Edit data yang dipilih
	{
		$id=$this->uri->segment(3); //Mengambil parameter
		$data['judul']="EDIT DATA"; //Judul
		$data['edit']=$this->M_jurusan->getid($id)->row_array();
		$this->load->view('jurusan/edit', $data, FALSE);
	}

	public function update() // menambah data
	{
		$kode=$this->input->post('kode_jurusan');
		$nama=$this->input->post('nama_jurusan');

		$data=array(
			'nama_jurusan'=>$nama
		);

		$this->M_jurusan->update($data,$kode);
		redirect('jurusan','refresh');
	}

	public function delete() // delete data
	{
			$id=$this->uri->segment(3);
			$this->db->where('kode_jurusan',$id);
			$this->db->delete('jurusan');
			redirect('jurusan','refresh');
	}

}

/* End of file Jurusan.php */
/* Location: ./application/controllers/Jurusan.php */

