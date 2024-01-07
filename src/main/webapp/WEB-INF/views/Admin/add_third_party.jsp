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
        <title>E-Patsanstha - Add Third Party</title>
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
                    
                
     
 <div class="row">

						<div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-info o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                     
                                    </div>
                                    <div class="mr-5" id="openingbalance">Opening Balance : ${openingBalance}  </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="">
                                    <span class="float-left"></span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                       <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-warning o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                      
                                    </div>
                                    <div class="mr-5">Credit Amount : ${credit} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="">
                                    <span class="float-left">Debit Amount : ${debit} </span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div> 
                        
                        
                       
                       
                         <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-primary o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                      
                                    </div>
                                    <div class="mr-5">Closing Balance : ${ClosingBalance} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="">
                                    <span class="float-left"> </span> 
                                    <span class="float-right"> </span>
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        </div>
                        
                     

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> Add Third Party Payment Form</div>
                        <div class="card-body" align="center">


 

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select Party Name</label>
                                    <div class="col-8">
                                        <select id="party_name" name="party_name" class="form-control">
                                        <c:forEach var="obj" items="${hn}" varStatus="theCount">
                                            <option value="${obj.name}">${obj.name}</option>
                                        </c:forEach>        
                                        </select>
                                    </div>
                                </div>

                                   <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="ACNumber" name="ACNumber" placeholder="Enter Account Number" required="required">
                                    </div>
                                </div>



                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="amount" name="amount" placeholder="Enter Amount" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="date" name="date" placeholder="Select Date"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque No</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="cheque_number" name="cheque_number" placeholder="Enter Cheque No"  required="required">
                                    </div>
                                </div>
                                
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Receipt No</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="receipt_number" name="receipt_number" placeholder="Enter Receipt No"  required="required">
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Transaction</label>
                                    <div class="col-8">
                                        <select id="transaction" name="transaction" class="form-control">                                      
                                            <option value="Debit">Debit</option>
                                            <option value="Credit">Credit</option>                                             
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
				                    <label for="example-text-input" class="col-4 col-form-label">Notes</label>
				                    <div class="col-8">
				                    	<textarea class="form-control" id="notes" name="notes" rows="2" required="required"></textarea>
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
                            <i class="fa fa-table"></i> VIEW PARTY DATA
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0" >          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Party Name</th>	
                                    <th scope="col">Amount</th> 
                                    <th scope="col">Date</th>	
                                    <th scope="col">Cheque No.</th>
                                    <th scope="col">Transaction</th>
                                    <th scope="col">Notes</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${tpp}" varStatus="theCount">
                                <tr>
                                    <td>${theCount.index+1}</td>	
                                    <td>${obj.party_name}</td>	
                                    <td>${obj.amount}</td>
                                    <td>${obj.date}</td>	
                                    <td>${obj.cheque_number}</td>
                                    <td>${obj.transaction}</td>
                                    <td>${obj.notes}</td>
                                    <td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="DeleteEntry(${obj.id});" ><i class="fa fa-trash"></i></button></td>
                                </tr>
                            </c:forEach>     
                            </tbody>
                        </table> 

                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

            <script>
            
            
            
                function onedit()
                {
                    var table = document.getElementById('dataTable');
                    for (var i = 1; i < table.rows.length; i++)
                    {
                        table.rows[i].onclick = function ()
                        {
                            //rIndex = this.rowIndex;
                            document.getElementById("id").value = this.cells[0].innerHTML;
                        };
                    }
                }
            </script>
            
            <script>
            function Submit() {
var accountNumber =document.getElementById("ACNumber").value;
            	var party_name = document.getElementById("party_name").value;
        		var amount = document.getElementById("amount").value;
        		var date = document.getElementById("date").value;
        	    //var date = changeDateFormat(inputDate1);
        		var cheque_number = document.getElementById("cheque_number").value;
        		var transaction = document.getElementById("transaction").value;
        		var notes = document.getElementById("notes").value;
        		var receipt_number = document.getElementById("receipt_number").value;
        		//var OpeningBalaance = document.getElementById("openingbalance").value;
        		
        		if (party_name == "") {
        			alert("Party Name required")
        			return false;
        		}
        		if (amount == "") {
        			alert("Amount required")
        			return false;
        		}
        		if (date == "") {
        			alert("Date required")
        			return false;
        		}
        		//code mangal
        		if(accountNumber == ""){
        			alert("AccountNumber requierd")
        			return false;
        		}
        		
        		//end
        		
        		
        		
        	$.ajax({
        		type : "POST",
        		url : "../Admin/Add_Third_Party_Payment",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			party_name : party_name,
        			amount : amount,
        			date : date,
        			cheque_number : cheque_number,
        			receipt_number : receipt_number,
        			transaction : transaction,
        			notes : notes,
        			accountNumber : accountNumber,
        			
        		},
        		success : function(data) {

        			var res = data;
        			
        			if (res == "Fail" ) {
        				alert("Third Party Payment Failed To Add");
        			}
        			else if(res == "closing balance must be positive")
        			{
        				alert("closing balance must be positive");
        			}
        			
        			else {
        				alert("Third Party Payment Added Successfully");
        				window.location.href = 'add_third_party';
        			} 

        		}
        	});

        }
            
            function DeleteEntry(id) {
            	$.ajax({
            		type : "POST",
            		url : "../Admin/DeleteThirdParty",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			id : id,           			
            		},
            		success : function(data) {

            			var res = data;
            			if (res == "Success") {            			
            			alert("Record Deleted Successfully");
            			window.location.href = 'add_third_party';
            			
            			} else {
            				alert("Connection Error");
            				
            			} 

            		}
            	});
            	
            }
            
            </script>


        </body>

    </html>
