package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	Connection con; 
	
	public LikeDao(Connection con ){
		this.con =con;
	}

	public boolean doLike(int userId, int postId) {
		boolean f=false;
		try {
			
			String q = "insert into liked(uid, pid) values(?,? )";
			
			PreparedStatement psmt = this.con.prepareStatement(q);
			
			psmt.setInt(1, userId);
			psmt.setInt(2, postId);
			
			
			psmt.executeUpdate();
			f=true;
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


    public int countLikesOnPost(int postId) {
    	int count =0;
    	try {
			

        	String query = "Select count(*) from liked where pid=?";
        	PreparedStatement psmt = con.prepareStatement(query);
        	psmt.setInt(1, postId);
        	ResultSet rs = psmt.executeQuery();
        	if(rs.next()) {
        		count = rs.getInt(1);
        	}
        	
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return count;
    	
    }

    
    public boolean isPostLikedByUser(int postId, int userId) {
    	
    	boolean f = false;
    	
    	
    	try {
    		
    		String query = "Select * from liked where uid=? and uid=?";
    		PreparedStatement psmt = con.prepareStatement(query);
    		psmt.setInt(1, userId);
    		psmt.setInt(2, postId);
    		ResultSet rs = psmt.executeQuery();
    		if(rs.next()) {
    			f= true;
    		}
    		
    	}
    	
    	catch(Exception e) {
    		
    		e.printStackTrace();
    	}
    	return f;
    	
    }
}
