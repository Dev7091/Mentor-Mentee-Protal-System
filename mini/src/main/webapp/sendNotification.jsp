<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notification sending</title>
</head>
<body>
<%
  // retrieve form data
  String message = request.getParameter("message");
  String[] students = request.getParameterValues("students");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app","root","root");

  if (students != null) {
    // create new notification object for each selected student
    for (String studentID : students) {
      PreparedStatement stmt = con.prepareStatement("INSERT INTO notification (notificationMessage, notificationTime, studentID) VALUES (?, NOW(), ?)");
      stmt.setString(1, message);
      stmt.setString(2, studentID);
      stmt.executeUpdate();
    }
  }

  // redirect to confirmation page
  response.sendRedirect("notificationSent.jsp");
%>

</body>
</html>
