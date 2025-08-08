<%@page import="java.sql.*"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="java.lang.*"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/jan-kahanek-fVUl6kzIvLg-unsplash (1).jpg");
	background-repeat: no-repeat;
	height: 90vh;
	width: 150%;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container back-img text-center text-light">
		<h1>Welcome to Address Book</h1>
	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>
