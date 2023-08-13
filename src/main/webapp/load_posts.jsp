<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>

<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.entities.User" %>

<div class="row">
<%

   User curUser = (User)session.getAttribute("currentUser");
   PostDao pdao = new PostDao(ConnectionProvider.getConnection());

   ArrayList<Post> posts =null;
   
   int cid= Integer.parseInt(request.getParameter("cid"));
   
   if(cid==0){
	   posts = pdao.getAllPosts();
   }
   else{
	   
	   posts = pdao.getPostsByCatid(cid);
   }
   if(posts.size()==0){
	   out.println("<h4 class=\"display-3 text-center\"> No posts in the category</h4>");
   }
   for(Post p: posts){
	/*    int postId = Integer.parseInt(request.getParameter("post_id"));
	  LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
	      int count= ldao.countLikesOnPost(postId);
	   */
	  
	   %>
	   
	 <div class="col-md-6 mt-2">
	 
	 <div class="card" style="width: 16rem; height: 5  rem;" >
	 <img   style="width: 16rem; height: 200px;" class="card-img-top" src="img/blog_pics/<%= p.getpPic()%>" alt="Card image cap">
	 <div class="card-body">
    <h5 class="card-title"><%= p.getpTitle()%></h5>
        <p class="card-text"><%=p.getpContent() %></p>
      </div>
      

     <% LikeDao ld = new LikeDao(ConnectionProvider.getConnection()); %>
     <div class="card-footer primary-background">
      <a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm"> Read More</a>
   <a href="#" onclick="doLike(<%= p.getPid() %>, <%= curUser.getId() %>)"  class="btn btn-outline-light btn-sm"> <i class="fa fa-solid fa-thumbs-up"></i> <span class="like-counter"><%= ld.countLikesOnPost(p.getPid())%></span> </a>      
  <a href="#" class="btn btn-outline-light btn-sm"> <i class= "fa fa-solid fa-comments"></i> <span>20</span> </a>
     </div>
	 </div>
	 </div>  
<%

   } 
   
   %>   </div>
  




