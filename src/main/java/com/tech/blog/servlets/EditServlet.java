package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.ImageHelper;

/**
 * Servlet implementation class EditServlet
 */

@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//fetch all data
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		String userName = request.getParameter("user_name");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("user_image");
		String imageName = part.getSubmittedFileName();
		System.out.println(imageName.isEmpty());
	    Boolean imageUpdated=true;
		
		//get currentuser  object  from session 
	
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		
		//Set new field values to the user object
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setName(userName);
		user.setAbout(userAbout);
		String oldimagefilename = user.getProfile();
		System.out.println("Old file  name: "+oldimagefilename);
		if(!imageName.isEmpty()) {
			user.setProfile(imageName);

		}
		else {
			user.setProfile("default.png");
			imageUpdated=false;
		}
		
		//update database
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		boolean  updated = dao.updateUser(user);
		if(updated) {
			
			//String path = request.getRealPath("/")+"profilepics"+File.separator+user.getProfile();
		String path = "C:/Users/Dhanshree Rane/Documents/LEARN/JAVA_Projects/1_Project/TechBlog/src/main/webapp" + "/profilepics"+ File.separator + user.getProfile();
		//	response.getWriter().println("path: " + path);
			
		
	    //delete code 
	      String pathOldFile = "C:/Users/Dhanshree Rane/Documents/LEARN/JAVA_Projects/1_Project/TechBlog/src/main/webapp" + "/profilepics"+ File.separator + oldimagefilename;
			
	      if(!oldimagefilename.equals("default.png")) {
			boolean delFile= ImageHelper.deleteFile(pathOldFile);
	      }
		
	     
	      if(imageUpdated) {
			if (ImageHelper.saveFile(part.getInputStream(), path)) {
			
			    Message m = new Message("Profile pic updated", "success", "alert-success");
				s.setAttribute("message", m);
				
				
			}
			
			else {
				 Message m = new Message("Something went wrong", "error", "alert-danger");
					s.setAttribute("message", m);
									
			}
				
           
	      }
			
		}
		else {
			//response.getWriter().println("not updated...");
			 Message m = new Message("Something went wrong", "error", "alert-danger");
				s.setAttribute("message", m);
				
			
		}
		
		
		 response.sendRedirect("profile.jsp");
				
	}

}
