package com.tech.blog.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ImageHelper;

/**
 * Servlet implementation class AddPostServlet
 */

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ptitle= request.getParameter("posttitle");
		String pcontent = request.getParameter("postcontent");
		String pcode = request.getParameter("postcode");
		int catId = Integer.parseInt(request.getParameter("cid"));
		Part picture = request.getPart("postpic");
		String ppic = picture.getSubmittedFileName();
		HttpSession s = request.getSession();
		User u = (User) s.getAttribute("currentUser");
		int userId = Integer.parseInt(u.getId());
		Post p = new Post(ptitle,pcontent,pcode, ppic ,catId,userId);
		
		PostDao postdao = new PostDao(ConnectionProvider.getConnection());
		if(postdao.createPost(p)) {
			
			
			String imagePath = "C:/Users/Dhanshree Rane/Documents/LEARN/JAVA_Projects/1_Project/TechBlog/src/main/webapp/img/blog_pics/"+ppic;
		    ImageHelper.saveFile(picture.getInputStream(), imagePath);
		    System.out.println("Done");
		}
		else {
			System.out.println("Error");
		}
		
		
	}

}
