package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        String checkterms = request.getParameter("check");
	
        if(checkterms==null) {
        	pw.println("Please agree to terms and conditions");
        }
        
        //if terms and conditions have been accepted then only proceed further
      
        else {
        	
        	//fetch all details from form
        	  String name  = request.getParameter("user_name");
        	  String email  = request.getParameter("user_email");
        	  String password = request.getParameter("user_password");
        	  String gender = request.getParameter("user_gender");
              String about = request.getParameter("about");
        
              //Create user and set all data to the object
              User user = new User(name, email, password, gender, about);
              UserDao dao = new UserDao(ConnectionProvider.getConnection());
        
              if(dao.saveUser(user)) {
					/* pw.println("Done"); */
            	  
            	  Message msg = new Message("Login with new credentials","success","alert-success");
            	  HttpSession s = request.getSession();
            	  s.setAttribute("message", msg);
            	  response.sendRedirect("login_page.jsp");
            	  
              }
              
              else {
            	//  pw.println("error");
            	  response.sendRedirect("error_page.jsp");
              }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
