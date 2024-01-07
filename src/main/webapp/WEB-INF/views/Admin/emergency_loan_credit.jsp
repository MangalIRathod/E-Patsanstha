<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin - Emergency Loan Credit</title>
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
                            <i class="fa fa-table"></i> Emergency Loan Credit</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id = "accountnumber" name="accountnumber" placeholder="Enter Account No."  required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary " onclick="return search_emergency_credit_loan_details();">Search</button>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id = "date1" name="date1" placeholder="Enter Date"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Prev. Balance</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "previousbalance" name="previousbalance" placeholder="Enter Prev. Balance"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Loan Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id= "loanamount" name="loanamount" placeholder="Enter Loan Amount"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="chequenumber" name="chequenumber" placeholder="Enter Cheque No."  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Receipt No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "receiptnumber" name="receiptnumber" placeholder="Receipt Details">
                                    </div>
                                </div>
                                
                                
                                <button type="button" class="btn btn-primary " onclick="return emergency_loan_credit_save();">Submit</button>

                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Emergency Loan Credit
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Loan Amount</th>                      
                                    <th scope="col">Cheque No.</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Current Balance</th>
                                </tr>
                            </thead>
							<tbody>
                        <c:forEach var="obj" items="${EmergencyLoanCreditInfo}" varStatus="theCount">
                         <fmt:parseNumber var = "i" type = "number" value = "${obj.previousbalance}" />
                          <fmt:parseNumber var = "j" type = "number" value = "${obj.loanamount}" />
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.loanamount}</td>
                        		<td>${obj.chequenumber}</td>
                        		<td>${obj.date1}</td>
                        		<td> ${i - j} </td>
                        		
                          </tr>
                          </c:forEach>
                        </tbody>

                        </table> 
                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

        
        <script>
        
        
            function emergency_loan_credit_save() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;      
        	 	var date1 = document.getElementById("date1").value;
        	    //var date1 = changeDateFormat(inputDate1);
        	 	var previousbalance = document.getElementById("previousbalance").value;
        	 	var loanamount = document.getElementById("loanamount").value;
        	 	var chequenumber = document.getElementById("chequenumber").value;
        	 	var receiptnumber = document.getElementById("receiptnumber").value;
        	 	
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);     
        		    formData.append('date1', date1);
        		    formData.append('previousbalance', previousbalance);
        		    formData.append('loanamount', loanamount);
        		    formData.append('chequenumber', chequenumber);
        		    formData.append('receiptnumber', receiptnumber);
        		    
        		          		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./emergency_loan_credit_save",
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
        	 			window.location.href = './emergency_loan_credit';
        	 			alert("Emergency Loan Credit Saved Successfully");
        	 			} else {
        	 				alert("Emergency Loan Credit Saved failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_emergency_credit_loan_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
            	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_emergency_credit_loan_details",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	    		 
        	    		 document.getElementById('fullname').value = result[0];        	    		 
        	    		 document.getElementById('previousbalance').value = result[1];
        	 			
        	 			if (res == "Success") {
        	 		//	window.location.href = './New_Loan';
        	 		//	alert("Loan Sanction Successfully");
        	 			} else {
        	 				alert(res);
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            </script>


    </body>

</html>
