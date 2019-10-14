<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Input Data Diri</title>
</head>
<body>
	<?php echo form_open('siswa/proses'); ?>
		<table>
			
				<tr>
					<td>
						Nama  
					</td> 
						<td> 
							<input type="text" name="Nama" value="" placeholder="Masukan Nama!">
						</td>
				</tr>
				<tr>
					<td>
						Alamat
					</td>
						<td>
							<textarea name="Alamat" id="" cols="30" rows="10" value="" placeholder="Masukan Alamat!"></textarea>		
						</td>
				</tr>
				<tr>
					<td>
						No Hp 
					</td>
						<td>
							<input type="text" name="NoHp" value="" placeholder="Masukan No Hp!"> 
						</td>
				</tr>
				<tr><td><input type="submit" name="" value="SIMPAN"></td> <td><input type="reset" name="" value="BATAL"></td></tr>
			
		</table>
	<?php echo form_close(); ?>
</body>
</html>