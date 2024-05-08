<%@ page import="java.sql.*" %>
<%
// Get the student ID from the session attribute
String studentID = (String) session.getAttribute("studentID");

// Connect to the MySQL database
String url = "jdbc:mysql://localhost:3306/lab_app";
String username = "root";
String password = "root";
Connection conn = DriverManager.getConnection(url, username, password);

// Prepare the SQL statement to select the student progress data for the current student
String sql = "SELECT name, performance_current_semester, remarks " +
             "FROM studentprogress " +
             "WHERE studentID = ? " +
             "ORDER BY performance_current_semester";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, studentID);

// Execute the SQL statement and retrieve the result set
ResultSet rs = stmt.executeQuery();
%>

<!-- Display the progress report as heading and paragraphs -->
<div class="card">
  <h3>Semester-wise Performance:</h3><br>
  <div class="card-body">
    
    <% while (rs.next()) { %>
    <p><strong>Semester: </strong><%= rs.getString("name") %></p><br>
    <p><strong>Performance: </strong><%= rs.getString("performance_current_semester") %></p><br>
    <p style='text-align: justify;'><strong>Remarks: <br></strong><%= rs.getString("remarks") %></p><br>
    <% } %>
  </div>
</div>


<%
// Close the result set, statement, and database connection
rs.close();
stmt.close();
conn.close();
%>
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