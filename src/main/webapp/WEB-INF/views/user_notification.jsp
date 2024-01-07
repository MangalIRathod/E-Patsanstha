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
        <title>E-Patsanstha - Notification</title>
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
            .table-bordered td, .table-bordered th {
                border: 1px solid #dee2e6; 
                border-right: 5px solid red;
                border-left: 5px solid red;
                border: 1px;
            }
        </style>

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
                   
                    <div class="row" id="load_tweets">

                    </div>
                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> VIEW NOTIFICATION
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0" >          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Title</th>	
                                    <th scope="col">Date</th>	
                                    <th scope="col">Description</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${ntf}" varStatus="theCount">
                                <tr>
                                    <td>${theCount.index+1}</td>	
                                    <td>${obj.title}</td>	
                                    <td>${obj.cdate}</td>
                                    <td>${obj.description}</td>	                                    
                                </tr>
                            </c:forEach>     
                            </tbody>
                        </table> 

                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

            
        </body>

    </html>
