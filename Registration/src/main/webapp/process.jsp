<%@ page language="java" import="java.sql.*"%>

<%

    String name = request.getParameter("uname");

    String pass = request.getParameter("upass");

    try {

    	Class.forName("com.mysql.cj.jdbc.Driver");
    	
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employee", "root", "root");

        PreparedStatement ps = con.prepareStatement("select * from userdata where name=? and password=?");

        ps.setString(1, name);

        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        int x = 0;

        while (rs.next()) {

            if (rs.getString(1).equals(name) && rs.getString(2).equals(pass)) {

                x = 1;

            } else {

                x = 2;

            }
        }
            %>
            
           <%
           
           if(x == 1){
        	   PreparedStatement ps1 = con.prepareStatement("update userdata set flag=? where name=?");
        	   ps1.setInt(1,1);
        	   ps1.setString(2,name);
        	   int num = ps1.executeUpdate();
        	   session.setAttribute("name", name);
        	   RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
        	   rd.forward(request,response);
           }else{
        	   RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
        	   rd.forward(request,response);
           }
    } catch(Exception e){
    	e.printStackTrace();
    }
           %>

       
