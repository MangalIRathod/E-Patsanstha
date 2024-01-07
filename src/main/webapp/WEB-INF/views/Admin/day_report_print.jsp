<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Daily Report Print</title>
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
........................................................................................................................
<h3> Daily Report <br> (दिनांक ${daily_report_date})  </h3>

					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>Sr. No.</th>
					    <th>Date</th>
					    <th>Opening Balance</th>
					    <th>Header Name</th>
					    <th>Account No</th>					   			
					    <th>Cheque / Receipt No</th>
					    <th>Amount</th>
					    <th>Transaction Mode</th>
					    <th>Note</th>
					    <th>Closing Balance</th>							       
					  </tr>
					  </thead>
					  <tbody>
					    
					      <c:forEach var="obj" items="${daily_report_details}" varStatus="theCount">                   
                          <tr>
                          		<td>${theCount.index+1}</td>                         		
                            	<td>${obj.date}</td>  
                            	<td>${obj.openingbalance}</td>  
                            	<td>${obj.party_name}</td>  
                            	<td>${obj.accountnumber}</td>  
                            	<td>${obj.cheque_number}</td> 
                            	<td>${obj.amount}</td>
                            	<td>${obj.transaction}</td>                             	 
                            	<td>${obj.notes}</td>  
                            	<td>${obj.closingbalance}</td>  
                            	           		                      		                      		                  		                      		                      		                        		
                          </tr>
                          
                          </c:forEach>  
                          
                        </tbody>
					</table>
					<br><br>
    <div>
	 <p style="float: left; width:33.33333%; text-align:left;" class="alignleft"> अध्यक्ष </p>
	 <p style="float: left; width:33.33333%; text-align:center;" class="aligncenter"> सचिव </p>
	 <p style="float: left; width:33.33333%; text-align:right;" class="alignright"> कोषाध्यक्ष </p>
 	</div>
</div>
<script>
	document.onload = window.print();
</script>
</body>
</html>


