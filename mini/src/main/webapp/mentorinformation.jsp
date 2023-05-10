<%@ page import="java.sql.*,java.io.*"
 %>
<html>
<head>
<title>Mentor Details</title>
<style>
.card {
           box-sizing: border-box;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 98%;
            margin: 50px auto 0;
            max-width: 1400px;
            margin-top: 0px;
        }
        </style>
</head>
<body>
<div class="card">
<%
try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app","root","root");
   String studentID = (String) session.getAttribute("studentID");
   PreparedStatement pstmt=con.prepareStatement("select * from mentors where mentorID=(select mentorID from students where studentID=?)");
   pstmt.setString(1,studentID);
   ResultSet rs=pstmt.executeQuery();
   if(rs.next()){
	   // Retrieve the mentorID and use it to build the image name
	      String mentorID = rs.getString("mentorID");
	      String imageName = mentorID + ".jpg";



	  // Check if the image exists
	      boolean imageExists = new File("C:/Users/iamta/git/mini/mini/src/main/webapp/" + imageName).exists();

	   // If the image exists, display it
	   if(imageExists){
	      out.println("<img src='" + imageName + "'style='border-radius: 10px;'><br>");
	   }

	   out.println("<strong>Mentor Name:</strong> "+rs.getString("mentorname")+"<br>");
	      out.println("<strong>Department:</strong> "+rs.getString("department")+"<br>");
	      out.println("<strong>Email:</strong> "+rs.getString("email")+"<br>");
	      out.println("<strong>Phone Number:</strong> "+rs.getString("phoneno")+"<br>"+"<br>");
	      out.println("<strong>About:</strong><br> <p style='text-align: justify;'>"+rs.getString("about")+"<br>");
   }else{
      out.println("No Mentor Assigned for this Student");
   }
}catch(Exception e){
   out.println(e);
}
%>
</div>
</body>
</html>
