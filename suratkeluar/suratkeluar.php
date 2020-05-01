<link href="../asset/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="../asset/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link  href="../asset/css/bootstrap-responsive.min.css"  rel ="stylesheet"> 
<link href="../asset/css/style.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.css"/>
<?php include('../navbar2.php'); ?>
            <div class="page-header">
                <div class="panel panel-Primary">
            <div class="panel-heading">
                <b>Surat Keluar</b>
            </div>              
            <div class="panel-body">    
            <table id="datatable" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Id Surat Keluar</th>
                        <th>Id Petugas</th>
                        <th>No Agenda</th>
                        <th>Id Jenis Surat</th>
                        <th>Tanggal Kirim</th>
                        <th>No Surat</th>
                        <th>Pengirim</th>
                        <th>Perihal</th>
                        <th>Kepada</th> 
						<th></th>						
                    </tr>
                </thead>

<?php
    
    include '../koneksi/config.php';
    $data1 = mysqli_query($dbconnect,"SELECT * FROM surat_keluar");
    while($data=mysqli_fetch_array($data1))
    {

    echo "<tr>";
    echo  "<td>" .$data['id_surat_keluar'], "</td>";
    echo  "<td>" .$data['id_petugas'], "</td>";        
    echo  "<td>" .$data['no_agenda'], "</td>"; 
    echo  "<td>" .$data['id_jenis_surat'], "</td>";        
    echo  "<td>" .$data['tgl_kirim'], "</td>";   
    echo  "<td>" .$data['no_surat'], "</td>";
    echo  "<td>" .$data['pengirim'], "</td>";
    echo  "<td>" .$data['perihal'], "</td>";     
    echo  "<td>" .$data['kepada'], "</td>";          
    echo  "<td>".
            "<a href='deletesuratkeluar.php?id_surat_keluar=$data[id_surat_keluar]' class='btn btn-danger btn-sm'>
                <span class='glyphicon glyphicon-trash'> Hapus</span></a>
           
            <a href='editsuratkeluar.php?id_surat_keluar=$data[id_surat_keluar]' class='btn btn-warning btn-sm'>
                <span class='glyphicon glyphicon-edit'> edit</span></a>",
        "</td></tr>";
 
 }?>
    <?php
    
    ?>

    </table>
    <a href="formsuratmasuk.php" class="btn btn-warning btn-sm">
        <span class="glyphicon glyphicon-plus"> Tambah Data</span>
    </a> 
</div>
</div>
</div>
</div>
</section>
</form>
</div>
		<script src="js/jquery-1.11.0.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="datatables/jquery.dataTables.js"></script>
        <script src="datatables/dataTables.bootstrap.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#datatable").dataTable();
            });
        </script>
</body>
</html>