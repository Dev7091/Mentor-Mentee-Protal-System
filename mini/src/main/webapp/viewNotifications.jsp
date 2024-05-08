<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notifications</title>
<style>
        /* CSS for the card */
        .card {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 97%;
            margin: auto;
            margin-top: 0px;
        }
        

        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
    padding: 8px;
    text-align: center; /* updated */
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f2f2f2;
    text-align: center; /* updated */
}


    </style>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app","root","root");
String studentID = (String) session.getAttribute("studentID");
PreparedStatement pstmt=conn.prepareStatement("select * from mentors where mentorID=(select mentorID from students where studentID=?)");
pstmt.setString(1,studentID);
ResultSet rsm=pstmt.executeQuery();
if(rsm.next()){
	   // Retrieve the mentorID and use it to build the image name
	      String mentorID = rsm.getString("mentorID");	      
	   }
	  
%>

<%
  // connect to database and retrieve notifications for this student
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app","root","root");
  PreparedStatement stmt = con.prepareStatement("SELECT * FROM notification WHERE studentID = ?");
  stmt.setString(1, studentID);
  ResultSet rs = stmt.executeQuery();

  // display notifications in a table
%>
<div class="card">
<h3>View Notifications sent by your Mentor: <%= rsm.getString("mentorname") %> </h3>

<table border="1">
  <tr>
    <th>Notification ID</th>
    <th>Notification Message</th>
    <th>Notification Time</th>
  </tr>
  <% while (rs.next()) { %>
  <tr>
    <td><%= rs.getInt("notificationID") %></td>
    <td><%= rs.getString("notificationMessage") %></td>
    <td><%= rs.getTimestamp("notificationTime") %></td>
  </tr>
  <% } %>
</table>
</div>
<%
  // close database connection
  rsm.close();
  pstmt.close();
  conn.close();
%>
<%
  // close database connection
  rs.close();
  stmt.close();
  con.close();
%>
</body>
</html>
  