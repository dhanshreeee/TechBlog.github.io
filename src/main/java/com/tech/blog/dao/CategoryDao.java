package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Category;

public class CategoryDao {

	Connection con;
	
	
	public CategoryDao(Connection con) {
		this.con=con;
	}
	
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> categories = new ArrayList<Category>();
		
		String query = "Select * from categories";
		try {
		Statement st =  con.createStatement();
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			
	        int cid= rs.getInt(1);
	        String name = rs.getString(2);
	        String desciption = rs.getString(3);
	        Category c = new Category(cid, name , desciption);
	        categories.add(c);
			
		}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return categories;
		
	}
	
	
	
}
