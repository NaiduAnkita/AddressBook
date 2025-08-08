<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.conn.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
<%@include file="component/navbar.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("#myModal").modal('show');
	});
</script>
</head>
<body style="background-color: #f7faf8;">



	<%
	User user6 = (User) session.getAttribute("user");
	if (user6!= null) {
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		//List<contact> cont = dao.getALLContact(user.getId());
		List<contact> list1 = dao.getALLBirth(user6.getId());
		int n = list1.size();
		String n1 = Integer.toString(n);
		session.setAttribute("s", n1);
		for (contact c : list1) {
	%>
	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Address Book</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center"><strong>Don't forget to wish !!!</strong>
				<h3><%=c.getName()%></h3></div>
				<div class="modal-footer">
					<a href="index.jsp"><button type="button" class="btn btn-secondary"
						>Close</button></a>
					<a href="birth.jsp"><button type="button" class="btn btn-primary">Click for more details</button></a>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	}
	%>

</body>