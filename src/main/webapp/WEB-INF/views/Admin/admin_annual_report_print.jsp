<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member - Annual Report</title>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>

</head>
<body> 

<div style="text-align:center; width:90%; padding:1%;">
       <img src="images/sf_logo.png" alt=""> 
		<p style="float: left;"><img src="../logo/pat.jpeg" height="70" width="60" alt=""></p>
		
		<span style="font-size:12px; font-family: Adobe Garamond Pro Bold; float: right;">नोंदणी क्रमांक : NND/NND/DNX/O/(340)OF2002</span> <br>
	 <br>  	<span style="font-size:16px; font-family: Adobe Garamond Pro Bold; ">स्वामी रामानंद तीर्थ मराठवाडा विद्यापीठ कर्मचारी सहकारी पतसंस्था मर्यादित,</span> <br>
	   	<span style="font-size:14px; font-family: Adobe Garamond Pro Bold; ">विष्णुपुरी, नांदेड</span> <br>
</div>	  

<div style="width:99%; padding:1%; text-align:center;" >

	   <br>
	   
	   	<!--<table style="width:100%">
		  <tr>
		    <td style="width:20%">खाते क्रमांक: ${accountnumber} </td>
		    <td style="width:80%"><span style="float:left">सभासदाचे नाव : ${fullname}</span> <span style="float:right">विभाग : ${department}</span></td>    
		  </tr>
		  <tr>
		    <td style="width:20%">जन्म दिनांक: ${dob} </td>
		    <td style="width:80%"><span style="float:left">नेमणूक दिनांक: ${doj}</span> <span>निवृत्ती दिनांक: ${dor}</span> <span style="float:right">भ्रमणध्वनी क्रमांक: ${mobile}</span> </td>   
		  </tr>  
		</table>-->
		
		<div style="text-align:center; width:90%; padding:1%;">
			<span style="font-size:16px; font-family: Adobe Garamond Pro Bold; "> येणे देणे यादी   (आर्थिक वर्ष ${ecoyear})</span>
		</div>	
		
		<table style="width:100%">
		
		  <tr>		   
		    <th style="width:10%" >अ.क्रं </th>
		    <th style="width:10%" >खातेधारकाचे नाव </th>
		    <th style="width:10%" >खाते क्रं </th>
		    <th style="width:10%" >स. भाग </th> 
		    <th style="width:10%" >स. ठेव </th>
		    <th style="width:10%" >ख. क. निधी </th> 
		    <th style="width:10%" >नि. क. बाकी </th>
		    <th style="width:10%" >आ. क. बाकी </th> 
		    <th style="width:10%" >स.ब. खाते </th>		
		  </tr>
		  
		 	<!--  <tr>		    
		    <td style="width:5%">जमा </td> 
		    <td style="width:5%">एकूण </td>
		    <td style="width:5%">जमा </td> 
		    <td style="width:5%">एकूण </td>
		    <td style="width:5%">जमा </td> 
		    <td style="width:5%">एकूण </td>
		    <td style="width:5%">जमा </td> 
		    <td style="width:5%">एकूण </td>
		    <td style="width:5%">जमा </td>
		    <td style="width:5%">शिल्लक </td> 
		    <td style="width:5%">व्याज </td>
		    <td style="width:5%">जमा </td>
		    <td style="width:5%">शिल्लक </td> 
		    <td style="width:5%">व्याज </td>		    
		  </tr>-->
		  
		  
		 
		  
		 <c:forEach var="obj" items="${User_Annual_Report}" varStatus="theCount">  
		  <tr>
		  <td>${theCount.index+1}</td>
		  <td style="width:5%"> ${obj.accountname}</td> 
		    <td style="width:5%"> ${obj.accountnumber}</td> 
		    <td style="width:5%"> ${obj.shares}</td>
		    <td style="width:5%"> ${obj.monthlydeposite}</td> 
		    <td style="width:5%"> ${obj.insurance}</td>
		    <td style="width:5%"> ${obj.loanbalance}</td> 
		    <td style="width:5%"> ${obj.eloanbalance}</td>
		    <td style="width:5%"> ${obj.rd}</td> 
		   
		  </tr>	 
		  </c:forEach>
		</table>

		

		<p style="text-align:left;">नोट - दुरुस्तीच्या अधीन राहून </p>
      
		<div style="text-align:center;margin: 70px;">
		    <span style="float:left">लिपिक</span>
		    <span style="float:right">अध्यक्ष</span>
		    <span>सचिव</span>
		</div>
</div>


     
 	<script>
        document.onload = window.print();
    </script>     
       
</body>
</html>
