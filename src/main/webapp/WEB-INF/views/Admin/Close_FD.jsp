<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Sanstha Admin - Close FD</title>
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



		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- current date -->



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
                            <i class="fa fa-table"></i> CLOSE FD</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                                    <div class="col-4">
                                        <input class="form-control" type="text" id = "accountnumber1" name="accountnumber1" placeholder="Enter Account No."  required="required">
                                    </div>
                                    <div class="col-4">
                                        
                                     <button type="button" class="btn btn-primary" onclick="Search();">SEARCH</button>
                                    </div>
                                </div>
                               
                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Close FD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">FD Cert. No.</th>	
                                    <th scope="col">Full_Name</th>
                                    <th scope="col">FD Amount</th>
                                    <th scope="col">FD Start_Date</th>
                                    <th scope="col">FD Close_Date</th>                                   
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Cheque_No.</th>                                   
                                    <th scope="col">Receipt_No.</th>
                                    <th scope="col">Close</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${CloseFDInfo}" varStatus="theCount">
                          <tr>
                            	<td>${obj.id}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fdcertificatenumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.fdamount}</td>
                        		<td>${obj.fddate}</td>
                        		<td>${obj.maturingdate}</td>
                        		<td>${obj.totalamount}</td>
                        		
                        		<c:if test="${obj.status == 'close'}">
                        		<td>${obj.chequenumber}</td>
                        		<td>${obj.receiptnumber}</td>  
                        		<td>${obj.status}</td>
                        		</c:if>
                        		<c:if test="${obj.status == 'start'}">
                        		<td></td>
                        		<td></td>
                        		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo" onclick="onedit11()"><i class="fa fa-close"></i></button></td>
                        		</c:if>                        		
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
          <h5 class="modal-title" id="exampleModalLabel">Close FD</h5>
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
                    <input type="hidden" class="form-control" name="accountnumber" id="accountnumber" readonly>
                    <input type="hidden" class="form-control" name="fdcertificatenumber" id="fdcertificatenumber" readonly>
                    <input type="hidden" class="form-control" name="fullname" id="fullname" readonly>                   
                    </div>
                </div>
                                
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Start Date</label>
                    <div class="col-8">
                    <input class="form-control" type="date" id="fdstartdate" name="fdstartdate" placeholder="Enter Start Date">
                    </div>
                </div>  
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">End Date</label>
                    <div class="col-8">
                    <input class="form-control" type="date" id="fdmaturedate" name="fdmaturedate" placeholder="Enter End Date">
                    </div>                                      
                    <script>
    					$('#fdmaturedate').val(new Date().toJSON().slice(0,10));
					</script>
                </div> 
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Total Days</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="tdays" name="tdays" placeholder="Enter Total Days" onclick="DaysCalculate();" onkeyup="DaysCalculate();" required="required">
                    </div>
                </div>       
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">FD Amount</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="fdamount" name="fdamount" placeholder="Enter FD Amount" required="required">
                    </div>
                </div>  
                               
                <div class="form-group row">
                	<label for="example-text-input" class="col-4 col-form-label">ROI</label>
                    <div class="col-8">
                    	<select id="roi" name="roi" class="form-control">
                    		<c:forEach var="obj" items="${ChangeInterestInfo}" varStatus="theCount">
                    			<option value="${obj.roi}">${obj.roi}</option>
                    		</c:forEach>        
                    	</select>
                    </div>
                </div>  
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Total Amount</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="totalamount" name="totalamount" onkeyup="CalTotalAmount();" onclick="CalTotalAmount();" placeholder="Total Amount" required="required">
                    </div>
                </div>  
              
              	<div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Cheque Number</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="chequenumber" name="chequenumber" placeholder="Enter Cheque Number" required="required">
                    </div>
                </div>  
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Receipt Number</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="receiptnumber" name="receiptnumber" placeholder="Enter Receipt Number">
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

								<script>
                                    function onedit11()
                                    {
                                        var table = document.getElementById('dataTable');
                                        for(var i = 1; i < table.rows.length; i++)
                                        {
                                            table.rows[i].onclick = function()
                                            {
                                                //rIndex = this.rowIndex;
                                                
                                                document.getElementById("id").value = this.cells[0].innerHTML;                                                 
                                                document.getElementById("accountnumber").value = this.cells[1].innerHTML;
                                                document.getElementById("fdcertificatenumber").value = this.cells[2].innerHTML;
                                                document.getElementById("fullname").value = this.cells[3].innerHTML; 
                                                document.getElementById("fdamount").value = this.cells[4].innerHTML; 
                                                document.getElementById("fdstartdate").value = this.cells[5].innerHTML; 
                                                document.getElementById("dddate").value = this.cells[6].innerHTML;                                                 
                                                document.getElementById("totalamount").value = this.cells[7].innerHTML;
                                            	                                             
                                            };
                                        }
                                    }
                                </script>                 
 <!-- --------------------------------------------------------------------------------------------------------- -->                   

                </div>

            </div>
            <!-- /.container-fluid-->

     <script>
     
     var today = new Date();
     var dd = today.getDate();
     var mm = today.getMonth()+1; 
     var yyyy = today.getFullYear();
     if(dd<10) 
     {
         dd='0'+dd;
     } 
     if(mm<10) 
     {
         mm='0'+mm;
     } 
     today = yyyy+'-'+mm+'-'+dd;
  
     function closed_fd_save()
     {  
    	var id = document.getElementById("id").value;
    	var accountnumber = document.getElementById("accountnumber").value;
    	var fdcertificatenumber = document.getElementById("fdcertificatenumber").value;
 	 	var fullname = document.getElementById("fullname").value;       	 		 		 	
 	 	var fdstartdate = document.getElementById("fdstartdate").value;
 	 	var fdmaturedate = document.getElementById("fdmaturedate").value;
 	 	var fdamount = document.getElementById("fdamount").value;
 	 	var roi = document.getElementById("roi").value;
  	 	var totalamount = document.getElementById("totalamount").value;
    	var chequenumber = document.getElementById("chequenumber").value;
      	var receiptnumber = document.getElementById("receiptnumber").value;
      	
      	if (chequenumber == "") {
       	  alert("Cheque Number required")
       	  return false;
       	  }
      	// code mangal
      	if(accountnumber == ""){
      		alert("Accountnumber required")
      		return false;
      	}
      	//end
      	  
             	
             	var formData = new FormData();
             	formData.append('id', id);
     	 		formData.append('accountnumber', accountnumber);
     	 		formData.append('fdcertificatenumber', fdcertificatenumber);
     		    formData.append('fullname', fullname);        		         		    
     		    formData.append('fdstartdate', fdstartdate);
     		    formData.append('fdmaturedate', fdmaturedate);
     		    formData.append('fdamount', fdamount);
     		    formData.append('roi', roi); 
     		    formData.append('totalamount', totalamount); 
     		    formData.append('chequenumber', chequenumber);
    		    formData.append('receiptnumber', receiptnumber); 
     		    
     	 	$.ajax({
     	 		type : "POST",
     			url : "./close_fd_save",
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
     	 			window.location.href = './Close_FD';
     	 			alert("FD Closed Successfully");
     	 			} else {
     	 				alert("Close FD failed");
     	 				
     	 			} 

     	 		}
     	 	});
             	           
     }
     
     function Search() {

    	 
    	  var AccountNumber = document.getElementById("accountnumber1").value;
    	  if (AccountNumber == "") {
    	  alert("Account Number required")
    	  return false;
    	  }
    	     	 
    	  $.ajax({
    	  type : "POST",
    	  url : "../Admin/CloseFDMember",
    	  contentType : "application/x-www-form-urlencoded; charset=UTF-8",
    	  data : {
    	  AccountNumber : AccountNumber,    	 
    	  },
    	  success : function(data) {
	 			var res = data;	 			
	 			if (res == "Success") {	 				
	 			window.location.href = './Close_FD';	 			
	 			} else {
	 				alert("Close FD failed");
	 				
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

<script type="text/javascript">	
	function DaysCalculate() {
    	var startDate = document.getElementById("fdstartdate").value;
	 	var endDate = document.getElementById("fdmaturedate").value;      	 		 	  
	 	//var abc = getMonthDifference(new Date(startDate), new Date(endDate))
	 	var diffInMs   = new Date(endDate) - new Date(startDate)
	 	var diffInDays = diffInMs / (1000 * 60 * 60 * 24);
	 	document.getElementById('tdays').value = diffInDays;		       
	 }
</script>  

<script type="text/javascript">	
	function CalTotalAmount() {
    	var fdamount = document.getElementById("fdamount").value;
	 	var roi = document.getElementById("roi").value;   
	 	var tdays = document.getElementById("tdays").value; 
	 	
	 	
	 	var formData = new FormData();
 		formData.append('fdamount', fdamount);
	    formData.append('roi', roi);
	    formData.append('tdays', tdays);	    
	    
 	$.ajax({
 		type : "POST",
		url : "./CalculateFDTotalAmount",
		enctype : 'multipart/form-data',
		data : formData,
		processData : false, //prevent jQuery from automatically transforming the data into a query string
		contentType : false,
		cache : false,
		timeout : 600000,
		
 		success : function(data) {
					
 			var result = data;
 			//alert(result);
 			var res1 = Math.round(result);  
 			   		 
    		document.getElementById('totalamount').value = res1;
    		  			
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
