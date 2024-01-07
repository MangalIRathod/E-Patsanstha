<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta http-equiv="Content-Security-Policy" content="block-all-mixed-content">
    <title>Insecure_Deserialization</title>
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
    <!-- country mobile number css  -->
    <link rel="stylesheet" href="../css/intlTelInput.css">
    <link rel="stylesheet" href="../css/demo.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/own.css" />
    
    <script>
    window.addEventListener('contextmenu', function (e) {
    	  //document.body.innerHTML += '<p>Right-click is disabled</p>'
    	  e.preventDefault();
    	}, false);    
        </script> 
    
  </head>
  <body class="crm_body_bg">
    <div class="container pt-2">
      <div class="row justify-content-center">
        <div class="col-lg-12">
        <!-- 
           <div class="row justify-content-left">
            <div class="col-lg-4 mb-3">
              <div class="logo d-flex justify-content-left">
                <a href="#"><img  class="img-logo" src="" alt=""></a>
               </div>
             </div>
         </div>
         -->
          <div class="row justify-content-center">
            <div class="col-lg-5">
              <!-- sign_in  -->
              <div class="modal-content cs_modal">
                <div class="modal-header justify-content-left theme_bg_1">
                  <h5 class="modal-title">Insecure_Deserialization</h5>
                </div>
                <div class="modal-body">
                
                  <form>                
                  <div class="row">              
                     
                     <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead class="theadone">                         
                              <tr>
                                <th>Id</th>
                                <th>Array List</th>                               
                              </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="obj" items="${arraylist}" varStatus="theCount">
                              <tr>
                                <td>${theCount.index+1}</td>
                                <td>${obj}</td>                               
                              </tr>
                              </c:forEach>
                            </tbody>
                          </table>
                     
                     <table class="table table-bordered" width="100%" cellspacing="0">
                            <thead class="theadone">                         
                              <tr>
                                <th>Id</th>
                                <th>Vector</th>                               
                              </tr>
                            </thead>
                            <tbody>
                             <c:forEach var="obj" items="${vector}" varStatus="theCount">
                              <tr>
                                <td>${theCount.index+1}</td>
                                <td>${obj}</td>                               
                              </tr>
                              </c:forEach>
                            </tbody>
                          </table>     
                    
                  </div>
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
     <!-- country code js -->
    <script src="../js/intlTelInput.js"></script>
    <script src="../js/nationalMode.js"></script>

    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script>
  
      function Read_XML() {      	
      	
      	$.ajax({
      		type : "POST",
      		url : "./Read_XML",
      		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
      		
      		success : function(data) {

      			var res = data;
      			if (res == "Success") {
      			window.location.href = './xee';
      			alert("XML File Read Successfully");
      			} 
      			else if (res == "Duplicate Entry") {
    				alert("Mobile No. Already Added.")
    				window.location.href = './xee';
    			} else {
    				alert("User Registration Failed")
    				window.location.href = './xee';
    			}

      		}
      	});
      
      }
      
    </script>
  </body>
</html>