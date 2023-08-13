package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;


public class UserDao {
	
	private Connection con;
	
	
	public UserDao(Connection con) {
	this.con  = con;
	
	}
	
	//method to insert user to database
	public boolean saveUser(User user) {
		boolean f= false;
		try {
			
			String query  = "insert into user(name, email, password, gender, about) values(?,?,?,?,?)";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getGender());
			psmt.setString(5, user.getAbout());
			
			psmt.executeUpdate();
			f= true;
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		return f;
		
		
	}
	
	public User getUserByEmail(String email, String password) {
		User u= null;
		
		String q = "Select * from user where email=? and password=?";
		ResultSet rs;
		try {
			PreparedStatement psmt = con.prepareStatement(q);
			psmt.setString(1, email);
			psmt.setString(2, password);
			 rs = psmt.executeQuery();
			 
			 if (rs.next()){
				 u = new User();
				 u.setName(rs.getString("name"));
				 u.setId(rs.getString("id"));
				 u.setEmail(rs.getString("email"));
				 u.setGender(rs.getString("gender"));
				 u.setAbout(rs.getString("about"));
				 u.setPassword(rs.getString("password"));
				 u.setDatetime(rs.getTimestamp("regdate"));
				 u.setProfile(rs.getString("profile"));
				 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
		
		

		
	}
	
	
	
	public boolean updateUser(User u) {
		
		boolean f = false;
		
		String query = "update user set name= ?, email=?, password=?, gender=?, about=?, profile=? where id=?";
		try {
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setString(1, u.getName());
			psmt.setString(2, u.getEmail());
			psmt.setString(3, u.getPassword());
			psmt.setString(4, u.getGender());
			psmt.setString(5, u.getAbout());
			psmt.setString(6, u.getProfile());
			psmt.setString(7, u.getId());
			psmt.executeUpdate();
			
			f=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
		
	}


    public User getUserByUserId(int userId) {
    	
    	User u = null;
    	
    try {
		
    
    	String query = "Select * from user  where id = ?";
    	PreparedStatement psmt = con.prepareStatement(query);   	
    	psmt.setInt(1, userId);
    	ResultSet rs= psmt.executeQuery();
    	
    	while(rs.next()) {
    		u = new User();
			 u.setName(rs.getString("name"));
			 u.setId(rs.getString("id"));
			 u.setEmail(rs.getString("email"));
			 u.setGender(rs.getString("gender"));
			 u.setAbout(rs.getString("about"));
			 u.setPassword(rs.getString("password"));
			 u.setDatetime(rs.getTimestamp("regdate"));
			 u.setProfile(rs.getString("profile"));
    	}
    	
    
	} catch (Exception e) {
		
		e.printStackTrace();
		
	}
     return u; 
    }

}
