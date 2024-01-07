<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Terij Patrak Print</title>
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
<h3> तेरीज पत्रक  <br> (दिनांक 01-04-2021 ते 31-03-2022)  </h3>

					<table id="vaibhav">
					  <thead>
					  <tr>   
					    <th>जमा तपशील</th>
					    <th>रुपये</th>
					    <th>पैसे</th>
					    <th>नावे तपशील</th>
					    <th>रुपये</th>
					    <th>पैसे</th>					    
					  </tr>
					  </thead>
					  <tbody>
					    
					        <c:forEach var="entry" items="${terij}" varStatus="theCount"> 
					     
                        	
					                       
                          <tr>                         		
                            	<td><c:out value="${entry.key}"/> </td>
                        		<td><c:out value="${entry.value}"/></td> 
                        		<td>00</td>
                        		<c:forEach var="entry1" items="${terij1}" varStatus="count2">
                        		 
                        		<c:if test="${(theCount.index ==  count2.index)}" >
                        		                     		                        		
                        		<td><c:out value="${entry1.key}"/> </td>
                        		<td><c:out value="${entry1.value}"/> </td> 
                        		<td>00</td>
                        		     </c:if>
                                    </c:forEach>             		                      		                      		                  		                      		                      		                        		
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


