
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
        <link href="../UserUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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


                    <div class="row">

						<div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-info o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">Total Share Amount(सभासद भाग) : ${TotalAmountOfSahre}</div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_share">
                                    <span class="float-left">View Details</span> 
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                         <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-primary o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                      
                                    </div>
                                    <div class="mr-5">Total Monthly Balance (सभासद कायम ठेव) : ${MDeposit}</div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_monthly_deposit">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                        
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-secondary o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                    
                                    </div>
                                    <div class="mr-5">Insurance(सभासद कल्याण निधी) : ${TotalInsuranceAmount}</div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_insurance">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-success o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                      
                                    </div>
                                    <div class="mr-5"> FD Amount(कायम मुदत ठेव) : ${FD} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_fd">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-danger o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">RD Amount(सभासद बचत  ठेव) : ${RD}</div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_rd">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>


					

                    

                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-warning o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                        
                                    </div>
                                    <div class="mr-5">Regular Loan Balance Amount(नियमित कर्ज) : ${LoanAmount}</div>                                   
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_regular_loan">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

                    
                    
                    <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-primary o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">Emergency Loan Balance Amount(आकस्मिक कर्ज) : ${TotalAmountEmergencyLoan}</div>                                   
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="user_emergency_loan">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>

					<!-- 
                     <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-success o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                     
                                    </div>
                                    <div class="mr-5">Dividend (बोनस)    :  </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="#">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                       -->
                        
                        
                        
						</div>

                    </div>   

                </div>
                
            </div>

        </body>

    </html>
