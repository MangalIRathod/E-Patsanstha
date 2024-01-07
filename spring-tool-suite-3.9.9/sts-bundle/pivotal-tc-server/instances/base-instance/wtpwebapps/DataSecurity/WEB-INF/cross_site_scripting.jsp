<!DOCTYPE html>
<html lang="zxx">
  <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>User Login</title>
    
    
    <link rel="stylesheet" href="../css/style1.css" />
    <script src="../css/app.js" defer></script>
    
  </head>
  <body class="crm_body_bg">
    <div class="container mt-3">
      <div class="row justify-content-center">
        <div class="col-lg-12">
        
        	

          <section id="user-input">
          
            	<center><h2>Cross Site Scripting</h2></center>
            
      <form>
        <div class="form-control">
          <label for="user-message">Your Message</label>
          <textarea id="user-message" name="user-message"></textarea>
        </div>
        <div class="form-control">
          <label for="message-image">Message Image</label>
          <input type="text" id="message-image" name="message-image" />
          <!-- 
          <img src = "C://Users//Codeft/Downloads//Firstneed Activity Admin.jpg">
           -->
        </div>
        <button type="submit">Send Message</button>
      </form>
    </section>
    <section id="user-messages">
      <ul></ul>
    </section>
    
        </div>
      </div>
    </div>
    <!-- main content part end -->
    <!-- jquery slim -->
    <script src="../js/jquery-3.4.1.min.js"></script>
    <!-- popper js -->
    <script src="../js/popper.min.js"></script>
    <!-- bootstarp js -->
    <script src="../js/bootstrap.min.js"></script>
    
    
    
  </body>
</html>