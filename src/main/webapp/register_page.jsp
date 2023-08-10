<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page errorPage="error_page.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">

<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 92%, 75% 100%, 31% 90%, 0 97%, 0 0);
}
</style>

</head>
<body>
 <%@ include file="normal_navbar.jsp" %>

<main class="primary-background banner-background" style="padding-bottom: 80px">
<div class="container">
<div class="col-md-6 offset-md-3" >
<div class="card ">

<div class="card-header text-center primary-background">

Register Here
</div>
<div class="card-body">

<form action="RegisterServlet" method="POST">

<div class="form-group">
    <label for="user_name">Username</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Username">
   <!--  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
   <div class="form-group">
    <label for="gender">Gender</label>
    <br>
    <input type="radio"  id="gender" placeholder="Gender" name="user_gender" value="male">Male 
    <input type="radio"  id="gender" placeholder="Gender" name="user_gender" value="female">Female
  </div>
  
  <div class="form-group">
  <textarea name="about" class="form-control" rows="2" cols="30"  placeholder="Enter Something about yourself"></textarea>
  
  </div>
  
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
  </div>
  <br>
  <button type="submit" class="btn primary-background">Register</button>
</form>
</div>
<!-- <div class="card-footer">
</div>
 -->

</div>

</div>

</div>

</main>
<!-- JavaScripts -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>