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



                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i> Dividend</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">

                                <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Account Number (खाते क्रमांक)</label>
                                    <div class="col">
                                        <input class="form-control" type="number" name="acnumber" value="${Account_Number}"  required="required">
                                    </div>                                   
                                </div>
                                
                                     <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Full Name (पूर्ण नाव)</label>
                                    <div class="col">
                                        <input class="form-control" type="text" name="fname" value="${FullName}" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>
                                     <div class="form-group ">
                                    <label for="example-text-input" class=" col-form-label">Year</label>
                                    <div class="col">
                                        <input class="form-control" type="text" name="fname" value="" placeholder="Enter Full Name"  required="required">
                                    </div>
                                </div>

                               <div class="form-group ">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Share</label>
                                    <div class="col-3">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Share" required="required">
                                    </div>
                                     
                                    
                                    <div class="col-2">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Roi" required="required">
                                    
                                </div>
                                 
                                   
                                    <div class="col-3">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Dividend Share" required="required">
                                 
                                </div>
                                </div>
                                
                                
                                
                                
                                  <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Total Monthly Deposit</label>
                                    <div class="col-3">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Monthly Deposit" required="required">
                                    </div>
                                     
                                    
                                    <div class="col-2">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Roi" required="required">
                                    
                                </div>
                                 
                                   
                                    <div class="col-3">
                                        <input class="form-control" type="number" name="fdamount" value="" placeholder="Dividend Mo Deposit" required="required">
                                 
                                </div>
                                </div>
                                
                                
                                


                                
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Bonus</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" name="mdate" value="${TotalAmount}" placeholder="Enter Total Amount" required="required">
                                    </div>
                                </div>
                            <!--      <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Interest Amount</label>
                                    <div class="col-8">
                                        <input class="form-control" type="numer" name="ROI" value="${InterestAmount}" placeholder="Enter Interest Amount" required="required">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Maturity Date</label>
                                    <div class="col-8">
                                        <input class="form-control" type="text" name="m_date" value="${MaturityDate}" placeholder="Enter Maturity Date" required="required">
                                    </div>
                                </div>
-->
                                <input class="btn btn-primary " type="submit" name="all" value="Submit"/>
                            </form>


                        </div>
                    </div>





                    <!-- Example DataTables Card-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i>Dividend</div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account Number</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Dividend Share</th>
                                    <th scope="col">Dividend Monthly Deposit</th>
                                    <th scope="col">Bonus</th>
                                    
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
