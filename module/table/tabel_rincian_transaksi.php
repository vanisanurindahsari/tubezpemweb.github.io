<h2>Daftar Rincian Transaksi</h2>
<hr color="#0263A0"><br>

<form action="halaman_utama.php?tabel_rincian_transaksi=$tabel_rincian_transaksi" method="post">
	<input type="search" name="cari" placeholder="Pencarian Data Rincian Transaksi" class="css-input" style="width:250px;" />
	<button type="submit" name="pencarian" value="Cari" class="btn" style="padding:3px;" margin="6px;" width="10px;"><img src="../img/icon/search.png" height="10" width="12"></button>
</form>
<br>

<table id="daftar-table" border='1' bordercolor="black" cellpading='2' cellspacing='2' width='100%'>
	<tr align='center'>
		<th class="short">NO</th>
		<th class="normal">ID RINCIAN</th>
		<th class="normal">JUMLAH</th>
		<th class="normal">NO TRANSAKSI</th>
		<th class="normal">ID JENIS PAKAIAN</th>
		<?php
		if (isset($_SESSION['TypeUser']) && $_SESSION['TypeUser'] !== "user") { ?>
			<th class="normal">TOOLS</th>
		<?php } ?>
	</tr>
	<?php
	$host = "localhost";
$user = "root";
$password = "";
$database = "jasa_laundry";

$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));
	$tampilkan_isi = "select * from `rincian_transaksi`";

	if (isset($_POST['pencarian']) and $_POST['cari'] <> "") {
		$key = $_POST['cari'];
		$tampilkan_isi = "select * from `rincian_transaksi` where IDRincian LIKE '%$key%' OR Jumlah LIKE '%$key%' OR NoTransaksi LIKE '%$key%' OR IDJenisPakaian LIKE '%$key%'";

		echo "Hasil pencarian data rincian transaksi dengan kata '$key'";
	} else if (isset($_POST['pencarian']) and $_POST['cari'] == "") {
		$tampilkan_isi = "select * from `rincian_transaksi`";
	}

	$no = 1;
	$tampilkan_isi_sql = mysqli_query($connect, $tampilkan_isi);

	while ($isi = mysqli_fetch_array($tampilkan_isi_sql)) {
		$IDRincian = isset($isi['IDRincian']) ? $isi['IDRincian'] : '';
		$Jumlah = isset($isi['Jumlah']) ? $isi['Jumlah'] : '';
		$NoTransaksi = isset($isi['NoTransaksi']) ? $isi['NoTransaksi'] : '';
		$IDJenisPakaian = isset($isi['IDJenisPakaian']) ? $isi['IDJenisPakaian'] : '';

	?>
		<tr align='center'>
			<td><?php echo $no ?></td>
			<td><?php echo $IDRincian ?></td>
			<td><?php echo $Jumlah ?></td>
			<td><?php echo $NoTransaksi ?></td>
			<td><?php echo $IDJenisPakaian ?></td>
			<?php
			if (isset($_SESSION['TypeUser']) && $_SESSION['TypeUser'] !== "user") { ?>
				<td>

					<form action="halaman_utama.php?aksi_rincian_transaksi=$aksi_rincian_transaksi" method="post">
						<input type="hidden" name="IDRincian" value="<?php echo $IDRincian; ?>">
						
					</form>
				</td>
			<?php } ?>
		</tr>
		</form>
	<?php
		$no++;
	}
	?>
</table>
