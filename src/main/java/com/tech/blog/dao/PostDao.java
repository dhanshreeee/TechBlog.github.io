package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.blog.entities.Post;

public class PostDao {
	
	Connection con;
	
	public PostDao(Connection con) {
		this.con =con;
		
	}
	
	// save post created by user to db 
	public boolean createPost(Post post) {
		boolean f = false ;
		
		String q = "Insert into posts(ptitle, pcontent, pcode,ppic, catId, userId) values(?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(q);
			
			ps.setString(1, post.getpTitle());
			ps.setString(2, post.getpContent());
			ps.setString(3, post.getpCode());
			ps.setString(4, post.getpPic());
			ps.setInt(5, post.getCatId());
			ps.setInt(6, post.getUserId());
			ps.executeUpdate();
			f= true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return f;
		
	}

	
	//get all Post 
	public ArrayList<Post> getAllPosts(){
		ArrayList<Post> al = new ArrayList<Post>();
		
		
		///fetch all Post 
		
		String query = "Select * from posts";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle= rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp timestampi= rs.getTimestamp("pdate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				
				Post p = new Post(pid,ptitle,ptitle, pcode,ppic,timestampi,catId,userId);
				al.add(p);
			}
			
			
		}
		
		
		catch (Exception e) {
			// TODO: handle exception
		}
		return al;
		
		
	}
	
	// get Posts related to a specific category
	
	public ArrayList<Post> getPostsByCatid(int CatId){
		
ArrayList<Post> al = new ArrayList<Post>();
		
		
		///fetch all Post 
		
		String query = "Select * from posts where catId = ? ";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, CatId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String ptitle= rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp timestampi= rs.getTimestamp("pdate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				
				Post p = new Post(pid,ptitle,pcontent, pcode,ppic,timestampi,catId,userId);
				al.add(p);
			}
			
			
		}
		
		
		catch (Exception e) {
			// TODO: handle exception
		}
		return al;
		
		

		
	}
	
	
	// get Post  by Post Id
	
	public Post getPostByPostId(int postid) {
		Post p=null;
		try {
			
			String query = "Select * from posts where pid=?";
			PreparedStatement psmt = con.prepareStatement(query);
			psmt.setInt(1, postid);
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle= rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp timestampi= rs.getTimestamp("pdate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				
			    p = new Post(pid,ptitle,pcontent, pcode,ppic,timestampi,catId,userId);
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return p;
	}
	
	
}
