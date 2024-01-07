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
        <title>E-Patsanstha</title>
        <!-- Bootstrap core CSS-->
        <link href="/AdminUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="/AdminUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
        <link href="/AdminUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        
        <link href="/AdminUI/css/sb-admin.css" rel="stylesheet">
        <script src="/AdminUI/js/jquery.js"></script> 
        
        <style>
            .sidebar {
                overflow-y: scroll;
            }
        </style>
        
        <script>           
		$(document).ready(function() {
		    $('#dataTable').dataTable( {
		        "bStateSave": true,
		        "fnStateSave": function (oSettings, oData) {
		            localStorage.setItem( 'DataTables', JSON.stringify(oData) );
		        },
		        "fnStateLoad": function (oSettings) {
		            return JSON.parse( localStorage.getItem('DataTables') );
		        }
		    } );
		} );
		</script>
        
    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-white fixed-top" id="mainNav">
            <a class="navbar-brand" href="Admin_index"><img src="/logo/pat.jpeg" width="40" height="40" class="d-inline-block align-top" alt=""></a><h6 class="text-justify text-black">स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था  मर्यादित, विष्णुपुरी, नांदेड  </h6> 
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                <i class="fa fa-navicon" style="color:#000; font-size:28px;"></i>
                </span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav sidebar" id="exampleAccordion">

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Account" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Account (खाते)</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="Account">
                    
                            <li>
                                <a href="add_account_head">Add Account Head</a>
                            </li>
                            <li>
                                <a href="add_third_party">Third Party Form</a>
                            </li>                            
                            <li>
                                <a href="Add_Member">Add Member</a>
                            </li>
                            <li>
                                <a href="Pat_Profile">Patsanstha Profile</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Loan" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Loan</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="Loan">
                            <li>
                                <a href="New_Loan">New Loan</a>
                            </li>
                            <li>
                                <a href="LoanAmountC">Loan Amount Credit</a>
                            </li>
                            <li>
                                <a href="Close_Loan">Close Loan</a>
                            </li>
                            <li>
                                <a href="Emergency_Loan">Emergency Loan</a>
                            </li>
                            <li>
                                <a href="emergency_loan_credit">Emergency Loan Credit</a>
                            </li>
                            <li>
                                <a href="emergency_loan_close">Emergency Loan Close</a>
                            </li>
                            <li>
                                <a href="monthly_emi_change">Monthly EMI Change</a>
                            </li>

                        </ul>
                    </li>


                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#FD" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>

                            <span class="nav-link-text">FD (मुदत ठेव)</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="FD">
                            <li>
                                <a href="Add_FD">Add FD (मुदत ठेव जोडा)</a>
                            </li>           
                            <li>
                                <a href="Close_FD">Close FD (मुदत ठेव बंद करा)</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#RD" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">RD (आवर्ती ठेव)</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="RD">
                            <li>
                                <a href="Add_RD">Add RD (आवर्ती ठेव जोडा)</a>
                            </li>           
                            <li>
                                <a href="Close_RD">Close RD (आवर्ती ठेव बंद करा)</a>
                            </li>
                            <li>
                                <a href="Close_RD_data">Close RD Details</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="New_Share">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">New Share (नवीन शेअर)</span>
                        </a>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="add_insurance">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Insurance (स. क. नि. जमा)</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="Monthly_Deposit">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Monthly Deposit</span>
                        </a>
                    </li>
                    
                     <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#SM" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Cancel Membership</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="SM">
                            <li>
                                <a href="Dead_Member">Death Members from(मृत झालेल्या सभासदांचा गोषवारा)</a>
                            </li>           
                            <li>
                                <a href="Cancel_Member">Terminated  Members (सभासदत्व रद्द झालेल्या सभासदांचा)</a>
                            </li>
                        </ul>
                    </li>
                   
                    
                    <!--
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#TC" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Transaction Code (व्यवहार कोड)</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="TC">
                            <li>
                                <a href="TCode.jsp">Add TCode(व्यवहार कोड जोडा)</a>
                            </li>           
                            <li>
                                <a href="Show_Tcode.jsp">Show TCode (व्यवहार कोड बंद करा)</a>
                            </li>
                        </ul>
                    </li>
                    -->

 					<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#MS" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Master Setting</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="MS">
                            <li>
                                <a href="Change_Interest">Change Interest</a>
                            </li>           
							<li>
                                <a href="Dividend_Interest">Dividend Interest</a>
                            </li> 
                        </ul>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Salesman" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Report (अहवाल )</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="Salesman">                            
                            <li>
                                <a href="Share_Report">Share Report</a>
                            </li> 
                            <li>
                                <a href="Monthly_Deposite_Report">Monthly Deposit</a>
                            </li>
                            <li>
                                <a href="Insurance_Report">Insurance Report</a>
                            </li>
                            <li>
                                <a href="FD_Report">FD Report</a>
                            </li>
                            <li>
                                <a href="RD_Report">RD Report</a>
                            </li>
                            <li>
                                <a href="Loan_Report">Loan Report</a>
                            </li>
                            <li>
                                <a href="Loan_Close_Report">Loan Close Report</a>
                            </li>
                            <li>
                                <a href="Emergency_Loan_Report">Emergency Loan Report</a>
                            </li> 
                            <li>
                                <a href="Emergency_Loan_Close_Report">Emergency Loan Close Report</a>
                            </li>                    
                            <li>
                                <a href="Cancel_Member_Report">Cancel Member Report</a>
                            </li> 
                            <li>
                                <a href="Dead_Member_Report">Dead Member Report</a>
                            </li>
                        </ul>
                    </li> 
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Annual_Report" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Annual Report</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="Annual_Report">                         
                            <li>
                                <a href="Terij_patrak"> तेरीज पत्रक </a>
                            </li>
                            <li>
                                <a href="Nafatota_patrak"> नफा तोटा पत्रक </a>
                            </li>
                            <li>
                                <a href="Taleband_patrak"> ताळेबंद पत्रक </a>
                            </li>
                            <li>
                                <a href="Andaj_patrak"> अंदाज पत्रक </a>
                            </li> 
                            <li>
                                 <a href="day_report"> दैनंदिन पत्रक </a>
                            </li>  
                            <li>
                                 <a href="admin_annual_report"> Annual Report </a>
                            </li>                          
                        </ul>
                    </li>       
                    					
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Deduction" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Deduction</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="Deduction">
                            <li>
                                <a href="deduction">Deduction List Generate</a>
                            </li>           
							<li>
                                <a href="deduction_compare">Deduction List Compare</a>
                            </li> 
                            <li>
                                <a href="Monthly_Deduction_Edit">Monthly Deduction Edit</a>
                            </li> 
                        </ul>
                    </li>
                   
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="Dividend">
                          <i class="fa fa-fw fa-table"></i>
                          <span class="nav-link-text">Dividend</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="Notification">
                          <i class="fa fa-fw fa-table"></i>
                          <span class="nav-link-text">Notification</span>
                        </a>
                    </li>                  
                </ul>

                <ul class="navbar-nav sidenav-toggler" style="color:black;">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i style="color:black;" class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto"  style="color:black;">
                	<!-- 
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i style="color:black;" class="fa fa-fw fa-envelope"></i>
                          <span class="d-lg-none">Messages
                                <span class="badge badge-pill badge-primary">12 New</span>
                            </span>
                            <span class="indicator text-primary d-none d-lg-block">
                                <i class="fa fa-fw fa-circle"></i>
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">New Messages:</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>David Miller</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>Jane Smith</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>John Doe</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item small" href="#">View all messages</a>
                        </div>
                    </li>
                    -->
                    <li class="nav-item dropdown" style = "margin-right: 150px;">
                        <a class="nav-link dropdown-toggle mr-lg-8" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i style="color:black;"class="fa fa-fw fa-bell"></i>
                            <span class="d-lg-none">Alerts
                                <span class="badge badge-pill badge-warning">New</span>
                            </span>
                            <span class="indicator text-warning d-none d-lg-block">
                                <i class="fa fa-fw fa-circle"></i>
                            </span>
                        </a>
                          
                         <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">New Alerts:</h6>
                            <c:forEach var="obj" items="${AddMemberInfo}" varStatus="theCount">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-success">
                                    <strong><i class="fa fa-long-arrow-up fa-fw"></i>Birthday</strong>
                                </span>
                                <!-- <span class="small float-right text-muted">${obj.dob}</span> -->                             
                                <div class="dropdown-message small">${obj.fullname} &nbsp;&nbsp;&nbsp; ${obj.dob}</div>
                                <div class="dropdown-message small">${obj.mobile}</div>
                            </a>
                            </c:forEach>
                            
                            <c:forEach var="obj" items="${am_retd}" varStatus="theCount">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-danger">
                                    <strong><i class="fa fa-long-arrow-up fa-fw"></i>Retirement</strong>
                                </span>
                                <!-- <span class="small float-right text-muted">${obj.dob}</span> -->                             
                                <div class="dropdown-message small">${obj.fullname} &nbsp;&nbsp;&nbsp; ${obj.dor}</div>
                                <div class="dropdown-message small">${obj.mobile}</div>
                            </a>
                            </c:forEach>
                            
                          <!--  
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-danger">
                                    <strong>
                                        <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
                                </span>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-success">
                                    <strong>
                                        <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
                                </span>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item small" href="#">View all alerts</a>
                            -->
                        </div>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" style="color:black;" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out "></i>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>


        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                    <small>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All Rights Reserved | Design by <a href="https://codeft.co.in/" target="_blank">Codeft Technologies PVT LTD</a></small>
                </div>
            </div>
        </footer>
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">X</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login">Logout</a>
                    </div>
                </div>
            </div>
        </div>
         
        <script src="/AdminUI/vendor/jquery/jquery.min.js"></script>
        <script src="/AdminUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        
        <script src="/AdminUI/vendor/jquery-easing/jquery.easing.min.js"></script>
        
        <script src="/AdminUI/vendor/chart.js/Chart.min.js"></script>
        <script src="/AdminUI/vendor/datatables/jquery.dataTables.js"></script>
        <script src="/AdminUI/vendor/datatables/dataTables.bootstrap4.js"></script>
         
        <script src="/AdminUI/js/sb-admin.min.js"></script>
        
        <script src="/AdminUI/js/sb-admin-datatables.min.js"></script>
        <script src="/AdminUI/js/sb-admin-charts.min.js"></script>
        
        <script>
                        $('#toggleNavPosition').click(function () {
                            $('body').toggleClass('fixed-nav');
                            $('nav').toggleClass('fixed-top static-top');
                        });

        </script>
        <!-- Toggle between dark and light navbar-->
        <script>
            $('#toggleNavColor').click(function () {
                $('nav').toggleClass('navbar-dark navbar-light');
                $('nav').toggleClass('bg-dark bg-light');
                $('body').toggleClass('bg-dark bg-light');
            });

        </script>

    </body>

</html>
