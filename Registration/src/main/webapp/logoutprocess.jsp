<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" import="java.sql.*"%>
<html><body bgcolor="#ECF0F1">

        <%
       try{
    	   String name = (String)session.getAttribute("name");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "root");
    	   PreparedStatement ps2 = con.prepareStatement("update userdata set flag=? where name=?");
    	   ps2.setInt(1,0);
    	   ps2.setString(2,name);
     	   int num = ps2.executeUpdate();
     	   session.invalidate();
       }catch(Exception e){
    	   e.printStackTrace();
       }
      

        %>

        <h1><font color="Blue">You are Successfully logged out...</font></h1>

        <a href="home.jsp">Go-Back To Home Page</a>

    </body>

</html>