<?php
    include "../koneksi/config.php";
    $id_surat_keluar = $_GET['id_surat_keluar'];
    $query = $dbconnect->query("DELETE FROM surat_keluar WHERE id_surat_keluar='$id_surat_keluar'");

        if($query){
                    header("location:suratkeluar.php");
        }else{
                echo "Data Gagal Dihapus. <a href='suratkeluar.php'>Kembali ke halaman sebelumnya</a>";
        }
?>