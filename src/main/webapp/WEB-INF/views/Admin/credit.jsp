
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
      

        
       <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Credit (देवाण घेवाण)</div>
        <div class="card-body" align="center">
      
                    <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">
            
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Full Name (पूर्ण नाव)</label>
                    <div class="col-8">
                    <input class="form-control" type="text" name="tname" placeholder="Enter Name"  required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Account Number (खाते क्रमांक)</label>
                    <div class="col-8">
                    <input class="form-control" type="number" name="acnumber" placeholder="Enter Account Number"  required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Share (भाग)</label>
                    <div class="col-8">
                    <input class="form-control" type="text" name="department" placeholder="Enter Shares"  required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Monthly Deposit (मासिक ठेव)</label>
                    <div class="col-8">
                    <input class="form-control" type="text" name="Designation" placeholder="Enter Designation"  required="required">
                    </div>
                    </div>
                    
                        <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Regular Loan (
नियमित कर्ज)</label>
                    <div class="col-8">
                    <input class="form-control" type="date" name="dob" placeholder="Enter Date of Birth"  required="required">
                    </div>
                    </div>
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Insurance (सभासद कल्यानं निधी) </label>
                    <div class="col-8">
                    <input class="form-control" type="date" name="doj" placeholder="Enter Date of Joining"  required="required">
                    </div>
                    </div>
                        <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Emergency Loan (
आपत्कालीन कर्ज)</label>
                    <div class="col-8">
                    <input class="form-control" type="date" name="dor" placeholder="Enter Date of Reporting"  required="required">
                    </div>
                    </div>
                        <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">FD (सभासद बचत  ठेव )</label>
                    <div class="col-8">
                    <input class="form-control" type="number" name="mobile" placeholder="Enter Mobile Number"  required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">RD (सभासद मुदत ठेव )</label>
                    <div class="col-8">
                    <input class="form-control" type="text" name="email" placeholder="Enter Email Id"  required="required">
                    </div>
                    </div>
                     
                        
                        <input class="btn btn-primary " type="submit" name="all" value="Add Member"/>
                    
                     </form>
        
      
          </div>
        </div>
        
      </div>
   
 
     
      <!-- Example DataTables Card-->
    
    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fa fa-table"></i>देवाण घेवाण</div>
                        <div class="card-body" align="center">
                            <table class="table table-bordered table-responsive" id="dataTable" width="90%" cellspacing="8">          
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>	
                                        <th scope="col">खाते क्रमांक</th>	
                                        <th scope="col">पूर्ण नाव</th>
                                        <th scope="col">भाग</th>
                                        <th scope="col">मासिक ठेव</th>
                                        <th scope="col">नियमित कर्ज</th>
                                        <th scope="col">सभासद कल्यानं निधी</th>
                                        <th scope="col">आपत्कालीन कर्ज</th>
                                        <th scope="col">सभासद बचत ठेव</th>
                                        <th scope="col">सभासद मुदत ठेव</th>                                                                            
                                    </tr>
                                </thead>

                            </table> 
                        </div>
                    </div>  
     
    </div>
    <!-- /.container-fluid-->
   
								<script>
                                    function onedit()
                                    {
                                        var table = document.getElementById('dataTable');
                                        for(var i = 1; i < table.rows.length; i++)
                                        {
                                            table.rows[i].onclick = function()
                                            {
                                                //rIndex = this.rowIndex;
                                                document.getElementById("id").value = this.cells[0].innerHTML;                                                
                                            };
                                        }
                                    }
                                </script>


</body>

</html>
