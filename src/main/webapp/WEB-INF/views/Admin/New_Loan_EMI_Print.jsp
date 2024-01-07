<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - EMI Print</title>
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
<h3> स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था मर्यादित, विष्णुपुरी, नांदेड </h3>
<br>
<c:set var="dateParts" value="${fn:split(details, ':')}" />
<p style="text-align:left;"><b>Account Number :</b> ${dateParts[0]}<span style="float:right;"><b>Date :</b> ${dateParts[2]}</span></p> 
<p style="text-align:left;"><b>Name :</b> ${dateParts[1]}</p> 

<h3>EMI List</h3>

<table>
  
  <tr>
    <th>Month </th>
    <th>Interest Paid</th>
    <th>Principal Amount</th>
    <th>Balance Amount</th>
  </tr>
  <c:forTokens items="${EMIList}" delims="," var="mySplit">
  
  <tr>
  <c:forTokens items="${mySplit}" delims=":" var="vb">
  <td>
   <c:out value="${vb}"/>
   </td>
   
   </c:forTokens>
   </tr>
</c:forTokens>

</table>
</div>
<script>
	document.onload = window.print();
</script>     
</body>
</html>


