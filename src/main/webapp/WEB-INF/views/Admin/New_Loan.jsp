<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                            <i class="fa fa-table"></i> NEW LOAN</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">
								<!-- <input type="hidden" id= "id" name="id"> -->
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number  (खाते क्रमांक)</label>
                                    <div class="col-5">
                                        <input class="form-control" type="number" id= "accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">

                                    </div>
                                    <div class="col-3">
                                        <button type="button" class="btn btn-primary " onclick="return search_new_loan_details();">Search</button>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव) </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance (विमा)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "insurance" name="insurance" placeholder="Insurance"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Share (भाग)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="share" name="share" placeholder="Share"  required="required">
                                    </div>
                                </div>
								
								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Gross Salary</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id = "grosssalary" name="grosssalary" placeholder="Enter Salary (in Rs.)"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Net Salary</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id = "netsalary" name="netsalary" placeholder="Enter Net Salary (in Rs.)"  required="required">
                                    </div>
                                </div>                                                         

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Loan Amount (कर्जाची रक्कम)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="loanamount" name="loanamount" placeholder="Enter loan Amount (in Rs.)"  required="required">
                                    </div>
                                    <div class="col-4">                                       
                                        <button type="button" class="btn btn-primary " onclick="return check_loan_sanction();">Check</button>
                                    </div>
                                </div>
                               
                               <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Type of Loan</label>
                                    <div class="col-8">
                                        <select id="typeofloan" name="typeofloan" class="form-control" onchange="type_of_loan(this.value);">
                                        <option value="Select Type">Select Type</option>
                                        <c:forEach var="obj" items="${ChangeInterestInfo}" varStatus="theCount">
                                            <option value="${obj.interesttype}">${obj.interesttype}</option>
                                        </c:forEach>        
                                        </select>roi
                                    </div>
                                </div>
                                -->
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">ROI (व्याज दर)</label>
                                    <div class="col-8">
                                       <select id="roi" name="roi" class="form-control">
                                        <c:forEach var="obj" items="${ChangeInterestInfo}" varStatus="theCount">
                                            <option value="${obj.roi}">${obj.roi}</option>
                                        </c:forEach>        
                                        </select>
                                    </div>
                                </div>
 									<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="date" name="date" placeholder="Enter Date"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">User Principal Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="tenure" name="tenure" placeholder="Enter User Principal Amount" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">EMI</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id = "emi" name="emi" placeholder="Enter EMI" onclick="LoanAutoCalculate();" onkeyup="LoanAutoCalculate();" required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary" onclick="return search_printAmortizationSchedule();">List</button>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Principal Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="principalamount" name="principalamount" placeholder="Enter Principal Amount"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Interest Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "intrestamount" name="intrestamount" placeholder="Intrest Amount"  required="required">
                                    </div>
                                </div>
								<!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 1 (हमी नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="guranteer" name="guranteer" placeholder="Guranteer Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 2 (हमी नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="guranteer2" name="guranteer2" placeholder="Guranteer Name"  required="required">
                                    </div>
                                </div>
                                 -->
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 1</label>
                                    <div class="col-8">
                                        <select id="guranteer" name="guranteer" class="form-control">
                                        <c:forEach var="obj" items="${glist}" varStatus="theCount">
                                            <option value="${obj.fullname}">${obj.fullname}</option>
                                        </c:forEach>        
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 2</label>
                                    <div class="col-8">
                                        <select id="guranteer2" name="guranteer2" class="form-control">
                                        <c:forEach var="obj" items="${glist}" varStatus="theCount">
                                            <option value="${obj.fullname}">${obj.fullname}</option>
                                        </c:forEach>        
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque Number</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="chequenumber" name="chequenumber" placeholder="Cheque Number"  required="required">
                                    </div>
                                </div>
                                <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Receipt Number</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="receiptnumber" name="receiptnumber" placeholder="Receipt Number"  required="required">
                                    </div>
                                </div>
                                -->
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select files:</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Loan Balance</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "loanbalance" name="loanbalance" placeholder="Enter Loan Balance"  required="required" readonly>
                                    </div>
                                </div>

                                
								<button type="button" class="btn btn-primary " onclick="return new_loan_save();">Loan Apply</button>
                            </form>



                        </div>
                    </div>


                    

                        <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> NEW LOAN
                        </div>
                        
                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">           
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">Full Name</th>
                                    <!--  
                                    <th scope="col">Insurance</th>
                                    <th scope="col">Share</th>                                    
                                    <th scope="col">Gross Salary</th>
                                    <th scope="col">Net Salary</th>
                                    -->
                                    <th scope="col">Loan Amount</th>
                                    <!-- <th scope="col">Type of Loan</th> -->
                                    <th scope="col">ROI</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">EMI</th>
                                    <th scope="col">Principal Amount</th>
                                    <!-- <th scope="col">Principal Amount</th> -->
                                    <th scope="col">Interest</th>
                                    <th scope="col">Loan Balance</th>
                                    <th scope="col">Guarantor1</th>
                                    <th scope="col">Guarantor2</th>
                                    <th scope="col">Cheque Number</th>
									<th scope="col">Uploaded Document</th>
									<th scope="col">Edit</th> 
									<th scope="col">Delete</th>
                                </tr>
                            </thead>
                             
                            <tbody>
                        <c:forEach var="obj" items="${LoanInfo}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		
                        		<td>${obj.loanamount}</td>
                        		
                        		<td>${obj.roi}</td>
                        		<td>${obj.date}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.emi}" /></td>
                        		<td>${obj.principalamount}</td>
                        		                    		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestamount}" /></td>                       		
                        		<td>${obj.loanbalance}</td>
                        		<td>${obj.guranteer}</td>
                        		<td>${obj.guranteer2}</td>
                        		<td>${obj.chequenumber}</td>
                        		
                        		<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadNewLoanDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td>
                        		<td><button class="btn btn-primary btn-sm rounded-0" type="button" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo" onclick="onedit22()"><i class="fa fa-edit"></i></button></td> 
                        		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="DeleteEntry(${obj.id},${obj.accountnumber});" ><i class="fa fa-trash"></i></button></td>
                        		
                          </tr>
                          </c:forEach>
                        </tbody>
						 
                        </table> 

                    </div> 
 
 <!-- -------------------------------------------------------------------------------------------------------------------->
 			<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" align="center">
          <h5 class="modal-title" id="exampleModalLabel">Update Guarantor</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body" align="center">
          	  <form method="POST" action = "#"> 
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                    <div class="col-8">
                    <input type="text" class="form-control" id="accountnum1" name="accountnum1" readonly>                   
                               
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Guarantor 1</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="gurant" name="gurant" placeholder="Enter Guarantor 1">
                    </div>
                </div>   
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Guarantor 2</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="gurantee" name="gurantee" placeholder="Enter Guarantor 2">
                    </div>
                </div>   
                
              	<div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Cheque Number</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id="chequenum" name="chequenum" placeholder="Enter Cheque Number">
                    </div>
                </div>                                                       
              
                 <div class="modal-footer"> 
                 	<button type="button" class="btn btn-primary " onclick="return update_loan_guarantor();">Submit</button>           		                 	              
          		 </div>
             </form>
        </div>          
        </div>
      </div>
    </div>

								<script>
                                    function onedit22()
                                    {
                                    	
                                        var table = document.getElementById('dataTable');
                                        for(var i = 1; i < table.rows.length; i++)
                                        {
                                            table.rows[i].onclick = function()
                                            {
                                            
                                               // alert(this.cells[1].innerHTML);
                                                //document.getElementById("id").value = this.cells[0].innerHTML; 
                                                document.getElementById("accountnum1").value = this.cells[1].innerHTML; 
                                                
                                            	                                             
                                            };
                                        }
                                    }
                                </script>                
 <!-- --------------------------------------------------------------------------------------------------------- -->                     
                       

                </div>


            </div>
            
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
            
            function new_loan_save() {
            	//var id = document.getElementById("id").value;
        	 	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;
        	 	var grosssalary = document.getElementById("grosssalary").value;
        	 	var netsalary = document.getElementById("netsalary").value;
        	 	var loanamount = document.getElementById("loanamount").value;
        	 	var roi = document.getElementById("roi").value;       	 	
        	 	var tenure = document.getElementById("tenure").value;
        	 	var emi = document.getElementById("emi").value;
        	 	var principalamount = document.getElementById("principalamount").value;
        	 	var intrestamount = document.getElementById("intrestamount").value;
        	 	var insurance = document.getElementById("insurance").value;	 
        	 	var share = document.getElementById("share").value;
        	 	var guranteer = document.getElementById("guranteer").value;
        	 	var guranteer2 = document.getElementById("guranteer2").value;
        	 	//var typeofloan = document.getElementById("typeofloan").value;
        	 	var chequenumber = document.getElementById("chequenumber").value;
        	 	
        	 	var photo = document.getElementById("photo").value;
        	 	
        	 	var loanbalance = document.getElementById("loanbalance").value;
        	 	
        	 	var loan = Number(loanamount)+Number(loanbalance);
        	 	var date = document.getElementById("date").value;
        	    //var date = changeDateFormat(inputDate1);
        	 	
        	    if (accountnumber == "") {
	                alert("Account Number Required")
	                return false;
                }
        	    if (guranteer == guranteer2) {
	                alert("Both Guarantor are same, Please select another!!!")
	                return false;
                }
        	    if (fullname == guranteer) {
	                alert("Member Name And Guarantor 1 are same, Please select another!!!")
	                return false;
                }
        	    if (fullname == guranteer2) {
	                alert("Member Name And Guarantor 2 are same, Please select another!!!")
	                return false;
                }
        	 //   if (photo == "") {
	         //       alert("Please Select File")
	         //       return false;
             //   }
        	 	
        	 	 var formData = new FormData();
        	 		//formData.append('id', id);
        		    formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);
        		    formData.append('grosssalary', grosssalary);
        		    formData.append('netsalary', netsalary);
        		    formData.append('loanamount', loanamount);
        		    formData.append('roi', roi);
        		    formData.append('tenure', tenure);
        		    formData.append('emi', emi);
        		    formData.append('principalamount', principalamount);
        		    formData.append('intrestamount', intrestamount);
        		    formData.append('insurance', insurance);
        		    formData.append('share', share);
        		    formData.append('guranteer', guranteer);
        		    formData.append('guranteer2', guranteer2);
        		    //formData.append('typeofloan', typeofloan);
        		    formData.append('chequenumber', chequenumber);
        		    formData.append('loanbalance', loan);
        		    formData.append('date', date);       		    
        		    
        		    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		    for(var i = 0;i<file_data.length;i++){
        		    	formData.append("files", file_data[i]);
        		    }
        		   	 	
        	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./new_loan_save",
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
        	 			window.location.href = './New_Loan';
        	 			alert("Loan Apply Successfully");
        	 			} else {
        	 				alert("Loan Apply failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }

            function update_loan_guarantor()
            {            		
           		var accountnumber = document.getElementById("accountnum1").value;
        	 	var guranteer = document.getElementById("gurant").value;       	 		 	
        	 	var guranteer2 = document.getElementById("gurantee").value;        	 	
           		var chequenumber = document.getElementById("chequenum").value;
             	          
                    	var formData = new FormData();                   	
            	 		formData.append('accountnumber', accountnumber);
            		    formData.append('guranteer', guranteer);        		    
            		    formData.append('guranteer2', guranteer2);
            		    formData.append('chequenumber', chequenumber);
            		    
            	 	$.ajax({
            	 		type : "POST",
            			url : "./New_Loan_Update_Guarantor",
            			enctype : 'multipart/form-data',
            			data : formData,
            			processData : false, //prevent jQuery from automatically transforming the data into a query string
            			contentType : false,
            			cache : false,
            			timeout : 600000,            			          			
            	 		success : function(data) {
            	 			var res = data;
            	 			if (res == "Success") {
            	 			window.location.href = './New_Loan';
            	 			alert("Guarantor Updated Successfully");
            	 			} else {
            	 				alert("Guarantor Updated Failed");          	 				
            	 			} 
            	 		}
            	 	});                   
            }
        
            
            function check_loan_sanction() {
            	var loanamount = document.getElementById("loanamount").value;
        	 	var netsalary = document.getElementById("netsalary").value;      	 	
        	 	var share = document.getElementById("share").value;
        	 	var insurance = document.getElementById("insurance").value;	         	 	
        	 	
        	 	if (loanamount == "") {
                	  alert("Loan Amount required")
                	  return false;
                	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('loanamount', loanamount);
        		    formData.append('netsalary', netsalary);
        		    formData.append('share', share);
        		    formData.append('insurance', insurance);
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./check_loan_sanction",
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
        	 		//	window.location.href = './New_Loan';
        	 			alert("Loan Sanction Successfully");
        	 			} else {
        	 				alert(res);
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function LoanAutoCalculate() {
            	var loanamount = document.getElementById("loanamount").value;
        	 	var roi = document.getElementById("roi").value;      	 	
        	 	var tenure = document.getElementById("tenure").value;
        	 	var principalamount = document.getElementById("principalamount").value;
        	 	if(principalamount==""){
        	 		principalamount = "0";
        	 	}
        	 	var loanbalance = document.getElementById("loanbalance").value;
        	 	if(loanbalance==""){
        	 		loanbalance = "0";
        	 	}
        	 	
        	 	//var total_principal = parseFloat(tenure) + parseFloat(principalamount);   
        	 	var total_principal = parseFloat(tenure);        	 	     	 	
        	 	
        	 	if(parseFloat(loanbalance)>0){
        	 	var result11 = parseFloat(loanamount) + parseFloat(loanbalance);
        	 	  // alert(result11);
        	 	}else{
        	 		result11 = loanamount;
        	 	}
        	 	
        	 	if (loanamount == "") {
              	  alert("Loan Amount required")
              	  return false;
              	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('loanamount', result11);
        		    formData.append('roi', roi);
        		    formData.append('tenure', total_principal);
        		    formData.append('loanbalance', loanbalance);
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./LoanAutoCalculate",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	 			
        	    		 
        	    		 document.getElementById('intrestamount').value = Math.round(result[0]);
        	    		 document.getElementById('emi').value = Math.round(result[1]);
        	    		 document.getElementById('principalamount').value = Math.round(result[2]);
        	    		 document.getElementById('tenure').value = Math.round(result[2]);
        	 			
        	 			if (res == "Success") {
        	 		//	window.location.href = './New_Loan';
        	 			alert("Loan Sanction Successfully");
        	 			} else {
        	 				alert(res);
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_new_loan_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
              	  alert("Account Number required")
              	  return false;
              	  }
        	 	   
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_new_loan_details",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	    		 
        	    		 document.getElementById('fullname').value = result[0];
        	    		 document.getElementById('insurance').value = result[1];
        	    		 document.getElementById('share').value = result[2];        	    		 
        	    		 document.getElementById('loanbalance').value = result[3];       	    		        	    		 
        	    		 document.getElementById('principalamount').value = result[4];
        	    		
        	 			if (res == "Success") {
        	 		//	window.location.href = './New_Loan';
        	 		//	alert("Loan Sanction Successfully");
        	 			} else {
        	 				alert(res);
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function type_of_loan(interesttype)
            {
            	var formData = new FormData();
    	 		formData.append('interesttype', interesttype);     		    
    		    
    	 	$.ajax({
    	 		type : "POST",
    			url : "./type_of_loan",
    			enctype : 'multipart/form-data',
    			data : formData,
    			processData : false, //prevent jQuery from automatically transforming the data into a query string
    			contentType : false,
    			cache : false,
    			timeout : 600000,
    			
    	 		success : function(data) { 	 		
    	    		 
    	    		 document.getElementById('roi').value = data;    	    	

    	 		}
    	 	});
            }
            
            function search_printAmortizationSchedule()
            {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;       	 	
        	 	var date = document.getElementById("date").value;   
            	var loanamount = document.getElementById("loanamount").value;
        	 	var roi = document.getElementById("roi").value;       	 	
        	 	var tenure = document.getElementById("tenure").value; 
				var loanbalance = document.getElementById("loanbalance").value;
        	 	
        	 	var loan = Number(loanamount)+Number(loanbalance);
        	 	
            	var formData = new FormData();
            	formData.append('accountnumber', accountnumber);
            	formData.append('fullname', fullname);
    		    formData.append('date', date);
            	formData.append('loanamount', loan);
            	formData.append('roi', roi);
    		    formData.append('tenure', tenure);
    		    
    	 	$.ajax({
    	 		type : "POST",
    			url : "./search_printAmortizationSchedule",
    			enctype : 'multipart/form-data',
    			data : formData,
    			processData : false, //prevent jQuery from automatically transforming the data into a query string
    			contentType : false,
    			cache : false,
    			timeout : 600000,
    			
    	 		success : function(data) { 	 		
    	    		    	 			
    	 			var res = data;
        			if (res == "Success") {
        			//window.location.href = './New_Loan_EMI_Print';
        			window.open('./New_Loan_EMI_Print', '_blank');
        			//alert("login Successfully");
        			} else {
        			//	alert("login failed");
        				
        			} 

    	 		}
    	 	});
            }
            
            
            function DeleteEntry(id,accountnumber) {
            	//alert(id+" "+accountnumber);
            	$.ajax({
            		type : "POST",
            		url : "../Admin/DeleteRegularLoan",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			id : id,  
            			accountnumber : accountnumber,
            		},
            		success : function(data) {
            			var res = data;
            			if (res == "Success") {            			
            			alert("Record Deleted Successfully");
            			window.location.href = 'New_Loan';            			
            			} else {
            				alert("Connection Error");            				
            			} 
            		}
            	});            	
            }
            </script>
            
            <script>
            
			function onedit11()
            {                                	  
                var table = document.getElementById('dataTable');
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {         
                    	                  	
                        document.getElementById("id").value = this.cells[0].innerHTML; 
                        document.getElementById("accountnumber").value = this.cells[1].innerHTML; 
                        document.getElementById("fullname").value = this.cells[2].innerHTML; 
                        document.getElementById("insurance").value = this.cells[3].innerHTML;
                        document.getElementById("share").value = this.cells[4].innerHTML;      
                        document.getElementById("grosssalary").value = this.cells[5].innerHTML; 
                        document.getElementById("netsalary").value = this.cells[6].innerHTML; 
                        document.getElementById("loanamount").value = this.cells[7].innerHTML;
                        //document.getElementById("typeofloan").value = this.cells[8].innerHTML;
                        document.getElementById("roi").value = this.cells[9].innerHTML;
                        document.getElementById("date").value = this.cells[10].innerHTML;  
                        document.getElementById("tenure").value = this.cells[11].innerHTML;                                                 
                        document.getElementById("emi").value = this.cells[12].innerHTML;
                        document.getElementById("principalamount").value = this.cells[13].innerHTML;
                        document.getElementById("intrestamount").value = this.cells[14].innerHTML;
                        document.getElementById("guranteer").value = this.cells[15].innerHTML;    
                        document.getElementById("guranteer2").value = this.cells[16].innerHTML;
                        document.getElementById("chequenumber").value = this.cells[17].innerHTML;
                        document.getElementById("loanbalance").value = this.cells[18].innerHTML;
                        
                    };
                }
            }
			</script>

        </body>

    </html>
