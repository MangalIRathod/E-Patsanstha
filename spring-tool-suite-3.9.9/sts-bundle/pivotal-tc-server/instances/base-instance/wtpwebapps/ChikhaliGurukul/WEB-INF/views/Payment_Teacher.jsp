<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>School - Payment Calculation</title>
        <!-- Bootstrap core CSS-->
        <link href="/AdminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="/AdminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="/AdminUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="/AdminUI/css/sb-admin.css" rel="stylesheet">
        <script src="/AdminUI/js/jquery.js"></script>
        <!-- send id to fullorder.php-->

        
        <style>
            .table-bordered td, .table-bordered th {
                border: 1px solid #dee2e6; 
                border-right: 5px solid red;
                border-left: 5px solid red;
                border: 1px;
            }
        </style>

    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@ include
            file="navbar.jsp"%>
            <div class="content-wrapper">
                <div class="container-fluid">
                    <a href="#"></a>
                      </li>
                        </ol>
                    <!-- Icon Cards-->
                    
                         <div class="card mb-3">
                        <div class="card-header">
                         <i class="fa fa-table"></i> Payment_Calculation</div>
                        <div class="card-body" align="center">


                            <form  action="#" autocomplete="on" method="post">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select Name</label>
                                    <div class="col-6">
                                        <select id="Tname" name="Tname" class="form-control">
                                        <c:forEach var="obj" items="${fetchname}" varStatus="theCount">
                                            <option value="${obj}">${obj}</option>
                                        </c:forEach>        
                                        </select>
                                    </div>
                                </div>


                                
                                <div class="form-group row" align="center">
                                    <label for="example-text-input" class="col-4 col-form-label">TPayment</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="text1" name="text1" >
                                    </div>
                                </div>
                                 <div>
                                <button type="button" class="btn btn-primary" onclick="Submit();">Submit</button> 
                               
                                </div>
                                </div>
                               
                                
                             </form>
                             
                             
                   
     
            
           
            
            <script>
            function Submit() {
                
        		var Tname =document.getElementById("Tname").value;
        		var TPayment =document.getElementById("text1").value;
        		
        		
        		if (Tname == "" ||TPayment == ""  ) {
        			
        			alert("Tname required")
        			
        		
        			return false;
        		}

        		
        	 	$.ajax({
        		type : "POST",
        		url :  " ./Payment_Teacher_cal",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			Tname : Tname,
        			TPayment : TPayment,
        			
        		},
        		success : function(data) {

        			var res = data;
        			if (res == "Success") {            			
        			alert("Record  Successfully");
        			window.location.href = 'Payment_Teacher';
        			
        			} else {
        				alert("Connection Error");
        				
        			} 

        		}
        	});

        }
            
            
 </script>


        </body>

    </html>
