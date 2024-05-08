<%@ page import="java.sql.*,java.io.*" %>
<%
String studentID = (String) session.getAttribute("studentID");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Picture Upload</title>
    <style>
 
   body {
   background-image: url("wsbg.jpeg");
   background-size: cover;
   background-position: 70px 0px; /* shift right by 50 pixels */
   background-repeat: no-repeat;
   background-size: 100%;
} 

    .profile-pic {
  border-radius: 50%;
  
}
    </style>
</head>
<body>
        <div style="box-sizing: border-box; background-color: rgba(200, 200, 200, 0.7); backdrop-filter: blur(10px); padding: 20px; border-radius: 10px; margin: 140px auto;margin-left: 380px;
        margin-right: 50px; width: 600px; text-align: center;">
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
            <h1>Welcome, <%= session.getAttribute("name") %>!</h1>
            <p>Your Phone Number is <%= session.getAttribute("phoneno") %></p>
            <p>Your Official Email is <%= session.getAttribute("email") %></p>
            <p>Your student ID is <%= studentID %></p>

        </div>
    
</body>
</html>
  