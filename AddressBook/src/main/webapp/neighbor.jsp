<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<%
	String msg = (String) session.getAttribute("succMsg");
	String wrg = (String) session.getAttribute("failedMsg");

	if (msg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=msg%></div>
	<%
	session.removeAttribute("succMsg");
	}
	if (wrg != null) {
	%>
	<p class="text-danger text-center"><%=wrg%></p>
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	<div class="container">
		<div class="row p-3">

			<%
			if (user != null) {
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				//List<contact> cont = dao.getALLContact(user.getId());
				List<contact> list1=dao.getALLNeighbors(user.getId());
				int n=list1.size();
				//String n1=Integer.toString(n);
				//session.setAttribute("s",n1);
				//for (contact c : list1) {
			%>
	<table class="table table-hover table-bordered">
  <thead>
    <tr>
      
      <th scope="col" style="font-size:20px">Name</th>
      <th scope="col" style="font-size:20px">Phone Number</th>
      
    </tr>
  </thead>
  <tbody>
  <%for (contact c : list1) { %>
    <tr>
      
      <td><%=c.getName() %></td>
      <td><%=c.getPhno()%></td>
      
    </tr>
    
    <%} %>
  </tbody>
</table>
<%} %>
</div>
</div>