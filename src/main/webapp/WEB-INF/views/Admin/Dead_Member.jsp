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
        <title>E-Sanstha Admin - Dead Member</title>
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

<script type="text/javascript">
function sum() {
            var shares = document.getElementById('shares').value;          
            var rd= document.getElementById('rd').value;
            var fd = document.getElementById('fd').value; 
            var insurance = document.getElementById('insurance').value; 
            var monthlydeposit = document.getElementById('monthlydeposit').value; 
            //var result = parseFloat(txt8) + parseFloat(txt9) + parseFloat(txt10);
            var result1 = parseFloat(shares) + parseFloat(rd) + parseFloat(fd) + parseFloat(insurance) + parseFloat(monthlydeposit);
            //alert(result1);
            
            var totalregularloan = document.getElementById('totalregularloan').value;          
            var intrestregularloan= document.getElementById('intrestregularloan').value;
            var totalemerloan = document.getElementById('totalemerloan').value; 
            var intrestonemerloan = document.getElementById('intrestonemerloan').value; 
            var result2 = parseFloat(totalregularloan) + parseFloat(intrestregularloan) + parseFloat(totalemerloan) + parseFloat(intrestonemerloan);
            
            var result = parseFloat(result1) - parseFloat(result2);
            if (!isNaN(result)) {
                document.getElementById('totalamount').value = result;
            }
        }

function sum1() {
    var shares1 = document.getElementById('shares1').value;          
    var rd1 = document.getElementById('rd1').value;
    var fd1 = document.getElementById('fd1').value; 
   // var insurance1 = document.getElementById('insurance1').value; 
    var insurance1 = "0"; 
    var monthlydeposit1 = document.getElementById('monthlydeposit1').value; 
    var percentamount1 = document.getElementById('percentamount1').value; 
    //var result = parseFloat(txt8) + parseFloat(txt9) + parseFloat(txt10);
    var result11 = parseFloat(shares1) + parseFloat(rd1) + parseFloat(fd1) + parseFloat(insurance1) + parseFloat(monthlydeposit1) + parseFloat(percentamount1);
    //alert(result1);
    
    var totalregularloan1 = document.getElementById('totalregularloan1').value;          
    var intrestregularloan1= document.getElementById('intrestregularloan1').value;
    var totalemerloan1 = document.getElementById('totalemerloan1').value; 
    var intrestonemerloan1 = document.getElementById('intrestonemerloan1').value; 
    var result22 = parseFloat(totalregularloan1) + parseFloat(intrestregularloan1) + parseFloat(totalemerloan1) + parseFloat(intrestonemerloan1);
    
    var result33 = parseFloat(result11) - parseFloat(result22);
    if (!isNaN(result33)) {
        document.getElementById('totalamount1').value = result33;
        document.getElementById('payableamount').value = result33;
    }
}    
//    function sum2() {
//       var totalamount = document.getElementById('totalamount').value;  
//       var totalamount1 = document.getElementById('totalamount1').value; 
//       
//       var result = parseFloat(totalamount1) - parseFloat(totalamount);
//       if (!isNaN(result)) {
//            document.getElementById('payableamount').value = result;
//        }
//}
    
    function sum3() {
        var insurance = document.getElementById('insurance').value; 
        var result = parseFloat(insurance) * 10;
          if (!isNaN(result)) {
             document.getElementById('percentamount1').value = result;
          }       
}    
        
