<!DOCTYPE html>
<html>
<head>
	<title>Forgot Password</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-image: url("resetpassword.jpg");
			background-size: cover;
			
		}
		.container2 {
			position: absolute;
			top:18%;
			left: 40%;
			max-width: 300px;
			padding: 20px;
			background-color: #ffffff;
			box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
			border-radius: 5px;
			font-family: Arial, sans-serif;
		}
		

		h2 {
			text-align: center;
			margin-top: 0;
		}
		form {
			display: flex;
			flex-direction: column;
		}
		label {
			font-weight: bold;
			/* margin-bottom:5px; */
		}
		input[type=text], input[type=password] {
			width: 100%;
			padding: 12px;
			margin: 8px 0;
			display: inline-block;
			border: none;
			/* border-bottom: 2px solid #4CAF50; */
			box-sizing: border-box;
			font-size: 16px;
			color: #444;
			background-color: #f2f2f2;
			border-radius: 0;
			transition: all 0.3s ease-in-out;
		}
		input[type=text]:focus, input[type=password]:focus {
			outline: none;
			border-bottom: 2px solid #007bff;
			/* background-color: #0f0e0e; */
		}
		button[type=submit] {
		
			background-color: #007bff;
			color: rgb(255, 255, 255);
			padding: 10px 60px;
			border: none;
			border-radius: 50px;
			cursor: pointer;
			margin-top: 16px;
			transition: all 0.3s ease-in-out;
			align-self: center;
			font-size: 16px;
			font-weight: bold;
		}
		button[type=submit]:hover {
			background-color: #0069d9;
		}
		a {
			color: dodgerblue;
			font-size: 14px;
			margin-top: 8px;
			text-align: center;
			transition: all 0.3s ease-in-out;
		}
		a:hover {
			color: #0069d9;
		}
	</style>
</head>
<body>
	<div class="container2">
		<h1>Forgot Password</h1>
		<form method="post" action="reset_passwordmentor.jsp">
			<label for="mentorID">ID:</label>
			<input type="text" placeholder="Enter Your Faculty ID" id="mentorID" name="mentorID">
			<label for="key">Key:</label>
			<input type="text" placeholder="Enter Your Key" id="key" name="key">
			<label for="new_password">New Password:</label>
			<input type="password" placeholder="Enter Your New Password" id="new_password" name="new_password">
			<label for="confirm_password">Confirm Password:</label>
			<input type="password" placeholder="Enter New Password Again!" id="confirm_password" name="confirm_password">
			<button type="submit" value="Reset Password">Reset</button>
			
		</form>
	</div>
</body>
</html>
