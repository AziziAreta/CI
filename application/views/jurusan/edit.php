<?php echo form_open ('jurusan/update') ?>
<?php echo $judul ?>
<table width="316" border="1">
  <tr>
    <td width="171" height="26">Kode Jurusan Matkul </td>
    <td width="129">
      <label>
      <input type="text" value="<?php echo $edit['kode_jurusan'] ?>" name="kode_jurusan">
        </label>
    </td>
  </tr>
  <tr>
    <td>Nama Jurusan Matkul </td>
    <td>
      <label>
      <input type="text" value="<?php echo $edit['nama_jurusan'] ?>"  name="nama_jurusan">
        </label>
    </td>
  </tr>
  <tr>
    <td>
      <label></label>
       <input type="submit" name="Submit" value="UPDATE"></td>
    <td><label>
      <input type="reset" name="Submit2" value="Reset">
    </label></td>
  </tr>
</table>

<?php echo form_close() ?>