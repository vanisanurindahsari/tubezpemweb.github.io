<h2>Daftar Tarif</h2>
<hr color="#0263A0"><br>

<form action="halaman_utama.php" method="post">
    <input type="search" name="cari" placeholder="Pencarian Tarif" class="css-input" style="width:250px;" />
    <button type="submit" name="pencarian" value="Cari" class="btn" style="padding:3px;" margin="6px;" width="10px;">
        <img src="../img/icon/search.png" height="10" width="12">
    </button>
</form>

<br>

<table id="daftar-table" border='1' bordercolor="black" cellpading='2' cellspacing='2' width='100%'>
    <tr align='center'>
        <th class="short">NO</th>
        <th class="normal">ID JENIS PAKAIAN</th>
        <th class="normal">NAMA PAKAIAN</th>
        <th class="normal">JENIS LAUNDRY</th>
        <th class="normal">TARIF</th>
        <?php if ($_SESSION['TypeUser'] !== "user") { ?>
            <th class="normal">TOOLS</th>
        <?php } ?>
    </tr>
    <?php
	$host = "localhost";
	$user = "root";
	$password = "";
	$database = "jasa_laundry";
	
	$connect = mysqli_connect($host, $user, $password, $database) or die(mysqli_error($connect));
	$tampilkan_isi = "SELECT t.IDJenisPakaian, t.NmPakaian, jl.NmJenisLaundry, t.tarif FROM tarif t INNER JOIN jenis_laundry jl ON t.IDJenisLaundry = jl.IDJenisLaundry;";

    if (isset($_POST['pencarian']) and $_POST['cari'] <> "") {
        $key = $_POST['cari'];
        $tampilkan_isi = "SELECT t.IDJenisPakaian,t.NmPakaian,jl.NmJenisLaundry,t.tarif FROM tarif t INNER JOIN jenis_laundry jl ON t.IDJenisLaundry = jl.IDJenisLaundry AND t.NmPakaian LIKE '%$key%'";
        echo "Pencarian data tarif dengan kata '$key'";
    } else if (isset($_POST['pencarian']) and $_POST['cari'] == "") {
        $tampilkan_isi = "SELECT t.IDJenisPakaian,t.NmPakaian,jl.NmJenisLaundry,t.tarif FROM tarif t INNER JOIN jenis_laundry jl ON t.IDJenisLaundry = jl.IDJenisLaundry;";
    }

    $no = 1;
    $tampilkan_isi_sql = mysqli_query($connect, $tampilkan_isi);

    while ($isi = mysqli_fetch_array($tampilkan_isi_sql)) {
        $IDJenisPakaian = $isi['IDJenisPakaian'];
        $NmPakaian = $isi['NmPakaian'];
        $NmJenisLaundry = $isi['NmJenisLaundry'];
        $tarif = $isi['tarif'];

    ?>
        <tr align='center'>
            <td><?php echo $no ?></td>
            <td><?php echo $IDJenisPakaian ?></td>
            <td><?php echo $NmPakaian ?></td>
            <td><?php echo $NmJenisLaundry ?></td>
            <td>Rp.<?php echo $tarif ?>,-</td>
            <?php if ($_SESSION['TypeUser'] !== "user") { ?>
                <td>
                    <!-- <form method="post"> -->
                        <input class="update" name="proses" type="submit" value="Update">
                        <input class="delete" name="proses" type="submit" value="Delete" onClick="return confirm('Apakah Anda ingin menghapus data tarif <?php echo $NmJenisLaundry; ?> <?php echo $NmPakaian; ?> ?')">
						<form action="table/proses_checkout.php" method="post">
                            <input type="hidden" name="IDJenisPakaian" value="<?php echo $IDJenisPakaian; ?>">
                            <input type="hidden" name="NamaPakaian" value="<?php echo $NmPakaian; ?>">
							<input class="Checkout" name="proses" type="submit" value="Check Out">
						</form>
					<!-- </form> -->
                   
                </td>
            <?php } ?>
        </tr>
    <?php
        $no++;
    }
    ?>
</table>

