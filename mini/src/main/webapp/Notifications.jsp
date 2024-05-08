<%@ page import="java.sql.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notifications</title>
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
        
        /* CSS for the form elements */
        label {
            display: block;
            margin-top: 20px;
        }
        label span {
		color: red;
	}
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-top: 5px;
            margin-bottom: 2px;
        }
        
        input[type="checkbox"] {
            margin-right: 10px;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }
        
        input[type="submit"]:hover {
            background-color: #00008B;
        }
        .button {
			display: inline-block;
			padding: 12px 20px;
			background-color: #Ff0000;
			color: #fff;
			text-align: center;
			font-size: 14px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			text-decoration: none;
		}
		.button:hover {
            background-color: #8b0000;
        }	
    </style>
</head>
<body>
<%
  // retrieve mentor ID from session
String mentorID = (String) session.getAttribute("mentorID");
  // query database to get students assigned to mentor
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/lab_app", "root", "root");
  PreparedStatement stmt = conn.prepareStatement("SELECT * FROM students WHERE mentorID = ?");
  stmt.setString(1, mentorID);
  ResultSet rs = stmt.executeQuery();
%>

<form action="sendNotification.jsp" method="post">
  <label for="message">Notification Message:</label>
  <textarea id="message" name="message" style="height: 460px; border-radius: 10px;"></textarea>
  <br>
  <label for="students">Select Students:</label>
  <select id="students" name="students" multiple style="width: 300px;">

    <% while (rs.next()) { %>
      <option value="<%= rs.getString("studentID") %>"><%= rs.getString("name") %></option>
    <% } %>
  </select>
  <br>
  <input type="submit" value="Send Notification">
</form>

</body>
</html>  