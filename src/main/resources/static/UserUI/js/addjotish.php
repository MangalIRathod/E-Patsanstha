<?php session_start();
$name = $_SESSION['username'];
if(isset($_SESSION['username']))
{
}
else
{
	header('location:login.php');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=0.75, maximum-scale=0.75, minimum-scale=0.75">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - Start Bootstrap Template</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
   <script src="js/jquery.js"></script>
  
        <script type="text/javascript">
        $(document).ready(function(){
				$(".viewdatadel").click(function(){
           
				var buttonValue = $(this).attr("id");
			
		  window.location.href = "delnews.php?name=" + buttonValue; 
		  
			
				});
			});
				
        </script>
        
        
        
        

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.php">Start Bootstrap</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index.php">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
       
       <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="addnews.php">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">News Manager</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="addjotish.php">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Add Astrologer</span>
          </a>
        </li>
        
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="product.php">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Add Product</span>
          </a>
        </li>
         <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="horoscopeupdate.php">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Update Horoscope</span>
          </a>
        </li>
       
       <!-- <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="tables.html">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tables</span>
          </a>
        </li>-->
       
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>David Miller</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>Jane Smith</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <strong>John Doe</strong>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all messages</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="alertsDropdown">
            <h6 class="dropdown-header">New Alerts:</h6>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-danger">
                <strong>
                  <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
              <span class="text-success">
                <strong>
                  <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
              </span>
              <span class="small float-right text-muted">11:21 AM</span>
              <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item small" href="#">View all alerts</a>
          </div>
        </li>
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">My Dashboard</li>
      </ol>
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i>   ADD JOTISH</div>
        <div class="card-body" align="center">
      
                    <form  action="astoreg.php" method="POST" enctype="multipart/form-data">
            
                    <div class="form-group row">
                    <label for="example-text-input" class="col-2 col-form-label">Email Address</label>
                    <div class="col-3">
                    <input class="form-control" type="text" name="email" size="45" maxlength="255"  autocomplete="on" placeholder="Enter Email Address">
                    </div>
                   
                    <label for="example-text-input" class="col-2 col-form-label">Major Category</label>
                    <div class="col-5">
                    
                    <select id="category" name="category" class="form-control">
					<option value="parashari-astrologer" selected="selected">Astrologer » Parashari Astrologer</option>
					<option value="vedic-astrologer">Astrologer » Vedic Astrologer</option>
					<option value="naadi-astrologer">Astrologer » Naadi Astrologer</option>
					<option value="lalkitab-astrologer">Astrologer » LalKitab Astrologer</option>
					<option value="astrologer">Astrologer</option>
					<option value="calculative-astrologer">Astrologer » Calculative Astrologer</option>
					<option value="career-astrologer">Astrologer » Career/Job Astrologer</option>
					<option value="gemstone-astrologer">Astrologer » Gemstone Expert Astrologer</option>
					<option value="horary-astrologer">Astrologer » Horary Astrologer</option>
					<option value="kp-astrologer">Astrologer » K. P. Astrologer</option>
					<option value="marriage-expert-astrologer">Astrologer » Marriage Expert Astrologer</option>
					<option value="health-astrologer">Astrologer » Medical/Health Expert Astrologer</option>
					<option value="share-market-astrologer">Astrologer » Share Market Astrologer</option>
					<option value="signature-astrologer">Astrologer » Signature Astrologer</option>
					<option value="thumb-impression-astrologer">Astrologer » Thumb Impression Astrologer</option>
					<option value="astrology-ecommerce-website">Astrology eCommerce Website</option>
					<option value="astrology-shop">Astrology Shop</option>
					<option value="vedic-science-author">Author » All Vedic Sciences Author</option>
					<option value="astrology-author">Author » Astrology Author</option>
					<option value="numerology-author">Author » Numerology Author</option>
					<option value="palmistry-author">Author » Palmistry Author</option>
					<option value="reiki-author">Author » Reiki Author</option>
					<option value="spiritual-author">Author » Spiritual Author</option>
					<option value="vastu-author">Author » Vastu Author</option>
					<option value="yoga-author">Author » Yoga Author</option>
					<option value="coffee-cup-reader">Coffee Cup Reader</option>
					<option value="face-reader">Face Reader</option>
					<option value="fengshui">Feng Shui</option>
					<option value="complete-horoscope-center">Horoscope Center » All Horoscopes</option>
					<option value="astrology-horoscope-center">Horoscope Center » Astrology Horoscopes</option>
					<option value="matching-horoscope-center">Horoscope Center » Horoscope Matching</option>
					<option value="numerology-horoscope-center">Horoscope Center » Numerology Horoscopes</option>
					<option value="hypno-therapy-expert">HypnoTherapy Expert</option>
					<option value="vedic-science-institute">Institute » All Vedic Sciences Institute</option>
					<option value="astrology-institute">Institute » Astrology Institute</option>
					<option value="numerology-institute">Institute » Numerology Institute</option>
					<option value="palmistry-institute">Institute » Palmistry Institute</option>
					<option value="reiki-institute">Institute » Reiki Institute</option>
					<option value="spiritual-institute">Institute » Spiritual Institute</option>
					<option value="vastu-institute">Institute » Vastu Institute</option>
					<option value="yoga-institute">Institute » Yoga Institute</option>
					<option value="naturopathy-expert">Naturopathy Expert</option>
					<option value="indian-numerologist">Numerologist » Indian Numerologist</option>
					<option value="western-numerologist">Numerologist » Western Numerologist</option>
					<option value="palmist">Palmist » Palm Reader</option>
					<option value="pastlife-regression-expert">Pastlife Regression Expert</option>
					<option value="holistic-preacher">Preacher</option>
					<option value="reiki-healer">Reiki Healer</option>
					<option value="spiritual-councellor">Spiritual Councellor</option>
					<option value="tarot-reader">Tarot Reader</option>
					<option value="commercial-vastu-expert">Vastu » Commercial Vastu Expert</option>
					<option value="home-vastu-expert">Vastu » Home/Domestic Vastu Expert</option>
					<option value="industrial-vastu-expert">Vastu » Industrial Vastu Expert</option>
					<option value="interior-vastu-expert">Vastu » Interior Vastu Expert</option>
					<option value="pyramid-vastu-expert">Vastu » Pyramid Vastu Expert</option>
					<option value="town-vastu-expert">Vastu » Town Vastu Expert</option>
					<option value="yoga-trainer">Yoga Trainer</option>				
					
					</select>
                      
                   
                    </div>
                   
                   
                    </div>
                     
                    <div class="form-group row">
                        
                    <label for="example-text-input" class="col-2 col-form-label">Login Password</label>
                    <div class="col-3">
                    <input class="form-control"  name="password" type="password" size="75" maxlength="125" placeholder="Enter Login Password" >
                    </div>
                    
                     <label for="example-text-input" class="col-2 col-form-label">Name</label>
                    <div class="col-4">
                    <input class="form-control" type="text" name="name"   size="40" maxlength="100"  autocomplete="on" placeholder="Enter Name">
                    </div>
                    
                    
                    </div>
               
                    
                      
                    <div class="form-group row">
                    <label for="example-text-input" class="col-2 col-form-label">Oragnisation Name</label>
                    <div class="col-9">
                    <input class="form-control" type="text" name="organisation"  autocomplete="on" placeholder="Enter Oragnisation Name" >
                    </div>
                    </div>
                    
                    
                    <div class="form-group row">
                     <label for="example-text-input" class="col-2 col-form-label"><strong>Office Address:</strong></label> <br>  
                    
                    </div>
                    
                    <div class="form-group row">
                   
                    <label for="example-text-input" class="col-2 col-form-label">Street Address</label>
                    <div class="col-3">
                    <input class="form-control" type="text" name="add1"  autocomplete="on" placeholder="Enter Street Address" >
                    </div>
                    
                    <label for="example-text-input" class="col-2 col-form-label">Address Line 2</label>
                    <div class="col-4">
                    <input class="form-control" type="text" name="add2"  autocomplete="on" placeholder="Enter Address Line 2" >
                    </div>
                    </div>
                    
                    <div class="form-group row">
                   
                    <label for="example-text-input" class="col-2 col-form-label">City</label>
                    <div class="col-3">
                    <input class="form-control" type="text" name="add3" placeholder="Enter City" >
                    </div>
                    
                    <label for="example-text-input" class="col-2 col-form-label">State</label>
                    <div class="col-4">
                    <input class="form-control" type="text" name="add4"  autocomplete="on" placeholder="Enter State" >
                    </div>
                    </div> 
                    
                    
                    
                    <div class="form-group row">
                   
                    <label for="example-text-input" class="col-2 col-form-label">Pincode/Zip</label>
                    <div class="col-3">
                    <input class="form-control" type="text" name="add5"  autocomplete="on" placeholder="Enter Pincode/Zip" >
                    </div>
                    
                    <label for="example-text-input" class="col-2 col-form-label">Country</label>
                    <div class="col-4">
                   <select id="add6" name="add6" class="form-control">
						<option value="Afghanistan">Afghanistan</option>
						<option value="Albania">Albania</option>
						<option value="Algeria">Algeria</option>
						<option value="Andorra">Andorra</option>
						<option value="Angola">Angola</option>
						<option value="Antigua and Barbuda">Antigua and Barbuda</option>
						<option value="Argentina">Argentina</option>
						<option value="Armenia">Armenia</option>
						<option value="Australia">Australia</option>
						<option value="Austria">Austria</option>
						<option value="Azerbaijan">Azerbaijan</option>
						<option value="Bahamas">Bahamas</option>
						<option value="Bahrain">Bahrain</option>
						<option value="Bangladesh">Bangladesh</option>
						<option value="Barbados">Barbados</option>
						<option value="Belarus">Belarus</option>
						<option value="Belgium">Belgium</option>
						<option value="Belize">Belize</option>
						<option value="Benin">Benin</option>
						<option value="Bermuda">Bermuda</option>
						<option value="Bhutan">Bhutan</option>
						<option value="Bolivia">Bolivia</option>
						<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
						<option value="Botswana">Botswana</option>
						<option value="Brazil">Brazil</option>
						<option value="Brunei">Brunei</option>
						<option value="Bulgaria">Bulgaria</option>
						<option value="Burkina Faso">Burkina Faso</option>
						<option value="Burundi">Burundi</option>
						<option value="Cambodia">Cambodia</option>
						<option value="Cameroon">Cameroon</option>
						<option value="Canada">Canada</option>
						<option value="Cape Verde">Cape Verde</option>
						<option value="Central African Republic">Central African Republic</option>
						<option value="Chad">Chad</option>
						<option value="Chile">Chile</option>
						<option value="China">China</option>
						<option value="Colombia">Colombia</option>
						<option value="Comoros">Comoros</option>
						<option value="Congo">Congo</option>
						<option value="Costa Rica">Costa Rica</option>
						<option value="Côte d Ivoire">Côte d Ivoire</option>
						<option value="Croatia">Croatia</option>
						<option value="Cuba">Cuba</option>
						<option value="Cyprus">Cyprus</option>
						<option value="Czech Republic">Czech Republic</option>
						<option value="Denmark">Denmark</option>
						<option value="Djibouti">Djibouti</option>
						<option value="Dominica">Dominica</option>
						<option value="Dominican Republic">Dominican Republic</option>
						<option value="East Timor">East Timor</option>
						<option value="Ecuador">Ecuador</option>
						<option value="Egypt">Egypt</option>
						<option value="El Salvador">El Salvador</option>
						<option value="Equatorial Guinea">Equatorial Guinea</option>
						<option value="Eritrea">Eritrea</option>
						<option value="Estonia">Estonia</option>
						<option value="Ethiopia">Ethiopia</option>
						<option value="Fiji">Fiji</option>
						<option value="Finland">Finland</option>
						<option value="France">France</option>
						<option value="Gabon">Gabon</option>
						<option value="Gambia">Gambia</option>
						<option value="Georgia">Georgia</option>
						<option value="Germany">Germany</option>
						<option value="Ghana">Ghana</option>
						<option value="Greece">Greece</option>
						<option value="Grenada">Grenada</option>
						<option value="Guatemala">Guatemala</option>
						<option value="Guinea">Guinea</option>
						<option value="Guinea-Bissau">Guinea-Bissau</option>
						<option value="Guyana">Guyana</option>
						<option value="Haiti">Haiti</option>
						<option value="Honduras">Honduras</option>
						<option value="Hong Kong">Hong Kong</option>
						<option value="Hungary">Hungary</option>
						<option value="Iceland">Iceland</option>
						<option value="India" selected="selected">India</option>
						<option value="Indonesia">Indonesia</option>
						<option value="Iran">Iran</option>
						<option value="Iraq">Iraq</option>
						<option value="Ireland">Ireland</option>
						<option value="Israel">Israel</option>
						<option value="Italy">Italy</option>
						<option value="Jamaica">Jamaica</option>
						<option value="Japan">Japan</option>
						<option value="Jordan">Jordan</option>
						<option value="Kazakhstan">Kazakhstan</option>
						<option value="Kenya">Kenya</option>
						<option value="Kiribati">Kiribati</option>
						<option value="North Korea">North Korea</option>
						<option value="South Korea">South Korea</option>
						<option value="Kuwait">Kuwait</option>
						<option value="Kyrgyzstan">Kyrgyzstan</option>
						<option value="Laos">Laos</option>
						<option value="Latvia">Latvia</option>
						<option value="Lebanon">Lebanon</option>
						<option value="Lesotho">Lesotho</option>
						<option value="Liberia">Liberia</option>
						<option value="Libya">Libya</option>
						<option value="Liechtenstein">Liechtenstein</option>
						<option value="Lithuania">Lithuania</option>
						<option value="Luxembourg">Luxembourg</option>
						<option value="Macedonia">Macedonia</option>
						<option value="Madagascar">Madagascar</option>
						<option value="Malawi">Malawi</option>
						<option value="Malaysia">Malaysia</option>
						<option value="Maldives">Maldives</option>
						<option value="Mali">Mali</option>
						<option value="Malta">Malta</option>
						<option value="Marshall Islands">Marshall Islands</option>
						<option value="Mauritania">Mauritania</option>
						<option value="Mauritius">Mauritius</option>
						<option value="Mexico">Mexico</option>
						<option value="Micronesia">Micronesia</option>
						<option value="Moldova">Moldova</option>
						<option value="Monaco">Monaco</option>
						<option value="Mongolia">Mongolia</option>
						<option value="Montenegro">Montenegro</option>
						<option value="Morocco">Morocco</option>
						<option value="Mozambique">Mozambique</option>
						<option value="Myanmar">Myanmar</option>
						<option value="Namibia">Namibia</option>
						<option value="Nauru">Nauru</option>
						<option value="Nepal">Nepal</option>
						<option value="Netherlands">Netherlands</option>
						<option value="New Zealand">New Zealand</option>
						<option value="Nicaragua">Nicaragua</option>
						<option value="Niger">Niger</option>
						<option value="Nigeria">Nigeria</option>
						<option value="Norway">Norway</option>
						<option value="Oman">Oman</option>
						<option value="Pakistan">Pakistan</option>
						<option value="Palau">Palau</option>
						<option value="Palestine">Palestine</option>
						<option value="Panama">Panama</option>
						<option value="Papua New Guinea">Papua New Guinea</option>
						<option value="Paraguay">Paraguay</option>
						<option value="Peru">Peru</option>
						<option value="Philippines">Philippines</option>
						<option value="Poland">Poland</option>
						<option value="Portugal">Portugal</option>
						<option value="Puerto Rico">Puerto Rico</option>
						<option value="Qatar">Qatar</option>
						<option value="Romania">Romania</option>
						<option value="Russia">Russia</option>
						<option value="Rwanda">Rwanda</option>
						<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
						<option value="Saint Lucia">Saint Lucia</option>
						<option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
						<option value="Samoa">Samoa</option>
						<option value="San Marino">San Marino</option>
						<option value="Sao Tome and Principe">Sao Tome and Principe</option>
						<option value="Saudi Arabia">Saudi Arabia</option>
						<option value="Senegal">Senegal</option>
						<option value="Serbia and Montenegro">Serbia and Montenegro</option>
						<option value="Seychelles">Seychelles</option>
						<option value="Sierra Leone">Sierra Leone</option>
						<option value="Singapore">Singapore</option>
						<option value="Slovakia">Slovakia</option>
						<option value="Slovenia">Slovenia</option>
						<option value="Solomon Islands">Solomon Islands</option>
						<option value="Somalia">Somalia</option>
						<option value="South Africa">South Africa</option>
						<option value="Spain">Spain</option>
						<option value="Sri Lanka">Sri Lanka</option>
						<option value="Sudan">Sudan</option>
						<option value="Suriname">Suriname</option>
						<option value="Swaziland">Swaziland</option>
						<option value="Sweden">Sweden</option>
						<option value="Switzerland">Switzerland</option>
						<option value="Syria">Syria</option>
						<option value="Taiwan">Taiwan</option>
						<option value="Tajikistan">Tajikistan</option>
						<option value="Tanzania">Tanzania</option>
						<option value="Thailand">Thailand</option>
						<option value="Togo">Togo</option>
						<option value="Tonga">Tonga</option>
						<option value="Trinidad and Tobago">Trinidad and Tobago</option>
						<option value="Tunisia">Tunisia</option>
						<option value="Turkey">Turkey</option>
						<option value="Turkmenistan">Turkmenistan</option>
						<option value="Tuvalu">Tuvalu</option>
						<option value="Uganda">Uganda</option>
						<option value="Ukraine">Ukraine</option>
						<option value="United Arab Emirates">United Arab Emirates</option>
						<option value="United Kingdom">United Kingdom</option>
						<option value="United States">United States</option>
						<option value="Uruguay">Uruguay</option>
						<option value="Uzbekistan">Uzbekistan</option>
						<option value="Vanuatu">Vanuatu</option>
						<option value="Vatican City">Vatican City</option>
						<option value="Venezuela">Venezuela</option>
						<option value="Vietnam">Vietnam</option>
						<option value="Yemen">Yemen</option>
						<option value="Zambia">Zambia</option>
						<option value="Zimbabwe">Zimbabwe</option>
					</select>
                    
                   
                    </div>
                    </div> 
                    
                   <hr> 
                     <div class="form-group row">
                   
                    <label for="example-text-input" class="col-2 col-form-label">Consultation Fee(in INRS)</label>
                    <div class="col-3">
                    <input class="form-control" name="cfee" type="text" value="FREE" autocomplete="on">
                    </div>
                    
                    <label for="example-text-input" class="col-2 col-form-label">Availability for Appontment</label>
                    <div class="col-4">
                    <input class="form-control" type="time" name="usr_time" value="13:45:00" >
                    </div>
                    </div> 
                    
                    
                    <div class="form-group row">
                   
                    <label for="example-text-input" class="col-2 col-form-label">Website</label>
                    <div class="col-3">
                    <input class="form-control" name="website" type="text"  placeholder="https://demo.com" >
                    </div>
                    
                    <label for="example-text-input" class="col-2 col-form-label">Office Phone</label>
                    <div class="col-4">
                    <input class="form-control" id="ophone" name="ophone" type="text" placeholder="Office Phone" >
                    </div>
                    </div> 
                    
                  
                    <div class="form-group row">
                   
                    <label for="example-text-input" class="col-1 col-form-label">Mobile</label>
                    <div class="col-2">
                    <input class="form-control" name="cphone" type="text"  placeholder="Enter Mobile" >
                    </div>
                    
                    <label for="example-text-input" class="col-1 col-form-label">Fax</label>
                    <div class="col-2">
                    <input class="form-control" name="fax" type="text"  placeholder="Enter Fax" >
                    </div>
                    
                    
                    <label for="example-text-input" class="col-1 col-form-label">Date</label>
                    <div class="col-4">
                    <input class="form-control" type="date" name="date"  >
                    </div>
                    </div> 
                    <div class="form-group row">
                     <label for="example-text-input" class="col-2 col-form-label"><strong>Expertise Fields:</strong></label> 
  
                    </div>
                    <div class="col-12" style="align:center">
                         <table width="100%" border="0" cellspacing="10" cellpadding="2" class="subtext">
			           <tbody><tr>
		                <td width="33%"><input id="e1" name="e[]" type="checkbox" value="Astrologer"> Astrology</td>
		                <td width="33%"><input id="e2" name="e[]" type="checkbox" value="Astrology Teacher"> Astrology Teaching</td>
		                <td width="33%"><input id="e3" name="e[]" type="checkbox" value="Numerologist"> Numerology</td>
		              </tr>
		              <tr>
		                <td><input id="e4" name="e[]" type="checkbox" value="Numerology Teacher"> Numerology Teaching</td>
		                <td><input id="e5" name="e[]" type="checkbox" value="Palmist"> Palmistry</td>
		                <td><input id="e6" name="e[]" type="checkbox" value="Palmistry Teacher"> Palmistry Teaching</td>
		              </tr>
		              <tr>
		                <td><input id="e7" name="e[]" type="checkbox" value="Vaastu Shastri"> Vaastu Shastri</td>
		                <td><input id="e8" name="e[]" type="checkbox" value="Reiki Healer"> Reiki Healing</td>
		                <td><input id="e9" name="e[]" type="checkbox" value="Tarot Card Reader"> Tarot Card Reading</td>
		              </tr>
		              <tr>
		                <td><input id="e10" name="e[]" type="checkbox" value="Face Reader"> Face Reading</td>
		                <td><input id="e11" name="e[]" type="checkbox" value="Spiritualist"> Spirituality</td>
		                <td><input id="e12" name="e[]" type="checkbox" value="Health Care"> Health Care</td>
		              </tr>
		              <tr>
		                <td><input id="e13" name="e[]" type="checkbox" value="Astrology Study Center"> Astro-Science Study Center</td>
		                <td><input id="e14" name="e[]" type="checkbox" value="Yoga Teacher"> Yoga</td>
		                <td><input id="e15" name="e[]" type="checkbox" value="Karmkand &amp; Pujari"> Karmkand &amp; Pujari</td>
		              </tr>
		              <tr>
		                <td><input id="e16" name="e[]" type="checkbox" value="Ayurvedic Vaidh"> Ayurvedic Vaidh</td>
		                <td><input id="e17" name="e[]" type="checkbox" value="Computer Horoscope Maker"> Computer Horoscope Maker</td>
		                <td><input id="e18" name="e[]" type="checkbox" value="Astrological Writer"> Astrological Writer</td>
		              </tr>
		              <tr>
		                <td><input id="e19" name="e[]" type="checkbox" value="Astrology Institute"> Astrology Institute</td>
		                <td><input id="e20" name="e[]" type="checkbox" value="Vedic Researcher"> Vedic Researches</td>
		                <td>&nbsp;</td>
		              </tr>
		              <tr>
		                <td colspan="3">Others : <input id="other" name="e[]" type="text" class="form-control" autocomplete="on"></td>
		              </tr>
		            </tbody></table>
                   
                        
                    </div>
                    <div class="form-group row">
                     <label for="example-text-input" class="col-2 col-form-label"><strong>Title(s) Holded:</strong></label>   
  
                    </div>
                    
                     <div class="col-12" style="align:center">
                        <table width="100%" border="0" cellspacing="15" cellpadding="2" class="subtext">
		              <tbody><tr>
		                <td width="25%"><input id="t0" name="t[]" type="checkbox" value="Jyotish Manishi"> Jyotish Manishi</td>
		                <td width="25%"><input id="t1" name="t[]" type="checkbox" value="Jyotish Devagya"> Jyotish Devagya</td>
		                <td width="25%"><input id="t2" name="t[]" type="checkbox" value="Jyotish Devagyacharya"> Jyotish Devagyacharya</td>
		                <td width="25%"><input id="t3" name="t[]" type="checkbox" value="Jyotish Shiromani"> Jyotish Shiromani</td>
		              </tr>
		              <tr>
		                <td><input id="t4" name="t[]" type="checkbox" value="Jyotish Chanakya"> Jyotish Chanakya</td>
		                <td><input id="t5" name="t[]" type="checkbox" value="Jyotish Tatvavetta"> Jyotish Tatvavetta</td>
		                <td><input id="t6" name="t[]" type="checkbox" value="Hastrekha Acharya"> Hastrekha Acharya</td>
		                <td><input id="t7" name="t[]" type="checkbox" value="Hastrekha Shiromani"> Hastrekha Shiromani</td>
		              </tr>
		              <tr>
		                <td><input id="t8" name="t[]" type="checkbox" value="Vastu Acharya"> Vastu Acharya</td>
		                <td><input id="t9" name="t[]" type="checkbox" value="Vastu Shiromani"> Vastu Shiromani</td>
		                <td><input id="t10" name="t[]" type="checkbox" value="Ank Shastracharya"> Ank Shastracharya</td>
		                <td><input id="t11" name="t[]" type="checkbox" value="Ank Shiromani"> Ank Shiromani</td>
		              </tr>
		              <tr>
		                <td><input id="t12" name="t[]" type="checkbox" value="LalKitab Acharya"> LalKitab Acharya</td>
		                <td><input id="t13" name="t[]" type="checkbox" value="LalKitab Shiromani"> LalKitab Shiromani</td>
		                <td><input id="t14" name="t[]" type="checkbox" value="Upaya Acharya"> Upaya Acharya</td>
		                <td><input id="t15" name="t[]" type="checkbox" value="Upaya Shiromani"> Upaya Shiromani</td>
		              </tr>
		              <tr>
		                <td colspan="3">Others : <input type="text" id="t16" name="t[]" class="form-control" autocomplete="on"></td>
		              </tr>
		            </tbody></table>  
                     </div>
                     
                     <br>
                     
                     <div class="form-group row">
                    <label for="example-text-input" class="col-1 col-form-label">Note</label>
                    <div class="col-4">
                    <textarea class="form-control" name="note" type="text" rows="2"></textarea>
                    </div>
                    
                    <label for="example-text-input" class="col-1 col-form-label">Image</label>
                    <div class="col-3">
                    <input class="form-control" type="file" name="image" multiple >
                    </div>
                    </div>
                     
                      
                        <input class="btn btn-primary col-2" type="submit" name="all" value="ADD JOTISH"/>
                    
                     </form>
        
          </div>
        </div>
        
      </div>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Your Website 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="logout1.php">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>
