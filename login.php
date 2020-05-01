<html>
  <head>
    <title>Arsip| Login</title>
<link href="asset/css/bootstrap.css" rel="stylesheet" media="screen">
<link href="asset/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link  href="asset/css/bootstrap-responsive.min.css"  rel ="stylesheet"> 
<link href="asset/css/style.css" rel="stylesheet" media="screen">
  </head>
  <body>
   <?php
        if(empty($_GET['err'])) {
        ?>
          
          
		 <?php 
        }else{
         ?>

     <div class="panel-body" >
       <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>PERINGATAN!</strong> ID petugas atau password salah.
</div>
      
	     <?php
         }
         ?>
    <div class="topbar"></div>
    <div class="col-md-3 col-md-offset-4 form-login">
        <div class="outter-form-login">
        <div class="logo-login">
            <em class="glyphicon glyphicon-user"></em>
        </div>
            <form action="ceklog.php" class="inner-login" method="post">
            <h3 class="text-center title-login">Login</h3>
                <div class="form-group">
                    <input type="text" class="form-control" name="id_petugas" placeholder="id petugas">
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                
                <input type="submit" class="btn btn-block btn-primary"/>
                
                <div class="text-center forget">
                </div>
            </form>
        </div>
    </div>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>
