<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha</title>
<!-- 
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
 -->

        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
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
<div style="width:100%; text-align:center;" >
<p style="float: left;"><img src="/logo/pat.jpeg" height="70" width="60" alt=""></p>
<h3> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था मर्यादित, </h3>
<h3> विष्णुपुरी, नांदेड </h3>
<h3> कपात यादी माहे ${cmonth}</h3>


<button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button> 
					<div class="card mb-3">
                        
					<table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                     <thead>
					  <tr>   
					    <th>Sr. No.</th>
					    <th>Acc No.</th>
					    <th>Full Name</th>
					    <th>Shares</th>
					    <th>RD</th>
					    <th>Insurance</th>
					    <th>Monthly Deposit</th>
					    <th>EMI</th>
					    <th>Principal Amount</th>
					    <th>Interest</th>
					    <th>E_EMI</th>    
					    <th>E_Principal Amount</th>
					    <th>E_Interest</th>					    
					    <th>Total </th>
					    <th>Deduct</th>
					  </tr>
					  </thead>
                      <tbody>
					    
					    <c:set var="total" value="${0}"/>
                        <c:forEach var="obj" items="${deduction_details}" varStatus="theCount">
                          <tr>                       
                          <c:set var="total" value="${total + obj.total}" />
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td> 
                        		<td>${obj.fullname}</td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.shareallot}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rdamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.insdebt}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.m_debit}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.emi}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.principalamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_emi}" /></td>  
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_principalamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_intrestamount}" /></td>                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.total}" /></td>  
                        		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo" onclick="onedit11()"><i class="fa fa-close"></i></button></td>                   		                        		                   		                      		                      		                        		
                          </tr>
                          
                          </c:forEach>
                          <tr>
                          		<td><b>Total</b></td>
                        		<td></td> 
                        		<td></td>                        		
                        		<td></td> 
                        		<td></td>
                        		<td></td>   
	                       		<td></td> 
                        		<td></td>
                        		<td></td> 
                        		<td></td> 
                        		<td></td>
                        		<td></td> 
                        		<td></td>
                          		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total}" /></b></td>
                          		<td></td>
                          </tr>
                        </tbody>
					</table>
</div>
<script>
	document.onload = window.print();
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
	
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" align="center">
          <h5 class="modal-title" id="exampleModalLabel">Monthly Deduction</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body" align="center">
          	  <form method="POST" action = "#"> 
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Id</label>
                    <div class="col-8">
                    <input type="text" class="form-control" name="id" id="id" readonly>
                    <input type="text" class="form-control" name="accountnumber" id="accountnumber" readonly>
                    <input type="text" class="form-control" name="fullname" id="fullname" readonly>
                    <input type="text" class="form-control" name="shares" id="shares" readonly>
                    <input type="text" class="form-control" name="rd" id="rd" readonly>
                    <input type="text" class="form-control" name="insurance" id="insurance" readonly>
                    <input type="text" class="form-control" name="monthly_deposit" id="monthly_deposit" readonly>                   
                    <input type="text" class="form-control" name="emi" id="emi" readonly>
                    <input type="text" class="form-control" name="principal_amount" id="principal_amount" readonly>
                    <input type="text" class="form-control" name="interest" id="interest" readonly>
                    <input type="text" class="form-control" name="e_emi" id="e_emi" readonly>
                    <input type="text" class="form-control" name="e_principal_amount" id="e_principal_amount" readonly>
                    <input type="text" class="form-control" name="e_interest" id="e_interest" readonly>                   
                    <input type="text" class="form-control" name="total" id="total" readonly>
                    </div>
                </div>             
                 <div class="modal-footer"> 
                 	<button type="button" class="btn btn-primary " onclick="return closed_fd_save();">Submit</button>           		                 	              
          		 </div>
             </form>
        </div>          
        </div>
      </div>
    </div>
	</div>

            </div>	
            </div>	 
            
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
                                                document.getElementById("shares").value = this.cells[3].innerHTML; 
                                                document.getElementById("rd").value = this.cells[4].innerHTML; 
                                                document.getElementById("insurance").value = this.cells[5].innerHTML; 
                                                document.getElementById("monthly_deposit").value = this.cells[6].innerHTML;
                                                document.getElementById("emi").value = this.cells[7].innerHTML;                                                 
                                                document.getElementById("principal_amount").value = this.cells[8].innerHTML;
                                                document.getElementById("interest").value = this.cells[9].innerHTML;
                                                document.getElementById("e_emi").value = this.cells[10].innerHTML;
                                                document.getElementById("e_principal_amount").value = this.cells[11].innerHTML;
                                                document.getElementById("e_interest").value = this.cells[12].innerHTML;                                               
                                                document.getElementById("total").value = this.cells[13].innerHTML;                                                                                        	                                             
                                            };
                                        }
                                    }
 

                                   function monthly_deduction_update()
                                   {                                    	
                                  	var accountnumber = document.getElementById("accountnumber").value;
                               	 	var fullname = document.getElementById("fullname").value;       	 		 	
                               	 	var shares = document.getElementById("shares").value;
                               	 	var rd = document.getElementById("rd").value;
                               	 	var insurance = document.getElementById("insurance").value;
                                	var monthly_deposit = document.getElementById("monthly_deposit").value;
                                  	var emi = document.getElementById("emi").value;
                                    var principal_amount = document.getElementById("principal_amount").value;
                                    var interest = document.getElementById("interest").value;
                                	var e_emi = document.getElementById("e_emi").value;
                                  	var e_principal_amount = document.getElementById("e_principal_amount").value;
                                    var e_interest = document.getElementById("e_interest").value;
                                    	                                   	
                                           	var formData = new FormData();
                                           	formData.append('accountnumber', accountnumber);
                                   		    formData.append('fullname', fullname);        		    
                                   		    formData.append('shares', shares);
                                   		    formData.append('rd', rd);
                                   		    formData.append('insurance', insurance);
                                   		    formData.append('monthly_deposit', monthly_deposit);
                                   		    formData.append('emi', emi); 
                                   		    formData.append('principal_amount', principal_amount);
                                  		    formData.append('interest', interest); 
                                  		  	formData.append('e_emi', e_emi); 
                                 		    formData.append('e_principal_amount', e_principal_amount);
                                		    formData.append('e_interest', e_interest); 
                                   		    
                                   	 	$.ajax({
                                   	 		type : "POST",
                                   			url : "./monthly_deduction_update",
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
                                   	 			window.location.href = './deduction_print';
                                   	 			alert("Close FD Successfully");
                                   	 			} else {
                                   	 				alert("Close FD failed");
                                   	 				
                                   	 			} 

                                   	 		}
                                   	 	});
                                           	           
                                   }                                   
</script> 
                                                                        

</body>
</html>


