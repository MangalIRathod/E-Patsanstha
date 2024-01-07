<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha - Close RD</title>
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
                            <i class="fa fa-table"></i> CLOSE RD</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account No.</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="accountnumber1" name="accountnumber1" placeholder="Enter Account No."  required="required">
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
                            <i class="fa fa-table"></i> Close RD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">Full_Name</th>
                                    <th scope="col">RD Amount</th>
                                    <th scope="col">ROI</th>
                                    <th scope="col">Start_Date</th>
                                    <th scope="col">End_Date</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Cheque_No.</th>                                   
                                    <!-- <th scope="col">Receipt_No.</th> -->
                                    <th scope="col">Uploaded Document</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${rdn}" varStatus="theCount">
                          <tr>
                            	<td>${obj.id}</td>
                        		<td>${obj.accno}</td>
                        		<td>${obj.name}</td>
                        		<td>${obj.rdamt}</td>
                        		<td>${obj.roi}</td>
                        		<td>${obj.startdate}</td>
                        		<td>${obj.enddate}</td>
                        		<td>${obj.totamt}</td>
                        		<td>${obj.cheque_no}</td>
                        		<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadRDDocument?AccountNumber=<c:out value="${obj.accno}"/>"></a></td>
                        		<c:if test="${obj.status == 'close'}">                                              		                        		
                        		<td>${obj.status}</td>
                        		</c:if>                       		
                        		<c:if test="${obj.status == 'start'}">                        		                       		                        		
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
          <h5 class="modal-title" id="exampleModalLabel">Close RD</h5>
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
                    <input type="hidden" class="form-control" name="accno" id="accno" readonly>
                    <input type="hidden" class="form-control" name="name" id="name" readonly>
                    <!-- 
                    <input type="text" class="form-control" name="rdamt" id="rdamt" readonly>                   
                    <input type="hidden" class="form-control" name="rddate" id="rddate" readonly>
                    <input type="hidden" class="form-control" name="maturingdate" id="maturingdate" readonly>                   
                    <input type="hidden" class="form-control" name="rdtillamount" id="rdtillamount" readonly>
                    -->
                    </div>
                </div>
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">RD Amount</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id="rdamt" name="rdamt" placeholder="Enter RD Amount" required="required" readonly>
                    </div>
                </div>  
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Start Date</label>
                    <div class="col-8">
                    <input class="form-control" type="date" id="startdate" name="startdate" placeholder="Enter Start Date" required="required">
                    </div>
                </div>  
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">End Date</label>
                    <div class="col-8">
                    <input class="form-control" type="date" id="enddate" name="enddate" placeholder="Enter End Date" required="required">
                    </div>
                    <script>
    					$('#enddate').val(new Date().toJSON().slice(0,10));
					</script>
                </div> 
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Total Month</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="tmonth" name="tmonth" placeholder="Enter Total Month" onclick="MonthCalculate();" onkeyup="MonthCalculate();" required="required">
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
                    <input class="form-control" type="number" id="totamt" name="totamt" placeholder="Enter Total Amount" onkeyup="CalTotalAmount();" onclick="CalTotalAmount();" required="required">
                    </div>
                </div>  
                
              	<div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Cheque Number</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id="chequenumber" name="chequenumber" placeholder="Enter Cheque Number" required="required">
                    </div>
                </div>  
                
                <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Receipt Number</label>
                    <div class="col-8">
                    <input class="form-control" type="number" id="receiptnumber" name="receiptnumber" placeholder="Enter Receipt Number">
                    </div>
                </div>                             
              
                 <div class="modal-footer"> 
                 	<button type="button" class="btn btn-primary " onclick="return closed_rd_save();">Submit</button>           		                 	              
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
                                                document.getElementById("accno").value = this.cells[1].innerHTML; 
                                                document.getElementById("name").value = this.cells[2].innerHTML; 
                                                document.getElementById("rdamt").value = this.cells[3].innerHTML; 
                                                document.getElementById("roi").value = this.cells[4].innerHTML; 
                                                document.getElementById("startdate").value = this.cells[5].innerHTML;                                                 
                                                document.getElementById("denddate").value = this.cells[6].innerHTML;
                                                document.getElementById("totamt").value = this.cells[7].innerHTML;
                                            	                                             
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
        
        function closed_rd_save()
        {  
       		var id = document.getElementById("id").value;
       		var accountnumber = document.getElementById("accno").value;
    	 	var fullname = document.getElementById("name").value;       	 		 	
    	 	var rdamount = document.getElementById("rdamt").value;
    	 	var startdate = document.getElementById("startdate").value;
    	 	var enddate = document.getElementById("enddate").value;
     	 	var roi = document.getElementById("roi").value;
     	 	var totamt = document.getElementById("totamt").value;
       		var chequenumber = document.getElementById("chequenumber").value;
         	var receiptnumber = document.getElementById("receiptnumber").value;
         	
         	if (chequenumber == "") {
          	  alert("Cheque Number required")
          	  return false;
          	  }
         	              	
                	
                	var formData = new FormData();
                	formData.append('id', id);
        	 		formData.append('accountnumber', accountnumber);
        		    formData.append('fullname', fullname);        		    
        		    formData.append('rdamount', rdamount);
        		    formData.append('startdate', startdate);
        		    formData.append('enddate', enddate);
        		    formData.append('roi', roi);
        		    formData.append('totamt', totamt);  
        		    formData.append('chequenumber', chequenumber);
        		    formData.append('receiptnumber', receiptnumber);  
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./close_rd_save",
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
        	 			window.location.href = './Close_RD';
        	 			alert("Close RD Successfully");
        	 			} else {
        	 				alert("Close RD failed");
        	 				
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
            url : "../Admin/CloseRDMember",
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data : {
            AccountNumber : AccountNumber,        
            },
            success : function(data) {
	 			var res = data;	 			
	 			if (res == "Success") {	 				
	 			window.location.href = './Close_RD';	 			
	 			} else {
	 				alert("Close RD failed");
	 				
	 			} 

	 		}
            });

            }
        
