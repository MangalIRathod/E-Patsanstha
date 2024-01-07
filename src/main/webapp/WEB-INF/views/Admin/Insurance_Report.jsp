<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha</title>
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


    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@ include
            file="navbar.jsp"%>
            <div class="content-wrapper">
                <div class="container-fluid">
                    <!-- Breadcrumbs-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">My Dashboard</li>
                    </ol>
                    <!-- Icon Cards-->



                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> Insurance Report</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">
                              
 								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="accountnumber" name="accountnumber">
                                    </div>
                                </div>
 								
 								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select Start Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="sdate" name="sdate" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select End Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="edate" name="edate" required="required">
                                    </div>
                                </div>
                                
								<button type="button" class="btn btn-primary" onclick="return insurance_report();">Report</button>
                            </form>

                        </div>
                    </div>

                </div>


            </div>
            
            <script>
            function insurance_report() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var sdate = document.getElementById("sdate").value;
        	 	var edate = document.getElementById("edate").value;
        	 	
        	 	if (sdate == "") {
              	  alert("Please Select Start Date")
              	  return false;
             	}
        	 	if (edate == "") {
              	  alert("Please Select End Date")
              	  return false;
             	}
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('sdate', sdate);
        		    formData.append('edate', edate);
        		           	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./insurance_report",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, 
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {

        	 			var res = data;
        	 			if (res == "Success") {
        	 				window.open('./Insurance_Report_Print', '_blank');
        	 		//	alert("Loan Apply Successfully");
        	 			} else {
        	 				alert("Insurance_Report_Print Failed");        	 				
        	 			} 
        	 		}
        	 	});               	
                }          
            </script>

        </body>

    </html>
