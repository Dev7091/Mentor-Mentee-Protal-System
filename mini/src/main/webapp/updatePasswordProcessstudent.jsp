<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String jdbcUrl = "jdbc:mysql://localhost:3306/lab_app";
String dbUser = "root";
String dbPassword = "root";

String studentID = request.getParameter("id");
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
    String sql = "SELECT * FROM students WHERE studentID=? AND password=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, studentID);
    stmt.setString(2, oldPassword);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        // Student exists with old password, update password in database
        String updateSql = "UPDATE students SET password=? WHERE studentID=?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, newPassword);
        updateStmt.setString(2, studentID);
        updateStmt.executeUpdate();
        response.sendRedirect("updateSuccessstudent.jsp");
    } else {
        // Student does not exist with old password, display error message
        out.println("Invalid ID or password.");
    }

    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
  