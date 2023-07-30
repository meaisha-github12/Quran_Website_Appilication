<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<title>SignUp</title>
<style>
body {
	background-image: url("ii4.jpg");
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	margin: 0;
	text-shadow: 13px 5px 2px rgba(0, 0, 0, 0.8);
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Fredoka One', cursive;
}

.container {
	padding-bottom: 40px;
	padding-left: 60px;
	padding-right: 60px;
	padding-top: 10px;
	background-color: transparent;
	border-radius: 25px;
	text-align: center;
	color: white;
	border: 2px solid white;
	margin-top: -100px;
}

.heading {
	margin-bottom: 35px;
}

.heading h1 {
	color: white;
}

.heading p {
	color: #FFB84C;
}

.container .group {
	margin-top: 10px;
	margin-bottom: 10px;
}

.container .group label {
	display: inline-block;
	width: 30px;
	text-align: left;
}

.container .group input {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #ccc;
	width: 200px;
}

.container .checkbox-container {
	text-align: left;
	margin-bottom: 20px;
}

.container .checkbox-label {
	margin-left: 5px;
}

.container input[type="submit"] {
	padding: 10px 20px;
	background-color: teal; /* Set button background to transparent */
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-family: 'Fredoka One', cursive;
	font-size: 16px;
	width: 100%;
	background-color: teal;
}

.container input[type="submit"]:hover {
	background-color: #A1CCD1;
	color: teal;
}

.container input[type="text"], .container input[type="password"],
	.container input[type="email"], .container input[type="tel"] {
	padding-top: 10px;
	padding: 8px;
	margin-bottom: 10px;
	margin-top: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 14px;
	background-color: transparent;
	color: white;
	font-family: Arial;
	border: 2px solid white;
}

.container .checkbox-container input[type="checkbox"]:checked::before {
	content: "\f00c";
	display: inline-block;
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	font-size: 18px;
	color: #FFB84C; /* Set checkbox tick color to #FFB84C */
}

.Acc a {
	cursor: pointer;
	text-decoration: none;
	font-size: 14px;
	color: white;
}

.Acc a:hover {
	text-decoration: underline;
}

::placeholder {
	color: white; /* Replace "red" with the desired color */
}

.checkbox-label:hover {
	color: #A1CCD1;
}
</style>
</head>
<body>
	<div class="container">
		<div class=heading>
			<h1>!السلام عليكم</h1>
		</div>
		<form action="Ser" method="post">
			<div class="group">
				<label for="username"><i class="fas fa-user"></i></label> <input
					type="text" id="username" name="t1" autocomplete="off" required
					placeholder="Enter Your Name">
			</div>



			<div class="group">
				<label for="password"><i class="fa fa-lock"
					aria-hidden="true"></i></label> <input type="password" id="password"
					name="t3" autocomplete="off" required placeholder="Enter Password">
			</div>
			<div class="checkbox-container">
				<input type="checkbox" id="terms" name="terms" required> <label
					for="terms" class="checkbox-label">Remember Me</label><br>
			</div>

			<br> <input class=" button" type="submit" value="Register">
		</form>
		<br> <br>
		<div class="Acc">
			<a href="NewFile.jsp">Create an account</a>
		</div>
	</div>
</body>
</html>
