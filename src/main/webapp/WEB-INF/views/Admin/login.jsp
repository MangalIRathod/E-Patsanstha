<!DOCTYPE html>
<html lang="en">

<head>
        <%@ page contentType="text/html; charset=UTF-8" %>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>E-Patsanstha - Admin Login</title>
  <!-- Bootstrap core CSS-->
  <link href="/AdminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/AdminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/AdminUI/css/sb-admin.css" rel="stylesheet">
 <style>
 .backimage {
  background-image: url("/logo/pat.jpeg");
  background-color: #cccccc;
 
  background-position: center;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  position: relative;
   
   
}
p.date {
  text-align: center;
  color:red;
}
 </style>
</head>

<body  class="bg-white">
  <div  class="container">
    <div class="card card-register mx-auto mt-5">
    
      <div class="card-header"> <h6> <p class="date"> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ </p></h6>
      <p style="float: left;"><img src="../logo/sr_logo.jpeg" height="70" width="60" alt=""></p>
      <h4><p class="date">कर्मचारी सहकारी पतसंस्था  मर्यादित,</p> </h4>  <h6> <p class="date">विष्णुपुरी, नांदेड</h6></p>
      </div>
      <div class="card-body">
        <form action="#" method="post">
          <div  class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">User Name</label>
                <input class="form-control" name ="wname" id="wname" type="text" aria-describedby="nameHelp" placeholder="Enter User name">
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
           <!-- <input class="btn btn-primary btn-block" type="submit" value="Login" onclick="return login();"> -->
           <button type="button" class="btn btn-primary btn-block" onclick="return login();">Login</button> 
        </form>
          <!-- 
	        <div class="text-center">
	          <a class="d-block small mt-3" href="forgot_password">Forgot Password</a>          
	        </div>
          -->
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
   <script src="/AdminUI/js/jquery-3.4.1.min.js"></script>
  <script src="/AdminUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="/AdminUI/vendor/jquery-easing/jquery.easing.min.js"></script>
  
  
  <script>
        
        function login() {
        	var name = document.getElementById("wname").value;
        	var password = document.getElementById("password").value;
        	if (name == "" && password == "") {
    			alert("Name OR Password should not be empty")
    			return false;
    		}       	
        	$.ajax({
        		type : "POST",
        		url : "./Adminloginvalidate",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			name : name,
        			password : password,        			
        		},
        		success : function(data) {

        			var res = data;
        			if (res == "Success") {
        			window.location.href = './Admin_index';
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
