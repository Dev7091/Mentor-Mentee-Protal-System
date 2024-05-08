<%@ page import="java.util.*, mini.Student, mini.StudentDAO" %>
<html>
<head>
    <title>Student List</title>
    <%-- CSS Styles --%>
<style>
    table {
        border-collapse: collapse;
        margin-top: 20px;
        width: 100%;
    }
    
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    
    th {
        background-color: #f2f2f2;
    }
    
    .dropdown {
        position: relative;
        display: inline-block;
    }
    
      .dropbtn {
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
        border-radius: 5px;
    }
    
    .dropbtn:hover {
        background-color: #3e8e41;
    }
    
    .dropdown-content {
        display: none;
        position: absolute;
        z-index: 1;
        background-color: #f1f1f1;
        min-width: 290px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        left: 50%;
    transform: translateX(-50%);
    }
    
    .dropdown-content button {
        color: black;
        padding: 10px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        width: 100%;
        text-align: left; 
    }
    
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Card Styles */
    .card {
       box-sizing: border-box;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            width: 98%;
            margin: 50px auto 0;
    }
</style>

<%-- Retrieve the mentor's ID from the session attribute and parse it to an int --%>
<% String mentorID = (String) session.getAttribute("mentorID"); %>

<%-- Use the StudentDAO class to retrieve the list of students for the mentor --%>
<% StudentDAO studentDAO = new StudentDAO(); %>
<% List<Student> studentList = studentDAO.getStudentsByMentor(mentorID); %>
<body>
<div class="card">
<table>
    <tr>
        <th>Student ID</th>
        <th>Roll Number</th>
        <th>Name</th>
        <th>Update Progress</th>
    </tr>
    <% for (Student student : studentList) { %>
    <tr>
        <td><%= student.getStudentID() %></td>
        <td><%= student.getRollNo() %></td>
        <td><%= student.getName() %></td>
        
        <td>
<form action="updateprogressstudentform.jsp" method="post" target="_blank">
                <input type="hidden" name="studentID" value="<%= student.getStudentID() %>">
                <button class="dropbtn" type="submit">Update Progress Report</button>
            </form>
        </td>

    </tr>
    <% } %>
</table>
</div>
</body>
</html>  