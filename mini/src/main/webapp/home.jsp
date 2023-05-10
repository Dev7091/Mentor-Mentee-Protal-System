<!DOCTYPE html>
<html>
<head>
	<title>MENTOR MENTEE PORTAL SYSTEM</title>
	<style>
		body {
			margin: 0; 
			padding: 0;
			font-family: Arial, sans-serif;
			background-image: url("background.jpg");
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
			font-size: 60px;
			font-weight: bold;
			margin: 0;
			color: #000000;
			overflow: hidden; /* Ensures the content is not revealed until the animation */
  			border-right: .15em solid black; /* The typwriter cursor */
  			white-space: nowrap; /* Keeps the content on a single line */
  			margin: 0 auto; /* Gives that scrolling effect as the typing happens */
  			animation: 
    		typing 2.5s steps(40, end),
    		blink-caret .75s step-end infinite;
		}
		@keyframes typing {
  			from { width: 0 }
  			to { width: 70% }
		}
		/* The typewriter cursor effect */
		@keyframes blink-caret {
  			from, to { border-color: transparent }
 			50% { border-color: orange; }
		}
		p {
			font-size: 26px;
			margin: 10px 0 0 0;
			color: black;
			text-align: center;
		}
		.btn {
			display: inline-block;
			padding: 10px 20px;
			border: none;
			border-radius: 50px;
			font-size: 18px;
			font-weight: bold;
			color: #fff;
			background-color: #007bff;
			cursor: pointer;
			margin-top: 40px;
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
			margin-bottom: 80px;
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
			<a href="Login.jsp" class="btn">Login</a>
			<a href="chooseRegister.jsp" class="btn">Register</a>
		</div>
	</div>
	<div class="links-container">
		<a href="technicalSupport.jsp" class="link">Technical Support</a>
		<a href="faqs.jsp" class="link">FAQs</a>
	</div>
</body>
</html>
