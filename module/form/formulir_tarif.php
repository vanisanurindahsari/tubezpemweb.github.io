<h2>Form Pendaftaran Tarif</h2>
<hr color="#0263A0"><br>

<form action="../process/input/input_tarif.php" method="POST">

    <table>
        <tr>
            <td>ID Jenis Pakaian</td>
        </tr>
        <tr>
            <td><input type="text" name='IDJenisPakaian' size="25px" maxlength="10" placeholder="ketikkan ID jenis pakaian.."></td>
        </tr>

        <tr>
            <td>Nama Pakaian</td>
        </tr>
        <tr>
            <td><input type="text" name="NmPakaian" size="25px" maxlength="50" placeholder="ketikkan nama pakaian.."></td>
        </tr>

        <tr>
            <td>Tarif</td>
        </tr>
        <tr>
            <td><input type="text" name="tarif" size="25px" maxlength="11" placeholder="ketikkan tarif.."></td>
        </tr>

        <tr>
            <td>Jenis Laundry</td>
        </tr>
        <tr>
            <td><select name="IDJenisLaundry">
                    <option value="" disabled selected>--</option>
                    <?php include "../config/koneksi.php";
                    $tampilkan_isi = "SELECT *  FROM jenis_laundry";
                    $tampilkan_isi_sql = mysqli_query($connect, $tampilkan_isi);
                    while ($isi = mysqli_fetch_array($tampilkan_isi_sql)) {
                        $IDJenisLaundry = $isi['IDJenisLaundry'];
                        $NmJenisLaundry = $isi['NmJenisLaundry'];
                        ?>
                        <option value="<?php echo $IDJenisLaundry ?>">
                            <?php echo $NmJenisLaundry ?>
                            <?php
                    }
                    ?>
                    </option>
                </select>
                    <!-- <option value="" disabled selected>--</option>
                    <option value="c">Cuci</option>
                    <option value="ck">Cuci Kering</option>
                    <option value="cks">Cuci Kering Setrika</option> -->

            </td>
        </tr>

        <tr>
            <td><br><input class="tombol" type="submit" value="Tambah"></td>
        </tr>


    </table>

</form>