<?php 

// Di Function Controller nama huruf awal harus Kapital
// Function itu ada di dalem Class
class Siswa extends CI_Controller {

	public function index()
	{
		echo "Tidak Memanggil File Lain";
	}
	public function datadiri()
	{
		echo " Tampil Data Diri ";
	}
	public function input()
	{
		$this->load->view('v_input');
	}
	public function proses()
	{
		$Nama=$this->input->post('Nama');
		$Alamat=$this->input->post('Alamat');
		$NoHp=$this->input->post('NoHp');

		echo "<pre>
			Nama 	: $Nama
			Alamat  : $Alamat
			NoHp	: $NoHp
		</pre>";
	}
}