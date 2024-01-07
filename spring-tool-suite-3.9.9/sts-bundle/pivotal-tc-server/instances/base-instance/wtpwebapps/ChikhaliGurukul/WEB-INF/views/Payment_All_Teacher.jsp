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
                                   <label for="example-text-input" class="col-4 col-form-label">Wdays</label>
                                   <div class="col-6">
                                        <input class="form-control" type="text" id="wday" name="wday" >
                                    </div>
                                </div>
                                  
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Start_Date</label>
                                    <div class="col-6">
                                        <input class="form-control" type="date" id="sdate" name="sdate" placeholder="Select Start Date"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">End_Date</label>
                                    <div class="col-6">
                                        <input class="form-control" type="date" id="edate" name="edate" placeholder="Select End Date"  required="required">
                                    </div>
                                </div>
                                 <div>
                                <button type="button" class="btn btn-primary" onclick="Submit();">Submit</button> 
                               
                                
                                <divclass="form-group row" align="right">
                                <button type="button" class="btn btn-primary" onclick="SaveAll();">SaveAll</button> 
                               
                                </div>
                                </div>
                                
                                
                             </form>
                             
                              </div>
                    </div>
     
            
           
            
            <script>
            function Submit() {
               
        		var Tname =document.getElementById("Tname").value;
        		var Wday = document.getElementById("wday").value;
        		var date1 =document.getElementById("sdate").value;
        		var date2 =document.getElementById("edate").value;
        		
        		if (Tname == "" && date1 == "" && date2 == "" && Wday == "" ) {
        			alert("Tname required")
        			
        		
        			return false;
        		}

        		
        	 	$.ajax({
        		type : "POST",
        		url : "Teacher_Payment_cal",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			Tname : Tname,
        	        Wday : Wday,
        			date1 : date1,
        			date2 : date2,
        			
        		},
        		success : function(data) {

        			var res = data;
        			var myArray = res.split(":");
        			document.getElementById("text1").value = myArray[0];
        			document.getElementById("text2").value = myArray[1];
        			document.getElementById("text3").value = myArray[2];
        			document.getElementById("text4").value = myArray[3];
        			document.getElementById("text5").value = myArray[4];
        			
        			
        			
        			if (res == "Success") {            			
        			alert("Record  Successfully");
        			window.location.href = 'Teacher_Payment';
        			
        			} else {
        				alert("Connection Error");
        				
        			} 

        		}
        	});

        }
            
            
 </script>
 
 <script>
            function SaveAll() {
               
        		var Tname =document.getElementById("Tname").value;
        		var Wday = document.getElementById("wday").value;
        		var date1 =document.getElementById("sdate").value;
        		var date2 =document.getElementById("edate").value;
        		
        		if (Tname == "" && date1 == "" && date2 == "" && Wday == "" ) {
        			alert("Tname required")
        			
        		
        			return false;
        		}

        		
        	 	$.ajax({
        		type : "POST",
        		url : "data_search",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			Tname : Tname,
        	        Wday : Wday,
        			date1 : date1,
        			date2 : date2,
        			
        		},
        		success : function(data) {

        			var res = data;
        
        			if (res == "Success") {            			
        			alert("Record  Successfully");
        			window.location.href = 'Teacher_Payment';
        			
        			} else {
        				alert("Connection Error");
        				
        			} 

        		}
        	});

        }
            
            
 </script>


        </body>

    </html>
