<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>School Admin - Login</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Login an Account</div>
      <div class="card-body">
        <form action="logindb.jsp" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">User Name</label>
                <input class="form-control" name ="uname" id="exampleInputName" type="text" aria-describedby="nameHelp" placeholder="Enter User name">
              </div>
              
            </div>
          </div>
         
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputPassword1">Password</label>
                <input class="form-control" name="password" id="exampleInputPassword1" type="password" placeholder="Password">
              </div>
              
            </div>
          </div>
          <input class="btn btn-primary btn-block" type="submit" value="Login">
          
        </form>
          <!--
        <div class="text-center">
          <a class="d-block small mt-3" href="../index.php">Home</a>
          
        </div>
          -->
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
