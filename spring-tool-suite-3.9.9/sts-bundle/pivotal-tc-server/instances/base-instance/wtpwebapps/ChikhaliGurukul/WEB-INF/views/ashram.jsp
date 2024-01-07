
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=0.75, maximum-scale=0.75, minimum-scale=0.75">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Admin - Add Staff</title>
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
            var txt7 = document.getElementById('txt7').value;          
            var txt8= document.getElementById('txt8').value;
            var txt9 = document.getElementById('txt9').value; 
            var result = parseFloat(txt7) + parseFloat(txt8) + parseFloat(txt9);
            if (!isNaN(result)) {
                document.getElementById('txt10').value = result;
            }
        }
        
function sum1() {
            var txt10 = document.getElementById('txt10').value;
            var txt11= document.getElementById('txt11').value;
            var txt12 = document.getElementById('txt12').value;
            var result1 = parseFloat(txt10) + parseFloat(txt11) + parseFloat(txt12);
            var result2 = parseFloat(txt10) * 12 / 100;
            if (!isNaN(result1)) {
                document.getElementById('txt13').value = result1;
            }
            
            if (!isNaN(result2)) {
                document.getElementById('txt14').value = result2;
            }
        }  
        
function sum2() {
            var txt14 = document.getElementById('txt14').value;
            var txt15= document.getElementById('txt15').value;
            var txt16 = document.getElementById('txt16').value;
            var txt17= document.getElementById('txt17').value;
            var txt18 = document.getElementById('txt18').value;
            var result3 = parseFloat(txt14) + parseFloat(txt15) + parseFloat(txt16) + parseFloat(txt17) + parseFloat(txt18);
            if (!isNaN(result3)) {
                document.getElementById('txt19').value = result3;
            }
        }
        
function sum3() {
            var txt13 = document.getElementById('txt13').value;
            var txt19= document.getElementById('txt19').value;
            var result4 = parseFloat(txt13) - parseFloat(txt19);
            if (!isNaN(result4)) {
                document.getElementById('txt20').value = result4;
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
           <i class="fa fa-table"></i>&nbsp;&nbsp; ADD ASHRAM STAFF </div> 
          </div> 
        <div class="card-body" align="center">
      
                    <form  action="ashramdb" method="post">
                   
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Sr. No.</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt2" name="srno" placeholder="Enter Sr. No."  required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Professor Name</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt3" name="proname" placeholder="Enter Professor Name"  required="required">
                    </div>
                    </div>
                      
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Post</label>
                    <div class="col-8">
                    <select id="category" id="txt4" name="post" class="form-control">
			<option value="Admin" selected="selected">Admin</option>
			<option value="Cook">Cook</option>
			<option value="Helper">Co-Teacher</option>			
                    </select>
                     </div>
                    </div>   
                        
                    
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Basic Salary</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt7" onkeyup="sum();" name="bs" placeholder="Enter Basic Salary" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Dearness Allowance</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt8" onkeyup="sum();" name="da" placeholder="Enter Dearness Allowance" required="required">
                    </div>
                    </div>
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Travel Allowance</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt9" onkeyup="sum();" name="ta" placeholder="Enter Travel Allowance" required="required">
                    </div>
                    </div> 
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Basic+Dearness+Travel Allowance</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt10" onkeyup="sum1();" name="bdta" placeholder="Enter Basic+Dearness+Travel Allowance" required="required">
                    </div>
                    </div> 
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">House Rent Allowance</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt11" onkeyup="sum1();" name="hra" placeholder="Enter House Rent Allowance" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Other</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt12" onkeyup="sum1();" name="other" placeholder="Enter Other" required="required">
                    </div>
                    </div> 
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Payable Salary</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt13" onkeyup="sum3();" name="ps" placeholder="Enter Payable Salary" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Future Subsistence Fund</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt14" onkeyup="sum2();" name="fsf" placeholder="Enter Future Subsistence Fund" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Other 1</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt15" onkeyup="sum2();" name="oo" placeholder="Enter Other 1" >
                    </div>
                    </div>  
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Other 2</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt16" onkeyup="sum2();" name="ot" placeholder="Enter Other 2" >
                    </div>
                    </div>  
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Business Tax</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt17" onkeyup="sum2();" name="bt" placeholder="Enter Business Tax" required="required">
                    </div>
                    </div>      
                    
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Deduction (Advance)</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt18" onkeyup="sum2();" name="deduction" placeholder="Enter Deduction (Advance)" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Total Deduction</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt19" onkeyup="sum3();" name="tdeduction" placeholder="Enter Total Deduction" required="required">
                    </div>
                    </div>
                        
                    <div class="form-group row">
                    <label for="example-text-input" class="col-4 col-form-label">Net Salary</label>
                    <div class="col-8">
                    <input class="form-control" type="text" id="txt20" name="netsal" placeholder="Enter Net Salary" required="required">
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
