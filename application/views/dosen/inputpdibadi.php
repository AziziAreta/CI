<?php echo form_open ('dosen/save') ?>
<?php echo $judul ?>
<table width="316" border="1">
  <tr>
    <td width="171" height="26">Kode dosen Matkul </td>
    <td width="129">
      <label>
      <input type="text" name="kode_dosen">
        </label>
    </td>
  </tr>
  <tr>
    <td>Nama dosen Matkul </td>
    <td>
      <label>
      <input type="text" name="nama_dosen">
        </label>
    </td>
  </tr>
  <tr>
    <td>
      <label></label>
       <input type="submit" name="Submit" value="Submit"></td>
    <td><label>
      <input type="reset" name="Submit2" value="Reset">
    </label></td>
  </tr>
</table>

<?php echo form_close() ?>