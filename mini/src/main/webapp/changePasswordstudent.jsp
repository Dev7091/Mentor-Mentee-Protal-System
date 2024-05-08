<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Change Password</title>
	<style>
	.card {
		position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	max-width: 300px;
	padding: 10px;
	background-color: #ffffff;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	font-family: Arial, sans-serif;
	}
	label {
		display: block;
		margin-bottom: 5px;
	}
	
	label span {
		color: red;
	}
	input[type=text], input[type=password] {
			width: 100%;
			padding: 12px;
			margin: 8px 0;
			display: inline-block;
			border: none;
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
		}
	
	input[type=submit] {
		background-color: #007bff;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
		border-radius: 10px;
	}
	
	input[type=submit]:hover {
		background-color: #45a049;
	}
</style>
	</head>
<body>
<div class="card">
	<form method="post" action="updatePasswordProcessstudent.jsp">
		<label for="id">Student ID: <span>*</span></label>
		<input type="text" id="id" name="id"><br><br>
		<label for="oldPassword">Old Password: <span>*</span></label>
		<input type="password" id="oldPassword" name="oldPassword"><br><br>
		<label for="newPassword">New Password: <span>*</span></label>
		<input type="password" id="newPassword" name="newPassword"><br><br>
		<input type="submit" value="Update Password">
	</form>
</div>
</body>
</html>  