<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>E-Patsanstha - Member Register</title>
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
      <div class="card-header">Register an Member</div>
      <div class="card-body">
        <form action="#" method="post">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">User Name</label>
                <input class="form-control" name ="user_name" id="user_name" type="text" aria-describedby="nameHelp" placeholder="Enter User name">
              </div>
              
            </div>
          </div>
            
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <label for="exampleInputName">Account Number</label>
                <input class="form-control" name ="acc_no" id="acc_no" type="text" aria-describedby="nameHelp" placeholder="Enter Account No.">
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
         <!--   <input class="btn btn-primary btn-block" type="submit" value="Register">-->
         <a> <button type="button" class="btn btn-primary btn-block" onclick="return registeruser();">Submit</button></a>
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
        
        
        
    
        function registeruser() {
        	
        	var user_name = document.getElementById("user_name").value;
        	var acc_no = document.getElementById("acc_no").value;
        	var password = document.getElementById("password").value;
        	
        	if (name == "" && password == "") {
    			alert("Name OR Password should not be empty")
    			return false;
    		}
        	$.ajax({
        		type : "POST",
        		url : "./user_save",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		
        		data : {
        			user_name : user_name,
        			acc_no : acc_no,
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