function search_rd() {
	var accountnumber = document.getElementById("accountnumber").value;
 	

 	    $.ajax({
		type : "POST",
		url : "./SearchRdRecord",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			accountnumber : accountnumber,
			       			
		},
		success : function(data) {
		
			
			  $.each(data, function (key, value) { 
				 // alert(value);
				  $('#RecuuringDeposite').append(new Option(value,key))
				 
				 
				  
    });
			$( '#RecuuringDeposite' ).change(function() {
				 var abc =  document.getElementById('RecuuringDeposite').value
				 alert(data[abc])
			});
			
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
	function MonthCalculate() {
    	var startDate = document.getElementById("startdate").value;
	 	var endDate = document.getElementById("enddate").value;      	 		 	  
	 	var abc = getMonthDifference(new Date(startDate), new Date(endDate))
	 	document.getElementById('tmonth').value = abc;		
        }
	
		function getMonthDifference(startDate, endDate) {
  		return (
    	endDate.getMonth() - startDate.getMonth() +	12 * (endDate.getFullYear() - startDate.getFullYear())
  		);
	 }
</script>  

<script type="text/javascript">	
	function CalTotalAmount() {
    	var rdamt = document.getElementById("rdamt").value;
	 	var roi = document.getElementById("roi").value;   
	 	var tmonth = document.getElementById("tmonth").value; 
	 	
	 	
	 	var formData = new FormData();
 		formData.append('rdamt', rdamt);
	    formData.append('roi', roi);
	    formData.append('tmonth', tmonth);	    
	    
 	$.ajax({
 		type : "POST",
		url : "./CalculateRDTotalAmount",
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
    		document.getElementById('totamt').value = res1;
    		  			
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
