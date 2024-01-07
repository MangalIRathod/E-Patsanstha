<!DOCTYPE html>
<html lang="en">

<head>
  <%@ page contentType="text/html; charset=UTF-8" %>
  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>E-Patsanstha - Member Login</title>
  <!-- Bootstrap core CSS-->
  <link href="UserUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="UserUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="UserUI/css/sb-admin.css" rel="stylesheet">
<style>
p.date {
  text-align: center;
  color:red;
}
 </style>
</head>

<body class="bg-white">
 
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header"><h6> <p class="date"> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ </p></h6>
      <p style="float: left;"><img src="../logo/sr_logo.jpeg" height="70" width="60" alt=""></p>
      <h4><p class="date">कर्मचारी सहकारी पतसंस्था  मर्यादित,</p> </h4>  <h6> <p class="date">विष्णुपुरी, नांदेड</h6></p></div>
      <div class="card-body">
        <form action="#" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">Enter Account No</label>
                <input class="form-control" name ="acc_no" id="acc_no" type="text" aria-describedby="nameHelp" placeholder="Enter Account No">
              </div>
              
            </div>
          </div>
         
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputPassword1">Password</label>
                <input class="form-control" name="password" id="password" type="password" placeholder="Password">
              </div>
              
            </div>
          </div>
         <!--   <input class="btn btn-primary btn-block" type="submit" value="Login">-->
          <button type="button" class="btn btn-primary btn-block" onclick="return login();">Submit</button>
        </form>
          
               
        <div class="form-group row">                                   
        	<div class="col-6">
            	<a class="d-block small mt-3" href="user_forgot_password">Forgot Password</a> 
            </div>
                       
            <div class="col-6">
                <a style="float:right;" class="d-block small mt-3" href="user_register">Register</a> 
            </div>
    	</div>
          
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
   <script src="../UserUI/js/jquery-3.4.1.min.js"></script>
  <script src="UserUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="UserUI/vendor/jquery-easing/jquery.easing.min.js"></script>
 
  
  
   <script>
        
        function login() {
        	var acc_no = document.getElementById("acc_no").value;
        	var password = document.getElementById("password").value;
        	if (acc_no == "" && password == "") {
    			alert("Account No. OR Password should not be empty")
    			return false;
    		}
        	$.ajax({
        		type : "POST",
        		url : "./loginuser",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			acc_no : acc_no,
        			password : password,      			
        		},
        		success : function(data) {

        			var res = data;
        			if (res == "Success") {
        			window.location.href = './user_index';
        			alert("login Successfully");
        			} else {
        				alert("login failed");
        				
        			} 

        		}
        	});
        	
        }
 
   </script>
  
  
  
  
  
  
  
  
</body>

</html>
