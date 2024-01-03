<?php
global $host, $user, $password, $database, $connect;

$host = "localhost";
$user = "root";
$password = "";
$database = "jasa_laundry";

$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));
$IDJenisLaundry = $_POST['IDJenisLaundry'];
$NmJenisLaundry = $_POST['NmJenisLaundry'];

$insertJenisLaundry = "INSERT INTO jenis_laundry values ('$IDJenisLaundry','$NmJenisLaundry')";

$insertJenisLaundry_query = mysqli_query($connect,$insertJenisLaundry);

if ($insertJenisLaundry_query)
{
	echo "Pendaftaran Berhasil!";
	header('location:../../module/halaman_utama.php?tabel_jenislaundry=$tabel_jenislaundry');
}
else
{
	echo "Insert gagal dijalankan";
}

?>