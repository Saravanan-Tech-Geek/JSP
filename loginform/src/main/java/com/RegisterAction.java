package com;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAction extends Action {
   @Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
	   int id = Integer.parseInt(request.getParameter("uid"));
	   String name = request.getParameter("uname");
	   String pass = request.getParameter("upass");
	   int flag = Integer.parseInt(request.getParameter("flag"));
	   
	   DBCon dbcon = new DBCon();
	   int num = dbcon.register(id, name, pass, flag);
	   if(num == 1) {
		   return "register.success";
	   }else {
		   return "register.failure";
	   }
	}
}
