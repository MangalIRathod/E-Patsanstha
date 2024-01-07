
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link href="/UserUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="/UserUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="/UserUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="/UserUI/css/sb-admin.css" rel="stylesheet">
        <script src="/UserUI/js/jquery.js"></script>
        <!-- send id to fullorder.php-->

        


    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <%@ include
            file="user_navbar.jsp"%>
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
                            <i class="fa fa-table"></i> UPDATE MEMBER </div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id = "fullname" name="fullname" value="${fullname}" pattern="^[a-zA-Z][a-zA-Z\\s]+$" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="accountnumber" name="accountnumber" value="${accountnumber}" placeholder="Enter Account Number"  required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Department (विभाग)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="department" name="department" value="${department}" placeholder="Enter Department"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Designation (पदनाम)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="designation" name="designation" value="${designation}" placeholder="Enter Designation"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOB (Date of Birth)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="dob" name="dob" value="${dob}" placeholder="Enter Date of Birth"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOJ(Date of Joining) </label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="doj" name="doj" value="${doj}" placeholder="Enter Date of Joining"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">DOR (Date of Retirement) निवृत्तीची तारीख</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="dor" name="dor" value="${dor}" placeholder="Enter Date of Retirement"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Mobile No</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="mobile" name="mobile" value="${mobile}" placeholder="Enter Mobile Number"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Email Id</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="email" name="email" value="${email}" placeholder="Enter Email Id"  required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Address (पत्ता)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="address" name="address" value="${address}" placeholder="Enter Address"  required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Shares (भाग)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="shares" name="shares" value="${shares}" placeholder="Enter Shares"  required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit (मासिक ठेव )</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="monthlydeposit" name="monthlydeposit" value="${monthlydeposit}" placeholder="Enter Monthly Deposit"  required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Insurance (सभासद कल्याण निधी)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="insurance" name="insurance" value="${insurance}" placeholder="Enter Insurance"  required="required" readonly>
                                    </div>
                                </div>
                               
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Bank Account Number (बँक खाते क्रमांक)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="number" id="bankaccount" name="bankaccount" value="${bankaccount}" placeholder="Enter Bank Account Number"  required="required" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Bank Name (बँकेचे नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="bankname" name="bankname" value="${bankname}" placeholder="Enter Bank Name"  required="required" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Branch Code (शाखा कोड)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="branchcode" name="branchcode" value="${branchcode}" placeholder="Enter IFSC Code"  required="required" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Branch Name (शाखा नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="branchname" name="branchname" value="${branchname}" placeholder="Enter Branch Name" required="required" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee's Name (नामनिर्देशित व्यक्तीचे नाव)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nominee" name="nominee" value="${nominee}" placeholder="Enter Nominee's Name" required="required">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Nominee's Relation (नामनिर्देशित व्यक्तीचे नाते)</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="nomineerelation" name="nomineerelation" value="${nomineerelation}" placeholder="Enter Nominee's Relation" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Registration Fee</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" id="reg_fee" name="reg_fee" value="${reg_fee}" placeholder="Enter Registration Fee" required="required" readonly>
                                    </div>
                                </div>
                                
                                <button type="button" class="btn btn-primary " onclick="return profile_update();">Update Profile</button>

                            </form>


                        </div>
                    </div>

					<!-- 
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i>User Profile</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

								<div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="full_name" name="fname" placeholder="Enter Full Name" value="${name}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col">
                                        <input class="form-control" type="number" id="acc_no" name="acnumber" placeholder="Enter Account Number" value="${Account_Number}" required="required">
                                    </div>                                   
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Member Registration Date</label>
                                    <div class="col">
                                        <input class="form-control" type="date" id="mreg_date" name="fdamount" placeholder="Enter Member Registration Date" value="${mreg_date}" required="required">
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Department</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="department" name="fddate" placeholder="Enter Department" value="${department}" required="required">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Designation</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="designation" name="fdamount" placeholder="Enter Designation" value="${designation}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Date of Birth</label>
                                    <div class="col">
                                        <input class="form-control" type="date" id="dob" name="fdamount" placeholder="Enter Date of Birth"  value="${dob}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Date of Joining</label>
                                    <div class="col">
                                        <input class="form-control" type="date" id="doj" name="fdamount" placeholder="Enter Date of Joining" value="${doj}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Date of Relieving</label>
                                    <div class="col-8">
                                        <input class="form-control" type="date" id="do_reg" name="fdamount" placeholder="Enter Date of Relieving" value="${do_reg}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Mobile No.</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="mobile_no" name="fdamount" placeholder="Enter Mobile No." value="${mobile_no}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Emergency Contact No.</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="econtact_no" name="fdamount" placeholder="Enter Emergency Contact No." value="${econtact_no}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Email Id</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="email_id" name="fdamount" placeholder="Enter Email Id" value="${email_id}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Address</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="address" name="fdamount" placeholder="Enter Address" value="${address}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Bank Account No.</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="bank_acc_no" name="fdamount" placeholder="Enter Bank Account No." value="${bank_acc_no}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Bank Name</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="bank_name" name="bank_name" placeholder="Enter Bank Name" value="${bank_name}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Branch Name</label>
                                    <div class="col">
                                        <input class="form-control" type="text" id="branch_name" name="branch_name" placeholder="Enter Branch Name" value="${branch_name}" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Upload Photo</label>
                                    <div class="col">
                                        <input class="form-control" type="file" id="photo" name="photo" placeholder="Upload Your Photo" accept="image/*" required="required">
                                    </div>
                                </div>
								
		                        <div class="form-group row">
		                           <label for="example-text-input" class="col-4 col-form-label"></label> 
		                           <c:set var="Account_Number" value="${Account_Number}" />
		                           <c:if test="${empty Account_Number}">
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return profile_save();">Submit</button>
		                            </div>
		                            </c:if>
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return profile_update();">Update</button>
		                            </div>
		                            
		                        </div>

                                
                            </form>


                        </div>
                    </div>
                    -->
                    

                </div>  

            </div>


<script src="../UserUI/js/jquery-3.4.1.min.js"></script>

<script>
//url : "./save_user_profile",
 function profile_save() {
	 	var acc_no = document.getElementById("acc_no").value;
	 	var full_name = document.getElementById("full_name").value;	 	
	 	var mreg_date = document.getElementById("mreg_date").value;
	 	var department = document.getElementById("department").value;
	 	var designation = document.getElementById("designation").value;
	 	var dob = document.getElementById("dob").value;
	 	var doj = document.getElementById("doj").value;
	 	var do_reg = document.getElementById("do_reg").value;
	 	var mobile_no = document.getElementById("mobile_no").value;
	 	var econtact_no = document.getElementById("econtact_no").value;
	 	var email_id = document.getElementById("email_id").value;
	 	var address = document.getElementById("address").value;
	 	var bank_acc_no = document.getElementById("bank_acc_no").value;
	 	var bank_name = document.getElementById("bank_name").value;
	 	var branch_name = document.getElementById("branch_name").value;
	 	
	 	
	 	 var formData = new FormData();
		    formData.append('AccountNumber', acc_no);
		    formData.append('FullName', full_name);
		    formData.append('mreg_date', mreg_date);
		    formData.append('department', department);
		    formData.append('designation', designation);
		    formData.append('dob', dob);
		    formData.append('doj', doj);
		    formData.append('do_reg', do_reg);
		    formData.append('mobile_no', mobile_no);
		    formData.append('econtact_no', econtact_no);
		    formData.append('email_id', email_id);
		    formData.append('address', address);
		    formData.append('bank_acc_no', bank_acc_no);
		    formData.append('bank_name', bank_name);
		    formData.append('branch_name', branch_name);
		   // formData.append('photo', photo);
		    
	 	$.ajax({
	 		type : "POST",
			url : "./save_user_profile",
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
	 			window.location.href = './user_profile';
	 			alert("Profile Saved Successfully");
	 			} else {
	 				alert("Profile Saved failed");	 				
	 			} 

	 		}
	 	});
        	
        }
 
 function profile_update() {
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
		   
 	$.ajax({
 		type : "POST",
		url : "./update_user_profile",
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
 			window.location.href = './user_profile';
 			alert("Profile Updated Successfully");
 			} else {
 				alert("Profile Updated failed");
 				
 			} 

 		}
 	});
 	
 }

</script>
        </body>

    </html>
