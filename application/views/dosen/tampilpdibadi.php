<?php echo anchor('dosen/input', 'Tambah Baru'); ?>

<table border="1">
	<tr> <td>NO</td> <td>NAMA JURUSAN</td> <td>AKSI</td> </tr>
	<?php foreach ($tampil as $key => $value) { ?>
		
		<tr> <td><?php echo $value->kode_dosen ?></td> <td><?php echo $value->nama_jurusan ?></td> <td> <?php echo anchor('dosen/delete/' .$value->kode_dosen,'DELETE'); ?> <?php echo anchor('dosen/edit/' .$value->kode_dosen,'EDIT'); ?></td> </tr>

	<?php } ?>	
	
	
</table>