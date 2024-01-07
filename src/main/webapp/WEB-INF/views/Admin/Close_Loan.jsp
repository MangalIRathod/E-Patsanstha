<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Sanstha Admin - Close Loan</title>
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
                            <i class="fa fa-table"></i> Close Loan 
                        </div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id = "accountnumber" name="accountnumber" placeholder="Enter Account No."  required="required">
                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary " onclick="return search_close_loan_details();">Search</button>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Balance Loan Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="balanceloan" name="balanceloan" placeholder="Enter Balance Loan Amount"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Interest Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="intrestamount" name="intrestamount" placeholder="Enter Interest Amount"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Principal Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "remtenure" name="remtenure" placeholder="Enter Principal Amount"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id = "date" name="date" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Cheque No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="chequenumber" name="chequenumber" placeholder="Enter Cheque No." >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Receipt No.</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "recieptnumber" name="recieptnumber" placeholder="Enter Receipt No.">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Paid Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "paidamount" name="paidamount" placeholder="Enter Paid Amount"  required="required">
                                    </div>
                                </div> 
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 1</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="guranteer1" name="guranteer1" placeholder="Guranteer Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Guaranteer Name 2</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="guranteer2" name="guranteer2" placeholder="Guranteer Name"  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select files:</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-primary " onclick="return loan_close();">Submit</button>

                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Close Loan &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Balance Loan Amount</th>
                                    <th scope="col">Interest Amount</th>
                                    <!-- <th scope="col">Rem. Tenure</th> -->
                                    <th scope="col">Cheque No.</th>
                                    <th scope="col">Receipt No.</th>
                                    <th scope="col">Paid Amount</th>
                                    <th scope="col">Uploaded Document</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${CloseLoanInfo}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.date}</td>
                        		<td>${obj.balanceloan}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestamount}" /></td>
                        		<!-- <td>${obj.remtenure}</td> -->
                        		<td>${obj.chequenumber}</td>
                        		<td>${obj.recieptnumber}</td>
                        		<td>${obj.paidamount}</td>  
                        		<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadLoanCloseDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td>                     		
                          </tr>
                          </c:forEach>
                        </tbody>

                        </table> 
                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

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
        
            function loan_close() {
        	 	var accountnumber = document.getElementById("accountnumber").value;
        	 	var fullname = document.getElementById("fullname").value;
        	 	var date = document.getElementById("date").value;
        	    //var date = changeDateFormat(inputDate1);
        	 	var balanceloan = document.getElementById("balanceloan").value;
        	 	var intrestamount = document.getElementById("intrestamount").value;
        	 	var remtenure = document.getElementById("remtenure").value;       	 	
        	 	var chequenumber = document.getElementById("chequenumber").value;
        	 	var recieptnumber = document.getElementById("recieptnumber").value;
        	 	var paidamount = document.getElementById("paidamount").value;  
        	 	var guranteer1 = document.getElementById("guranteer1").value;
        	 	var guranteer2 = document.getElementById("guranteer2").value; 
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
        		    formData.append('date', date);
        		    formData.append('balanceloan', balanceloan);
        		    formData.append('intrestamount', intrestamount);
        		    formData.append('remtenure', remtenure);
        		    formData.append('chequenumber', chequenumber);
        		    formData.append('recieptnumber', recieptnumber);
        		    formData.append('paidamount', paidamount);
        		    formData.append('guranteer1', guranteer1);
        		    formData.append('guranteer2', guranteer2);
        		    
        		    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		    for(var i = 0;i<file_data.length;i++){
        		    	formData.append("files", file_data[i]);
        		    }
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./loan_closed",
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
        	 			window.location.href = './Close_Loan';
        	 			alert("Loan Closed Successfully");
        	 			} else {
        	 				alert("Loan Closed failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            function search_close_loan_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
        	 	   
        	 	 var formData = new FormData();
        	 		formData.append('accountnumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./search_close_loan_details",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
        			
        	 		success : function(data) {
       	 		
        	 			var result = data.split(":");
        	    		 
        	    		 document.getElementById('fullname').value = result[0];
        	    		 document.getElementById('balanceloan').value = result[1];
        	    		 document.getElementById('intrestamount').value = result[2];
        	    		 document.getElementById('remtenure').value = result[3];
        	    		 document.getElementById('guranteer1').value = result[4];
        	    		 document.getElementById('guranteer2').value = result[5];
        	 			
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
