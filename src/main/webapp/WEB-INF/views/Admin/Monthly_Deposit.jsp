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
        <title>E-Patsanstha - Monthly Deposit</title>
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



                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> Monthly Deposit  Form </div>
                        <div class="card-body" align="center">



                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                               
                                 <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id = "accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary" onclick="Search();">SEARCH</button>
                                    </div>
                                </div>
                                  <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fullname" name="fullname" placeholder="Enter Full Name" required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="m_debit" name="m_debit" placeholder="Enter Monthly Deposit" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="cdate" name="cdate" placeholder="Select Date" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Monthly Deposit</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="m_deposit" name="m_deposit" placeholder="Enter Total Monthly Deposit" onkeyup="CalTotalAmount();" onclick="CalTotalAmount();" required="required" readonly>
                                    </div>
                                </div>
                                
                              <button type="button" class="btn btn-primary" onclick="Submit();">Submit</button>

                            </form>


                        </div>
                    </div>



                    <!-- Example DataTables Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i>Monthly Deposit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Date </th>
                                    <th scope="col">Monthly Deposit</th>
                                    <th scope="col">Total Monthly Deposit </th>
                                </tr>
                            </thead>
 						<tbody>
                        <c:forEach var="obj" items="${AllUserMonthlyDepositData}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.cdate}</td>
                        		<td>${obj.m_debit}</td>
                        		<td>${obj.m_deposit}</td>                       		
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>

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
               
                function Search() {

            		
            		var AccountNumber = document.getElementById("accountnumber").value;
            		if (AccountNumber == "") {
            			alert("Account Number required")
            			return false;
            		}
            		
            		
            	$.ajax({
            		type : "POST",
            		url : "../Admin/SearchAccountName",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			AccountNumber : AccountNumber,
            			
            		},
            		success : function(data) {

            			var res = data;
            			
            			if (res == "Fail" ) {
            				alert("User Is Not Register");
            			} else {
            				document.getElementById("fullname").value =  res;
            				
            			} 

            		}
            	});

            }
                
                function CalTotalAmount()
                {
                   	var AccountNumber = document.getElementById("accountnumber").value;
            		var m_debit = document.getElementById("m_debit").value;
            		if (AccountNumber == "") {
            			alert("Account Number required")
            			return false;
            		}
            		$.ajax({
            		type : "POST",
            		url : "../Admin/GetTotalMonthlyDepositAmount",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			AccountNumber : AccountNumber,
            			m_debit : m_debit,
            		},
            		success : function(data) {

            			var res = data;
            			
            			if (res == "" ) {
            				//alert("Monthly Deposit Amount Not Found");
            				document.getElementById("m_deposit").value =  m_debit;
            			} else {
            				document.getElementById("m_deposit").value =  res;
            				
            			} 

            		}
            	});
               }
                
                function Submit()
                {
                	//alert("Hello");
                   	var accountnumber = document.getElementById("accountnumber").value;
            		var fullname = document.getElementById("fullname").value;
            		var m_debit = document.getElementById("m_debit").value;
            		var cdate = document.getElementById("cdate").value;
            	    //var cdate = changeDateFormat(inputDate1);
            		var m_deposit = document.getElementById("m_deposit").value;
            		
            		if (accountnumber == "") {
            			alert("Account Number required")
            			return false;
            		}
            		$.ajax({
            		type : "POST",
            		url : "../Admin/AddMonthlyDeposit",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			accountnumber : accountnumber,
            			fullname   : fullname,
            			m_debit : m_debit,
            			cdate   :  cdate,
            			m_deposit : m_deposit
            			
            		},
            		success : function(data) {

            			var res = data;
            			
            			if (res == "Success" ) {
            				alert("Monthly Deposit Added Successfully");
            				document.getElementById("accountnumber").value = "";
            				document.getElementById("fullname").value = "";
            				 document.getElementById("m_debit").value = "";
            				 document.getElementById("cdate").value = "";
            				 document.getElementById("m_deposit").value = "";
            			} else {
            				alert("Monthly Deposit Failed To Add");
            				
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
