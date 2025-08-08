<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.conn.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="component/style.css">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary p-1">
	<a class="navbar-brand" href="index.jsp"> <i
		class="fa-solid fa-address-book"></i>Address Book
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<button type="button" class="btn btn-primary">
						<i class="fas fa-home fa-xs"></i> Home<span class="sr-only">(current)</span>
					</button>
			</a></li>
			<li class="nav-item dropdown show "><a class="nav-link" href="#"
				class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
				class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
				aria-haspopup="true" aria-expanded="false"><button type="button"
						class="btn btn-primary">
						<i class="fa-solid fa-ellipsis-vertical fa-sm"></i> Options <i
							class="fa-solid fa-caret-down fa-sm"></i>
					</button></a> <%
 User user1 = (User) session.getAttribute("user");
 if (user1 != null) {
 %>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="addContact.jsp"> <i
						class="fa-solid fa-user-plus fa-sm"> </i> Add New Contact
					</a> <a class="dropdown-item" href="viewContact.jsp"><i
						class="fas fa-eye fa-sm"></i> View All Contacts </a>
					<div class="dropdown-divider"></div>
				</div> <%
 } else {
 %>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="addContact.jsp" data-toggle="modal"
						data-target="#exampleModalCenter2"> <i
						class="fa-solid fa-user-plus fa-sm"> </i> Add New Contact
					</a> <a class="dropdown-item" href="viewContact.jsp"
						data-toggle="modal" data-target="#exampleModalCenter2"><i
						class="fas fa-eye fa-sm"></i> View All Contacts</a>
					<div class="dropdown-divider"></div>

				</div></li>
			<%
			}
			%>
			<%
			User user2 = (User) session.getAttribute("user");
			if (user2 != null) {
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				List<contact> list1 = dao.getALLBirth(user2.getId());
				int n = list1.size();
			%>

			<li class="nav-item active"><a class="nav-link" href="birth.jsp">
					<button type="button" class="btn btn-primary">
						<i class="fas fa-bell fa-sm"></i> Birthdays <span
							class="badge badge-light"> <%=n%></span>
					</button>
			</a></li>
			<%
			}
			%>
			<%
			User user3 = (User) session.getAttribute("user");
			if (user3 != null) {
			%>
			<li class="nav-item active"><a class="nav-link" href="fav.jsp"><button
						type="button" class="btn btn-primary">
						<i class="fas fa-star fa-sm"></i> Favorites
					</button> </a></li>
			<%
			}
			%>
			<%
			User user4 = (User) session.getAttribute("user");
			if (user4 != null) {
			%>
			<li class="nav-item dropdown show "><a class="nav-link" href="#"
				class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
				class="nav-link dropdown-toggle" id="navbarDropdown2" role="button"
				aria-haspopup="true" aria-expanded="false"><button type="button"
						class="btn btn-primary">
						<i class="fa-solid fa-user-group"></i> Groups <i
							class="fa-solid fa-caret-down fa-sm"></i>
					</button></a>

				<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
					<a class="dropdown-item" href="relative.jsp"> Relatives </a> <a
						class="dropdown-item" href="family.jsp"> Family </a> <a
						class="dropdown-item" href="friend.jsp"> Friends </a> <a
						class="dropdown-item" href="colleague.jsp">Colleagues </a> <a
						class="dropdown-item" href="neighbor.jsp">Neighbors </a>

					<div class="dropdown-divider"></div>
				</div></li>
			<%
			}
			%>
		</ul>
		<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
		%><form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success ml-2"><i
				class="fas fa-user"></i> Login</a> <a href="register.jsp"
				class="btn btn-danger ml-2  "> <i class="far fa-user"></i>
				Register
			</a>
		</form>
		<%
		} else {
		%>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-success">
				<%=user.getName()%></button>
			<a data-toggle="modal" data-target="#exampleModalCenter"
				class="btn btn-danger ml-2 text-white">Logout</a>
		</form>
		<%
		}
		%>
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Address
						Book</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center ">
					<h6>Do you want to log out?</h6>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="Logout" class="btn btn-primary">Log out</a>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Address
						Book</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center ">
					<h6>Please Login to perform this action</h6>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="login.jsp" class="btn btn-primary">Log in</a>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</nav>