package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBCon {
	public DBCon() {
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
	 }
	
	public boolean checkUser(String uname,String upass) {
		try {
		 Connection con =	DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "root");
	     PreparedStatement ps = con.prepareStatement("select * from users where uname=? and upass=?");
	     ps.setString(1, uname);
	     ps.setString(2, upass);
	     ResultSet rs = ps.executeQuery();
	     if(rs.next()) {
	    	 return true;
	     } else {
	    	 return false;
	     }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int register(int uid,String uname,String upass,int flag) {
		try {
			 Connection con =	DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "root");
		     PreparedStatement ps = con.prepareStatement("insert into users values (?,?,?,?)");
		     ps.setInt(1, uid);
		     ps.setString(2, uname);
		     ps.setString(3, upass);
		     ps.setInt(4, flag);
		     int no = ps.executeUpdate();
		     return no;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//	public static void main(String[] args) {
//		DBCon dbcon = new DBCon();
//		int output = dbcon.register(5, "Muthu", "root", 1);
//		System.out.println("value added successfully..." + output);
//		System.out.println(dbcon.checkUser("ututu", "ihih"));
//	}
}