</script>     
 

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
                            <i class="fa fa-table"></i> मृत झालेल्या सभासदांचा गोषवारा</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">खाते क्रमांक </label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="accountnumber" name="accountnumber" placeholder="खाते क्रमांक"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary" onclick="return search_dead_members();">Search</button>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">सभासदाचे नाव</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fullname" name="fullname" placeholder="सभासदाचे नाव"  required="required">
                                    </div>                                    
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">पगार खाते क्रमांक </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="salary_accountnumber" name="salary_accountnumber" placeholder="पगार खाते क्रमांक"  required="required">
                                    </div>                                    
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">मृत्यू दिनांक</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="dateofdeath" name="dateofdeath" placeholder="मृत्यू दिनांक"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label"></label>
                                    <label for="example-text-input" class="col-4 col-form-label">Current Deduction</label>
                                    <label for="example-text-input" class="col-4 col-form-label">Update Deduction</label>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">भाग (शेअर्स)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="shares" name="shares" placeholder="भाग (शेअर्स)"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="shares1" name="shares1" placeholder="भाग (शेअर्स)"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">मासिक  ठेव </label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="monthlydeposit" name="monthlydeposit" placeholder="मासिक ठेव"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="monthlydeposit1" name="monthlydeposit1" placeholder="मासिक ठेव"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">सभासद कल्याण निधी</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="insurance" name="insurance" placeholder="सभासद कल्याण निधी"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="insurance1" name="insurance1" placeholder="सभासद कल्याण निधी"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">10 Multiply Added Amount</label>
                                    <div class="col-4">
                                        <input class="form-control" type="hidden" id="percentamount" name="percentamount" placeholder="10 % Added Amount" >
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="percentamount1" name="percentamount1" onclick="sum3();" onkeyup="sum3();" placeholder="10 % Added Amount"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">सभासद बचत योजना (RD)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="rd" name="rd" placeholder="सभासद बचत योजना"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="rd1" name="rd1" placeholder="सभासद बचत योजना"  required="required">
                                    </div>
                                    
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">कायम ठेवी (FD)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="fd" name="fd" placeholder="कायम ठेवी"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="fd1" name="fd1" placeholder="कायम ठेवी"  required="required">
                                    </div>
                                    
                                </div>                               
                                
                                

                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">एकूण नियमित कर्ज</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalregularloan" name="totalregularloan" placeholder="एकूण नियमित कर्ज"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalregularloan1" name="totalregularloan1" placeholder="एकूण नियमित कर्ज"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">नियमित कर्जावरील व्याज</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="intrestregularloan" name="intrestregularloan" placeholder="नियमित कर्जावरील व्याज"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="intrestregularloan1" name="intrestregularloan1" placeholder="नियमित कर्जावरील व्याज"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">एकूण आकस्मित कर्ज</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalemerloan" name="totalemerloan" placeholder="एकूण आकस्मित कर्ज"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalemerloan1" name="totalemerloan1" placeholder="एकूण आकस्मित कर्ज"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">आकस्मित कर्जावरील व्याज </label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="intrestonemerloan" name="intrestonemerloan" placeholder="आकस्मित कर्जावरील व्याज"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="intrestonemerloan1" name="intrestonemerloan1" placeholder="आकस्मित कर्जावरील व्याज"  required="required">
                                    </div>
                                </div>                                                              
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Amount </label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalamount" name="totalamount" onclick="sum();" onkeyup="sum();" placeholder="Total Amount"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id="totalamount1" name="totalamount1" onclick="sum1();" onkeyup="sum1();" placeholder="Total Amount" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Payable Amount </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="payableamount" name="payableamount" onclick="sum2();" onkeyup="sum2();" placeholder="Payable Amount" required="required">
                                    </div>                                    
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="cheque" name="cheque" placeholder="Cheque Number"  required="required">
                                    </div>                                    
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque Date</label>                                    
                                    <div class="col-8">
                                        <input class="form-control" type=date id="chequedate" name="chequedate" placeholder="Cheque Date"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Pay To </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="payto" name="payto" placeholder=""  required="required">
                                    </div>                                   
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee Name 1 </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nom1" name="nom1" placeholder="Nominee Name 1"  required="required">
                                    </div>                                   
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee Name 2 </label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nom2" name="nom2" placeholder="Nominee Name 2"  required="required">
                                    </div>                                   
                                </div>
								<!--  
		                        <div class="form-group row">
		                           <label for="example-text-input" class="col-4 col-form-label"></label> 	                           	                           
			                        <div class="col-4">
			                            <button type="button" class="btn btn-primary btn-block" onclick="return dead_member_save();">Submit</button>
			                        </div>			                            
			                        <div class="col-4">
			                            <button type="button" class="btn btn-primary btn-block" onclick="return dead_member_update();">Edit</button>
			                        </div>		                            
		                        </div>
		                        -->
		                        <button type="button" class="btn btn-primary " onclick="return dead_member_save();">Submit</button>

                            </form>

                        </div>
                    </div>

                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> मृत झालेल्या सभासदांचा गोषवारा &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account Number</th>	
                                    <th scope="col">Full Name</th>
                                    <!-- <th scope="col">Salary Account Number</th> -->
                                    <th scope="col">Date of Death</th>
                                    <th scope="col">Shares</th>
                                    <th scope="col">Monthly Deposit</th>
                                    <th scope="col">Insurance</th>
                                    <th scope="col">10 % Added Amount</th>
                                    <th scope="col">RD</th>
                                    <th scope="col">FD</th>
                                    <th scope="col">Total Regular Loan</th>
                                    <th scope="col">Interest</th>
                                    <th scope="col">Total Emergency Loan</th>
                                    <th scope="col">Interest</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Payable Amount</th>
                                    <th scope="col">Cheque</th>
                                    <th scope="col">Cheque Date</th>
                                    <th scope="col">Pay To</th>
                                    <th scope="col">Nominee 1</th>
                                    <th scope="col">Nominee 2</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${AllDeadMember}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<!-- <td>${obj.salary_accountnumber}</td> -->
                        		<td>${obj.dateofdeath}</td>
                        		<td>${obj.shares}</td>
                        		<td>${obj.monthlydeposit}</td>
                        		<td>${obj.insurance}</td>
                        		<td>${obj.percentamount}</td>   
                        		<td>${obj.rd}</td>
                        		<td>${obj.fd}</td>
                        		<td>${obj.totalregularloan}</td>
                        		<td>${obj.intrestregularloan}</td>
                        		<td>${obj.totalemerloan}</td>
                        		<td>${obj.intrestonemerloan}</td>
                        		<td>${obj.totalamount}</td> 
                        		<td>${obj.payableamount}</td>    
                        		<td>${obj.cheque}</td>
                        		<td>${obj.chequedate}</td>
                        		<td>${obj.payto}</td>
                        		<td>${obj.nom1}</td>
                        		<td>${obj.nom2}</td>                     		
                          </tr>
                          </c:forEach>
                        </tbody>

                        </table> 
                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

        

       
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
       
            function dead_member_save() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;       	 	
        	 	var dateofdeath = document.getElementById("dateofdeath").value;
        	    //var dateofdeath = changeDateFormat(inputDate1);
        	 	var shares = document.getElementById("shares1").value;
        	 	var fd = document.getElementById("fd1").value;
        	 	var insurance = document.getElementById("insurance1").value;
        	 	var percentamount = document.getElementById("percentamount1").value;
        	 	var rd = document.getElementById("rd1").value;
        	 	var totalregularloan = document.getElementById("totalregularloan1").value;       	 	
        	 	var intrestregularloan = document.getElementById("intrestregularloan1").value;
        	 	var totalemerloan = document.getElementById("totalemerloan1").value;
        	 	var intrestonemerloan = document.getElementById("intrestonemerloan1").value;
        	 	var monthlydeposit = document.getElementById("monthlydeposit1").value;
        	 	var totalamount = document.getElementById("totalamount1").value;
        	 	var payableamount = document.getElementById("payableamount").value;
        	 	var cheque = document.getElementById("cheque").value;
        	 	var chequedate = document.getElementById("chequedate").value;
        	    //var chequedate = changeDateFormat(inputDate2);
        	 	var payto = document.getElementById("payto").value;
        	 	var nom1 = document.getElementById("nom1").value;
        	 	var nom2 = document.getElementById("nom2").value;
        	 	var salary_accountnumber = document.getElementById("salary_accountnumber").value;
        	 	
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);        		    
        		    formData.append('dateofdeath', dateofdeath);
        		    formData.append('shares', shares);
        		    formData.append('fd', fd);
        		    formData.append('insurance', insurance);
        		    formData.append('percentamount', percentamount);      
        		    formData.append('rd', rd);
        		    formData.append('totalregularloan', totalregularloan);        		    
        		    formData.append('intrestregularloan', intrestregularloan);
        		    formData.append('totalemerloan', totalemerloan);
        		    formData.append('intrestonemerloan', intrestonemerloan);
        		    formData.append('monthlydeposit', monthlydeposit);
        		    formData.append('totalamount', totalamount);  
        		    formData.append('payableamount', payableamount);  
        		    formData.append('cheque', cheque);
        		    formData.append('chequedate', chequedate);
        		    formData.append('payto', payto);
        		    formData.append('nom1', nom1);
        		    formData.append('nom2', nom2);  
        		    formData.append('salary_accountnumber', salary_accountnumber);  
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./dead_member_save",
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
        	 			window.location.href = './Dead_Member';
        	 			alert("Dead Member Save Successfully");
        	 			} else {
        	 				alert("Dead Member Save failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_dead_members() {
            	var accountnumber = document.getElementById("accountnumber").value;
            	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_dead_members",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	    		 
        	    		 document.getElementById('fullname').value = result[0];
        	    		 document.getElementById('shares').value = Math.round(result[1]);
        	    		 document.getElementById('rd').value = Math.round(result[2]);
        	    		 document.getElementById('fd').value = Math.round(result[3]);
        	    		 document.getElementById('insurance').value = Math.round(result[4]);
        	    		 document.getElementById('monthlydeposit').value = Math.round(result[5]);
        	    		 document.getElementById('totalregularloan').value = Math.round(result[6]);
        	    		 document.getElementById('intrestregularloan').value = Math.round(result[7]);
        	    		 document.getElementById('totalemerloan').value = Math.round(result[8]);        	    		 
        	    		 document.getElementById('intrestonemerloan').value = Math.round(result[9]);
        	 			
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
            
            <script type="text/javascript">
				var tableToExcel = (function() {
				  var uri = 'data:application/vnd.ms-excel;base64,'
				    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
				    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
				    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
				  return function(table, name) {
				    if (!table.nodeType) table = document.getElementById(table)
				    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
				    window.location.href = uri + base64(format(template, ctx))
				  }
				})()
			</script>  
       
    </body>

</html>
