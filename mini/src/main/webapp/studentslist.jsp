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
        padding: 10px 30px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 10px;
        
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
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
}

.dropdown:hover .dropdown-content {
  display: block;
  opacity: 1;
  transition: opacity 0.3s ease-in-out;
}

.dropdown-content button {
  color: black;
  padding: 10px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  width: 100%;
  text-align: left;
  background-color: #f1f1f1;
  border-bottom: 1px solid #ddd;
  transition: background-color 0.3s ease-in-out, transform 0.3s ease-in-out;
}

.dropdown-content button:hover {
  background-color: #ddd;
  transform: translateX(5px);
}


    /* Card Styles */
    .card {
       box-sizing: border-box;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 98%;
            margin: 50px auto 0;
    }
    button.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 10px 30px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out, transform 0.3s ease-in-out;
}

    button.dropbtn:hover {
    background-color: #3e8e41;
    color: white;
    transform: scale(1.1);
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
        <th>Personal Details</th>
        <th>Academic Details</th>
    </tr>
    <% for (Student student : studentList) { %>
    <tr>
        <td><%= student.getStudentID() %></td>
        <td><%= student.getRollNo() %></td>
        <td><%= student.getName() %></td>
        
        <td>
            <form action="viewStudentPersonalDetailsForMentor.jsp" method="post" target="_blank">
                <input type="hidden" name="studentID" value="<%= student.getStudentID() %>">
                <button class="dropbtn" type="submit">View</button>
            </form>
        </td>
        <td>
            <div class="dropdown">
                <button class="dropbtn">View</button>
                <div class="dropdown-content">
                    <% for (int i = 1; i <= 10; i++) { %>
                        <form action="ViewStudentAssessment<%= i %>DetailsForMentor.jsp" method="post" target="_blank">
                            <input type="hidden" name="studentID" value="<%= student.getStudentID() %>">
                            <button type="submit">Assessment during <%= i %> semester</button>
                        </form>
                    <% } %>
                </div>
            </div>
        </td>
    </tr>
    <% } %>
</table>
</div>
</body>
</html>