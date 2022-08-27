package com;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestProcessor {
  public void process(HttpServletRequest request, HttpServletResponse response) {
	  try {
		  //first
		  ServletContext app = request.getServletContext();
		  String configpath = app.getRealPath("/WEB-INF/lib/config.properties");
		  Properties prop = new Properties();
		  prop.load(new FileInputStream(configpath));
		  
		  //second 
		  String formid = request.getParameter("formid"); 
		  String actionClassName = prop.getProperty(formid);
		  
		  Action action = (Action) Class.forName(actionClassName).newInstance();
		  String result = action.execute(request, response);
		  
		  String nextPage = prop.getProperty(result);
		  RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		  rd.forward(request, response);
		  
		  
		  
	  } catch(Exception e) {
		  e.printStackTrace();
	  }
	 
  }
}
