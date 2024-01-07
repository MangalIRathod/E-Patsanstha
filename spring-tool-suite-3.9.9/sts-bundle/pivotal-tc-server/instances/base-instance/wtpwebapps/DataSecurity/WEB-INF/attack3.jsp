<!DOCTYPE html>
<html lang="zxx">
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>User Login</title>
    <link rel="icon" href="../img/mini_logo.png" type="image/png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <!-- themefy CSS -->
    <link rel="stylesheet" href="../vendors/themefy_icon/themify-icons.css" />
    <link rel="stylesheet" href="../vendors/font_awesome/css/all.min.css" />
    <!-- datatable CSS -->
    <!-- scrollabe  -->
    <link rel="stylesheet" href="../vendors/scroll/scrollable.css" />
    <!-- menu css  -->
    <link rel="stylesheet" href="../css/metisMenu.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/own.css" />
  </head>
  <body class="crm_body_bg">
    <div class="container mt-3">
      <div class="row justify-content-center">
        <div class="col-lg-12">
        <!--  
         <div class="row justify-content-left">
            <div class="col-lg-4 mb-3">
              <div class="logo d-flex justify-content-left">
                <a href="#"><img  class="img-logo" src="../img/logo.png" alt=""></a>
               </div>
             </div>
         </div>
         -->

          <div class="row justify-content-center">
            <div class="col-lg-4">
             <!-- sign_in  -->
              <div class="modal-content cs_modal">
                <div class="modal-header justify-content-left theme_bg_1">
                  <h5 class="modal-title">Log in</h5>
                </div>
                <div class="modal-body">
                  <form>
                    <div class="form-group">
                      <input type="text" id = "email" class="form-control" placeholder="Enter your email id">
                    </div>
                    <div class="form-group">
                      <input type="password" id = "password" class="form-control" placeholder="Password">
                    </div>
                    <a  class="btn_1 full_width text-center" onclick="return validation();">Log in</a>
                    <p>Need an account? <a href="signup"> Sign Up</a></p>
                    <!-- 
                    <div class="text-center">
                      <a href="forgot-password" class="pass_forget_btn">Forgot Password?</a>
                    </div>
                     -->
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- main content part end -->
    <!-- jquery slim -->
    <script src="../js/jquery-3.4.1.min.js"></script>
    <!-- popper js -->
    <script src="../js/popper.min.js"></script>
    <!-- bootstarp js -->
    <script src="../js/bootstrap.min.js"></script>
    
    
    <script>
    function validation() {

		
		var u_name = document.getElementById("email").value;
		var u_pwd = document.getElementById("password").value;

		if (u_name == "") {
			alert("Email Address required")
			return false;
		}
		
		if (u_pwd == "") {
			alert("Password required")
			
			return false;
		}

	$.ajax({
		type : "POST",
		url : "./attack3loginvalidate",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			u_name : u_name,
			u_pwd : u_pwd
		},
		success : function(data) {

			var res = data;
			if (res == "Success") {
			window.location.href = './index3';
			} else {
				alert("Username and Password is incorrect.")
				
			} 

		}
	});

}
    
    </script>
    
    
  </body>
</html>