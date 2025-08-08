package com.servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.contact;

@WebServlet("/update")
public class EditContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid=Integer.parseInt(req.getParameter("cid"));
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
		boolean fav=Boolean.parseBoolean(req.getParameter("fav"));
		
		
		contact c =new contact();
		
		c.setName(name);
		c.setEmail(email);
		c.setPhno(phno);
		c.setRelation(relation);
		c.setDob(dob);
		c.setAddtype(addtype);
		c.setStreet(street);
		c.setCity(city);
		c.setState(state);
		c.setPin(pin);
		c.setFav(fav);
		c.setId(cid);
		
		ContactDAO dao=new ContactDAO(DbConnect.getConn());
		HttpSession session=req.getSession();
		boolean f= dao.updatecontact(c);
		System.out.println(f);
		if(f)
		{
			session.setAttribute("succMsg","Your Contact is Updated");
			resp.sendRedirect("viewContact.jsp");
		}
		else
		{
			
			session.setAttribute("failedMsg","Something went wrong");
			resp.sendRedirect("editcontact.jsp?cid="+cid);
		}
		
	}
    
}
