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
                            <i class="fa fa-table"></i> NEW SHARE (शेअर्स)</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="acnumber" placeholder="Enter Account Number"  required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary" onclick="Search();">SEARCH</button>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Add Share Amount (भाग किमत  )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="samount" placeholder="Enter Share Amount"  required="required">
                                    </div>
                                </div>




                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date (तारीख )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="sdate" placeholder="Enter Date"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Amount Of Share</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="TotalShare" placeholder="Total Share"  required="required" onkeyup="CalTotalAmount();" onclick="CalTotalAmount();" readonly>
                                    </div>
                                </div>
                              
                               <button type="button" class="btn btn-primary" onclick="Submit();">Add Share</button>

                            </form>

                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> NEW SHARE (शेअर्स) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Share Amount</th>
                                    <th scope="col">Total Share</th>
                                </tr>
                            </thead>
 						<tbody>
                        <c:forEach var="obj" items="${ShareData}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.date}</td>                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.shareallot}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totalamountofshare}" /></td>                      		
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>
                </div>  
            </div>

    <script>
    
    
        function Search() {

    		
    		var AccountNumber = document.getElementById("acnumber").value;
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
    				document.getElementById("fname").value =  res;   				
    			} 
    		}
    	});

    }
        
        
        
        
        function CalTotalAmount()
        {
           var AccountNumber = document.getElementById("acnumber").value;
    		var ShareAmount = document.getElementById("samount").value;
    		if (AccountNumber == "") {
    			alert("Account Number required")
    			return false;
    		}
    		$.ajax({
    		type : "POST",
    		url : "../Admin/GetTotalShareAmount",
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    		data : {
    			AccountNumber : AccountNumber,
    			ShareAmount : ShareAmount,
    		},
    		success : function(data) {

    			var res = data;
    			
    			if (res == "" ) {
    				//alert("Share Amount Not Found");
    				document.getElementById("TotalShare").value =  ShareAmount;
    			} else {
    				document.getElementById("TotalShare").value =  res;
    				
    			} 

    		}
    	});
        	}
        
        
        
        
        
        
        function Submit()
        {
           	var AccountNumber = document.getElementById("acnumber").value;
    		var FullName = document.getElementById("fname").value;
    		var ShareAmount = document.getElementById("samount").value;
    		var Date = document.getElementById("sdate").value;
    	    var TotalShareAmount = document.getElementById("TotalShare").value;
    		
    		if (AccountNumber == "") {
    			alert("Account Number required")
    			return false;
    		}
    		$.ajax({
    		type : "POST",
    		url : "../Admin/AddShares",
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    		data : {
    			AccountNumber : AccountNumber,
    			FullName   : FullName,
    			ShareAmount : ShareAmount,
    			Date   :  Date,
    			TotalShareAmount : TotalShareAmount
    			
    		},
    		success : function(data) {

    			var res = data;
    			
    			if (res == "Success" ) {
    				alert("Share Added Successfully");
    				document.getElementById("acnumber").value = "";
    				document.getElementById("fname").value = "";
    				 document.getElementById("samount").value = "";
    				 document.getElementById("sdate").value = "";
    				 document.getElementById("TotalShare").value = "";
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
