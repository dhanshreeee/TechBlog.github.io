<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<html>

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<title>Index</title>
<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 92%, 75% 100%, 31% 90%, 0 97%, 0 0);
}


</style>
</head>
<body>

<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>

<!-- banner -->
<div class="container-fluid m-0 p-0">
<div class="jumbotron primary-background text-white banner-background">
<div class=container>

<h3 class="display-3">Welcome to TechBlog!!!</h3>

<p>Welcome to technical blog, world of technology</p>
<br>
<p>Welcome to technical blog, world of technology</p>
<br>
<a class="btn btn-outline-light btn-lg"><span class=" fa fa-external-link"></span>Start Its Free!!</a>
<a  href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-sign-in"></span>Login</a>
</div>

</div>
</div>

<div class="container">
<div class="row mb-2">



<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
</div>

<div class="row">

<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
<div class="col-md-4">
<div class="card" style="width: 18rem;">
 
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
</div>



</div>
</div>
</div>
</div>



<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- <script type="text/javascript">

$(document).ready(function(){
	alert("document loaded")
})
</script> -->

</body>
</html>
