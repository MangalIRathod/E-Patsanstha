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
        <title>E-Patsanstha - User Panel</title>
        <!-- Bootstrap core CSS-->
        <link href="/UserUI/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="/UserUI/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="/UserUI/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="/UserUI/sb-admin.css" rel="stylesheet">
        <script src="/UserUI/js/jquery.js"></script>

        <!-- send id to fullorder.php-->
        <style>
            .sidebar {
                overflow-y: scroll;
            }
             
        </style>
    </head>
   

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
    if(session.getAttribute("AccountNumber")==null){
    response.sendRedirect(request.getContextPath() + "/user_login");
	}
	%>
        <!-- Navigation-->
       
        <nav class="navbar navbar-expand-lg navbar-dark bg-white fixed-top" id="mainNav">

            <a class="text-left text-black" href="user_index"><%= session.getAttribute("User_Name") %></a>
            <a class="nav-link text-right text-black" style="float: left; text-align:right;" class="alignright" class="alignright" data-toggle="modal" data-target="#exampleModal">
            	<i class="fa fa-fw fa-sign-out"></i>Logout
            </a>
            <h6  class="text-center text-black">स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था  मर्यादित, विष्णुपुरी, नांदेड </h6>           	  
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span style="color:black;"class="navbar-toggler-icon ">
                 <i class="fa fa-navicon" style="color:#000; font-size:28px;"></i>
                </span>
            </button>
           
  
 
            <div class="collapse navbar-collapse" id="navbarResponsive">
            
                <ul class="navbar-nav navbar-sidenav sidebar" id="exampleAccordion">                   
				<!-- 
				      <div class="nav-item">  
				              <img src="${PHOTO}" style= "border:1px solid pink; width: 80px; float: left; margin-left: 50px; position:relative; padding: 3px;" class="img-fluid">
				             <img src="" style= "border:1px solid pink; width: 80px; float: left; margin-left: 50px; position:relative; padding: 3px;" class="img-fluid">          
				      </div>
				-->
                     
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_profile">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Profile Setting</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_share">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Share</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_monthly_deposit">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Monthly Deposit</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_insurance">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Insurance</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_fd">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">FD</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_rd">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">RD</span>
                        </a>
                    </li>                                       
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_regular_loan">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Regular Loan</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_emergency_loan">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Emergency Loan</span>
                        </a>
                    </li>
                    
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_annual_report">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">User Annual Report</span>
                        </a>
                    </li>

                     <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#Graph" data-parent="#exampleAccordion">
                              <i class="fa fa-fw fa-table"></i>
                              <span class="nav-link-text">Graph</span>
                          </a>
                          <ul class="sidenav-second-level collapse" id="Graph">
                              <li>
                                  <a href="graph_share">Total Shares</a>
                              </li>                              
                              <li>
                                  <a href="graph_monthly_deposit">Monthly Deposit</a>
                              </li>          
                              <li>
                                  <a href="graph_insurance">Insurance</a>
                              </li>                              
                              <li>
                                  <a href="graph_fd">FD</a>
                              </li>
                              <li>
                                  <a href="graph_rd">RD</a>
                              </li>                                
                              <li>
                                  <a href="graph_regular_loan">Regular Loan</a>
                              </li>                               
                              <li>
                                  <a href="graph_emergency_loan">Emergency Loan</a>
                              </li>
                              <!-- 
                              <li>
                                  <a href="graph_dividend">Dividend (Bonus)</a>
                              </li>
                               -->                             
                          </ul>
                      </li>
                      
                      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a class="nav-link" href="user_notification">
                            <i class="fa fa-fw fa-table"></i>
                            <span class="nav-link-text">Notification</span>
                        </a>
                      </li>
                      
                      <!-- 
                      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
                        <a style = "color: white;" class="nav-link" style="color:black;" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>Logout
                        </a>
                      </li>
                      -->                     
                </ul>
                
                <ul class="navbar-nav sidenav-toggler"style="color:black;">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                <!--  
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i style="color:black;"class="fa fa-fw fa-envelope"></i>
                            <span class="d-lg-none">Messages
                                <span class="badge badge-pill badge-primary">12 New</span>
                            </span>
                            <span class="indicator text-primary d-none d-lg-block">
                                <i style="color:black;"class="fa fa-fw fa-circle"></i>
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
                        <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <c:forEach var="obj" items="${ntf}" varStatus="theCount">
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="user_notification">
                                <span class="text-success">
                                    <strong>
                                        <i class="fa fa-long-arrow-up fa-fw"></i>${obj.title}</strong>
                                </span>
                                <span class="small float-right text-muted">${obj.cdate}</span>
                                <div class="dropdown-message small">${obj.description}</div>
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
                       
                    </li>
                    <!--
                    <li class="nav-item">
                        <a class="nav-link" style="color:black;" data-toggle="modal" data-target="#exampleModal">
                            <i   class="fa fa-fw fa-sign-out"></i>Logout</a>
                    </li>
                    -->
                </ul>
            </div>
        </nav>


        <!-- /.container-fluid-->
        <!-- /.content-wrapper-->
        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                   <!-- <small>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All Rights Reserved | Design by <a href="https://codeft.co.in/" target="_blank">Codeft Technologies PVT LTD</a></small> -->
                    <small>Design by <a href="https://codeft.co.in/" target="_blank">Codeft Technologies PVT LTD</a></small>
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
                       <button class="btn btn-secondary" type="button" id = "logout" data-dismiss="modal" onclick="logout();">Logout</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="/UserUI/vendor/jquery/jquery.min.js"></script>
        <script src="/UserUI/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="/UserUI/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Page level plugin JavaScript-->
        <script src="/UserUI/vendor/chart.js/Chart.min.js"></script>
        <script src="/UserUI/vendor/datatables/jquery.dataTables.js"></script>
        <script src="/UserUI/vendor/datatables/dataTables.bootstrap4.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="/UserUI/js/sb-admin.min.js"></script>
        <!-- Custom scripts for this page-->
        <script src="/UserUI/js/sb-admin-datatables.min.js"></script>
        <script src="/UserUI/js/sb-admin-charts.min.js"></script>
        <script>
                        $('#toggleNavPosition').click(function () {
                            $('body').toggleClass('fixed-nav');
                            $('nav').toggleClass('fixed-top static-top');
                        });

        </script>
        <!-- Toggle between dark and light navbar-->
        <script>
        function logout() {
        	
        	
        	$.ajax({
        		type : "POST",
        		url : "./user_logout",
        		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        		
        		success : function(data) {

        			var res = data;
        			if (res == "Success") {
        			window.location.href = './user_login';
        			alert("logout Successfully");
        			} else {
        				alert("Profile Add failed");
        				
        			} 

        		}
        	});
        	
        }
        </script>

    </body>

</html>
