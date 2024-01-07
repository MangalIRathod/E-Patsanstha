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
                            <i class="fa fa-table"></i> ADD MEMBER (सदस्य जोडा)</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="accountnumber" name="accountnumber" placeholder="Enter Account Number"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Department (विभाग)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="department" name="department" placeholder="Enter Department"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Designation (पदनाम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="designation" name="designation" placeholder="Enter Designation"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOB (Date of Birth)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="dob" name="dob" placeholder="Enter Date of Birth"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOJ(Date of Joining) </label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="doj" name="doj" placeholder="Enter Date of Joining"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOR (Date of Retirement) निवृत्तीची तारीख</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="dor" name="dor" placeholder="Enter Date of Retirement"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Mobile No</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="mobile" name="mobile" placeholder="Enter Mobile Number"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Email Id</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="email" name="email" placeholder="Enter Email Id"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Address (पत्ता)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="address" name="address" placeholder="Enter Address"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Shares (भाग )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="shares" name="shares" placeholder="Enter Shares"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit (मासिक ठेव )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="monthlydeposit" name="monthlydeposit" placeholder="Enter Monthly Deposit"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance (सभासद कल्याण निधी)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="insurance" name="insurance" placeholder="Enter Insurance"  required="required">
                                    </div>
                                </div>								

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Bank Account Number (बँक खाते क्रमांक)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="bankaccount" name="bankaccount" placeholder="Enter Bank Account Number"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Bank Name (बँकेचे नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="bankname" name="bankname" placeholder="Enter Bank Name"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Branch Code (शाखा कोड)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="branchcode" name="branchcode" placeholder="Enter IFSC Code"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Branch Name (शाखा नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="branchname" name="branchname" placeholder="Enter Branch Name"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee's Name (नामनिर्देशित व्यक्तीचे नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nominee" name="nominee" placeholder="Enter Nominee's Name" required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee's Relation (नामनिर्देशित व्यक्तीचे नाते)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nomineerelation" name="nomineerelation" placeholder="Enter Nominee's Relation" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Registration Fee</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="reg_fee" name="reg_fee" placeholder="Enter Registration Fee" required="required">
                                    </div>
                                </div>
                                
                                <!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select Photo</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" accept="image/png, image/jpg, image/gif, image/jpeg">
                                    </div>
                                </div>
                                 -->
                                
                                <button type="button" class="btn btn-primary " onclick="return member_save();">Submit</button>

                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Add Member &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'W3C Example Table')">Download</button>
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Full Name</th>	
                                    <th scope="col">Account Number</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Designation</th>
                                    <th scope="col">DOB</th>
                                    <th scope="col">DOJ</th>
                                    <th scope="col">DOR </th>
                                    <th scope="col">Mobile No</th>
                                    <th scope="col">Email Id</th>
                                    <th scope="col">Address </th>    			
                                    <th scope="col">Shares </th>
                                    <th scope="col">Monthly Deposit</th>
                                    <th scope="col">Insurance </th>
                                    
                                    <th scope="col">Bank Account No.</th>
                                    <th scope="col">Bank Name </th>    			
                                    <th scope="col">Branch Code </th>
                                    <th scope="col">Branch Name</th>
                                    <th scope="col">Nominee </th>
                                    <th scope="col">Nominee Relation</th>
                                    <th scope="col">Reg. Fee</th>
                                    <th scope="col">Edit</th>
                                  	<!-- <th scope="col">Uploaded Document</th> -->

                                </tr>
                            </thead>
							<tbody>
                        <c:forEach var="obj" items="${AddMemberInfo}" varStatus="theCount">
                          <tr>
                            	<td>${theCount.index+1}</td>
                            	<td>${obj.fullname}</td>                       		
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.department}</td>
                        		<td>${obj.designation}</td>
                        		<td>${obj.dob}</td>
                        		<td>${obj.doj}</td>
                        		<td>${obj.dor}</td>
                        		<td>${obj.mobile}</td>
                        		<td>${obj.email}</td>
                        		<td>${obj.address}</td>
                        		<td>${obj.shares}</td>
                        		<td>${obj.monthlydeposit}</td>
                        		<td>${obj.insurance}</td>
                        		
                        		<td>${obj.bankaccount}</td>
                        		<td>${obj.bankname}</td>
                        		<td>${obj.branchcode}</td>
                        		<td>${obj.branchname}</td>
                        		<td>${obj.nominee}</td>
                        		<td>${obj.nomineerelation}</td>
                        		<td>${obj.reg_fee}</td>
                        		<td><button class="btn btn-primary btn-sm rounded-0" type="button" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo" onclick="onedit11()"><i class="fa fa-edit"></i></button></td> 
                        		<!-- <td><a class="btn fa fa-download btn-primary" href="../Admin/DownloadAddMemberDocument?AccountNumber=<c:out value="${obj.accountnumber}"/>"></a></td> -->
                        		
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>
                    
                    
                    

                </div>

            </div>
            <!-- /.container-fluid-->


            <script>
            
            
            function member_save() {
        	 	var fullname = document.getElementById("fullname").value;
        	 	var accountnumber = document.getElementById("accountnumber").value;
        	 	var department = document.getElementById("department").value;
        	 	var designation = document.getElementById("designation").value;
        	 	var dob = document.getElementById("dob").value;
        	    //var dob = changeDateFormat(inputDate1);
        	 	var doj = document.getElementById("doj").value;
        	    //var doj = changeDateFormat(inputDate2);
        	 	var dor = document.getElementById("dor").value;
        	    //var dor = changeDateFormat(inputDate3);
        	 	var mobile = document.getElementById("mobile").value;
        	 	var email = document.getElementById("email").value;
        	 	var address = document.getElementById("address").value;
        	 	var shares = document.getElementById("shares").value;
        	 	var monthlydeposit = document.getElementById("monthlydeposit").value;	 
        	 	var insurance = document.getElementById("insurance").value;
        	 	
        	 	
        	 	var bankaccount = document.getElementById("bankaccount").value;
        	 	var bankname = document.getElementById("bankname").value;
        	 	var branchcode = document.getElementById("branchcode").value;
        	 	var branchname = document.getElementById("branchname").value;	
        	 	var nominee = document.getElementById("nominee").value;
        	 	var nomineerelation = document.getElementById("nomineerelation").value;	 
        	 	var reg_fee = document.getElementById("reg_fee").value;	
        	 //	var photo = document.getElementById("photo").value;
        	 	
        	 	if (fullname == "") {
                	  alert("Full Name required")
                	  return false;
                	  }
        	 	if (accountnumber == "") {
              	  alert("Account Number required")
              	  return false;
              	  }
        	 	if (mobile == "") {
                	  alert("Mobile Number required")
                	  return false;
               	}
        	 	
        	 	//codev from mangal
        	 	if(department == "") {
        	 		alert("Department name required")
        	 		return false;
        	 	}
        	 	if(dob == "") {
        	 		alert("Date Of Birth required")
        	 		return false;
        	 	}
        	 	if(doj == "") {
        	 		alert("Date of joining required")
        	 		return false;
        	 	}
        	 	if(address == "") {
        	 		alert("Address required")
        	 		return false;
        	 	}
        	 	if(monthlydeposit == " ") {
        	 		alert("Monthlydeposit is required")
        	 		return false;
        	 	}
        	 	if(insurance == ""){
        	 		alert("Insurance required")
        	 		return false;
        	 	}
        	 	if(bankname == ""){
        	 		alert("Bankname required")
        	 		return false;
        	 	}
        	 	if(bankaccount == ""){
        	 		alert("Bankaccount required")
        	 		return false;
        	 	}
        	 	if(branchcode == ""){
        	 		alert("Branchcode required")
        	 		return false;
        	 	}
        	 	if(nominee == ""){
        	 		alert("Nominee required")
        	 		return false;
        	 	}
        	 	if(reg_fee == "") {
        	 		alert("Registration fee required")
        	 		return false;
        	 	}
        	 	
        	 	
        	 	
        	 	
        	 	
        	 	//end
        	 	
        	 	
        	 	 var formData = new FormData();
        		    formData.append('fullname', fullname);
        		    formData.append('accountnumber', accountnumber);
        		    formData.append('department', department);
        		    formData.append('designation', designation);
        		    formData.append('dob', dob);
        		    formData.append('doj', doj);
        		    formData.append('dor', dor);
        		    formData.append('mobile', mobile);
        		    formData.append('email', email);
        		    formData.append('address', address);
        		    formData.append('shares', shares);
        		    formData.append('monthlydeposit', monthlydeposit);
        		    formData.append('insurance', insurance);
        		    
        		    formData.append('bankaccount', bankaccount);
        		    formData.append('bankname', bankname);
        		    formData.append('branchcode', branchcode);
        		    formData.append('branchname', branchname);
        		    formData.append('nominee', nominee);
        		    formData.append('nomineerelation', nomineerelation);
        		    formData.append('reg_fee', reg_fee);
        		    
        		//    var file_data = $('input[type="file"]')[0].files; // for multiple files
        		//    for(var i = 0;i<file_data.length;i++){
        		 //   	formData.append("files", file_data[i]);
        		//    }
        		   	 	
        	 	
        	 	$.ajax({
        	 		type : "POST",
        			url : "./save_member",
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
        	 			window.location.href = './Add_Member';
        	 			alert("Member Saved Successfully");
        	 			} else {
        	 				alert("Member Saved failed");
        	 				
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
			
			<script>
			function onedit11()
            {                                	  
                var table = document.getElementById('dataTable');
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {                                               
                        //document.getElementById("id").value = this.cells[0].innerHTML; 
                        document.getElementById("fullname").value = this.cells[1].innerHTML; 
                        document.getElementById("accountnumber").value = this.cells[2].innerHTML;                        
                        document.getElementById("department").value = this.cells[3].innerHTML; 
                        document.getElementById("designation").value = this.cells[4].innerHTML; 
                        document.getElementById("dob").value = this.cells[5].innerHTML; 
                        document.getElementById("doj").value = this.cells[6].innerHTML;
                        document.getElementById("dor").value = this.cells[7].innerHTML;                                                 
                        document.getElementById("mobile").value = this.cells[8].innerHTML;
                        document.getElementById("email").value = this.cells[9].innerHTML;
                        document.getElementById("address").value = this.cells[10].innerHTML;
                        document.getElementById("shares").value = this.cells[11].innerHTML;
                        document.getElementById("monthlydeposit").value = this.cells[12].innerHTML;                                               
                        document.getElementById("insurance").value = this.cells[13].innerHTML;    
                                                          
                        document.getElementById("bankaccount").value = this.cells[14].innerHTML;
                        document.getElementById("bankname").value = this.cells[15].innerHTML;
                        document.getElementById("branchcode").value = this.cells[16].innerHTML;
                        document.getElementById("branchname").value = this.cells[17].innerHTML;
                        document.getElementById("nominee").value = this.cells[18].innerHTML;                                               
                        document.getElementById("nomineerelation").value = this.cells[19].innerHTML;  
                        document.getElementById("reg_fee").value = this.cells[20].innerHTML;  
                    };
                }
            }
			</script>


        </body>

    </html>
