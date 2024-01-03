<?php
global $host, $user, $password, $database, $connect;

$host = "localhost";
$user = "root";
$password = ""; 
$database = "jasa_laundry";

$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));

$query = "SELECT IDJenisPakaian, NmPakaian, tarif, IDJenisLaundry FROM tarif";
$result = mysqli_query($connect, $query);

// Check jika query berhasil dijalankan
if ($result) {
    echo "<table border='1'>
            <tr>
                <th>ID Jenis Pakaian</th>
                <th>Nama Pakaian</th>
                <th>Tarif</th>
                <th>ID Jenis Laundry</th>
            </tr>";

    // Loop untuk menampilkan data dalam tabel
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>{$row['IDJenisPakaian']}</td>
                <td>{$row['NmPakaian']}</td>
                <td>{$row['tarif']}</td>
                <td>{$row['IDJenisLaundry']}</td>
              </tr>";
    }

    echo "</table>";

    // Bebaskan hasil query
    mysqli_free_result($result);
} else {
    echo "Query gagal dijalankan";
}

// Tutup koneksi
mysqli_close($connect);
?>
