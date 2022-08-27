<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
try {
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "root");
	 PreparedStatement ps = con.prepareStatement("insert into userdata values (?,?,?,?,?)");
	 ps.setString(1, name);
	 ps.setString(2, pass);
	 ps.setString(3, email);
	 ps.setString(4, mobile);
	 ps.setInt(5, 0);
	 int no = ps.executeUpdate();
	 out.println("Thank you for register ! Please <a href='home.jsp'>Login</a> to continue.");
} catch (Exception e) {
 System.out.print(e);
 e.printStackTrace();
}
%>