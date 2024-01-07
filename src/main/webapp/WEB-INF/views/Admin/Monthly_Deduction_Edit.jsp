
<!DOCTYPE html>
<html lang="en">

<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>E-Patsanstha - Monthly Deduction Edit</title>
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
					<i class="fa fa-table"></i> Monthly Deduction Update
				</div>
				<div class="card-body" align="center">

					<form action="#" autocomplete="on" method="post"
						enctype="multipart/form-data">

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Account
								Number (खाते क्रमांक)</label>
							<div class="col-4">
								<input class="form-control" type="number" id="accountnumber"
									name="accountnumber" placeholder="Enter Account Number"
									required="required">

							</div>
							<div class="col-4">
								<button type="button" class="btn btn-primary "
									onclick="return search_monthly_emi_change();">Search</button>
							</div>
						</div>


						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Full
								Name (पूर्ण नाव)</label>
							<div class="col-8">
								<input class="form-control" type="text" id="fullname"
									name="fullname" placeholder="Enter Full Name"
									required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label"></label>
							<label for="example-text-input" class="col-4 col-form-label">Current
								Status (Deduction)</label> <label for="example-text-input"
								class="col-4 col-form-label">Update Amount (Deduction)</label>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Shares</label>
							<div class="col-4">
								<input class="form-control" type="number" id="shares"
									name="shares" placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number" id="shares1"
									name="shares1" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Monthly
								Deposit</label>
							<div class="col-4">
								<input class="form-control" type="number" id="monthlydeposit"
									name="monthlydeposit" placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number" id="monthlydeposit1"
									name="monthlydeposit1" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Insurance</label>
							<div class="col-4">
								<input class="form-control" type="number" id="insurance"
									name="insurance" placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number" id="insurance1"
									name="insurance1" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Regular
								Loan</label>
							<div class="col-4">
								<input class="form-control" type="number" id="regularloan"
									name="regularloan" placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number" id="regularloan1"
									name="regularloan1" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Regular
								Loan Interest</label>
							<div class="col-4">
								<input class="form-control" type="number"
									id="regularloaninterest" name="regularloaninterest"
									placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number"
									id="regularloaninterest1" name="regularloaninterest1"
									placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Emergency
								Loan</label>
							<div class="col-4">
								<input class="form-control" type="number" id="emergencyloan"
									name="emergencyloan" placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number" id="emergencyloan1"
									name="emergencyloan1" placeholder="" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Emergency
								Loan Interest</label>
							<div class="col-4">
								<input class="form-control" type="number"
									id="emergencyloaninterest" name="emergencyloaninterest"
									placeholder="" required="required">
							</div>
							<div class="col-4">
								<input class="form-control" type="number"
									id="emergencyloaninterest1" name="emergencyloaninterest1"
									placeholder="" required="required">
							</div>
						</div>

						<!--  
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">RD</label>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id = "rd" name="rd" placeholder=""  required="required">
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control" type="number" id="rd1" name="rd1" placeholder=""  required="required">
                                    </div>
                                </div>
                                -->
						<div class="form-group row">
							<label for="example-text-input" class="col-4 col-form-label">Date</label>
							<div class="col-8">
								<input class="form-control" type="date" id="date1" name="date1"
									placeholder="" required="required">
							</div>
						</div>

						<!--  	
		                        <div class="form-group row">
		                           <label for="example-text-input" class="col-4 col-form-label"></label> 
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return monthly_emi_change_save();">Change</button>
		                            </div>
		                            <div class="col-4">
		                                <button type="button" class="btn btn-primary btn-block" onclick="return monthly_emi_update_save();">Edit</button>
		                            </div>	                         
		                        </div>
		                     -->
						<button type="button" class="btn btn-primary "
							onclick="return monthly_emi_update_save();">Update</button>

					</form>

				</div>
			</div>

		</div>


	</div>

	<script>
		function monthly_emi_update_save() {
			var accountnumber = document.getElementById("accountnumber").value;
			var fullname = document.getElementById("fullname").value;
			var shares = document.getElementById("shares1").value;
			var monthlydeposit = document.getElementById("monthlydeposit1").value;
			var insurance = document.getElementById("insurance1").value;
			var regularloan = document.getElementById("regularloan1").value;
			var regularloaninterest = document
					.getElementById("regularloaninterest1").value;
			var emergencyloan = document.getElementById("emergencyloan1").value;
			var emergencyloaninterest = document
					.getElementById("emergencyloaninterest1").value;
			//var rd = document.getElementById("rd1").value;
			var date1 = document.getElementById("date1").value;

			if (accountnumber == "") {
				alert("Account Number required")
				return false;
			}
			if (shares == "") {
				alert("Share required")
				return false;
			}
			if (monthlydeposit == "") {
				alert("Monthly Deposit required")
				return false;
			}
			if (insurance == "") {
				alert("Insurance required")
				return false;
			}
			if (regularloan == "") {
				alert("Regular Loan required")
				return false;
			}
			if (emergencyloan == "") {
				alert("Emergency Loan required")
				return false;
			}

			var formData = new FormData();
			formData.append('accountnumber', accountnumber);
			formData.append('fullname', fullname);
			formData.append('shares', shares);
			formData.append('monthlydeposit', monthlydeposit);
			formData.append('insurance', insurance);
			formData.append('regularloan', regularloan);
			formData.append('regularloaninterest', regularloaninterest);
			formData.append('emergencyloan', emergencyloan);
			formData.append('emergencyloaninterest', emergencyloaninterest);
			//formData.append('rd', rd);
			formData.append('date1', date1);

			$.ajax({
				type : "POST",
				url : "./monthly_deduction_edit",
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
						window.location.href = './Monthly_Deduction_Edit';
						alert("Monthly Deduction Updated Successfully");
					} else {
						alert("Monthly Deduction Updated failed");

					}

				}
			});

		}

		function search_monthly_emi_change() {
			var accountnumber = document.getElementById("accountnumber").value;

			if (accountnumber == "") {
				alert("Account Number required")
				return false;
			}

			var formData = new FormData();
			formData.append('accountnumber', accountnumber);

			$
					.ajax({
						type : "POST",
						url : "./search_monthly_emi_change",
						enctype : 'multipart/form-data',
						data : formData,
						processData : false, //prevent jQuery from automatically transforming the data into a query string
						contentType : false,
						cache : false,
						timeout : 600000,

						success : function(data) {

							var result = data.split(":");

							document.getElementById('fullname').value = result[0];
							document.getElementById('shares').value = Math.round(result[1]);
							document.getElementById('monthlydeposit').value = Math.round(result[2]);
							document.getElementById('insurance').value = Math.round(result[3]);
							var regularloan = Math.round(result[4]);
							document.getElementById('regularloan').value = regularloan;
							var regularloaninterest = Math.round(result[5])	;								
							document.getElementById('regularloaninterest').value = regularloaninterest;
							var emergencyloan = Math.round(result[6]);
							document.getElementById('emergencyloan').value = emergencyloan;
							var emergencyloaninterest = Math.round(result[7]);									
							document.getElementById('emergencyloaninterest').value = emergencyloaninterest;
							//var rd = Number(result[6]).toFixed(2);
							//document.getElementById('rd').value = rd;
							//document.getElementById('date1').value = result[7];

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
