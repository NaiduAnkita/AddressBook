package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ContactDAO;
import com.conn.DbConnect;

@WebServlet("/delete")
public class DeleteContact extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int cid=Integer.parseInt(req.getParameter("cid"));
	
	ContactDAO dao=new ContactDAO(DbConnect.getConn());
	boolean f=dao.deleteContactById(cid);
	HttpSession session=req.getSession();
	System.out.println(f);
	if(f) {
		session.setAttribute("succMsg","Contact deleted Successfully..");
		resp.sendRedirect("viewContact.jsp");
	}else {
		session.setAttribute("failedMsg","Something went wrong..");
		resp.sendRedirect("viewContact.jsp");
	}
	}
}
