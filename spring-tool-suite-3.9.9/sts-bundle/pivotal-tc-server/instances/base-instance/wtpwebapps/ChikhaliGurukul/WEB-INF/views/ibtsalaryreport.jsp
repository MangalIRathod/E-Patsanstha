
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=0.75, maximum-scale=0.75, minimum-scale=0.75">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Auditor - IBT Salary Report</title>
        <!-- Bootstrap core CSS-->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
        <script src="js/jquery.js"></script>

    </head>

    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <%
String uname = (String) session.getAttribute("uname");
if(uname == null){
	response.sendRedirect("login.jsp");
}else{
}
%>
        <!-- Navigation-->
        <jsp:include page="navbar1.jsp" />

        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active">My Dashboard</li> 
                </ol>
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i>&nbsp;&nbsp;IBT SALARY REPORT</div> 
                </div> 
                <div class="card-body" align="center">

                    <form  action="ibtsalaryreportdb.jsp" method="post">
                       
                        <div class="form-group row">
                            <label for="example-text-input" class="col-4 col-form-label">Select Month and Year</label>
                            <div class="col-8">
                                <input class="form-control" type="month" id="txt1" value="" name="monthyear" placeholder="Enter Month and Year"  required="required">
                            </div>
                        </div>

                        <input class="btn btn-primary col-2" type="submit" name="all" value="Submit"/>

                    </form>

                </div>
            </div>

        </div>
    </div>
    <!-- /.container-fluid-->

</div>
</body>

</html>
