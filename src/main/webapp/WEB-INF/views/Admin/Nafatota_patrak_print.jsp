<%@page import="java.util.Vector"%>
<%@page import="com.codeft.Beans.JavaBeans"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
<title>E-Patsanstha - Nafatota Patrak Print</title>
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
<h3> नफा तोटा पत्रक  <br> (दिनांक 01-04-2021 ते 31-03-2022)  </h3>

	<table id="vaibhav">
		<thead>
            <tr>
                <th colspan="2">31.03.2016</th>
                <th >खर्चाचा तपशील</th>
                <th colspan="2">31.03.2017</th>
                <th colspan="2">31.03.2016</th>
                <th>उत्पन्नाचा तपशील</th>
                <th colspan="2">31.03.2017</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>रूपये </td>
                <td>पैसे</td>
                <td></td>
                <td>रूपये </td>
                <td>पैसे</td>
                <td>रूपये </td>
                <td>पैसे</td>
                <td></td>
                <td>रूपये </td>
                <td>पैसे</td>
            </tr>


            <tr>
                <td>50711</td>
                <td>00</td>
                <td>स. मुदत ठेव व्याज</td>
                <td>17531</td>
                <td>00</td>
                <td>7662121</td>
                <td>00</td>
                <td>कर्ज व्याज वसुत</td>
                <td>8053035</td>
                <td>00</td>
            </tr>


            <tr>
                <td>4387146</td>
                <td></td>
                <td>बँक व्याज</td>
                <td>3736672</td>
                <td>00</td>
                <td>453219</td>
                <td>00</td>
                <td>झेरॉक्स निव्वळ नफा</td>
                <td>533123</td>
                <td>00</td>
            </tr>

            <tr>
                <td>0</td>
                <td>00</td>
                <td>बँक कमिशन</td>
                <td>22119</td>
                <td>00</td>
                <td>25600</td>
                <td>00</td>
                <td>देणगी</td>
                <td>2600</td>
                <td>00</td>
            </tr>

            <tr>
                <td>0</td>
                <td>00</td>
                <td>किरकोळ</td>
                <td>8150</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>669567</td>
                <td>00</td>
                <td>कर्मचारी पगार</td>
                <td>707680</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>11112</td>
                <td>00</td>
                <td>कर्मचारी भ.नि.नि.</td>
                <td>77088</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>28500</td>
                <td>00</td>
                <td>वार्षिक सभा भत्ता</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>45000</td>
                <td>00</td>
                <td>निवडणूक खर्च</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>14500</td>
                <td>00</td>
                <td>खर्च खता</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>6037</td>
                <td>00</td>
                <td>कर्ज व्याज परत</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            
            <tr>
                <td>1991777</td>
                <td>00</td>
                <td>नफा</td>
                <td>2738378</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>


            <tr>
                <td></td>
                <td></td>
                <td>तरतुदी</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>499220</td>
                <td>00</td>
                <td>सभासद ठेव व्याज</td>
                <td>608770</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>200000</td>
                <td>00</td>
                <td>मु. ठेव व्याज </td>
                <td>300000</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>200000</td>
                <td>00</td>
                <td>स कल्याण निधी</td>
                <td>200000</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>30000</td>
                <td>00</td>
                <td>ऑडीट फीस</td>
                <td>40000</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>2000</td>
                <td>00</td>
                <td>प्रशिक्षण निधीखाते</td>
                <td>2000</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td>5370</td>
                <td>00</td>
                <td>डेडस्टॉक झिज</td>
                <td>5370</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td>सभासद बचत ठेव व्याज</td>
                <td>5370</td>
                <td>00</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>8140940</td>
                <td>00</td>
                <td>एकूण बेरीज</td>
                <td>8588758</td>
                <td>00</td>
                <td>8140940</td>
                <td>00</td>
                <td>एकूण बेरीज</td>
                <td>8588758</td>
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


