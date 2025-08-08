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
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				//List<contact> cont = dao.getALLContact(user.getId());
				List<contact> list1=dao.getALLBirth(user.getId());
				int n=list1.size();
				String n1=Integer.toString(n);
				session.setAttribute("s",n1);
				for (contact c : list1) {
			%>
			<div class="col-md-3">
				<div class="card">
					<div class="card-body">
						<h5>
							<b> Name: <%=c.getName()%></b>

						</h5>
						<p>
							<b> Mobile No.:&nbsp;</b><%=c.getPhno()%></p>
						<p>
							<b> Email:&nbsp;</b><%=c.getEmail()%></p>
						<p>
							<b> Relation:&nbsp;</b><%=c.getRelation()%></p>
							
						<!-- <p>
							<b> Date of Birth:&nbsp;</b><%=c.getDob()%></p>
						<p>
							<b> Address Type:&nbsp;</b><%=c.getAddtype()%></p>
						<p>
							<b> Street/Area/village:&nbsp;</b><%=c.getStreet()%></p>
						<p>
							<b> City:&nbsp;</b><%=c.getCity()%></p>
						<p>
							<b> State:&nbsp;</b><%=c.getState()%></p>
						<p>
							<b> PIN Code:&nbsp;</b><%=c.getPin()%></p>
						 <div class="text-center">
							<a href="editcontact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div> -->
					</div>

				</div>
				<br>
			</div>

			<%
			}
			}
			%>


		</div>
	</div>


</body>
</html>