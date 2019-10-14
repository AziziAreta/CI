<?php echo anchor('agama/input', 'Tambah baru'); ?>

<table border="1">
	<tr><td>ID AGAMA</td> <td>NAMA AGAMA</td><td>AKSI</td></tr>
	<?php foreach ($tampil as $key => $value) { ?>

		<tr> <td><?php echo $value->id_agama ?></td> <td><?php echo $value->nama_agama ?></td> <td> <?php echo anchor('agama/delete/' .$value->id_agama,'DELETE'); ?> <?php echo anchor('agama/edit/' .$value->id_agama,'EDIT'); ?></td> 
		</tr>
		
	<?php } ?>
</table>