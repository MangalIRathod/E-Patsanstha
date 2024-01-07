
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=0.75, maximum-scale=0.75, minimum-scale=0.75">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Admin - Add IBT Mandhan</title>
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
    <jsp:include page="navbar.jsp" />
 
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
           <i class="fa fa-table"></i>&nbsp;&nbsp; ADD IBT MANDHAN STAFF</div> 
          </div> 
        <div class="card-body" align="center">
      
                    <form  action="ibtdb" method="post">
                   
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Sr. No.</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt2" name="srno" placeholder="Enter Sr. No."  required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Name</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt3" name="proname" placeholder="Enter Name"  required="required">
                    </div>
                    </div>
                      
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Department</label>
                    <div class="col-8">
                    <select id="category" id="txt4" name="dept" class="form-control">
			<option value="Agriculture and Animal Husbandry" selected="selected">Agriculture and Animal Husbandry</option>
			<option value="Home and Health">Home and Health</option>
                        <option value="Energy Environment">Energy Environment</option>
                    </select>
                     </div>
                    </div>   
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Salary</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt7" name="salary" placeholder="Enter Salary" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Net Salary</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt8" name="netsal" placeholder="Enter Net Salary" required="required">
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
