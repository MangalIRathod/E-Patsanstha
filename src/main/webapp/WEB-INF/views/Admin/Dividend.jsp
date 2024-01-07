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
        <title>E-Patsanstha - Dividend</title>       
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
                    
                    <div class="card mb-3">

                        <div class="card-header">
                            <i class="fa fa-table"></i> Dividend List &nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-success" onclick="tableToExcel('dataTable', 'Dividend Table')">Download</button> 
                        </div>



                        <table class="table table-bordered table-responsive" id="dataTable" width="100%" cellspacing="0">          
                            <thead>
                                <tr>
                                    <th scope="col">Sr_No</th>	
                                    <th scope="col">Account No</th>	
                                    <th scope="col">Full_Name</th>
                                    <th scope="col">Share Total</th>
                                    <th scope="col">Monthly Deposit Total</th>
                                    <th scope="col">Share Dividend</th>
                                    <th scope="col">Monthly Deposit Dividend</th>
                                    <th scope="col">Total Dividend</th>
                                </tr>
                            </thead>
 						<tbody>
 						<c:set var="total_share" value="${0}"/>
 						<!--  
 						<c:set var="total_monthly_deposit" value="${0}"/>
 						<c:set var="total_share_dividend" value="${0}"/>
 						<c:set var="total_monthly_deposit_dividend" value="${0}"/>
 						<c:set var="total_dividend_total" value="${0}"/>
 						-->
                        <c:forEach var="obj" items="${dividend_details}" varStatus="theCount">
                          <tr>
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>
                        		<td>${obj.fullname}</td>  
                        		<c:set var="total_share" value="${total_share + obj.share_total}" />
                        		<c:set var="total_monthly_deposit" value="${total_monthly_deposit + obj.monthly_deposit_total}" />
                        		<c:set var="total_share_dividend" value="${total_share_dividend + obj.share_dividend}" />
                        		<c:set var="total_monthly_deposit_dividend" value="${total_monthly_deposit_dividend + obj.monthly_deposit_dividend}" />
                        		<c:set var="total_dividend_total" value="${total_dividend_total + obj.total_dividend}" />                      		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.share_total}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.monthly_deposit_total}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.share_dividend}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.monthly_deposit_dividend}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.total_dividend}" /></td>                       		                        		
                          </tr>
                          </c:forEach>
                          <tr>
                            	<td><b>Total</b></td>
                        		<td></td>
                        		<td></td>                         		                      		
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total_share}" /></b></td>
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total_monthly_deposit}" /></b></td>
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total_share_dividend}" /></b></td>
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total_monthly_deposit_dividend}" /></b></td>
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total_dividend_total}" /></b></td>                       		                        		
                          </tr>
                        </tbody>
                        </table> 
                    </div>

                </div>

            </div>
            <!-- /.container-fluid-->

			<script type="text/javascript">
				var tableToExcel = (function() {
				  var uri = 'data:application/vnd.ms-excel;base64,'
				    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
				    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
				    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
				  return function(table, name) {
				    if (!table.nodeType) table = document.getElementById(table)
				    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
				    window.location.href = uri + base64(format(template, ctx))
				  }
				})()
			</script>
      
    </body>

</html>
