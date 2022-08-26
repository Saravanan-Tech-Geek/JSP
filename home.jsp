<%@ page import="java.util.*" %>

<HTML> 

    <HEAD>

        <TITLE>Login Page</TITLE>

    </HEAD>

    <BODY >

        <form method="post" action="process.jsp">

            <center>

                <h1 style="color:blue">Welcome..!!!!</h1>

                <b style="color:blue">Login Here</b><br>

                <table bgcolor="#33FF99" style="color:#FF3333">

                    <tr><td><b>UserName</b></td> <td><input type="text" name="uname"></td></tr>

                    <tr><td><b>Password</b></td> <td><INPUT type="password" name="upass"></td></tr>

                    <tr><td><input type="submit" value="Login"></td>

                        <td><input type="reset" value="Reset"></td>

                </table>

        </form>

    </BODY>

</HTML>