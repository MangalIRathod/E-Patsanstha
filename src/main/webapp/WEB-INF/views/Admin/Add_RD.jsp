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
                            <i class="fa fa-table"></i> ADD RD</div>
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
                                    <label for="example-text-input" class="col-4 col-form-label">RD Number</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="rd_no" name = "rd_no" placeholder="Enter RD Number"  required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">RD Amount Monthly(RD रक्कम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="rdamount" placeholder="Enter RD Amount (in Rs.)"  required="required">
                                    </div>
                                </div>
								<!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Tenure (कालावधी)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="Time" placeholder="Enter No of Month."  required="required">
                                    </div>
                                </div>
                                 -->
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">RD Date (RD तारीख)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="rddate" placeholder="Enter RD Start Date."  required="required">
                                    </div>
                                </div>
                                <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Maturing Date (परिपक्वता तारीख)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="mdate" onkeyup="CalDate();" onclick="CalDate();" placeholder="Enter Number of Month"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">ROI (व्याज
                                        दर)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="ROI" placeholder="Enter Rate of Intrest"  required="required">
                                    </div>
                                </div> 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="t_amount" placeholder="Enter Total Amount"  required="required" onclick="CalTotalAmount();">
                                    </div>
                                </div>
                                 -->
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select files:</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-primary" onclick="return RD_Save();">Submit</button>

                            </form>


                        </div>
                    </div>

               



                <!-- Example DataTables Card-->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i> RD </div>
                   
                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">RD Amount</th>
                                    <th scope="col">RD Date</th>
                                    <!-- <th scope="col">Maturing Date</th> -->
                                    
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Status</th>
                                    
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
						<tbody>
                        <c:forEach var="obj" items="${RDInfo}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.rdamount}</td>
                        		<td>${obj.rddate}</td>
                        		
                        		
                        		<td>${obj.totalamount}</td>
                        		<td>${obj.status}</td>
                        		
                        		<td><button class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Delete" onclick="DeleteEntry(${obj.id});" ><i class="fa fa-trash"></i></button></td>
                        		
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>
                </div>

 </div>

            

        

        <script>
        
        
        function CalTotalAmount()
        {
        	
           var RDAmount = document.getElementById("rdamount").value;
    		var Tenure = document.getElementById("Time").value;
    		var ROI = document.getElementById("ROI").value;
    		var TotalAmount ;
    		if (RDAmount == "") {
    			alert("RD Amount required")
    			return false;
    		}
    		if(Tenure <= 24)
    			{
    			TotalAmount = RDAmount * Tenure;
    			
    			}
    		else if(Tenure > 24 && Tenure < 60)
    			{
    			var InterestAmount = RDAmount * (Tenure) * 6;
    			InterestAmount = InterestAmount/1200;
    			TotalAmount = eval(RDAmount * Tenure) + eval(InterestAmount) ;
    			
    			}
    		else
    			{
    			
    			TotalAmount = eval(RDAmount * Tenure) + eval((RDAmount * (60) * 7)/1200 );
    			}
    		
    		/*var InterestAmount = (ROI/100) * RDAmount;
    		InterestAmount = InterestAmount * Tenure;
    		RDAmount = RDAmount * Tenure;
    		TotalAmount = eval(RDAmount) + eval(InterestAmount);
    		alert (InterestAmount+ "  "+TotalAmount);*/
    		document.getElementById("t_amount").value =  TotalAmount;
    		
        	}
        
        function CalDate()
        {        	
        	var rddate = document.getElementById("rddate").value;
    		var tenure = document.getElementById("Time").value;
    		
    		var tenure1 = Number(tenure);
    	  
    		var d = new Date(rddate);
			d.setMonth(d.getMonth() +tenure1);
    		
    		document.getElementById("mdate").value =  d.toISOString().slice(0, 10);
    		
        	}
        
        
        function DownloadDoc(AccountNumber) {
        	if (AccountNumber == "") {
    			alert("Account Number required")
    			return false;
    		}
    		
        	$.ajax({
        		type : "POST",
        		url : "../Admin/DownloadRDDocument",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		data : {
        			AccountNumber : AccountNumber,
        			
        		},
        		success : function(data) {

        			var res = data;
        			
        			if (res == "Fail" ) {
        				alert("Document Not Available");
        			} else {
        				alert("Doc Downloaded");
        				
        			} 

        		}
        	});

		}
        
        
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

    			//var res = data;
    			var result = data.split(":");
    			
    			if (result == "Fail" ) {
    				alert("User Is Not Register");
    			} else {
    			//	document.getElementById("fname").value =  res;
    			document.getElementById('fname').value = result[0];
   	    		document.getElementById('rd_no').value = result[1];
    				
    			} 

    		}
    	});

    }
     
 function RD_Save()
 {	 	 	    	   	 
    	var AccountNumber = document.getElementById("acnumber").value;
		var FullName = document.getElementById("fname").value;
		var RDAmount = document.getElementById("rdamount").value;
		//var Time = document.getElementById("Time").value;
		var RDDate = document.getElementById("rddate").value;
	    //var RDDate = changeDateFormat(inputDate1);		 
		//var MDate = document.getElementById("mdate").value;
	    //var MDate = changeDateFormat(inputDate2);
		//var ROI = document.getElementById("ROI").value;
		//var TotalAmount = document.getElementById("t_amount").value;
		var photo = document.getElementById("photo").value;
		var rd_no = document.getElementById("rd_no").value;
				
		if (AccountNumber == "") {
           alert("Account Number required")
           return false;
        }
		// code mangal
		if(FullName == ""){
			alert("FullName required")
			return false;
		}
		if(RDAmount == "") {
			alert("RDAmount required")
			return false;
		}
		if(RDDate == "") {
			alert("RDDate required")
			return false;
		}
		if(rd_no == ""){
			alert("Rd_no required")
			return false;
		}
		
		
		//end
		
		//if (photo == "") {
	    //   alert("Please Select File")
	    //   return false;
	    //}
		
		 var formData = new FormData();
		    formData.append('AccountNumber', AccountNumber);
		    formData.append('FullName', FullName);
		    formData.append('RDAmount', RDAmount);
		    //formData.append('Time', Time);
		    formData.append('RDDate', RDDate);
		    //formData.append('MDate', MDate);
		    //formData.append('ROI', ROI);
		    //formData.append('TotalAmount', TotalAmount);
		    formData.append('rd_no', rd_no);
		    var file_data = $('input[type="file"]')[0].files; // for multiple files
		    for(var i = 0;i<file_data.length;i++){
		    	formData.append("files", file_data[i]);
		    }
		   			
			
		$.ajax({
		type : "POST",
		url : "../Admin/AddRD",
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
        	 	window.location.href = './Add_RD';
        	 	alert("RD Added Successfully");
        	 	} else {
        	 		alert("RD Added failed");      	 				
        	 	} 
        }				
	});
 	}
 
 function DeleteEntry(id) {
 	//alert(id+" "+accountnumber);
 	$.ajax({
 		type : "POST",
 		url : "../Admin/DeleteRD",
 		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
 		data : {
 			id : id,             			
 		},
 		success : function(data) {
 			var res = data;
 			if (res == "Success") {            			
 			alert("Record Deleted Successfully");
 			window.location.href = 'Add_RD';            			
 			} else {
 				alert("Connection Error");            				
 			} 
 		}
 	});            	
 }
        </script>


    </body>

</html>
