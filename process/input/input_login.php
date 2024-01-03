<?php

$host = "localhost";
$user = "root";
$password = "";
$database = "jasa_laundry";

$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));
$NIK = $_POST['NIK'];
$username = $_POST['username'];
$password = $_POST['password'];
$TypeUser = $_POST['TypeUser'];

$insertLogin = "INSERT INTO login values ('$username','$password','$TypeUser','$NIK')";

$insertLogin_query = mysqli_query($connect, $insertLogin);

if ($insertLogin_query) {
	header('location:../../module/halaman_utama.php?tabel_login=$tabel_login');
} else {
	echo "Insert gagal dijalankan";
}

?>