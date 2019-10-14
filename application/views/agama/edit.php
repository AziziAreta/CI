<?php echo form_open('agama/update') ?>
<?php echo $judul ?>

<table width="316" border="1">
  <tr>
    <td width="171" height="26">ID AGAMA</td>
    <td width="129">
      <label>
      <input type="text" value="<?php echo $edit['id_agama'] ?>" name="id_agama">
        </label>
    </td>
  </tr>
  <tr>
    <td>NAMA AGAMA </td>
    <td>
      <label>
      <input type="text" value="<?php echo $edit['nama_agama'] ?>"  name="nama_agama">
        </label>
    </td>
  </tr>
  <tr>
    <td>
      <label></label>
       <input type="submit" name="Submit" value="UPDATE"></td>
    <td><label>
      <input type="reset" name="Submit2" value="RESET">
    </label></td>
  </tr>
</table>