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
                            <i class="fa fa-table"></i> Loan Amount Credit Form</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number  (खाते क्रमांक)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id = "accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">

                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary " onclick="return search_credit_loan_details();">Search</button>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Shares</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "shares" name="shares" placeholder="Shares Detail"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "insurance" name="insurance" placeholder="Insurance Details"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Principal Amount </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "PrincipalAmount" name="PrincipalAmount" placeholder="Principal Amount Details"  required="required">
                                    </div>
                                </div>
                                
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Prev. Loan Amount (मागील कर्जाची रक्कम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="prevloan" name="prevloan" placeholder="Previous Loan Amount"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Credit 	`
                                    
                                    
                                    
                                    Loan Amount (कर्जाची रक्कम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id = "loanamount" name="loanamount" placeholder="Enter loan Amount (in Rs.)"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id = "chequenumber" name="chequenumber" placeholder="Enter Cheque No.">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Receipt No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "receipt" name="receipt" placeholder="Receipt Details">
                                    </div>
                                </div>
                                
                                

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="date" name="date" placeholder="Date" required="required">
                                    </div>
                                </div>
                            
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select files:</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>
                               
                                <button type="button" class="btn btn-primary " onclick="return loan_amount_credit();">Submit</button>

                            </form>



                        </div>
                    </div>


                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> NEW LOAN</div>
                        
                            <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
  <thead>
    <tr>
                                        <th scope="col">Id</th>	
                                        <th scope="col">Account No</th>	
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Loan Amount</th>
                                        <th scope="col">Cheque Number</th>
                                        <th scope="col">Receipt No</th>
                                        <th scope="col">Shares</th>
                                        <th scope="col">Insurance</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Current Loan Balance</th>
                                        <th scope="col">Uploaded Document</th>

                                    </tr>
                                </thead>
								<tbody>
                        <c:forEach var="obj" items="${Credit_Loan_Info}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.loanamount}</td>
                        		<td>${obj.chequenumber}</td>
                        		<td>${obj.receipt}</td>
                        		<td>${obj.shares}</td>
                        		<td>${obj.insurance}</td>
                        		<td>${obj.date}</td>
                        		<td>${obj.prevloan}</td>
                        		<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadLoanAmountCreditDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td>
                        		
                          </tr>
                          </c:forEach>
                        </tbody>
                            </table> 
                        </div>
                    </div>    

                


            </div>

        </body>
        
        <script>
        
        function changeDateFormat(inputDate){  // expects Y-m-d
    	    var splitDate = inputDate.split('-');
    	    if(splitDate.count == 0){
    	        return null;
    	    }
    	    var year = splitDate[0];
    	    var month = splitDate[1];
    	    var day = splitDate[2]; 
    	    return day + '-' + month + '-' + year;
    	}
        
            function loan_amount_credit() {
        	 	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;
        	 	var loanamount = document.getElementById("loanamount").value;
        	 	var chequenumber = document.getElementById("chequenumber").value;
        	 	var receipt = document.getElementById("receipt").value;
        	 	var shares = document.getElementById("shares").value;       	 	
        	 	var insurance = document.getElementById("insurance").value;
        	 	var date = document.getElementById("date").value;
        	    //var date = changeDateFormat(inputDate1);
        	 	var prevloan = document.getElementById("prevloan").value;
        	 	var PrincipalAmount  =  document.getElementById("PrincipalAmount").value;
        	 	var photo = document.getElementById("photo").value;
        	 	
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	// 	if (photo == "") {
	        //        alert("Please Select File")
	        //        return false;
            //    }
        	 	
        	 	 var formData = new FormData();
        		    formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);
        		    formData.append('loanamount', loanamount);
        		    formData.append('chequenumber', chequenumber);
        		    formData.append('receipt', receipt);
        		    formData.append('shares', shares);
        		    formData.append('insurance', insurance);
        		    formData.append('date', date);
        		    formData.append('prevloan', prevloan);
        		    formData.append('PrincipalAmount', PrincipalAmount);
        		          	
        		    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		    for(var i = 0;i<file_data.length;i++){
        		    	formData.append("files", file_data[i]);
        		    }
        		   	 	
        	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./loan_amount_credit_save",
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
        	 			window.location.href = './LoanAmountC';
        	 			alert("Loan Credit Successfully");
        	 			} else {
        	 				alert("Loan Credit failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_credit_loan_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	   
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_credit_loan_details",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	 			
        	    		 document.getElementById('fullname').value = result[0];
        	    		 document.getElementById('shares').value = result[1];
        	    		 document.getElementById('insurance').value = result[2];
        	    		 document.getElementById('prevloan').value = result[3];
        	    		 document.getElementById('PrincipalAmount').value = result[4];
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
        

    </html>
