<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>E-Patsanstha - Admin Forgot Password</title>
  <!-- Bootstrap core CSS-->
  <link href="/AdminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="/AdminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="/AdminUI/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Admin Forgot Password</div>
      <div class="card-body">
        <form action="#" method="post">
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">User Name</label>
                <input class="form-control" name ="wname" id="exampleInputMob" type="text" aria-describedby="nameHelp" placeholder="Enter User Name">
              </div>
              
            </div>
          </div>  
         
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputPassword1">New Password</label>
                <input class="form-control" name="password" id="exampleInputPassword1" type="password" placeholder="Password">
              </div>
              
            </div>
          </div>
          
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputPassword1">Confirm Password</label>
                <input class="form-control" name="password" id="exampleInputPassword1" type="password" placeholder="Confirm Password">
              </div>
              
            </div>
          </div>
          
         <!--   <input class="btn btn-primary btn-block" type="submit" value="Register">-->
         <a> <button type="button" class="btn btn-primary btn-block" onclick="return registeruser();">Submit</button></a>
        </form>
          
        <div class="text-center">
          <a class="d-block small mt-3" href="login">Login</a>          
        </div>
          
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
 <script src="/AdminUI/js/jquery-3.4.1.min.js"></script>
  <script src="/AdminUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="/AdminUI/vendor/jquery-easing/jquery.easing.min.js"></script>
   
  
  
  <script>
        
        
        
    
        function registeruser() {
        	
        	var name = document.getElementById("exampleInputName").value;
        	var MobileNumber = document.getElementById("exampleInputMob").value;
        	var password = document.getElementById("exampleInputPassword1").value;
        	
        	if (name == "" && password == "") {
    			alert("Name OR Password should not be empty")
    			return false;
    		}
        	$.ajax({
        		type : "POST",
        		url : "./user_save",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		
        		data : {
        			name : name,
        			MobileNumber : MobileNumber,
        			password : password,
        		
        		},
        		success : function(data) {

        			var res = data;
        			if (res == "Success") {
        			window.location.href = './user_login';
        			
        			} else {
        				alert("Connection Error");
        				
        			} 

        		}
        	});
        	
        	
        }

        
        
   </script>
  
  
  
  
  
  
</body>

</html>
