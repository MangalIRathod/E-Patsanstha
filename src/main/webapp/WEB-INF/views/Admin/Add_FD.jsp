<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
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



<style>

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
                            <i class="fa fa-table"></i> ADD FD(FIXED DEPOSIT)</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक
                                        )</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">

                                    </div>
                                    <div class="col-4">
                                        <button type="button" class="btn btn-primary" onclick="return search_fd_details();">Search</button>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">FD Certificate Number (FD प्रमाणपत्र क्रमांक)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fdcertificatenumber" value="${fdc}" name="fdcertificatenumber" placeholder="FD Certificate Number" required="required" readonly>

                                    </div>
                                    
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                
                                <!-- 
								<div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">ROI (व्याज दर)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="roi" name="roi" placeholder="Enter Rate of Intrest"  required="required">
                                    </div>
                                </div>
                                 -->

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">FD Amount (FD रक्कम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="fdamount" name="fdamount" placeholder="Enter FD Amount (in Rs.)"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">FD Date (FD तारीख )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="fddate" name="fddate" placeholder="Enter Date of FD."  required="required">
                                    </div>
                                </div>
                                
                                <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Maturing Date (परिपक्वता तारीख)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="maturingdate" name="maturingdate" onkeyup="CalDate();" onclick="CalDate();" placeholder="Maturing  Date."  required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="totalamount" name="totalamount" placeholder="Enter Total Amount"  required="required" onkeyup="CalTotalAmount();" onclick="CalTotalAmount();">
                                    </div>
                                </div>
                                 -->
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select files:</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>

								<button type="button" class="btn btn-primary " onclick="return fd_save();">Submit</button>
                                
                               <!-- <input class="btn btn-primary " type="submit" name="all" value="Pdf Genertae"/> -->
                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> FIXED DEPOSIT</div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">FD Certificate No</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">FD Amount</th>
                                    <th scope="col">FD Date</th>
                                    <th scope="col">Maturing Date</th>
                                    <th scope="col">ROI</th>
                                    <th scope="col">Total Amount</th>
                                    <!-- <th scope="col">Status</th> -->
                                    <th scope="col">Uploaded Document</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${FDInfo}" varStatus="theCount">
                          <tr>
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fdcertificatenumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.fdamount}</td>
                        		<td>${obj.fddate}</td>
                        		<td>${obj.maturingdate}</td>
                        		<td>${obj.roi}</td>
                        		<td>${obj.totalamount}</td>
                        		<!-- <td>${obj.status}</td> -->
    							<td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadFDDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td>								
                          		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="DeleteEntry(${obj.id});" ><i class="fa fa-trash"></i></button></td>
                          </tr>
                          </c:forEach>
                        </tbody>

                        </table> 
                    </div>
                </div>  

            </div>
       
        <!-- /.container-fluid-->

        <script>
        
        function CalDate()
        {        	
        	var rddate = document.getElementById("fddate").value;
    		//var tenure = document.getElementById("Time").value;
    		
    		var tenure1 = 12;
    	  
    		var d = new Date(rddate);
			d.setMonth(d.getMonth() +tenure1);
    		
    		document.getElementById("maturingdate").value =  d.toISOString().slice(0, 10);
    		
        	}
        
        function CalTotalAmount()
        {
        	
           var FDAmount = document.getElementById("fdamount").value;
    		
    		var ROI = document.getElementById("roi").value;
    		var TotalAmount ;
    		
    			
    			TotalAmount =eval(FDAmount) +  eval((FDAmount * ROI)/100);
    			
    		
    		/*var InterestAmount = (ROI/100) * RDAmount;
    		InterestAmount = InterestAmount * Tenure;
    		RDAmount = RDAmount * Tenure;
    		TotalAmount = eval(RDAmount) + eval(InterestAmount);
    		alert (InterestAmount+ "  "+TotalAmount);*/
    		document.getElementById("totalamount").value =  TotalAmount;
    		
        	}
        
        
        
        
            function fd_save() {
        	 	var fullname = document.getElementById("fullname").value;
        	 	var fdcertificatenumber = document.getElementById("fdcertificatenumber").value;
        	 	var accountnumber = document.getElementById("accountnumber").value;      	 	
        	 	var fdamount = document.getElementById("fdamount").value;
        	 	var fddate = document.getElementById("fddate").value;
        	    //var fddate = changeDateFormat(inputDate1);
        	 	//var maturingdate = document.getElementById("maturingdate").value;
        	    //var maturingdate = changeDateFormat(inputDate2);
        	 	//var roi = document.getElementById("roi").value;
        	 	//var totalamount = document.getElementById("totalamount").value;       	 	
        	 	
        	 	var photo = document.getElementById("photo").value;
        	 	
        	 	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
               	}
        	 	
        	// 	if (photo == "") {
            //  	  alert("Please Select File")
            //  	  return false;
            // 	}
        	 	
        	 	 var formData = new FormData();
        		    formData.append('fullname', fullname);
        		    formData.append('fdcertificatenumber', fdcertificatenumber);
        		    formData.append('accountnumber', accountnumber);
        		    formData.append('fdamount', fdamount);
        		    formData.append('fddate', fddate);
        		    //formData.append('maturingdate', maturingdate);
        		    //formData.append('roi', roi);
        		    //formData.append('totalamount', totalamount);       		    
        		    
        		    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		    for(var i = 0;i<file_data.length;i++){
        		    	formData.append("files", file_data[i]);
        		    }
        		   	 	
        	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./fd_save",
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
        	 			window.location.href = './Add_FD';
        	 			alert("FD Added Successfully");
        	 			} else {
        	 				alert("FD Added failed");
        	 				
        	 			} 

        	 		}
        	 	});
                	
                }
            
            
            function search_fd_details() {
            	var accountnumber = document.getElementById("accountnumber").value;
        	 	
            	if (accountnumber == "") {
                	  alert("Account Number required")
                	  return false;
                	  }
            	
        	 	 var formData = new FormData();
        	 		formData.append('AccountNumber', accountnumber);     		    
        		    
        	 	$.ajax({
        	 		type : "POST",
        			url : "./SearchFDAccountName",
        			enctype : 'multipart/form-data',
        			data : formData,
        			processData : false, //prevent jQuery from automatically transforming the data into a query string
        			contentType : false,
        			cache : false,
        			timeout : 600000,
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
            
            function DeleteEntry(id) {
            	//alert(id+" "+accountnumber);
            	$.ajax({
            		type : "POST",
            		url : "../Admin/DeleteFD",
            		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            		data : {
            			id : id,             			
            		},
            		success : function(data) {
            			var res = data;
            			if (res == "Success") {            			
            			alert("Record Deleted Successfully");
            			window.location.href = 'Add_FD';            			
            			} else {
            				alert("Connection Error");            				
            			} 
            		}
            	});            	
            }
            
            </script>

    </body>

</html>
