<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	if (session.getAttribute("username") == null)
	response.sendRedirect("./attack3");
  %>
<!DOCTYPE html>
<html lang="en">
  <!-- Basic -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <!-- Site Metas -->
  <title>Home</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- Site Icons -->
  <link rel="shortcut icon" href="JR/images/favicon.png" type="image/x-icon" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="JR/css/bootstrap.min.css">
  <!-- Site CSS -->
  <link rel="stylesheet" href="JR/style.css">
  <!-- Responsive CSS -->
  <link rel="stylesheet" href="JR/css/responsive.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="JR/css/custom.css">
  <!-- Modernizer for Portfolio -->
  <script src="JR/js/modernizer.js"></script>
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  </head>
  <body>
    <!-- LOADER -->
    <div id="preloader">
      <div class="loader">
        <div class="loader__bar"></div>
        <div class="loader__bar"></div>
        <div class="loader__bar"></div>
        <div class="loader__bar"></div>
        <div class="loader__bar"></div>
        <div class="loader__ball"></div>
      </div>
    </div>
    <!-- end loader -->
    <!-- END LOADER -->
    
    
    <div class="slider-area">
      <div class="slider-wrapper owl-carousel">
        <div class="slider-item text-center home-one-slider-otem slider-item-four slider-bg-one">
          <div class="container">
            <div class="row">
              <div class="slider-content-area">
                <div class="slide-text">
                  <h2>WELCOME TO Data Security</h2>
                  <h1 class="homepage-three-title">The Internet of <span>Blockchains</span></h1>
                  <h2>JRupy is a Fastest Growing ecofriendly system of interconnected apps and services, made with green technology. Designed to provide no cost transactions throughout the world. </h2>
                  <!-- <div class="slider-content-btn">
                    <a class="button btn btn-light btn-radius btn-brd" href="#">Read More</a>
                    <a class="button btn btn-light btn-radius btn-brd" href="#">Contact</a>
                    </div> -->
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
      </div>
    </div>
    
    <!-- end copyrights -->
    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
    <!-- ALL JS FILES -->
    <script src="JR/js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="JR/js/custom.js"></script>
    <!-- <script src="js/portfolio.js"></script>
    <script src="js/hoverdir.js"></script>  -->   
  </body>
</html>