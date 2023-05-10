<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update Student Progress Form</title>
	<style>
		body {
			background-color: #f2f2f2;
			font-family: Arial, sans-serif;
		}
		.container {
			display: flex;
			flex-direction: column;
			align-items: center;
			justify-content: center;
			height: 90vh;
			margin-right: 0px;
		}
		h1 {
			color: #333333;
			text-align: center;
		}
		form {
			background-color: #ffffff;
			border-radius: 10px;
			padding: 20px;
			box-shadow: 0 0 10px #cccccc;
			margin: 0 auto;
			max-width: 500px;
		}
		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}
		input[type=text] {
			width: 480px;
			padding: 10px;
			border-radius: 5px;
			border: 1px solid #cccccc;
			margin-bottom: 20px;
			font-size: 16px;
		}
		input[type=submit] {
			background-color: #008CBA;
			color: #ffffff;
			padding: 10px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
			font-size: 16px;
		}
		input[type=submit]:hover {
			background-color: #006687;
		}
	</style>
</head>
<body>
<div class="container">
	<h1>Update Student Progress</h1>
	<form method="post" action="updateprogressstudentformbackend.jsp">
		<input type="hidden" name="studentID" value="<%= request.getParameter("studentID") %>">
		<label for="name">Semester Name:</label>
		<input type="text" name="name" id="name">
		<label for="performance_current_semester">Performance (Current Semester):</label>
		<input type="text" name="performance_current_semester" id="performance_current_semester">
		<label for="remarks">Remarks:</label>
		<textarea name="remarks" id="remarks" rows="5" style="width: 495px; border-radius: 5px;"></textarea>
		<input type="submit" value="Submit">
	</form>
	</div>
</body>
</html>
