
							<%@page import="com.dao.*"%>
<%@page import="com.conn.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("invalidMsg","Login Please..");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		
			


						<h2 class="text-primary">
							<strong>Details</strong>
						</h2>
						<%
						
						String wrg = (String) session.getAttribute("failedMsg");

						
						if (wrg != null) {
						%>
						<p class="text-danger text-center"><%=wrg%></p>
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						<%
							int cid = Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao = new ContactDAO(DbConnect.getConn());
							contact c = dao.getContactByID(cid);
							
							%>
							<table>
							
							<tr>
							<th>Name:</th>
							<td><%=c.getName() %></td>
							<tr>
							<th>Email:</th>
							<td><%=c.getEmail() %></td></tr>
							<tr>
							<th>Phone Number:</th>
							
							<td><%=c.getPhno() %></td></tr>
							<tr>
							
							<th>Relation:</th>
							
							<td><%=c.getRelation() %></td></tr>
							<tr>
							<th>Date of Birth:</th>
							<td><%=c.getDob() %></td></tr>
							<tr>
							<th>Address Type:</th>
							<td><%=c.getAddtype() %></td></tr>
							<tr>
							<th>Address:</th>
							<td><%=c.getStreet()+", "+c.getCity()+", "+c.getState()+", "+c.getPin()+"."%></td>
							</tr>
							
							
							
							
							</table>
							<br>
							<a href="viewContact.jsp" class="btn btn-primary btn-sm text-white">Back</a>
		
		</div>