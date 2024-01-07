<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha - RD</title>
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
                            <i class="fa fa-table"></i>Trans RD</div>
                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account Number</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">RD Amount</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Total Amount</th>                                                                     
                                </tr>
                            </thead>
						<tbody>
                        <c:forEach var="obj" items="${RDList}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rdamount}" /></td> 
                        		<td>${obj.rddate}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totalamount}" /></td>                      		                       		
                          </tr>
                          </c:forEach>
                        </tbody>
                        </table> 
                    </div>
					
					<div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i>New RD</div>
                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account Number</th>	
                                    <th scope="col">Full Name</th>
                                    <th scope="col">RD Amount</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Total Amount</th> 
                                    <th scope="col">Status</th>                                                                      
                                </tr>
                            </thead>
						<tbody>
                        <c:forEach var="obj" items="${NewRD}" varStatus="theCount">
                          <tr>
                            <td>${theCount.index+1}</td>
                        		<td>${obj.accno}</td>
                        		<td>${obj.name}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rdamt}" /></td>                       			
                        		<td>${obj.startdate}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totamt}" /></td>
                        		<td>${obj.status}</td>                      		                       		
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
