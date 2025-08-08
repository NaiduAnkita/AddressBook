
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
<style>
.form-group {
	font-size: 20px;
}
</style>
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</head>
<body style="background-color: #f7faf8;"  >
	<%@include file="component/navbar.jsp"%>
	<div class="container-fluid  p-5">
		<h5 class="text-white text-center "></h5>
	</div>
	<div class="container-fluid">
		<div class="row-p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center text-primary">
							<strong>Login Page</strong>
						</h2>
						<%
						String invalidmsg = (String) session.getAttribute("invalidmsg");
						if (invalidmsg != null) {
						%>
						<p class="text-danger text-center"><%=invalidmsg%></p>
						<%
						session.removeAttribute("invalidmsg");
						}
						%>
						<%
						String logmsg = (String) session.getAttribute("logmsg");
						if (logmsg != null) {
						%>
						<p class="text-success text-center"><%=logmsg%></p>
						<%
						session.removeAttribute("logmsg");
						}
						%>


						<form action="login" method="post" class="needs-validation" novalidate>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter your Email " required>
									<div class="invalid-feedback">
        								Please enter your email!
     										 </div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									name="password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter your Password" required>
									<div class="invalid-feedback">
        								Please enter your password!
     										 </div>
							</div>
							
	
	
		                   <div class="text-center mt-2">
								<button type="submit" data-toggle="modal"
						data-target="#exampleModalCenter3" class="btn btn-primary ">Login</button>
							</div>
			


							<div class="text-center">
								Don't have an account? <a href="register.jsp">Register</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>