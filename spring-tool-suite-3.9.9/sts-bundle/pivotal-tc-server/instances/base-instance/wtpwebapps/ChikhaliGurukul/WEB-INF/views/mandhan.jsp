
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=0.75, maximum-scale=0.75, minimum-scale=0.75">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Admin - Add Mandhan</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
   <script src="js/jquery.js"></script>
  
<script type="text/javascript">
function sum() {
            var txt5 = document.getElementById('txt5').value;          
            var txt6= document.getElementById('txt6').value;
            var txt7 = document.getElementById('txt7').value; 
            
            var result = parseFloat(txt6) + parseFloat(txt7);
            var result1 = parseFloat(txt5) - parseFloat(result);
            if (!isNaN(result1)) {
                document.getElementById('txt8').value = result1;
            }
        }
        
   </script>     
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
           <i class="fa fa-table"></i>&nbsp;&nbsp; ADD MANDHAN STAFF</div> 
          </div> 
        <div class="card-body" align="center">
      
                    <form  action="mandhandb" method="post">
                                          
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
                    <label for="example-text-input" class="col-4 col-form-label">Post</label>
                    <div class="col-8">
                    <select id="category" id="txt4" name="post" class="form-control">
			<option value="Co-Teacher" selected="selected">Co-Teacher</option>
			<option value="IBT">IBT</option>
                    </select>
                     </div>
                    </div>   
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Honorarium</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt5" onkeyup="sum();" name="hon" placeholder="Enter Honorarium" required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Business Tax</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt6" onkeyup="sum();" name="bt" placeholder="Enter Business Tax" required="required">
                    </div>
                    </div>     
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Advance</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt7" onkeyup="sum();" name="adv" placeholder="Enter Advance" required="required">
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
