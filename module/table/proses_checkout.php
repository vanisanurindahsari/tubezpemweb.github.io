<?php
session_start();
$host = "localhost";     // Your database host (e.g., "localhost")
$user = "root";     // Your database username
$password = ""; // Your database password
$database = "jasa_laundry"; // Your database name

// Establish database connection
$connect = mysqli_connect($host, $user, $password, $database);

// Check if the session is not started, start it
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Check if the checkout form is submitted
if (isset($_POST['proses'])) {
    // Retrieve data from the form
    $noTransaksi = 2;
    $IDJenisPakaian = $_POST['IDJenisPakaian'];
    $NamaPakaian = $_POST['NamaPakaian'];
    $jumlah = 2;
    $NIK = $_SESSION['NIK'];
    echo $noTransaksi;
    echo $IDJenisPakaian;
    echo $jumlah;
    echo $NIK;
    echo $NamaPakaian;
    // Gunakan prepared statement
    $create = mysqli_query($connect, "INSERT INTO rincian_transaksi (Jumlah, NoTransaksi, IDJenisPakaian, NIK, IDJenisLaundry) VALUES ('$jumlah', '$noTransaksi', '1', '40220', '$IDJenisPakaian')");

    $DisableForeignKeyCheck = mysqli_query($connect, "SET foreign_key_checks = 0");
    $Delete = mysqli_query($connect, "DELETE FROM tarif WHERE `tarif`.`NmPakaian` = '$NamaPakaian'");
    $EnableForeignKeyCheck = mysqli_query($connect, "SET foreign_key_checks = 1");
    

    echo $create;


    header('location: ../halaman_utama.php?tabel_rincian_transaksi');
}
?>