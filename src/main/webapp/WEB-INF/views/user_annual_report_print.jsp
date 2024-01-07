<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
	   
	   	<table style="width:100%">
		  <tr>
		    <td style="width:20%">खाते क्रमांक: ${accountnumber} </td>
		    <td style="width:80%"><span style="float:left">सभासदाचे नाव : ${fullname}</span> <span style="float:right">विभाग : ${department}</span></td>    
		  </tr>
		  <tr>
		    <td style="width:20%">जन्म दिनांक: ${dob} </td>
		    <td style="width:80%"><span style="float:left">नेमणूक दिनांक: ${doj}</span> <span>निवृत्ती दिनांक: ${dor}</span> <span style="float:right">भ्रमणध्वनी क्रमांक: ${mobile}</span> </td>   
		  </tr>  
		</table>
		
		<div style="text-align:center; width:90%; padding:1%;">
			<span style="font-size:16px; font-family: Adobe Garamond Pro Bold; "> खाते उतारा  (आर्थिक वर्ष ${ecoyear})</span>
		</div>	
		
		<table style="width:100%">
		
		  <tr>
		    <th rowspan="2">${ecoyear}</th>
		    <th style="width:10%" colspan="2">भाग (शेअर्स) </th> 
		    <th style="width:10%" colspan="2">मासिक ठेव </th>
		    <th style="width:10%" colspan="2">सभासद कल्याण निधी </th> 
		    <th style="width:10%" colspan="2">सभासद बचत ठेव योजना (RD)</th>
		    <th style="width:20%" colspan="3">नियमित कर्ज </th> 
		    <th style="width:20%" colspan="3">आकस्मिक कर्ज </th>
		    <th rowspan="2">एकूण कपात</th> 
		  </tr>
		  
		  <tr>		    
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
		  </tr>
		  
		  
		  <tr>
		    <td style="width:5%"> C/F2021-22</td> 
		    <td style="width:5%"> 0</td>
		    <td style="width:5%"> ${TotalAmountOfSahre}</td> 
		    <td style="width:5%"> 0</td>
		    <td style="width:5%"> ${MDeposit}</td> 
		    <td style="width:5%"> 0</td>
		    <td style="width:5%"> ${TotalInsuranceAmount}</td> 
		    <td style="width:5%"> 0</td>
		    <td style="width:5%"> ${RD}</td> 
		    <td style="width:5%"> 0</td> 
		    <td style="width:5%"> ${LoanAmount}</td>
		    <td style="width:5%"> 0</td> 		    
		    <td style="width:5%"> 0</td> 
		    <td style="width:5%"> ${TotalAmountEmergencyLoan}</td>
		    <td style="width:5%"> 0</td>		
		    <td style="width:10%"> </td>	    
		  </tr>		
		  
		  <c:forEach var="obj" items="${user_annual_data}" varStatus="theCount"> 
		  <tr>
		    <td style="width:5%"> ${obj.cdate}</td> 
		    <td style="width:5%"> ${obj.share_debit}</td>
		    <td style="width:5%"> ${obj.share_total}</td> 
		    <td style="width:5%"> ${obj.md_debit}</td>
		    <td style="width:5%"> ${obj.md_total}</td> 
		    <td style="width:5%"> ${obj.insurance_debit}</td>
		    <td style="width:5%"> ${obj.insurance_total}</td> 
		    <td style="width:5%"> ${obj.rd_debit}</td>
		    <td style="width:5%"> ${obj.rd_total}</td> 
		    <td style="width:5%"> ${obj.r_principalamount}</td> 
		    <td style="width:5%"> ${obj.r_balanceloan}</td>
		    <td style="width:5%"> ${obj.r_intrestamount}</td> 
		    <td style="width:5%"> ${obj.e_principalamount}</td> 
		    <td style="width:5%"> ${obj.e_balanceloan}</td>
		    <td style="width:5%"> ${obj.e_intrestamount}</td>		
		    <td style="width:10%"> ${obj.total}</td>	    
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
