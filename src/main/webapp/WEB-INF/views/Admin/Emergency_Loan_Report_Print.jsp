<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Emergency Loan Report Print</title>
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
<h3> Emergency Loan Report :  ${emergency_loan_date} </h3>

					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>Sr No</th>
					    <th>Account No.</th>
					    <th>Full Name</th>
					    <th>Date</th>
					    <th>Loan Amount</th>
					    <th>Principal Amount</th>
					    <th>Interest Amount</th>
					    <th>Loan Balance</th>					    
					  </tr>
					  </thead>
					  <tbody>
					    
					    <c:set var="e_principalamount" value="${0}"/>
					    <c:set var="e_intrestamount" value="${0}"/>
                        <c:forEach var="obj" items="${emergency_loan_details}" varStatus="theCount">                       
                          <tr>
                          		<c:set var="e_principalamount" value="${e_principalamount + obj.e_principalamount}" />
                          		<c:set var="e_intrestamount" value="${e_intrestamount + obj.e_intrestamount}" />
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td> 
                        		<td>${obj.fullname}</td>                        		                        		
                        		<td>${obj.date}</td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.loanamount}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_principalamount}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.e_intrestamount}" /></td>
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.eloanbalance}" /></td>                       		                      		                      		                  		                      		                      		                        		
                          </tr>
                          </c:forEach>
                          
                          <tr>
                          		<td><b>Total</b></td>
                        		<td></td>                        		
                        		<td></td> 
                        		<td></td> 
                        		<td></td>                        		
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${e_principalamount}" /></b></td> 
                        		<td><b><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${e_intrestamount}" /></b></td> 
                        		<td></td>                      		                         		
                          </tr>
                          
                        </tbody>
					</table>
</div>
<script>
	document.onload = window.print();
</script>
</body>
</html>


