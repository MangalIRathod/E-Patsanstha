<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - RD Report Print</title>
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
<h3> RD Report :  ${rd_date} </h3>

					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>Sr No</th>
					    <th>Account No.</th>
					    <th>Full Name</th>
					    <th>RD Date</th>					    
					    <th>RD Amount</th>
					    <th>Total Amount</th>					    
					  </tr>
					  </thead>
					  <tbody>
					    
					    <c:set var="rdamount" value="${0}"/>
					    <c:set var="totalamount" value="${0}"/>
                        <c:forEach var="obj" items="${rd_details}" varStatus="theCount">                       
                          <tr>
                          		<c:set var="rdamount" value="${rdamount + obj.rdamount}" />
                          		<c:set var="totalamount" value="${totalamount + obj.totalamount}" />
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td> 
                        		<td>${obj.fullname}</td>                        		                        		
                        		<td>${obj.rddate}</td>                       		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rdamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totalamount}" /></td>                       		                      		                  		                      		                      		                        		
                          </tr>
                          </c:forEach>
                          
                          <tr>
                          		<td><b>Total</b></td>
                        		<td></td>
                        		<td></td>                        		
                        		<td></td>                         		
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${rdamount}" /></b></td>                      		
                          		<td><!-- <b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${totalamount}" /></b> --></td>
                          </tr>
                          
                        </tbody>
					</table>
</div>
<script>
	document.onload = window.print();
</script>
</body>
</html>


