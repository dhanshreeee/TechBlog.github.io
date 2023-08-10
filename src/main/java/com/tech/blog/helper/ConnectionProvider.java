package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection con;
	
	public static Connection getConnection() {
		
		try {
			if(con==null) {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url= "jdbc:mysql://localhost:3306/techblog";
			
			con= DriverManager.getConnection(url, "root","root");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return con;
		
	}
}
