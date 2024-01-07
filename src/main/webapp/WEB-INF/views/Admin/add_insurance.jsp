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
        <title>E-Patsanstha - Add Insurance</title>
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
                            <i class="fa fa-table"></i> Insurance Form</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="acc_no" placeholder="Enter Account No."  required="required">
                                    </div>
                                    <div class="col-4">
                                      
                                        <button type="button" class="btn btn-primary" onclick="Search();">SEARCH</button>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="full_name" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="ins_date" placeholder="Enter RD Start Date"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance Amount (Monthly)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="ins_amt" placeholder="Enter Insurance Amount"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Insurance Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="tot_ins_amt" placeholder="Enter Total Insurance Amount" onclick="CalTotalAmount();"  required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label"></label>  
                                    <div class="col-1"></div>
                                    <div class="col-1">
                                        <button type="button" class="btn btn-primary" onclick="Submit();">ADD</button>
                                    </div>
                                  <!--    <div class="col-1">
                                        <input class="btn btn-primary " type="submit" name="all" value="EDIT"/>
                                    </div>
                                    
                                    -->
                                    <div class="col-5"></div> 
                                </div>
                                
                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Add Insurance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Insurance Amount</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Total Insurance Amount</th>

                                </tr>
                            </thead>
 						<tbody>
                        <c:forEach var="obj" items="${AllUserIns}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.insdebt}</td>
                        		<td>${obj.date}</td>
                        		<td>${obj.totalinsuranceamount}</td>
                        		
                        		
                           
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->
       
        <script>
        
        
        function Search() {  		
    		var AccountNumber = document.getElementById("acc_no").value;
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
    				document.getElementById("full_name").value =  res;
    				
    			} 

    		}
    	});

    }
        
        
        
        
        function CalTotalAmount()
        {
           var AccountNumber = document.getElementById("acc_no").value;
    		var InsuranceAmount = document.getElementById("ins_amt").value;
    		if (AccountNumber == "") {
    			alert("Account Number required")
    			return false;
    		}
    		$.ajax({
    		type : "POST",
    		url : "../Admin/GetTotaInsuranceAmount",
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    		data : {
    			AccountNumber : AccountNumber,
    			InsuranceAmount : InsuranceAmount,
    		},
    		success : function(data) {

    			var res = data;
    			
    			if (res == "" ) {
    				//alert("Insurance Amount Not Found");
    				document.getElementById("tot_ins_amt").value =  InsuranceAmount;
    			} else {
    				document.getElementById("tot_ins_amt").value =  res;
    				
    			} 

    		}
    	});
        	}
        
        
        function Submit()
        {
            var AccountNumber = document.getElementById("acc_no").value;
    		var InsuranceAmount = document.getElementById("ins_amt").value;
    		var TotalAmount = document.getElementById("tot_ins_amt").value;
    		var FullName = document.getElementById("full_name").value;
    		var Date = document.getElementById("ins_date").value;
    	    
    		if (AccountNumber == "") {
    			alert("Account Number required")
    			return false;
    		}
    		$.ajax({
    		type : "POST",
    		url : "../Admin/AddInsuranceAmount",
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    		data : {
    			AccountNumber : AccountNumber,
    			InsuranceAmount : InsuranceAmount,
    			TotalAmount : TotalAmount,
    			FullName   : FullName,
    			Date   :  Date,
    			
    		},
    		success : function(data) {

    			var res = data;
    			
    			if (res == "Success" ) {
    				alert("Insurance Added Successfully");
    				document.getElementById("acc_no").value = "";
    				document.getElementById("ins_amt").value = "";
    				 document.getElementById("tot_ins_amt").value = "";
    				 document.getElementById("full_name").value = "";
    				 document.getElementById("ins_date").value = "";
    			} else {
    				alert("Insurance Failed To Add");
    				
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
