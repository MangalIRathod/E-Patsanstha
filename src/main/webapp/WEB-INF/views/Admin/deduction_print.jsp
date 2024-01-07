<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha</title>

<%@ page contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">       
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 99%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  font-size: 10px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

        
        
    </head>

<body>


<div style="text-align:center; width:99%; padding:1%;">
<p style="float: left;"><img src="/logo/pat.jpeg" height="70" width="60" alt=""></p>
<h3> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था मर्यादित, </h3>
<h3> विष्णुपुरी, नांदेड </h3>
<h3> कपात यादी माहे ${cmonth}</h3>


<button type="button" class="btn btn-success" onclick="tableToExcel('vaibhav', 'W3C Example Table')">Download</button> 
					<div class="card mb-3">
                    
                    <table id="vaibhav" style="width:100%">    
					         
                     <thead>
					  <tr>   
					    <th>Sr. No.</th>
					    <th>Acc No.</th>
					    <th>Full Name</th>
					    <th>Shares</th>
					    <th>RD</th>
					    <th>Insurance</th>
					    <th>Monthly Deposit</th>
					    <th>EMI</th>
					    <th>Principal Amount</th>
					    <th>Interest</th>
					    <th>E_EMI</th>    
					    <th>E Prin. Amount</th>
					    <th>E Interest</th>					    
					    <th>Total </th>
					    
					  </tr>
					  </thead>
                      <tbody>
					    
					    <c:set var="total" value="${0}"/>
                        <c:forEach var="obj" items="${deduction_details}" varStatus="theCount">
                          <tr>                       
                          <c:set var="total" value="${total + obj.total}" />
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td> 
                        		<td>${obj.fullname}</td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.shareallot}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rdamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.insdebt}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.m_debit}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.emi}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.principalamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_emi}" /></td>  
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_principalamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_intrestamount}" /></td>                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.total}" /></td>  
                        		                        		                   		                      		                      		                        		
                          </tr>
                          
                          </c:forEach>
                          <tr>
                          		<td><b>Total</b></td>
                        		<td></td> 
                        		<td></td>                        		
                        		<td></td> 
                        		<td></td>
                        		<td></td>   
	                       		<td></td> 
                        		<td></td>
                        		<td></td> 
                        		<td></td> 
                        		<td></td>
                        		<td></td> 
                        		<td></td>
                          		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${total}" /></b></td>
                          		
                          </tr>
                        </tbody>
					</table>
</div>
<script>
	document.onload = window.print();
</script>  
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
	
	
	</div>

          
             
            

                                                                        

</body>
</html>


