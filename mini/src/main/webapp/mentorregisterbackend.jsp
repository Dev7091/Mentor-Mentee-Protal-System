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

    	var phonenoInput = document.getElementById("phoneno");
    	phonenoInput.addEventListener("blur", function() {
    	    var pattern = /^[0-9]{10}$/i;
    	    if (!pattern.test(phonenoInput.value)) {
    	        alert("Please enter a valid phone no. in the format like 1234567890");
    	        phonenoInput.value = "";
    	        phonenoInput.blur(); // Move the focus away from the input field
    	    }
    	});

    };
</script>

	<meta charset="UTF-8">
	<title>Registration Form</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-image: url("mentorregisterbackground.jpg");
			background-size: cover;
			
		}
		.container2 {
			position: absolute;
			top:7%;
			left: 33%;
			width: 500px;
			max-width: 1200px;
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
<div class="container2">
	<h2>Mentor Registration</h2>
		<form method="post" action="mentorRegister.jsp" >
			<label for="mentorID">Faculty ID<span>*</span></label>
			<input type="text" placeholder="Enter Your faculty ID (5 Digits)" id="mentorID" name="mentorID" required>
			<label for="mentorname">Name<span>*</span></label>
			<input type="text" placeholder="Enter Your Full Name" id="mentorname" name="mentorname" required>
			<label for="department">Department<span>*</span></label>
			<input type="text" placeholder="Enter Your Department (Ex. CSE/IT, IT)" id="department" name="department" required>
			<label for="password">Password<span>*</span></label>
			<input type="password" placeholder="Enter a strong Password" id="password" name="password" required>
			<label for="email">Email-id<span>*</span></label>
			<input type="text" placeholder="Enter Your Official Email ID" id="email" name="email" required>
			<label for="phoneno">Phone Number<span>*</span></label>
			<input type="text" placeholder="Enter Your Phone No. (10 digits)" id="phoneno" name="phoneno" required>
			<label for="about">About<span>*</span></label>
			<input type="text" placeholder="Enter a short description" id="about" name="about" required>
			
			<button type="submit">Register</button>
		</form>
</div>
</body>
</html>