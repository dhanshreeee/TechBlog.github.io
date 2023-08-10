<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Sorry! Something went wrong </title>

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
<div class="container text-center " style="margin-top: 30px">

<img class="img-fluid" src="img/error.png">
<h3 class="display-3">Sorry ! Something went wrong</h3>
<%= exception %>
<a href="index.jsp" class="btn primary-background btn-lg text-white">Home</a>
</div>

</body>
</html>