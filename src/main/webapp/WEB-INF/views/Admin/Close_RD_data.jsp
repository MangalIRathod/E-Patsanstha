<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>E-Patsanstha - Close RD Data</title>
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

                    <!-- Example DataTables Card-->
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Close RD Details
                        </div>

                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>	
                                    <th scope="col">Account No.</th>	
                                    <th scope="col">Full_Name</th>
                                    <th scope="col">RD Amount</th>
                                    <th scope="col">Start_Date</th>
                                    <th scope="col">End_Date</th>
                                    <th scope="col">Total Amount</th>
                                    <th scope="col">ROI</th>
                                    <th scope="col">Cheque_No.</th>                                   
                                    <th scope="col">Receipt_No.</th> 
                                    <th scope="col">Status</th>                                    
                                </tr>
                            </thead>
                            <tbody>
                        <c:forEach var="obj" items="${close_rd_list}" varStatus="theCount">
                          <tr>
                            	<td>${obj.id}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>
                        		<td>${obj.rdamount}</td>
                        		<td>${obj.startdate}</td>
                        		<td>${obj.enddate}</td>
                        		<td>${obj.totamt}</td>
                        		<td>${obj.roi}</td>
                        		<td>${obj.chequenumber}</td>
                        		<td>${obj.receiptnumber}</td>
                        		<td>${obj.status}</td>                     		
                          </tr>
                          </c:forEach>
                        </tbody>

                        </table> 
                    </div>
                    
        </div>            
</div>
    </body>

</html>
