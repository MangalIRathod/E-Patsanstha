<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Dead Member Report Print</title>
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
<h3> Dead Member Report :  ${dm_date} </h3>

					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>Sr No</th>
					    <th>Account No.</th>
					    <th>Full Name</th>	
					    <th>Share</th>				    
					    <th>FD</th>
					    <th>Ins.</th>
					    <th>Percent Amount</th>	
					    <th>Rd</th>
					    <th>Monthly Deposit</th>
					    <th>Regular Loan</th>
					    <th>Loan Interest</th>
					    <th>Emer. Loan</th>
					    <th>Eloan Interest</th>
					    <th>Payable Amount</th>						    					    
					  </tr>
					  </thead>
					  <tbody>
					    
					    
                        <c:forEach var="obj" items="${dead_member_List}" varStatus="theCount">                       
                          <tr>                          		
                            	<td>${theCount.index+1}</td>
                        		<td>${obj.accountnumber}</td> 
                        		<td>${obj.fullname}</td>                
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.shares}" /></td>         		                        		
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.fd}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.insurance}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.percentamount}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.rd}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.monthlydeposit}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totalregularloan}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestregularloan}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.totalemerloan}" /></td> 
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.intrestonemerloan}" /></td>  
                        		<td><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${obj.payableamount}" /></td>                          		                 		                     		                      		                      		                  		                      		                      		                        		
                          </tr>
                          </c:forEach>                                                  
                          
                        </tbody>
					</table>
</div>
<script>
	document.onload = window.print();
</script>
</body>
</html>


