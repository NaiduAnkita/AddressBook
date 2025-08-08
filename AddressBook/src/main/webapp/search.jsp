<%@page import="com.dao.*"%>
<%@page import="com.conn.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hovert {
	background-v =color: grey
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (user == null) {
		session.setAttribute("invalidmsg", "Please Login..");
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
					String ch=request.getParameter("ch");
					ContactDAO dao = new ContactDAO(DbConnect.getConn());
					//List<contact> cont = dao.getALLContact(user.getId());
					List<contact> list1=dao.getContactBySearch(ch,user.getId());
					int n = list1.size();
			%>
			<%if(n>0){ %>
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
			<input class="form-control mr-sm-5" type="search" name="ch" placeholder="Search" aria-label="Search" >
			<button class="btn btn-primary my-2 my-sm-2" type="submit" >Search</button> </form></div>
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th scope="col" style="font-size: 20px">Sl. No.</th>
						<th scope="col" style="font-size: 20px">Name</th>
						<th scope="col" style="font-size: 20px">Phone Number</th>
						<th scope="col" style="font-size: 20px">Email</th>
						<th scope="col" style="font-size: 20px">Action</th>

					</tr>
				</thead>
				<tbody>
					<%
					int i=0;
					for (contact c : list1) {
						i=i+1;
					%>
					<tr>
						<td><%=i %></td>
						<td><%=c.getName()%></td>
						<td><%=c.getPhno()%></td>
						<td><%=c.getEmail()%></td>
						<td><a href="details.jsp?cid=<%=c.getId()%>"
							class="btn btn-primary btn-sm text-white">Details</a> <a
							href="editcontact.jsp?cid=<%=c.getId()%>"
							class="btn btn-success btn-sm text-white">Edit</a> <a
							href="delete?cid=<%=c.getId()%>"
							class="btn btn-danger btn-sm text-white">Delete</a></td>


					</tr>
					<%
					}
					%>

				</tbody>
			</table>
				<%
			}else{
			%>
			<div>
			<h3>Sorry, There are no contacts with <%=ch %> !!</h3>
			
			</div>
			<br>
			
			<% 
				}
			%>
			
			<%}
			%>
			<div>
<a href="index.jsp" class="btn btn-primary btn-sm text-white">Back</a></div>

		</div>
	</div>


</body>
</html>