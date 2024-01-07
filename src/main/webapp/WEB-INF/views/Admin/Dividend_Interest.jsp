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
                            <i class="fa fa-table"></i> Change_Interest</div>
                        <div class="card-body" align="center">



                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Share Interest Rate</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "share_interest" name="share_interest" placeholder="Enter Share Interest" required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit Interest Rate</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "monthly_deposit_interest" name="monthly_deposit_interest" placeholder="Enter Monthly Deposit Interest" required="required">
                                    </div>
                                </div>

                                <button type="button" class="btn btn-primary " onclick="return dividend_interest_save();">Submit</button>

                            </form>


                        </div>
                    </div>



                    <div class="row" id="load_tweets">

                    </div>
                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> VIEW DIVIDEND INTEREST
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0" >          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Share_Interest</th>	
                                    <th scope="col">Monthly_Deposit_Interest</th> 
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${DividendInterestInfo}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.share_interest}</td>
                        		<td>${obj.monthly_deposit_interest}</td>
                        		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="return delete_dividend_interest(${obj.id});"><i class="fa fa-trash"></i></button></td>
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 

                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

			<script>
            function dividend_interest_save() {
        	 	var share_interest = document.getElementById("share_interest").value;
        	 	var monthly_deposit_interest = document.getElementById("monthly_deposit_interest").value; 
        	 	
        	 	if (share_interest == "") {
                	  alert("Share Interest Required")
                	  return false;
               	}
          	 	if (monthly_deposit_interest == "") {
                	  alert("Monthly Deposit Interest required")
                	  return false;
               	}
        	 	
        	 	 var formData = new FormData();
        		    formData.append('share_interest', share_interest);
        		    formData.append('monthly_deposit_interest', monthly_deposit_interest);
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./dividend_interest_save",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			//contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        			
        	 		success : function(data) {

        	 			var res = data;
        	 			if (res == "Success") {
        	 			window.location.href = './Dividend_Interest';
        	 			alert("Dividend Interest Save Successfully");
        	 			} else {
        	 				alert("Dividend Interest Save failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function delete_dividend_interest(id) {
        	 	// alert(id);
        	 	 var formData = new FormData();
        		    formData.append('id', id);
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./delete_dividend_interest",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			//contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        			
        	 		success : function(data) {

        	 			var res = data;
        	 			if (res == "Success") {
        	 			window.location.href = './Dividend_Interest';
        	 			alert("Deleted Successfully");
        	 			} else {
        	 				alert("Deleted failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
			</script>

        </body>

    </html>
