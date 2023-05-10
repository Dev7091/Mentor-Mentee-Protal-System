<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String performance_current_semester = request.getParameter("performance_current_semester");
String remarks = request.getParameter("remarks");
String studentID = request.getParameter("studentID");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
    
    // Check if the student progress record already exists for the given studentID
    String checkStudentProgressQuery = "SELECT performance_number FROM studentprogress WHERE studentID = ?";
    PreparedStatement psCheckStudentProgress = con.prepareStatement(checkStudentProgressQuery);
    psCheckStudentProgress.setString(1, studentID);
    ResultSet rsCheckStudentProgress = psCheckStudentProgress.executeQuery();
    
    if (rsCheckStudentProgress.next()) {
        int studentProgressNo = rsCheckStudentProgress.getInt("performance_number");
    // Update the existing student progress record or insert a new record
        String updateStudentPerformanceQuery = "UPDATE studentprogress SET name=?, performance_current_semester=?, remarks=? WHERE performance_number=?";
        PreparedStatement psUpdateStudentPerformance = con.prepareStatement(updateStudentPerformanceQuery);
        psUpdateStudentPerformance.setString(1, name);
        psUpdateStudentPerformance.setString(2, performance_current_semester);
        psUpdateStudentPerformance.setString(3, remarks);
        psUpdateStudentPerformance.setInt(4, studentProgressNo);
        psUpdateStudentPerformance.executeUpdate();
        
        String message = "Progress updated successfully!";
        out.println("<script>alert('" + message + "'); window.close();</script>");


    } else {
    	String insertStudentPerformanceQuery = "INSERT INTO studentprogress (name, performance_current_semester, remarks, studentID) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE name = VALUES(name), performance_current_semester = VALUES(performance_current_semester), remarks = VALUES(remarks), studentID = VALUES(studentID)";
    	PreparedStatement psInsertStudentPerformance = con.prepareStatement(insertStudentPerformanceQuery);
    	psInsertStudentPerformance.setString(1, name);
    	psInsertStudentPerformance.setString(2, performance_current_semester);
    	psInsertStudentPerformance.setString(3, remarks);
    	psInsertStudentPerformance.setString(4, studentID);
    	int rowsAffected = psInsertStudentPerformance.executeUpdate();
    	
    	 String message = "Progress inserted successfully!";
    	 out.println("<script>alert('" + message + "'); window.close();</script>");
    
}

  
con.close();

}catch(Exception e) {
out.println(e);
}
%>
