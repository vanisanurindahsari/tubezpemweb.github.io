<?php
global $host, $user, $password, $database, $connect;

$host = "localhost";
$user = "root";
$password = "";
$database = "jasa_laundry";

$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));
$NIK = $_POST['NIK'];
$NmKaryawan = $_POST['NmKaryawan'];
$AlmtKaryawan = $_POST['AlmtKaryawan'];
$TelpKaryawan = $_POST['TelpKaryawan'];
$GenderKaryawan = $_POST['GenderKaryawan'];

$insertKaryawan = "INSERT INTO karyawan values ('$NIK','$NmKaryawan','$AlmtKaryawan','$TelpKaryawan','$GenderKaryawan')";

$insertKaryawan_query = mysqli_query($connect,$insertKaryawan);

if ($insertKaryawan_query)
{
	echo "Pendaftaran Berhasil!";
	header('location:../../module/halaman_utama.php?tabel_karyawan=$tabel_karyawan');
}
else
{
	echo "Insert gagal dijalankan";
}

?>