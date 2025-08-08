package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.dao.UserDAO;
import com.entity.User;
import com.entity.contact;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String email=req.getParameter("email");
       String pass=req.getParameter("password");
       
      
       UserDAO dao=new UserDAO(DbConnect.getConn());
       User u=dao.loginUser(email, pass);
       
       HttpSession session=req.getSession();
       
       if(u!=null)
       {
    	   session.setAttribute("user",u);
    	   ContactDAO dao1 = new ContactDAO(DbConnect.getConn());
   		   List<contact> list1 = dao1.getALLBirth(u.getId());
   		   int n=list1.size();
           if (n>0) {
    	   resp.sendRedirect("birthbox.jsp");
   	   }
   		   else {
    	   resp.sendRedirect("index.jsp");
           }
	}
       else {
    	   session.setAttribute("invalidmsg","Invalid Email and Password");
    	   resp.sendRedirect("login.jsp");
 
       }
       }
}
