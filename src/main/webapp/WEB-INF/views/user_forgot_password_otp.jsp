<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>E-Patsanstha - Member Forgot Password</title>
  <!-- Bootstrap core CSS-->
  <link href="UserUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="UserUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="UserUI/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Member Verify OTP</div>
      <div class="card-body">
        <form action="#" method="post">
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">Enter OTP</label>
                <input class="form-control" name ="otp" id="otp" type="text" aria-describedby="nameHelp" placeholder="Enter OTP">
              </div>
              
            </div>
          </div>  
         
          
          
         <!--   <input class="btn btn-primary btn-block" type="submit" value="Register">-->
         <a> <button type="button" class="btn btn-primary btn-block" onclick="return otp_verify();">Submit</button></a>
        </form>
          
        <div class="text-center">
          <a class="d-block small mt-3" href="user_login">Login</a>          
        </div>
          
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
 <script src="../UserUI/js/jquery-3.4.1.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
   
  
  
  <script>
        
  function otp_verify()
  {	
  	var otp = $("#otp").val();
  	
  	if (otp == "") {
  	  alert("Please Enter OTP!!!")
  	  return false;
 	}
  	
  	$.ajax({
  		type : "POST",
  		url : "./UserVerifyOTP",
  		traditional : true,
  		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
  		data : {    			
  			otp : otp, 			
  		},
  		success : function(data1) {

  			var res = data1;
  			//alert(res);
  			if (res == "Success") {
  				alert("Password Updated Successfully.")
  				window.location.href = './user_login';
  			}
  			 else {
  				alert("Wrong OTP!!!")
  			//	window.location.href = './user_forgot_password';
  			}
  		}
  	});
  
  }
  </script>
        
        
   
  
  
  
  
  
  
</body>

</html>
