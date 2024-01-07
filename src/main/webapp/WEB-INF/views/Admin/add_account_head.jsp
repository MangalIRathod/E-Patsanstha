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
        <title>E-Patsanstha - Add Account Head</title>
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
                            <i class="fa fa-table"></i> Add Account Head</div>
                        <div class="card-body" align="center">



                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Party Name</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="tname" placeholder="Enter Party Name"  required="required">
                                    </div>
                                </div>

                                

                              <button type="button" class="btn btn-primary" onclick="Submit();">Submit</button>

                            </form>


                        </div>
                    </div>



                    <div class="row" id="load_tweets">

                    </div>
                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> View Party Head
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0" >          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Party Head</th>	
                                    
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${hn}" varStatus="theCount">
                                <tr>
                                    <td>${theCount.index+1}</td>
                        			<td>${obj.name}</td>
                                    <td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="DeleteEntry(${obj.id});" ><i class="fa fa-trash"></i></button></td>
                                </tr>
                            </c:forEach>    
                            </tbody>
                        </table> 

                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->


            <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" align="center">
                            <h5 class="modal-title" id="exampleModalLabel">Vehicle Allotment</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">Ã</span>
                            </button>
                        </div>
                        <div class="modal-body" align="center">
                            <form method="POST" action = "#"> 
                                <!-- <label for="recipient-id" class="col-form-label"><b>Id:</b></label> -->
                                <input type="text" class="form-control" name="id" id="id" readonly>
                                <label for="recipient-id" class="col-form-label"><b>Select Vehicle</b></label>
                                <select id="allot_vehicle" name="allot_vehicle" class="form-control">
                                </select>    
                                <div class="modal-footer">            		
                                    <input type="submit" class="btn btn-primary" name="Submit" value="Submit">              
                                </div>
                            </form>
                        </div>          
                    </div>
                </div>
            </div>

            <script>
            function Submit() {

        		
        		var HeadName = document.getElementById("tname").value;
        		if (HeadName == "") {
        			alert("Head Name required")
        			return false;
        		}
        		
        		
        	$.ajax({
        		type : "POST",
        		url : "../Admin/AddHeadName",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			HeadName : HeadName,
        			
        		},
        		success : function(data) {

        			var res = data;
        			
        			if (res == "Fail" ) {
        				alert("Head Failed To Add");
        			} else {
        				alert("Head Added Successfully");
        				window.location.href = 'add_account_head';
        			} 

        		}
        	});

        }
            
            function DeleteEntry(id) {
            	$.ajax({
            		type : "POST",
            		url : "../Admin/DeleteAccountHead",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			id : id,           			
            		},
            		success : function(data) {

            			var res = data;
            			if (res == "Success") {            			
            			alert("Record Deleted Successfully");
            			window.location.href = 'add_account_head';
            			
            			} else {
            				alert("Connection Error");
            				
            			} 

            		}
            	});
            	
            }
            
            </script>


        </body>

    </html>
