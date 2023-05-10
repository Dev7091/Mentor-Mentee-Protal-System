<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
// Get user input from login form
String mentorID = request.getParameter("id");
String password = request.getParameter("password");

// Database connection details
String jdbcUrl = "jdbc:mysql://localhost:3306/lab_app";
String dbUser = "root";
String dbPassword = "root";

// Connect to database and query for user
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
    String sql = "SELECT * FROM mentors WHERE mentorID=? AND password=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, mentorID);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // Authentication successful, set session attribute and redirect to home page
        String mentorname = rs.getString("mentorname");
		String email = rs.getString("email");
		String phoneno = rs.getString("phoneno");
		session.setAttribute("mentorname", mentorname);
		session.setAttribute("email", email);
		session.setAttribute("phoneno", phoneno);
        session.setAttribute("mentorID", mentorID);
        response.sendRedirect("mentoraccount.jsp");
    } else {
        // Authentication failed, display error message
        out.println("<script>alert('Invalid username or password.');</script>");
        request.getRequestDispatcher("mentorLogin.jsp").include(request, response);
    }

    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
    
}

%>
