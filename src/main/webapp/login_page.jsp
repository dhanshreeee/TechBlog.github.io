<%@page import="org.apache.el.parser.AstDiv"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.tech.blog.entities.Message" %>    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 92%, 75% 100%, 31% 90%, 0 97%, 0 0);
}


</style>
</head>
<body>
<!-- Navbar -->
<%@include file="normal_navbar.jsp" %>

<main class="d-flex align-items-center primary-background banner-background" style="height: 50 vh">
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card " style="margin-bottom: 50px">
<div class="card-header primary-background text-white text-center">
<span class="fa fa-user-plus fa-3x"></span>
<br>
<p>Login Here</p>
</div>
<div class="card-body">

<form action="LoginServlet" method="POST">
   <%  Message msg = (Message)session.getAttribute("message");
   
       if(msg!=null){   %>
    	   
              <div class="alert <%= msg.getCssClass() %>" >
               <%= msg.getContent() %>
              </div>
       <%
       
       }
       
       session.removeAttribute("message");
       %>
   



  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>

<div class="container text-center ">
  <button type="submit" class="btn primary-background text-light">Submit</button>

</div>
</form>

</div>
<!-- <div class="card-footer">

</div>
 -->
</div>

</div>
</div>

</div>

</main>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>