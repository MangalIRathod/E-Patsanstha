<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>E-Patsanstha</title>
<!-- Bootstrap core CSS-->
<link href="/AdminUI/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="/AdminUI/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="/AdminUI/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="/AdminUI/css/sb-admin.css" rel="stylesheet">
<script src="/AdminUI/js/jquery.js"></script>
<!-- send id to fullorder.php-->

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<%@ include file="navbar.jsp"%>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">My Dashboard</li>
			</ol>
			<!-- Icon Cards-->



			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Patsanstha Profile (पतसंस्था माहिती)
				</div>
				<div class="card-body" align="center">

					<form action="#" autocomplete="on" method="post"
						enctype="multipart/form-data">

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Patsanstha
								Name (पूर्ण नाव)</label>
							<div class="col-8">
								<input class="form-control" type="text" id="patname" name="patname" placeholder="Enter Name" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Registration
								No.</label>
							<div class="col-8">
								<input class="form-control" type="text" id="rno" name="rno"	placeholder="Enter Registration Number" required="required">
							</div>

						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Patsanstha
								Address (पत्ता)</label>
							<div class="col-8">
								<input class="form-control" type="text" id="address" name="address" placeholder="Enter Address" required="required">
							</div>
						</div>


						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">City
							</label>
							<div class="col-8">
								<input class="form-control" type="text" id="city" name="city" placeholder="Enter City Name" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">State</label>
							<div class="col-8">
								<input class="form-control" type="text" id="state" name="state"	placeholder="Enter State" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Pincode</label>
							<div class="col-8">
								<input class="form-control" type="number" id="pincode" name="pincode" placeholder="Enter Pincode" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Year
								of Establishment </label>
							<div class="col-8">
								<input class="form-control" type="date" id="yoe" name="yoe"	placeholder="Enter Year of Establishment" required="required">
							</div>
						</div>


						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Contact
								Details</label>
							<div class="col-8">
								<input class="form-control" type="number" id="mobile" name="mobile" placeholder="Enter Mobile Number"
									required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Email
								Id</label>
							<div class="col-8">
								<input class="form-control" type="text" id="email" name="email" placeholder="Enter Email Id" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">GST
								Number</label>
							<div class="col-8">
								<input class="form-control" type="text" id="gst" name="gst"	placeholder="Enter GST Number" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Pan Number</label>
							<div class="col-8">
								<input class="form-control" type="text" id="pannumber" name="pannumber" placeholder="Enter Pan Number"
									required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Website</label>
							<div class="col-8">
								<input class="form-control" type="text" id="website"
									name="website" placeholder="Enter Website URL"
									required="required">
							</div>
						</div>

						<!-- 
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Select Image</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo" name="photo" multiple>
                                    </div>
                                </div>
                                 -->

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label"></label>


							<div class="col-4">
								<button type="button" class="btn btn-primary btn-block"
									onclick="return profile_save();">Submit</button>
							</div>
							<!--   
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return profile_update();">Edit</button>
		                            </div>
		                            -->

						</div>

					</form>


				</div>
			</div>





			<!-- Example DataTables Card-->
			<!-- 
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> पतसंस्था माहिती
                        </div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	

                                    <th scope="col">पतसंस्था नाव</th>
                                    <th scope="col">पत्ता</th>
                                    <th scope="col">City</th>
                                    <th scope="col">State</th>
                                    <th scope="col">Pincode</th>
                                    <th scope="col">Contact Details</th>
                                    <th scope="col">Year of Establishment</th>
                                    <th scope="col">Contact Details</th>
                                    <th scope="col">GST Number</th>
                                    <th scope="col">Pan Number</th>
                                    <th scope="col">Website</th>
                                </tr>
                            </thead>

                        </table> 
                    </div>
                    -->
		</div>
	</div>


	<script>
		function changeDateFormat(inputDate) { // expects Y-m-d
			var splitDate = inputDate.split('-');
			if (splitDate.count == 0) {
				return null;
			}
			var year = splitDate[0];
			var month = splitDate[1];
			var day = splitDate[2];
			return day + '-' + month + '-' + year;
		}

		function profile_save() {
			var patname = document.getElementById("patname").value;
			var rno = document.getElementById("rno").value;
			var address = document.getElementById("address").value;
			var city = document.getElementById("city").value;
			var state = document.getElementById("state").value;
			var pincode = document.getElementById("pincode").value;
			var yoe = document.getElementById("yoe").value;
			var mobile = document.getElementById("mobile").value;
			var email = document.getElementById("email").value;
			var gst = document.getElementById("gst").value;
			var pannumber = document.getElementById("pannumber").value;
			var website = document.getElementById("website").value;
			//	var photo = document.getElementById("photo").value;
			
			if (patname == "") {
				alert("Patsanstha Name required")
				return false;
			}
			if (rno == "") {
				alert("Registration Number required")
				return false;
			}
			if (address == "") {
				alert("Address required")
				return false;
			}
			if (city == "") {
				alert("City required")
				return false;
			}
			if (state == "") {
				alert("State required")
				return false;
			}
			if (pincode == "") {
				alert("Pincode required")
				return false;
			}
			if (yoe == "") {
				alert("Established Year required")
				return false;
			}
			if (mobile == "") {
				alert("Mobile Number required")
				return false;
			}
			if (email == "") {
				alert("Email Id required")
				return false;
			}

			var formData = new FormData();
			formData.append('patname', patname);
			formData.append('rno', rno);
			formData.append('address', address);
			formData.append('city', city);
			formData.append('state', state);
			formData.append('pincode', pincode);
			formData.append('yoe', yoe);
			formData.append('mobile', mobile);
			formData.append('email', email);
			formData.append('gst', gst);
			formData.append('pannumber', pannumber);
			formData.append('website', website);
			/*    
			    var file_data = $('input[type="file"]')[0].files; // for multiple files
			    for(var i = 0;i<file_data.length;i++){
			    	formData.append("files", file_data[i]);
			    }
			 */

			$.ajax({
				type : "POST",
				url : "./save_patsanstha_profile",
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
						window.location.href = './Pat_Profile';
						alert("Profile Saved Successfully");
					} else {
						alert("Profile Saved failed");

					}

				}
			});

		}

		function profile_update() {
			var acc_no = document.getElementById("acc_no").value;
			var full_name = document.getElementById("full_name").value;
			var mreg_date = document.getElementById("mreg_date").value;
			//var mreg_date = changeDateFormat(inputDate1);
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
			//var photo = document.getElementById("photo").value;
			//var photo = "vb";

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

			/*  
			  var file_data = $('input[type="file"]')[0].files; // for multiple files
			  for(var i = 0;i<file_data.length;i++){
			  	formData.append("files", file_data[i]);
			  }
			 */

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
