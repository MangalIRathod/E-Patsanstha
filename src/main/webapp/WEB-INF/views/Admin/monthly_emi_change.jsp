
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha - Monthly EMI Change</title>
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
                            <i class="fa fa-table"></i> Monthly EMI Change</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number  (खाते क्रमांक)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">

                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary " onclick="return search_monthly_emi_change();">Search</button>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
								
								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label"></label>
                                    <label for="example-text-input" class="col-4 col-form-label">Current Status (Deduction)</label>
                                    <label for="example-text-input" class="col-4 col-form-label">Update Amount (Deduction)</label>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Shares</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="shares" name="shares" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="shares1" name="shares1" placeholder=""  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="monthlydeposit" name="monthlydeposit" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="monthlydeposit1" name="monthlydeposit1" placeholder=""  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="insurance" name="insurance" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="insurance1" name="insurance1" placeholder=""  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Regular Loan</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="regularloan" name="regularloan" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="regularloan1" name="regularloan1" placeholder=""  required="required">
                                    </div>
                                </div>
                                
								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Emergency Loan</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="emergencyloan" name="emergencyloan" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="emergencyloan1" name="emergencyloan1" placeholder=""  required="required">
                                    </div>
                                </div>
                                <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">RD</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id = "rd" name="rd" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="rd1" name="rd1" placeholder=""  required="required">
                                    </div>
                                </div>
                                --> 
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id = "date1" name="date1" placeholder=""  required="required">
                                    </div>                                   
                                </div>
                                
							<!--  	
		                        <div class="form-group row">
		                           <label for="example-text-input" class="col-4 col-form-label"></label> 
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return monthly_emi_change_save();">Change</button>
		                            </div>
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return monthly_emi_update_save();">Edit</button>
		                            </div>	                         
		                        </div>
		                     -->    
								<button type="button" class="btn btn-primary " onclick="return monthly_emi_update_save();">Update</button>

                            </form>



                        </div>
                    </div>

				<!--  
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> NEW LOAN
                        </div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">खाते क्रमांक</th>	
                                    <th scope="col">पूर्ण नाव</th>
                                    <th scope="col">कर्जाची रक्कम</th>
                                    <th scope="col">व्याज दर</th>
                                    <th scope="col">कालावधी</th>
                                    <th scope="col">EMI</th>
                                    <th scope="col">मुद्दल रक्कम</th>
                                    <th scope="col">व्याज</th>
                                    <th scope="col">विमा</th>
                                    <th scope="col">भाग</th>
                                    <th scope="col">हमी नाव</th>
                                    <th scope="col">हमी नाव 2</th>

                                </tr>
                            </thead>

                        </table> 

                    </div>    
				-->
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
            
            function monthly_emi_change_save() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;       	 	
        	 	var shares = document.getElementById("shares").value;
        	 	var monthlydeposit = document.getElementById("monthlydeposit").value;
        	 	var insurance = document.getElementById("insurance").value;
        	 	var regularloan = document.getElementById("regularloan").value;
        	 	var emergencyloan = document.getElementById("emergencyloan").value;
        	 	//var rd = document.getElementById("rd").value;
        	 	var date1 = document.getElementById("date1").value;
        	    //var date1 = changeDateFormat(inputDate1);
        	 	
        	    if (accountnumber == "") {
              	  alert("Account Number required")
              	  return false;
              	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);        		    
        		    formData.append('shares', shares);
        		    formData.append('monthlydeposit', monthlydeposit);
        		    formData.append('insurance', insurance);
        		    formData.append('regularloan', regularloan);
        		    formData.append('emergencyloan', emergencyloan);        		    
        		    //formData.append('rd', rd);
        		    formData.append('date1', date1);
        		    
        		          		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./monthly_emi_change_save",
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
        	 			window.location.href = './monthly_emi_change';
        	 			alert("Monthly EMI Change Saved Successfully");
        	 			} else {
        	 				alert("Monthly EMI Change Saved failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function monthly_emi_update_save() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;       	 	
        	 	var shares = document.getElementById("shares1").value;
        	 	var monthlydeposit = document.getElementById("monthlydeposit1").value;
        	 	var insurance = document.getElementById("insurance1").value;
        	 	var regularloan = document.getElementById("regularloan1").value;
        	 	var emergencyloan = document.getElementById("emergencyloan1").value;
        	 	//var rd = document.getElementById("rd1").value;
        	 	var date1 = document.getElementById("date1").value;
        	 	alert(emergencyloan);
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);        		    
        		    formData.append('shares', shares);
        		    formData.append('monthlydeposit', monthlydeposit);
        		    formData.append('insurance', insurance);
        		    formData.append('regularloan', regularloan);
        		    formData.append('emergencyloan', emergencyloan);        		    
        		    //formData.append('rd', rd);
        		    formData.append('date1', date1);
        		    
        		          		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./monthly_emi_update_save",
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
        	 			window.location.href = './monthly_emi_change';
        	 			alert("Monthly EMI Updated Successfully");
        	 			} else {
        	 				alert("Monthly EMI Updated failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_monthly_emi_change() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	   
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_monthly_emi_change",
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
        	    		 document.getElementById('monthlydeposit').value = result[2];
        	    		 document.getElementById('insurance').value = result[3];       	    		        	    		 
        	    		 var regularloan = Number(result[4]).toFixed(2);
        	    		 document.getElementById('regularloan').value = regularloan;
        	    		 var emergencyloan = Number(result[5]).toFixed(2);
        	    		 document.getElementById('emergencyloan').value = emergencyloan;
        	    		 //var rd = Number(result[6]).toFixed(2);
        	    		 //document.getElementById('rd').value = rd;
        	    		 
        	    		         	    		 
        	    		 document.getElementById('shares1').value = result[1];
        	    		 document.getElementById('monthlydeposit1').value = result[2];
        	    		 document.getElementById('insurance1').value = result[3];       	    		        	    		 
        	    		 document.getElementById('regularloan1').value = regularloan;
        	    		 document.getElementById('emergencyloan1').value = emergencyloan;
        	    		 //document.getElementById('rd1').value = rd;
        	    		 
        	    		 
        	    		 document.getElementById('date1').value = result[7];
        	 			
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
