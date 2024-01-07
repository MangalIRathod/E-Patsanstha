<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Andaj Patrak Print</title>
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
<h3> अंदाज पत्रक  <br> (दिनांक 01-04-2021 ते 31-03-2022)  </h3>

	<table id="vaibhav">					 
        <thead>
            <tr>
                <th colspan="5">उत्पन्न बाजू</th>
                
                <th colspan="5">खर्च बाजू</th>
                </tr>
        </thead>
        <tbody>

            <tr>
                <td >तपशील</td>
                <td colspan="2">सन 2016-17</td>
                <td colspan="2">सन 2017-18</td>
                <td >तपशील</td>
                <td colspan="2">सन 2016-17</td>
                <td colspan="2">सन 2017-18</td>
                
            </tr>


            <tr>
                <td></td>

                <td>रूपये </td>
                <td>पैसे</td>
                
                <td>रूपये </td>
                <td>पैसे</td>

                <td></td>

                <td>रूपये </td>
                <td>पैसे</td>
                
                <td>रूपये </td>
                <td>पैसे</td>
            </tr>


            <tr>
                <td>नियमित कर्ज व्याज</td>
                <td>9000000</td>
                <td>00</td>
                <td>9145000</td>
                <td>00</td>
                <td>सभासद ठेव व्याज</td>
                <td>71000</td>
                <td>00</td>
                <td>750000</td>
                <td>00</td>
            </tr>


            <tr>
                <td>इतर उत्पन खाते</td>
                <td>50000</td>
                <td>00</td>
                <td>5000</td>
                <td>00</td>
                <td>बँक व्याज खाते</td>
                <td>5460000</td>
                <td>00</td>
                <td>45000000</td>
                <td>00</td>
            </tr>

            <tr>
                <td>झेरॉक्स उत्पन खाते</td>
                <td>900000</td>
                <td>00</td>
                <td>950000</td>
                <td>00</td>
                <td>वार्षिक सभाखर्च</td>
                <td>35000</td>
                <td>00</td>
                <td>55000</td>
                <td>00</td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>...</td>
                <td>डेडस्टॉक  खर्च </td>
                <td>30000</td>
                <td>00</td>
                <td>60000</td>
                <td>00</td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>किरकोळ खर्च</td>
                <td>35000</td>
                <td>00</td>
                <td>25000</td>
                <td>00</td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>छपाई व स्टेशनरी</td>
                <td>20000</td>
                <td>00</td>
                <td>25000</td>
                <td>00</td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>ऑडिट फिस</td>
                <td>45000</td>
                <td>00</td>
                <td>45000</td>
                <td>00</td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>कर्मचारी पगार</td>
                <td>750000</td>
                <td>00</td>
                <td>850000</td>
                <td>00</td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>लांभाश खर्च</td>
                <td>1600000</td>
                <td>00</td>
                <td>2100000</td>
                <td>00</td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>क. अधिलाभाश </td>
                <td>15000</td>
                <td>00</td>
                <td>15000</td>
                <td>00</td>
            </tr>

            
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>मुदत ठेव व्याज</td>
                <td>200000</td>
                <td>00</td>
                <td>400000</td>
                <td>00</td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>झेरॉक्स खर्च खाते </td>
                <td>450000</td>
                <td>00</td>
                <td>475000</td>
                <td>00</td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>रिझर्व फंड खाते </td>
                <td>600000</td>
                <td>00</td>
                <td>800000</td>
                <td>00</td>
            </tr>

            

            <tr>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td> _</td>
                <td>_ </td>
            </tr>
            <tr>
                <td>एकूण बेरीज</td>
                <td>9950000</td>
                <td>00</td>
                <td>10100000</td>
                <td>00</td>
                <td>एकूण बेरीज</td>
                <td>9950000</td>
                <td>00</td>
                <td>10100000</td>
                <td>00</td>
            </tr>
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


