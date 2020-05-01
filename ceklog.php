<?php
session_start();
include("koneksi/config.php");
$id_petugas=$_POST['id_petugas'];
$password=$_POST['password'];
$pass=md5($password);
$cek=mysqli_query($dbconnect,"SELECT * FROM petugas WHERE id_petugas='$id_petugas' AND password='$pass'");
$data1=mysqli_num_rows($cek);
$data2=mysqli_fetch_array($cek);

	if($data1==0)
	{
	header("location:login.php?err=yes");
	}
	else if($data1>0)
	{
		if($data2['hak']=="surat_masuk")
		{
		$SESSION['id_petugas']=$data2['id_petugas'];
		$SESSION['password']=$data2['password'];
		$_SESSION['hak']="surat_masuk";
		header("location:suratmasuk/suratmasuk.php");
		}
		else if($data2['hak']=="surat_keluar")
		{
		$SESSION['id_petugas']=$data2['id_petugas'];
		$SESSION['password']=$data2['password'];
		$_SESSION['hak']=="surat_keluarkeluar";
		header("location:suratkeluar/suratkeluar.php");
		}
        else{
        echo "id_petugas atau Password salah";}
	}
?>