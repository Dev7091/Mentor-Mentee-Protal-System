<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    window.onload = function onsubmit() {
        // Validate Student ID (should be of "0201mcsd008" format)
        var studentIDInput = document.getElementById("studentID");
        studentIDInput.addEventListener("blur", function() {
            var pattern = /^0201[a-z]{4}[0-9]{3}$/i;
            if (!pattern.test(studentIDInput.value)) {
                alert("Please enter a valid student ID in the format like 0201mcsd008");
                studentIDInput.value = "";
                studentIDInput.blur(); // Move the focus away from the input field
            }
        });
        
        // Validate University Roll No (should be 13 digits)
        var rollnoInput = document.getElementById("rollno");
        rollnoInput.addEventListener("blur", function() {
            var pattern = /^[0-9]{13}$/i;
            if (!pattern.test(rollnoInput.value)) {
                alert("Please enter a valid University Roll No. (13 digits)");
                rollnoInput.value = "";
                rollnoInput.blur();
            }
        });
        
        // Validate Phone Number (should be 10 digits)
        var phonenoInput = document.getElementById("phoneno");
        phonenoInput.addEventListener("blur", function() {
            var pattern = /^[0-9]{10}$/i;
            if (!pattern.test(phonenoInput.value)) {
                alert("Please enter a valid phone number (10 digits)");
                phonenoInput.value = "";
                phonenoInput.blur();
            }
        });
    };
</script>

	<meta charset="UTF-8">
	<title>Registration Form</title>
	<style>
		body {
			
			
			font-family: Arial, sans-serif;
			background-image: url("studentregisterbackground.jpg");
			background-size: cover;
			
			
		}
		.container1 {
			position: absolute;
			top:12.5%;
			left: 34.5%;
			width: 450px;
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
	<div class="container1">
		<h2>Mentee Registration</h2>
		<form method="post" action="studentRegister.jsp">
			<label for="studentID">ERP ID<span>*</span></label>
			<input type="text" placeholder="Enter Your ERP ID (Ex. 0201mcsdXXX)" id="studentID" name="studentID" required>
			<label for="studentID">University Roll No.<span>*</span></label>
			<input type="text" placeholder="Enter Your Roll No. (Ex. 2001330100XXX)" id="rollno" name="rollno" required>
			<label for="name">Name<span>*</span></label>
			<input type="text" placeholder="Enter Your Full Name" id="name" name="name" required>
			<label for="password">Password<span>*</span></label>
			<input type="password" placeholder="Enter Your Password" id="password" name="password" required>
			<label for="email">Email-id<span>*</span></label>
			<input type="text" placeholder="Enter Your Official Email ID (Ex. 0201mcsdXXX@niet.co.in)" id="email" name="email" required>
			<label for="phoneno">Phone Number<span>*</span></label>
			<input type="text" placeholder="Enter Your Phone No. (10 digits)" id="phoneno" name="phoneno" required>
			<button type="submit">Register</button>
		</form>
		
	</div>
</body>
</html>