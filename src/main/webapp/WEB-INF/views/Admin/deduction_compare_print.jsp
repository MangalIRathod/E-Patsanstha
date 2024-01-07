<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Deduction Compare Print</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd; 
}
</style>
</head>
<body>

<div style="width:100%; text-align:center;" >
<p style="float: left;"><img src="/logo/pat.jpeg" height="70" width="60" alt=""></p>
<h3> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था मर्यादित, </h3>
<h3> विष्णुपुरी, नांदेड </h3>
<h3> फरक यादी माहे </h3>


<button type="button" class="btn btn-success" onclick="tableToExcel('vaibhav', 'W3C Example Table')">Download</button> 
					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>Sr No</th>
					    <th>Account No.</th>
					    <th>Monthly Deduction</th>
					    <th>Bank Deduction</th>
					    <th>Difference</th>					    
					  </tr>
					  </thead>
					  <tbody>
					    
					    <c:set var="total" value="${0}"/>
                        <c:forEach var="obj" items="${deduction_compare}" varStatus="theCount">                       
                          <tr>
                          		<c:set var="total" value="${total + obj.difference}" />
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td>                        		                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.monthly_deduction}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.bank_deduction}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.difference}" /></td>                       		                      		                  		                      		                      		                        		
                          </tr>
                          </c:forEach>
                          <tr>
                          		<td><b>Total</b></td>
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
</body>
</html>


