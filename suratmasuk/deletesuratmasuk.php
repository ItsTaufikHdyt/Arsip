<?php
    include "../koneksi/config.php";
    $id_surat_masuk = $_GET['id_surat_masuk'];
    $query = $dbconnect->query("DELETE FROM surat_masuk WHERE id_surat_masuk='$id_surat_masuk'");

        if($query){
                    header("location:suratmasuk.php");
        }else{
                echo "Data Gagal Dihapus. <a href='suratmasuk.php'>Kembali ke halaman sebelumnya</a>";
        }
?>