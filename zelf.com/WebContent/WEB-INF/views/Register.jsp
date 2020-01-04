<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Zelf Welcomes You!</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function isNumeric(value) {
		if (value == "" || value == null
				|| !value.toString().match(/^[-]?\d*\.?\d*$/)) {
			return false;
		}
		return true;
	}
	function echeck(str) {
		var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		return emailPattern.test(str);
	}
	function validateForm() {
		var email = document.forms["regform"]["email"].value;
		var phoneno = document.forms["regform"]["phone"].value;

		if (echeck(email) == false) {
			alert("Invalid EmailID");
			return false;
		}
		if (isNumeric(phoneno) == false) {
			alert("Invalid Phonenumber");
			return false;
		}
	}
</script>
<style type="text/css">
body {
	color: #999;
	background: #f5f5f5;
	font-family: 'Varela Round', sans-serif;
}

.form-control {
	box-shadow: none;
	border-color: #ddd;
}

.form-control:focus {
	border-color: #4aba70;
}

.login-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}

.login-form form {
	color: #434343;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h4 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 20px;
}

.login-form .avatar {
	color: #fff;
	margin: 0 auto 30px;
	text-align: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	z-index: 9;
	background: #4aba70;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}

.login-form .avatar i {
	font-size: 62px;
}

.login-form .form-group {
	margin-bottom: 20px;
}

.login-form .form-control, .login-form .btn {
	min-height: 40px;
	border-radius: 2px;
	transition: all 0.5s;
}

.login-form .close {
	position: absolute;
	top: 15px;
	right: 15px;
}

.login-form .btn {
	background: #4aba70;
	border: none;
	line-height: normal;
}

.login-form .btn:hover, .login-form .btn:focus {
	background: #42ae68;
}

.login-form .checkbox-inline {
	float: left;
}

.login-form input[type="checkbox"] {
	margin-top: 2px;
}

.login-form .forgot-link {
	float: right;
}

.login-form .small {
	font-size: 13px;
}

.login-form a {
	color: #4aba70;
}

span {
	color: red;
}
</style>
</head>
<body>
	<div class="login-form">
		<form action="logon" name="regform" method="post"
			nsubmit="return validateForm()">
			<div class="avatar">
				<i class="material-icons">&#xE7FF;</i>
			</div>
			<h4 class="modal-title">Register yourself in Zelf</h4>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="First Name"
					name="first_name" required="required">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Last Name"
					name="last_name" required="required">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="User Name"
					name="user_name" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Password"
					name="password" required="required">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Email-ID"
					name="email" required="required">
			</div>
			<div class="form-group">
				<input type="radio" name="gender" value="male"checked> Male 
				<input type="radio" name="gender" value="female" > Female
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Phone"
					name="phone" required="required">
			</div>
			<div class="form-group">
				<input type="date" class="form-control" placeholder="DOB" name="dob"
					required="required">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Address"
					name="address">
			</div>
			<input type="submit" class="btn btn-primary btn-block btn-lg"
				value="Sign Up">
			<div class="form-group">
				<span class="error">${REGSTATUS}</span>
			</div>
		</form>
		<div class="text-center small">
			Already member in Zelf? <a href="login">Login Now</a>
		</div>
	</div>
</body>
</html>