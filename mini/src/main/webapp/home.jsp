<!DOCTYPE html>
<html>
<head>
	<title>MENTOR MENTEE PORTAL SYSTEM</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-image: url("https://img.freepik.com/free-vector/coach-speaking-before-audience-mentor-presenting-charts-reports-employees-meeting-business-training-seminar-conference-vector-illustration-presentation-lecture-education_74855-8294.jpg?w=1380&t=st=1680328931~exp=1680329531~hmac=34716141ca02a4844227c7feb6665b7f0cb9ca5a60b57a53205375cd62c8e3c5");
			background-size: cover;
			background-position: center;
		}
		.container {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}
		h1 {
			font-size: 48px;
			font-weight: bold;
			margin: 0;
			color: #444;
		}
		p {
			font-size: 24px;
			margin: 10px 0 0 0;
			color: #777;
			text-align: center;
		}
		.btn {
			display: inline-block;
			padding: 10px 20px;
			border: none;
			border-radius: 5px;
			font-size: 18px;
			font-weight: bold;
			color: #fff;
			background-color: #007bff;
			cursor: pointer;
			margin-top: 20px;
			text-decoration: none;
		}
		.btn:hover {
			background-color: #0069d9;
		}
		.links-container {
			position: absolute;
			top: 20px;
			right: 20px;
			display: flex;
			flex-direction: row;
			align-items: center;
		}
		.link {
			margin-right: 20px;
			font-size: 18px;
			color: #444;
			text-decoration: none;
		}
		.btn-container {
			display: flex;
			flex-direction: row;
			margin-top: 20px;
		}
		.btn-container .btn:first-child {
			margin-right: 20px;
		}
		.logo {
			width: 250px;
			height: 100px;
			position: absolute;
			top: 20px;
			left: 0px;
		}
	</style>
</head>
<body>
	<img src="https://www.niet.co.in/images/logo.svg" alt="Niet_Logo" class="logo">
	<div class="container">
		<h1>MENTOR MENTEE PORTAL SYSTEM</h1>
		<p>A Web application that enhances Mentorship system in the NIET college campus</p>
		<div class="btn-container">
			<a href="studentLogin.jsp" class="btn">Student Login</a>
			<a href="mentorLogin.jsp" class="btn">Mentor Login</a>
		</div>
	</div>
	<div class="links-container">
		<a href="technicalSupport.jsp" class="link">Technical Support</a>
		<a href="faqs.jsp" class="link">FAQs</a>
	</div>
</body>
</html>