package com.servlet;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.contact;
import com.conn.DbConnect;
import com.dao.ContactDAO;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId=Integer.parseInt(req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String relation=req.getParameter("relation");
		String addtype=req.getParameter("addtype");
		String city=req.getParameter("city");
		String street=req.getParameter("street");
		String pin=req.getParameter("pin");
		String state=req.getParameter("state");
		LocalDate dob=LocalDate.parse(req.getParameter("dob"));
		System.out.println(req.getParameter("fav")+"in addconjava");
		Boolean fav=Boolean.parseBoolean(req.getParameter("fav"));
		
		contact c =new contact(name,email,phno,relation,userId,dob,addtype,street,city,state,pin,fav);
		ContactDAO dao=new ContactDAO(DbConnect.getConn());
		
		HttpSession session=req.getSession();
		boolean f= dao.saveContact(c);
		if(f)
		{
			session.setAttribute("succMsg","Your Contact is saved successfully");
			resp.sendRedirect("addContact.jsp");
		}
		else
		{
			session.setAttribute("failedMsg","Something went wrong");
			resp.sendRedirect("addContact.jsp");
		}
	}

}
