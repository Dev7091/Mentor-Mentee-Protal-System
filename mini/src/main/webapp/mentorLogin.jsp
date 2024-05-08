<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    window.onload = function onsubmit() {
        
    	var mentorIDInput = document.getElementById("mentorID");
    	mentorIDInput.addEventListener("blur", function() {
    	    var pattern = /^[0-9]{5}$/i;
    	    if (!pattern.test(mentorIDInput.value)) {
    	        alert("Please enter a valid mentor ID in the format like 12345");
    	        mentorIDInput.value = "";
    	        mentorIDInput.blur(); // Move the focus away from the input field
    	    }
    	});

    };
</script>

	<meta charset="UTF-8">
	<title>Mentor Login</title>
	<style>
		body {
			background-color: #ffffff;
		}
		.container {
			position: absolute;
			top:20%;
			left: 65%;
			/* right: 50%; */
			/* transform: translate(-50%, -50%); */
			max-width: 300px;
			padding: 20px;
			background-color: #ffffff;
			box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2);
			border-radius: 5px;
			font-family: Arial, sans-serif;
		}
		.img1{
			height:50%;
			width:50%;
			padding:10px;
			margin-left: 20%;
		}
		.img2{
			height:100%;
			width:50%;
			margin-left:5%;

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
		label span {
		color: red;
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
	<div class="container">
		<h2>Mentor Login</h2>
		<img class="img1" src="user.png">
		<form method="post" action="mentorDashboard.jsp">
			<label for="id">Mentor ID<span>*</span></label>
			<input type="text" placeholder="Enter Your ID (Ex. 67890)" id="mentorID" name="id" required>
			<label for="password">Password<span>*</span></label>
			<input type="password" placeholder="Enter Your Password" id="password" name="password" required>
			<button type="submit">Login</button>
		</form>
		
<a href="forgotPasswordmentor.jsp">Forgot Password?</a>
	</div>
<div class="container2">
	<img class=img2 src="mentor.jpg">
</div>
</body>
</html>  