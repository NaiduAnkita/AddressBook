<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Book</title>
<%@include file="component/allCss.jsp"%>
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
	
	function myfun(){
		
		var phoneNumber = document.getElementById("exampleInputNumber").value;
		var regex = /^[6-9][0-9]{9}$/;
		
		if (!regex.test(phoneNumber)) {
			alert("Please enter a valid phone number");
			return false;
		}
		
		return true;
		
	}
</script>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">


						<h2 class="text-center text-primary">
							<strong>Add contact</strong>
						</h2>
						<%
						String msg = (String) session.getAttribute("succMsg");
						String wrg = (String) session.getAttribute("failedMsg");

						if (msg != null) {
						%>
						<p class="text-success text-center"><%=msg%></p>
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


						<form action="addContact" method="post" class="needs-validation"
							novalidate onsubmit="return myfun();">
							<%
							if (user != null) {
							%>
							<input type="hidden" value="<%=user.getId()%>" name="userid">
							<%
							}
							%>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									name="name" type="text" class="form-control "
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
								<div class="invalid-feedback">Please enter name!</div>


							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required>
								<div class="invalid-feedback">Please enter email!</div>
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone No.</label> <input
									name="phno" type="text" class="form-control"
									id="exampleInputNumber" aria-describedby="emailHelp" maxlength="10" required>
								<div class="invalid-feedback">Please enter phone number!</div>
							</div>

							<div class="form-group">
								<label for="inputRelation">Relation</label> <select
									name="relation" id="inputRelation" class="form-control"
									required>
									<!--  <option>Select</option>-->
									<option value="Relative">Relative</option>
									<option value="Family">Family</option>
									<option value="Friend">Friend</option>
									<option value="Colleague">Colleague</option>
									<option value="Neighbor">Neighbor</option>
								</select>
							</div>

							<div style="margin-bottom: 1rem"
								class="md-form md-outline input-with-post-icon datepicker row-p-4">
								<label for="exampleFormControlTextarea1">Date of Birth</label> <input
									name="dob" type="date" id="example" class="form-control"
									required>
								<div class="invalid-feedback">Please enter date of birth!
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputState">Address Type</label> <select
										name="addtype" id="inputState" class="form-control" required>
										<!-- <option>Select an Address Type</option>-->
										<option value="Home">Home</option>
										<option value="Office">Office</option>
									</select>
									<div class="invalid-feedback">Please select address type!
									</div>
								</div>
							</div>
							<div class="form-group ">
								<label for="exampleInputEmail1">Street/Area/Village</label> <input
									type="text" class="form-control"
									id="exampleFormControlTextarea2" name="street" required>
								<div class="invalid-feedback">Please enter
									Street/Area/Village!</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputCity">City</label> <input name="city"
										type="text" class="form-control" id="inputCity" required>
									<div class="invalid-feedback">Please enter city!</div>
								</div>


								<div class="form-group col-md-4">
									<label for="inputState">State</label> <select name="state"
										id="inputState" class="form-control" required>
										<!--  <option>Select</option>-->
										<option value="Andhra Pradesh">Andhra Pradesh</option>
										<option value="Arunachal Pradesh">Arunachal Pradesh</option>
										<option value="Assam">Assam</option>
										<option value="Bihar">Bihar</option>
										<option value="Chattisgarh">Chattisgarh</option>
										<option value="Goa">Goa</option>
										<option value="Gujarat">Gujarat</option>
										<option value="Haryana">Haryana</option>
										<option value="Himachal Pradesh">Himachal Pradesh</option>
										<option value="Jammu and Kashmir">Jammu and Kashmir</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Karnataka">Karnataka</option>
										<option value="Kerala">Kerala</option>
										<option value="Madhya Pradesh">Madhya Pradesh</option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Manipur">Manipur</option>
										<option value="Meghalaya">Meghalaya</option>
										<option value="Mizoram">Mizoram</option>
										<option value="Nagaland">Nagaland</option>
										<option value="Odisha">Odisha</option>
										<option value="Punjab">Punjab</option>
										<option value="Rajasthan">Rajasthan</option>
										<option value="Sikkim">Sikkim</option>
										<option value="Tamil Nadu">Tamil Nadu</option>
										<option value="Telangana">Telangana</option>
										<option value="Tripura">Tripura</option>
										<option value="Uttar Pradesh">Uttar Pradesh</option>
										<option value="Uttarakhand">Uttarakhand</option>
										<option value="West Bengal">West Bengal</option>
									</select>
									<div class="invalid-feedback">Please select state!</div>
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Pin Code</label> <input name="pin"
										type="text" class="form-control" id="inputZip" required maxlength="6">
									<div class="invalid-feedback">Please enter pin code!</div>
								</div>

							</div>
							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" name="fav" value="true"
									class="custom-control-input" id="fav"> <label
									class="custom-control-label" for="fav">Add to favorites
								</label>

							</div>

							<div class="text-center mt-3">
								<h1>
									<button type="submit" class=" btn btn-primary ">Save</button>
								</h1>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<!--  <div class="form-group">

	<div class="form-check form-group">
		<input type="checkbox"
			class="form-check-input form-control form-group" name="fav"
			value="true"> <label class="form-check-label form-group"
			for="fav">&nbsp;&nbsp;&nbsp;&nbsp;Add to favorites </label><br>

	</div>
</div>-->