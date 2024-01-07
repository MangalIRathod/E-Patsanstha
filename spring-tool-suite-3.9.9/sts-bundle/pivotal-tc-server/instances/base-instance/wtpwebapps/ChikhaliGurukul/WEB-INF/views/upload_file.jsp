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
        <title>Dada Maharaj School</title>
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
                            <i class="fa fa-table"></i> Upload Excel File</div>
                        <div class="card-body" align="center">

                            <form  action="#" autocomplete="on" method="post" enctype="multipart/form-data">                              
                               
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-4 col-form-label">Upload Excel Sheet</label>
                                    <div class="col-8">
                                        <input class="form-control" type="file" id="photo1" name="photo1" accept=".xlsx" />
                                    </div>
                                </div>
                               
                               
                                <button type="button" class="btn btn-primary " onclick="return compare_report();">Generate Report</button>

                            </form>


                        </div>
                    </div>


                </div>

            </div>
            <!-- /.container-fluid-->


            <script>
           
            function compare_report() {            
               
                var formData = new FormData();
                   
                   var file_data = $('input[type="file"]')[0].files; // for multiple files            
                 
                   alert(file_data);
                   if (photo1 == "") {
       				alert("Excel file required")
       				return false;
       			   }
                   
                  for(var i = 0;i<file_data.length;i++){
                    formData.append("files0", file_data[i]);  
                    
                 
                    //alert(file_data[i]);
                   }
                   
                $.ajax({
                type : "POST",
                url : "deduction_file",
                enctype : 'multipart/form-data',
                data : formData,
                processData : false, //prevent jQuery from automatically transforming the data into a query string
                contentType : false,
                cache : false,
                timeout : 600000,
                //contentType : "application/x-www-form-urlencoded; charset=UTF-8",
               
                success : function(data) {

        var res = data;
        if (res == "Success") {
        //window.open('./deduction_compare_print', '_blank');
        // alert("Loan Apply Successfully");
        } else {
        alert("Loan Apply failed");        
        }
        }
                });                      
              }
           
            </script>

           


        </body>

    </html>

