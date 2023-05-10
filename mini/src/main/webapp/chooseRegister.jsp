<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Register</title>
<style>
* {
  box-sizing: border-box;
}

body, html {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-image: url("ProfileSelect.jpg");
  background-size: cover;
  background-position: center;
}
.header {
  font-family: "Lucida Console", "Courier New", monospace;
  display: flex;
  justify-content: center;
  margin-bottom: 2rem;
  position: absolute;
  top: 2rem;
  left: 50%;
  transform: translateX(-50%);
  font-size: 1.7rem;
}

.wrapper {
  display: flex;
  width: 90%;
  justify-content: space-around;
}

.card {
  width: 280px;
  height: 360px;
  border-radius: 15px;
  padding: 1.5rem;
  background: white;
  position: relative;
  display: flex;
  align-items: flex-end;
  transition: 0.4s ease-out;
  box-shadow: 0px 7px 10px rgba(0, 0, 0, 0.5);
  border: 2px solid darkblue
}
.card:hover {
  transform: translateY(20px);
}
.card:hover:before {
  opacity: 1;
}
.card:hover .info {
  opacity: 1;
  transform: translateY(0px);
}
.card:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 15px;
  background: rgba(0, 0, 0, 0.6);
  z-index: 2;
  transition: 0.5s;
  opacity: 0;
}
.card img {
  width: 100%;
  height: 100%;
  -o-object-fit: cover;
     object-fit: cover;
  position: absolute;
  top: 0;
  left: 0;
  border-radius: 15px;
}
.card .info {
  position: relative;
  z-index: 3;
  color: white;
  opacity: 0;
  transform: translateY(30px);
  transition: 0.5s;
  
}
.card .info h1 {
margin-left: 65px;
}
.card .info p {
  letter-spacing: 1px;
  font-size: 15px;
  margin-top: 8px;
}
.card .info button {
  padding: 0.6rem;
  outline: none;
  border: none;
  border-radius: 3px;
  background: white;
  color: black;
  font-weight: bold;
  cursor: pointer;
  transition: 0.4s ease;
  margin-left: 78px;
}
.card .info button:hover {
  background: dodgerblue;
  color: white;
}
</style>
</head>
<body>
<div class="header">
  <h1>SELECT YOUR PROFILE</h1>
</div>

<div class="wrapper">
  <div class="card"><img src="studentregister.jpg"/>
    <div class="info">
      <h1>Mentee</h1>
      
    <a href="studentregisterbackend.jsp"><button>Register</button></a>

    </div>
  </div>
  <div class="card"><img src="mentor1.jpg"/>
    <div class="info">
      <h1>Mentor</h1>
      <a href="mentorregisterbackend.jsp"><button>Register</button></a>
    </div>
  </div>
</div>

</body>
</html>
