<?php echo form_open('dosen/save') ?>
<?php echo $judul ?>
<table width="325" border="1">
  <tr>
    <td>NIP Dosen</td>
    <td><input type="text" name="nik" id="kode_jurusan"></td>
  </tr>
   <tr>
    <td>Kode Dosen</td>
    <td><input type="text" name="kode_dosen" id="kode_jurusan"></td>
  </tr>
  <tr>
    <td>Nama Dosen</td>
    <td><input type="text" name="nama_dosen" id="nama_jurusan"></td>
  </tr>
   <tr>
    <td>Jenis Kelamin</td>
    <td><input type="radio" name="jk" value="L">Laki-laki
        <input type="radio" name="jk" value="P">Perempuan</td>
  </tr>
   <tr>
    <td>Email</td>
    <td><input type="text" name="email" id="kode_jurusan"></td>
  </tr>
   <tr>
    <td>Status</td>
    <td><input type="radio" name="status" value="aktif">Aktif
        <input type="radio" name="status" value="pasif">Pasif
    </td>
  </tr>
  <tr>
    <td><input type="submit" name="button" id="button" value="Simpan"></td>
    <td><input type="reset" name="button2" id="button2" value="Batal"></td>
  </tr>
</table>
<?php echo form_close() ?>