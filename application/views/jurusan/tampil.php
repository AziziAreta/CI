<?php echo anchor('jurusan/input', 'Tambah Baru'); ?>

<table border="1">
	<tr> <td>NO</td> <td>NAMA JURUSAN</td> <td>AKSI</td> </tr>
	<?php foreach ($tampil as $key => $value) { ?>
		
		<tr> <td><?php echo $value->kode_jurusan ?></td> <td><?php echo $value->nama_jurusan ?></td> <td> <?php echo anchor('jurusan/delete/' .$value->kode_jurusan,'DELETE'); ?> <?php echo anchor('jurusan/edit/' .$value->kode_jurusan,'EDIT'); ?></td> </tr>

	<?php } ?>	
	
	
</table>