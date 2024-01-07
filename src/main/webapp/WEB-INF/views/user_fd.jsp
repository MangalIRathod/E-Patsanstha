<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha - FD</title>
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


					<!-- 
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> ADD FD(FIXED DEPOSIT)</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col">
                                        <input class="form-control" type="number" name="acnumber" value="${Account_Number}"  required="required">
                                    </div>                                   
                                </div>
                                
                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">FD Certificate Number (FD प्रमाणपत्र क्रमांक)</label>
                                    <div class="col">
                                        <input class="form-control" type="number" name="fdnumber" value="${CertificateNumber}" placeholder="FD Certificate Number" required="required">
                                    </div>                            
                                </div>

                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col">
                                        <input class="form-control" type="text" name="fname" value="${FullName}" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                               <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">FD Amount (FD रक्कम)</label>
                                    <div class="col">
                                        <input class="form-control" type="number" name="fdamount" value="${FDAmount}" placeholder="Enter FD Amount (in Rs.)" required="required">
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <label for="example-text-input" class="col-form-label">FD Date (FD तारीख )</label>
                                    <div class="col">
                                        <input class="form-control" type="text" name="fddate" value="${FDDate}" placeholder="Enter Date of FD." required="required">
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Total Amount (Including Interest Amount)</label>
                                    <div class="col">
                                        <input class="form-control" type="text" name="mdate" value="${TotalAmount}" placeholder="Enter Total Amount" required="required">
                                    </div>
                                </div>
                            
                            </form>


                        </div>
                    </div>
					-->




                    <!-- Example DataTables Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> FIXED DEPOSIT</div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account Number</th>	
                                    <th scope="col">FD Certificate Number</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">FD Amount</th>
                                    <th scope="col">FD Date</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">Interest Amount</th>
                                    <th scope="col">Maturity Date</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
 <tbody>
                        <c:forEach var="obj" items="${FDList}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fdcertificatenumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.fdamount}</td>
                        		<td>${obj.fddate}</td>
                        		<td>${obj.totalamount}</td>
                        		<td>${obj.roi}</td>
                        		<td>${obj.maturingdate}</td>
                        		<td>${obj.status}</td>
                           
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>
                </div>  

            </div>

        </div>
        <!-- /.container-fluid-->

    </body>

</html>
