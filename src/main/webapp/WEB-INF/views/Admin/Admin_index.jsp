
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

        <style>
        .div-1 {
        background-color: #EBEBEB;
    }
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


                    <div class="row">

						<div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-info o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                     
                                    </div>
                                    <div class="mr-5">Total Share Deposit : ${total_share} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="New_Share">
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
                                    <div class="mr-5">Total Monthly Deposit : ${total_md} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Monthly_Deposit">
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
                                    <div class="mr-5">Total Insurance : ${total_insurance} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="add_insurance">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>               
                                          
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white  bg-success o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">Total FD : ${total_fd}</div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Add_FD">
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
                                    <div class="mr-5">Total RD : ${total_rd}  </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Add_RD">
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
                                    <div class="mr-5">Total Regular Loan : ${total_regular_loan} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="New_Loan">
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
                                    <div class="mr-5">Total Remaining Regular Loan : ${total_remaining_regular_loan} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="New_Loan">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-info o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">Total Emergency Loan : ${total_emergency_loan} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Emergency_Loan">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                                             
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-info o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                       
                                    </div>
                                    <div class="mr-5">Total Emergency Debt outstanding : ${total_remaining_emergency_loan} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Emergency_Loan">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-sm-6 mb-3">                         
                            <div  class="card text-white bg-secondary  o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                      
                                    </div>
                                    <div class="mr-5">Total Account : ${amc} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Add_Member">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                                                
                       <div class="col-xl-4 col-sm-6 mb-3">
                            <div  class="card text-white bg-success o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                     
                                    </div>
                                    <div class="mr-5">Total Closed Account : ${total_closed_account} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Dead_Member">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div  class="card text-white bg-success o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                     
                                    </div>
                                    <div class="mr-5">Total Canceled Account : ${total_canceled_account} </div>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="Cancel_Member">
                                    <span class="float-left">View Details</span>
                                    <span class="float-right">
                                        <i class="fa fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>                                                 
                        
                    </div>                                             
                   
                </div>
                <!-- /.container-fluid-->

            </div>

        </body>

    </html>
