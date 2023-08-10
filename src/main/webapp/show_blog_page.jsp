<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.dao.CategoryDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tech.blog.entities.Message, java.util.*" %>        
<%@page import="com.tech.blog.entities.User" errorPage="error_page.jsp" %>       
<%

User user= (User)session.getAttribute("currentUser");
if(user==null){
	
	response.sendRedirect("login_page.jsp");
	
}  

//Getting  post object with postId

int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao pdao = new PostDao(ConnectionProvider.getConnection());

Post p = pdao.getPostByPostId(postId);

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle() %></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 92%, 75% 100%, 31% 90%, 0 97%, 0 0);
}

.post-content{
font-weight: 100;
font-size: 20px;

}

.post-date{

font-weight: bold;
font-style: italic;
}

.post-user-info{
font-size: 20px;

}

body{
 background: url(img/postbg.jpg);
  
  background-size: cover;
}
</style>


</head>


<body>

<!-- Start of nav bar -->
<nav class="navbar navbar-expand-lg navbar-light primary-background">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span> TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"> <span class="fa fa-code"></span>Learn To Code <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class=" 	fa fa-check-circle"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
 </li>
  <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#createPostModal" ><span class="fa fa-address-card-o"></span> Create Post  </a>
 </li>
    </ul>
    
    <ul class="navbar-nav mr-right text-dark">
    
    <li class="nav-item">
     <a class="nav-link" href="#!" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
    </li>
    <li class="nav-item">
     <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
    </li>
    </ul>
  </div>
</nav>


<!-- End of navbar -->

<!-- Edit Profile Modal  Start -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        
       <img src="profilepics/<%=user.getProfile() %> " class="img-fluid"/>
        <h5 class="modal-title" id="exampleModalLabel"> <%=user.getName()%></h5>
        
         
         <!-- Details -->
         <div id="profile-details">
         <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%= user.getId() %> </td>
      
    </tr>
    <tr>
      <th scope="row">Email: </th>
            <td>  <%= user.getEmail()%></td>
      
          </tr>
    <tr>
      <th scope="row">Gender: </th>
      <td><%= user.getGender()%></td>
   
    </tr>
       
       <tr>
      <th scope="row">Status: </th>
      <td><%= user.getAbout()%></td>
   
    </tr>
     <tr>
      <th scope="row">Account Created On: </th>
      <td><%= user.getDatetime().toString()%></td>
      
   
    </tr>
  </tbody>
</table>
      
      </div>
      <!--profile edit  -->
      <div id="profile-edit" style="display: none">
      <h3 class="mt-2">Please edit carefully</h3>
      <form action="EditServlet" method="POST" enctype="multipart/form-data">
      <table class="table">
      <tbody>
      <tr>
       <th>ID : </th>
      <td><%=user.getId() %></td>
      </tr>
           <tr>
           <th>Email</th>
           <td><input class="form-control" name="user_email" type="email" placeholder="Add Updated Email" value="<%=user.getEmail() %>"/>  </td>
           </tr>
      
           <tr>
           <th>Password</th>
           <td><input class="form-control" name="user_password" type="password" placeholder="Add updated password" value="<%= user.getPassword()%>"/> </td>
           
           </tr>
           
           <tr>
           <th>Name</th>
           <td><input class="form-control" name="user_name" type="text" placeholder="Add updated name" value="<%=user.getName() %>"/> </td>
           </tr>
           
           <tr>
           <th>About</th>
           <td><input class="form-control" name="user_about" type="text" value="<%=user.getAbout() %>"> </td>
           </tr>
            <tr>
           <th>Gender</th>
           <td><%=user.getGender()%></td>
           
           </tr>
           <tr>
           <th>New Profile: </th>
           <td><input type="file" name="user_image" class="form-control" value="<%=user.getProfile() %>>"/> </td>
           </tr>
      </tbody>
      
      </table>
      <div class="container">
      <button type="submit" class="btn btn-outline-primary"> Save</button>
      </div>
      </form>
      </div>
      </div>
       </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button  id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<!-- Edit Profile Modal end  -->


<!-- Create Post Modal start  -->

<div class="modal fade" id="createPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="AddPostServlet" method="POST" enctype="multipart/form-data">
       
       <div class="form-group">
       <select class="form-control" name="cid">
      
         <option selected disabled>--Select category--</option>
         
          <%  CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection());
           ArrayList<Category> categories = dao.getAllCategories();
           
           for(Category c: categories)
           
           {
        	    %>
       
         <option value="<%=c.getCid()%>"><%= c.getName() %></option>
       
       <%
              }
       %>
       </select>
       
       </div>
       <div class="form-group">
       <input name="posttitle" type="text" placeholder="Enter post title" class="form-control"/>
       </div>
       <div class="form-group" >
       <textarea name="postcontent" rows="5" placeholder="Enter Content" class="form-control" style="height: 150px"></textarea>
       </div>
         <div class="form-group" >
       <textarea name="postcode" rows="5" placeholder="Enter Code(If Any)" class="form-control" style="height: 150px"></textarea>
       </div>
      <div class="form-group" >
        <label for="postimage"> Image : </label>
        <br>
         <input name="postpic" type="file" id="postimage">
       </div>
       <div class="container text-center">
        <button type="submit" class=" btn btn-info"> Post </button>
       </div>
       </form>
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
<!-- Create Post Modal end  -->


<!-- Main content of show_blog_page Page -->
  <div class="container">
  
  <div class="row mt-2">
  <div class="col-md-8 offset-md-2">
  <div class="card ">
  <div class="card-header primary-background text-light">
  
    <h4 class="post-title" ><%= p.getpTitle() %> </h4>
  </div>
    <div class="card-body">
  	 <img   style="width: 16rem; height: 200px;" class="card-img-top" src="img/blog_pics/<%= p.getpPic()%>" alt="Card image cap">
  
  <div class="row my-3">
  <div class="col-md-8">
     <p class="post-user-info"> <a href="#"> Durgesh Towari</a>  has Posted: </p>
  </div>
  <div class="col-md-4">
  <p  class="post-date"><%=p.getpDate().toLocaleString() %> </p>
  </div>
  </div>
    <p class="post-content"> <%= p.getpContent() %> </p>
  
  <br>
  <br>
  <div class="post-code" >
    <pre><%=p.getpCode() %> </pre>
    
    </div>
  </div>
  
  <div class="card-footer primary-background">
  <a href="#" class="btn btn-outline-light btn-sm"> <i class="fa fa-solid fa-thumbs-up"></i> <span>10</span> </a>      
  <a href="#" class="btn btn-outline-light btn-sm"> <i class= "fa fa-solid fa-comments"></i> <span>20</span> </a>
       
  </div>
  </div>
  </div>
  </div>
  </div>


<!-- End of Main content of show_blog_page Page -->


<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){

	let editStatus=false
	
	$('#edit-profile-button').click(function(){
		if(editStatus==false){
		$('#profile-details').hide()
		$('#profile-edit').show()
		editStatus=true
		$(this).text("Back")
		}
		else{
			$('#profile-details').show()
			$('#profile-edit').hide()
			editStatus=false
			$(this).text("Edit")
		}
	})
});
</script>



</body>
</html>