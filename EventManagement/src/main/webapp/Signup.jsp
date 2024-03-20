<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User SignUp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="sms/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="sms/vendor/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="sms/kushi/assets/css/styles.css">


<script>
	jQuery.validator
			.addMethod(
					"checkemail",
					function(value, element) {
						return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value)|| /^[0-9]{10}$/.test(value);
					});
	jQuery(document).ready(function($) {
		$("#signup").validate({
			rules : {
				name : {
					required : true
				},
				mail : {
					required : true,
					checkmail : true
				},
				phone : {
					required : true,
					minlength : 10,
					maxlength : 10
				},
				pass : {
					required : true,
					minlength : 8
				},
				cpass : {
					required : true,
					minlength : 8,
					equalTo : "#pass"
				}
			},
			messages : {
				name : {
					required : "Please enter the name."
				},
				mail : {
					required : "Please enter mail",
					email : "Enter valid email.."
				},
				phone : {
					required : "Please enter Phone number"
				},
				pass : {
					required : "Please enter password",
					minlength : "password is less than 8 charecters"
				},
				cpass : {
					required : "Please enter confirm password",
					equalTo : "Password mismatching.."
				}
			}
		})
	})
</script>


</head>
<body class="login" style="padding: 40px 0;">
	<div class="row">
		<div
			class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="logo margin-top-30"></div>
			<center>
				<h2><a href="index.jsp" >Happy</a> Event Management</h2>
			</center>
			<div class="box-login">

				<form class="form-login" action="register" id="signup" method="post">
					<center > <%
					if (request.getAttribute("status") != null) {
					%>
					<div id="msg">
						<h2 style="color: red;"><%=request.getAttribute("status")%></h2>
					</div>
					<%}%> </center>
					<fieldset style="font-size: 25px;">
						<legend style="font-size: 25px;"> Register </legend>
						<p>
							<br /> <span style="color: red;"></span>

						</p>
						<div class="form-group">
							<span class="input-icon"> <input type="text"
								class="form-control" name="name" placeholder="Name">
								<i class="fa fa-user"></i>
							</span>
						</div>
						<div class="form-group">
							<span class="input-icon"> <input type="text"
								class="form-control" name="phone" placeholder="Phone number">
								<i class="fa fa-phone"></i>
							</span>
						</div>
						
						<div class="form-group">
							<span class="input-icon"> <input type="text"
								class="form-control" name="mail" placeholder=" E-mail ID">
								<i class="fa fa-envelope"></i>
							</span>
						</div>
						
						<div class="form-group form-actions">
							<span class="input-icon"> <input type="password"
								class="form-control password" id="pass"name="pass"
								placeholder="Password"> <i class="fa fa-key"></i>
							</span>

						</div>
						<div class="form-group form-actions">
							<span class="input-icon"> <input type="password"
								class="form-control password" name="cpass"
								placeholder="Confirm Password"> <i class="fa fa-lock"></i>
							</span>

						</div>
						<div class="form-actions">

							<center><input class="btn btn-primary "
								 type="submit" name="register" value="Signup">
								<!-- Register <i class="fa fa-arrow-circle-right"></i> -->
							</input></center>
						</div>


					</fieldset>
				</form>

				<div class="copyright">
					<a href="login.jsp"><span class="text-bold text-uppercase">
							Login</span></a>
				</div>

			</div>

		</div>
	</div>

	<script src="assets/js/main.js"></script>

	<script src="assets/js/login.js"></script>
	

</body>
<style>
.box-login {
	padding: 20px 0;
	font-size: 20px;
}

body {
	background-image: url("background.jpeg");
	background-size: cover;
	/* Adjust the background size to cover the entire body */
	background-position: center; /* Center the background image */
	background-repeat: no-repeat;
	/* Prevent the background image from repeating */
	height: 100vh; /* Set the body height to 100% of the viewport height */
	margin: 0; /* Remove default body margin */
}

#msg {

	height: 60px;
	width: 200px;
}

h1 {
	color: hotpink;
}

.error{
    color: Red;
  }

input {
	display: block;
}

td {
	font-size: 20px;
	padding: 10px;
}

input {
	font-size: 20px;
	width: 250px;
	height: 30px;
	border-radius: 10px;
}
</style>

</html>