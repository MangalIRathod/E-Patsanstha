<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          <i class="fa fa-table"></i> NEW EMERGENCY LOAN (आकस्मिक कर्ज)</div>
        <div class="card-body" align="center">
      
                    <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">
            
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Account Number</label>
                    <div class="col-4">
                    <input class="form-control" type="number" id = "accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">                           
                    </div>
                    <div class="col-4">
                    	<button type="button" class="btn btn-primary " onclick="return search_emergency_loan_details();">Search</button>
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Full Name</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Loan Amount </label>
                    <div class="col-8">
                    <input class="form-control" type="number" id = "loanamount" name="loanamount" placeholder="Enter loan Amount (in Rs.)"  required="required">
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
	                    </select>
                    </div>
                    </div>
                    -->
                                
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">ROI (व्याज दर)</label>
	                    <div class="col-8">
	                    	<input class="form-control" type="number" id="roi" name="roi" placeholder="Enter Rate of Intrest"  required="required">
	                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                    <div class="col-8">
                    <input class="form-control" type="date" id= "date" name="date" placeholder="Enter Date" required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">User Principal Amount</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id = "tenure" name="tenure" placeholder="Enter User Principal Amount" required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">EMI</label>
                    <div class="col-4">
                    <input class="form-control" type="number" id = "emi" name="emi" placeholder="Enter EMI" onclick="LoanAutoCalculate();" onkeyup="LoanAutoCalculate();"  required="required">
                    </div>
                    <div class="col-4">
                    <button type="button" class="btn btn-primary" onclick="return search_printAmortizationSchedule();">List</button>
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Total Principal Amount</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id = "principalamount" name="principalamount" placeholder="Enter Principal Amount" required="required">
                    </div>
                    </div>
                   
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Interest (व्याज)</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id = "intrestamount" name="intrestamount" placeholder="Intrest"  required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Emergency Loan Balance</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id = "eloanbalance" name="eloanbalance" placeholder="Emergency Loan Balance"  required="required">
                    </div>
                    </div>
                    
                    <!-- 
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Guarantor Name 1</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id = "guranteername1" name="guranteername1" placeholder="Guranteer Name 1"  required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Guarantor Name 2</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id = "guranteername2" name="guranteername2" placeholder="Guranteer Name 2"  required="required">
                    </div>
                    </div>
                    -->                   
                    
                    <div class="form-group row">
                    	<label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 1</label>
                    	<div class="col-8">
                    		<select id="guranteername1" name="guranteername1" class="form-control">
                    		<c:forEach var="obj" items="${glist}" varStatus="theCount">
                    			<option value="${obj.fullname}">${obj.fullname}</option>
                    		</c:forEach>        
                    		</select>
                    	</div>
                    </div>
                                
                    <div class="form-group row">
                        <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 2</label>
                        <div class="col-8">
                        	<select id="guranteername2" name="guranteername2" class="form-control">
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
                               
                   <button type="button" class="btn btn-primary " onclick="return emergency_loan();">Submit</button>
                    
                     </form>       
          </div>
        </div>
        
      
   
 
     
      <!-- Example DataTables Card-->
      <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> आकस्मिक कर्ज</div>
                        
                            <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>	
                                        <th scope="col">Account No</th>	
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Loan Amount</th>
                                        <!-- <th scope="col">Loan Type</th> -->
                                        <th scope="col">ROI</th>
                                        <th scope="col">Date</th>  
                                        <!-- <th scope="col">Time/Tenure</th>  -->
                                        <th scope="col">EMI</th>
                                        <th scope="col">Principal Amount</th>
                                        <th scope="col">Interest</th>
                                        <th scope="col">Emergency Loan Balance</th>   
                                        <!--                                     
                                        <th scope="col">Guaranteer Name 1</th> 
                                        <th scope="col">Guaranteer Name 2</th>
                                        -->
                                        <th scope="col">Cheque Number</th>                                         
                                        <th scope="col">Uploaded Document</th>   
                                        <th scope="col">Edit</th>   
                                        <th scope="col">Delete</th>                               
                                   </tr>
                                </thead>
                                  
								<tbody>
                        <c:forEach var="obj" items="${EmergencyLoanInfo}" varStatus="theCount">
                          	<tr>
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.loanamount}</td>
                        		
                				<td>${obj.roi}</td>
	                       		<td>${obj.date}</td>
                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_emi}"/></td>
                        		<td>${obj.e_principalamount}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_intrestamount}"/></td>
                        		<td>${obj.eloanbalance}</td>                    		
                        		
                        		<td>${obj.chequenumber}</td>                      		
                        		<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadEmergencyLoanDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td>
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
    <!-- /.container-fluid-->
   
  		<script>
  	
            function emergency_loan() {
            	
        	 	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;
        	 	var roi = document.getElementById("roi").value;
        	 	var tenure = document.getElementById("tenure").value;
        	 	var emi = document.getElementById("emi").value;
        	 	var principalamount = document.getElementById("principalamount").value;       	 	
        	 	var loanamount = document.getElementById("loanamount").value;
        	 	
        	 	var eloanbalance = document.getElementById("eloanbalance").value;
        	 	var intrestamount = document.getElementById("intrestamount").value;
        	 	
        	 	var guranteername1 = document.getElementById("guranteername1").value;
        	 	var guranteername2 = document.getElementById("guranteername2").value;	
        	 	var chequenumber = document.getElementById("chequenumber").value;
        	 	       	 	
        	 	var date = document.getElementById("date").value;
        	    //var date = changeDateFormat(inputDate1);
        	 	//var typeofloan = document.getElementById("typeofloan").value;
        	 	
        	 	var loan = Number(loanamount)+Number(eloanbalance);
        	 	
        	 	var photo = document.getElementById("photo").value;
        	 	
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
               	}
        	 	if (guranteername1 == guranteername2) {
	                alert("Both Guarantor are same, Please select another!!!")
	                return false;
                }
        	 	if (fullname == guranteername1) {
	                alert("Member Name And Guarantor 1 are same, Please select another!!!")
	                return false;
                }
        	    if (fullname == guranteername2) {
	                alert("Member Name And Guarantor 2 are same, Please select another!!!")
	                return false;
                }
        	 //	if (photo == "") {
	         //       alert("Please Select File")
	         //       return false;
             //   }
        	 	
        	 	var formData = new FormData();
        		    formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);
        		    formData.append('roi', roi);
        		    formData.append('tenure', tenure);
        		    formData.append('emi', emi);
        		    formData.append('principalamount', principalamount);
        		    formData.append('loanamount', loanamount);
        		    formData.append('eloanbalance', loan);
        		    formData.append('intrestamount', intrestamount);
        		    formData.append('guranteername1', guranteername1);
        		    formData.append('guranteername2', guranteername2);   
        		    formData.append('chequenumber', chequenumber);   
        		    formData.append('date', date);
        		    //formData.append('typeofloan', typeofloan);
        		         	
        		    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		    for(var i = 0;i<file_data.length;i++){
        		    	formData.append("files", file_data[i]);
        		    }
        		 	 	
        	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./emergency_loan_save1",
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
        	 			window.location.href = './Emergency_Loan';
        	 			alert("Emergency_Loan Apply Successfully");
        	 			} else {
        	 				alert("Emergency_Loan Apply failed");
        	 				
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
            			url : "./Emergency_Loan_Update_Guarantor",
            			enctype : 'multipart/form-data',
            			data : formData,
            			processData : false, //prevent jQuery from automatically transforming the data into a query string
            			contentType : false,
            			cache : false,
            			timeout : 600000,            			          			
            	 		success : function(data) {
            	 			var res = data;
            	 			if (res == "Success") {
            	 			window.location.href = './Emergency_Loan';
            	 			alert("Guarantor Updated Successfully");
            	 			} else {
            	 				alert("Guarantor Updated Failed");          	 				
            	 			} 
            	 		}
            	 	});                   
            }
            
            function search_emergency_loan_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                }
            	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_emergency_loan_details",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	    		 
        	    		 document.getElementById('fullname').value = result[0];       	    		 
        	    		 document.getElementById('eloanbalance').value = result[1];
        	    		 document.getElementById('principalamount').value = result[2];      	    		 
        	 			
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
            
            function LoanAutoCalculate() {
            	var loanamount = document.getElementById("loanamount").value;
        	 	var roi = document.getElementById("roi").value;      	 	
        	 	var tenure = document.getElementById("tenure").value;
        	 	
        	 	var principalamount = document.getElementById("principalamount").value;
        	 	if(principalamount==""){
        	 		principalamount = "0";
        	 	}
        	 	       	 	
        	 	//var total_principal = parseFloat(tenure) + parseFloat(principalamount);
        	 	var total_principal = parseFloat(tenure);
        	 	
        	 	var eloanbalance = document.getElementById("eloanbalance").value;
        	 	if(eloanbalance==""){
        	 		eloanbalance = "0";
        	 	}
        	 	
        	 	if(parseFloat(eloanbalance)>0){
            	 	var result11 = parseFloat(loanamount) + parseFloat(eloanbalance);
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
            
            function search_printAmortizationSchedule()
            {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;       	 	
        	 	var date = document.getElementById("date").value;   
            	var loanamount = document.getElementById("loanamount").value;
        	 	var roi = document.getElementById("roi").value;       	 	
        	 	var tenure = document.getElementById("tenure").value;  
        	 	
        	 	if (accountnumber == "") {
              	  alert("Account Number required")
              	  return false;
             	}
        	 	
            	var formData = new FormData();
            	formData.append('accountnumber', accountnumber);
            	formData.append('fullname', fullname);
    		    formData.append('date', date);
            	formData.append('loanamount', loanamount);
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
            	$.ajax({
            		type : "POST",
            		url : "../Admin/DeleteEmergencyLoan",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			id : id,
            			accountnumber : accountnumber,
            		},
            		success : function(data) {
            			var res = data;
            			if (res == "Success") {            			
            			alert("Record Deleted Successfully");
            			window.location.href = 'Emergency_Loan';            			
            			} else {
            				alert("Connection Error");            				
            			} 
            		}
            	});            	
            }
            
            </script>





</body>

</html>
