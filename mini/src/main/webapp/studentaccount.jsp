<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" %>
<%
String studentID = (String) session.getAttribute("studentID");
%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8" />
  <title>Student Dashboard</title>
  <link rel="stylesheet" href="style.css" />
  <!-- Font Awesome Cdn Link -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
 
 <style> /*  import google fonts */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap");
*{
  margin: 0;
  padding: 0;
  outline: none;
  border: none;
  text-decoration: none;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body{
  background: rgb(226, 226, 226);
  
}
nav{
  position: sticky;
  top: 0;
  bottom: 0;
  height: 100vh;
  left: 0;
  width: 90px;
  background: #00003f;
  overflow: hidden;
  transition: 1s;
}
nav:hover{
  width: 300px;
  transition: 1s;
}
.logo{
  text-align: center;
  display: flex;
  margin: 10px 0 0 10px;
  padding-bottom: 3rem;
}

.logo img{
  width: 45px;
  height: 45px;
  border-radius: 50%;
}
.logo span{
  font-weight: bold;
  padding-left: 10px;
  font-size: 17px;
  text-transform: uppercase;
}
a{
  position: relative;
  width: 280px;
  font-size: 15px;
  color: white;
  display: table;
  padding: 10px;
}
nav .fas{
  position: relative;
  width: 70px;
  height: 40px;
  top: 10px;
  font-size: 20px;
  text-align: center;
  
}
.nav-item{
  position: relative;
  /*Yaha se change kr dena position*/
  top: 8px;
  margin-left: 10px;
}


a:hover{
  background: white;
  color: black;
  
  
}
a:hover i{
  color: #00003f;
  transition: 0.5s;
}
.logout{
  position: absolute;
  bottom: 0;
}

.container{
  display: flex;
  
}

/* Main Section */
.main{
  position: relative;
  padding: 20px;
  width: 100%;
  
 /* background-image: url("studentdashboardmainbg.jpg");*/
  
  
}
.main-top{
  display: flex;
  justify-content: space-between;
  width: 100%;
  margin-bottom: 20px;
}
.main-top h1{
  font-size: 28px;
  font-weight: bold;
}
.main-top p{
  font-size: 14px;
  color: rgb(110, 109, 109);
}
.main-content{
  padding: 20px;
  background: #fff;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.main-content h2{
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 20px;
}



</style>
</head>
<body>
  <div class="container">
    <nav>
      <ul>
        <li><a href="#Welcome" class="logo" onclick="loadContent('welcomestudent')" data-name="Welcome">
          <%
try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app","root","root");
   PreparedStatement pstmt=con.prepareStatement("select studentID from students where studentID=?");
   pstmt.setString(1,studentID);
   ResultSet rs=pstmt.executeQuery();
   if(rs.next()){
       // Retrieve the studentID and use it to build the image name
          String imageName = rs.getString("studentID") + ".jpg";

          // Check if the image exists
          boolean imageExists = new File("C:/Users/iamta/git/iamta/mini/src/main/webapp/" + imageName).exists();

          // If the image exists, display it
          if(imageExists){
              out.println("<img src='" + imageName + "' class='profile-pic' width='225' height='225'><br>");
          }
   }else{
          out.println("No Image of the Student");
   }
}catch(Exception e){
   out.println(e);
}
%>
          <span class="nav-item" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 250px;"><%= session.getAttribute("name") %></span>
        </a><br><br><br><br><br></li>
        
        
        <li><a href="#notifications" class="nav-link" onclick="loadContent('viewNotifications')" data-name="Notifications">
          <i class="fas fa-bell"></i>
          <span class="nav-item">Notifications</span>
        </a></li>
        <li><a href="#mentorinformation" class="nav-link" onclick="loadContent('mentorinformation')" data-name="Mentor Information">
          <i class="fas fa-user"></i>
          <span class="nav-item">Mentor Information</span>
        </a></li>
        <li><a href="#personaldetails" class="nav-link" onclick="loadContent('personaldetailsstudent')" data-name="Personal Details">
          <i class="fas fa-info-circle"></i>
          <span class="nav-item">Personal Details</span>
        </a></li>
        <li><a href="#" class="nav-link" onclick="loadContent('academicdetails')" data-name="Academic Details">
          <i class="fas fa-asterisk"></i>
          <span class="nav-item">Academic Details</span>
        </a></li>
        <li><a href="#progress" class="nav-link" onclick="loadContent('progressstudent')" data-name="Progress Report">
          <i class="fas fa-tasks"></i>
          <span class="nav-item">Progress</span>
        </a></li>
        <li><a href="#changepassword" class="nav-link" onclick="loadContent('changePasswordstudent')" data-name="Change Password">
          <i class="fas fa-unlock-alt"></i>
          <span class="nav-item">Change Password</span>
        </a></li>

        <li><a href="logOutstudent.jsp" class="logout">
          <i class="fas fa-sign-out-alt"></i>
          <span class="nav-item">Log out</span>
        </a></li>
      </ul>
    </nav>


    <section class="main">
  <div class="main-top" id="Welcome">

    <h1>Welcome</h1>
	<p style="position: absolute; top: 20px; right: 60px;"> 
    Your ERP ID is <%= session.getAttribute("studentID") %>
</p>

  </div>
  <div id="main-content"><div style="background-color: white; border-radius: 10px; padding: 20px; margin: 20px auto; max-width: 600px; text-align: center;">
		<div align="center">


</div>
		
	</div></div>
</section>
  </div>
<script>
  function loadContent(id) {
    const contentDiv = document.querySelector('#main-content');
    const url = id + '.jsp';
    fetch(url)
      .then(response => response.text())
      .then(html => {
        contentDiv.innerHTML = html;
      });
  }

  const links = document.querySelectorAll('.nav-link');
  const links1 = document.querySelectorAll('.logo');
  const mainContent = document.querySelector('.main-content');
  const mainTitle = document.querySelector('.main-top h1');

  links.forEach(link => {
    link.addEventListener('click', (event) => {
      event.preventDefault();
      const href = link.getAttribute('href');
      const name = link.getAttribute('data-name');
      mainTitle.textContent = name;
      mainContent.innerHTML = `<iframe src="${href}" style="width: 100%; height: 100%; border: none;"></iframe>`;
    });
  });
  
  links1.forEach(link => {
	    link.addEventListener('click', (event) => {
	      event.preventDefault();
	      const href = link.getAttribute('href');
	      const name = link.getAttribute('data-name');
	      mainTitle.textContent = name;
	      mainContent.innerHTML = `<iframe src="${href}" style="width: 100%; height: 100%; border: none;"></iframe>`;
	    });
	  });
</script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var welcomeLink = document.querySelector("a[href='#Welcome']");
    welcomeLink.classList.add("active");
  });
</script>
<script>
  document.addEventListener("DOMContentLoaded", function(){
    loadContent('welcomestudent');
  });
</script>


</body>
</html>
  