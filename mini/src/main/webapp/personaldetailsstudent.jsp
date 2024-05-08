<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Details Form</title> 
<style>
        /* CSS for the card */
        .card {
           box-sizing: border-box;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 98%;
            margin: 50px auto 0;
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
<div class="card">
    <% 
        String studentID = (String)session.getAttribute("studentID");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/lab_app", "root", "root");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM personal_details WHERE studentID = ? ");
        ps.setString(1, studentID);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	
    %>
    <form method="post" action="submitstudentpersonaldetails.jsp">
    <h3><label for="formfields"><strong>The fields which are not marked with a (Red star) can be left blank!</strong><span>*</span></label></h3>
    
        <label for="name">Name of the Student:<span>*</span></label>
        <input type="text" name="name" value="<%= rs.getString("name") %>" required>
        <label for="fatherName">Father's Name:<span>*</span></label>
        <input type="text" name="fatherName" value="<%= rs.getString("father_name") %>" required>
        <label for="universityRollNo">University Roll No.:<span>*</span></label>
        <input type="text" name="universityRollNo" value="<%= rs.getString("university_roll_no") %>" required><br>
        <label for="correspondenceAddress">Correspondence Address:<span>*</span></label>
        <textarea name="correspondenceAddress" required><%= rs.getString("correspondence_address") %></textarea>
        <label for="permanentAddress">Permanent Address:<span>*</span></label>
        <textarea name="permanentAddress" required><%= rs.getString("permanent_address") %></textarea><br>
        <label for="mobileNoStudent">Mobile No. (Student):<span>*</span></label>
        <input type="text" name="mobileNoStudent" value="<%= rs.getString("mobile_no_student") %>" required>
        <label for="mobileNoParent">Mobile No. (Parent's):<span>*</span></label>
        <input type="text" name="mobileNoParent" value="<%= rs.getString("mobile_no_parent") %>" required>
        <label for="emailStudent">Email (Student's):<span>*</span></label>
        <input type="email" name="emailStudent" value="<%= rs.getString("email_student") %>" required>
        <label for="emailParent">Email (Parent's):<span>*</span></label>
        <input type="email" name="emailParent" value="<%= rs.getString("email_parent") %>" required><br>
        <label for="occupation">Occupation of Father/Mother:<span>*</span></label>
        <input type="text" name="occupation" value="<%= rs.getString("occupation") %>" required>
        <label for="extraCurricularActivities">Participation in Extra Curricular Activities (during Course):</label>
        <textarea name="extraCurricularActivities"><%= rs.getString("extra_curricular_activities") %></textarea><br>
       <label for="category">Category:<span>*</span></label>
		<input type="radio" name="category" value="GEN" <%= rs.getString("category").equals("GEN") ? "checked" : "" %>>GEN
		<input type="radio" name="category" value="OBC" <%= rs.getString("category").equals("OBC") ? "checked" : "" %>>OBC
		<input type="radio" name="category" value="SC" <%= rs.getString("category").equals("SC") ? "checked" : "" %>>SC
		<input type="radio" name="category" value="ST" <%= rs.getString("category").equals("ST") ? "checked" : "" %>>ST
		<input type="radio" name="category" value="MINORITY" <%= rs.getString("category").equals("MINORITY") ? "checked" : "" %>>MINORITY<br>

        <label for="localGuardian">Name of Local Guardian:</label>
        <input type="text" name="localGuardian" value="<%= rs.getString("local_guardian") %>">
        <label for="localGuardianAddress">Address (Local Guardian's):</label>
        <textarea name="localGuardianAddress"><%= rs.getString("local_guardian_address") %></textarea>
        <label for="localGuardianContactNo">Contact No.(Local Guardian's):</label>
        <input type="text" name="localGuardianContactNo" value="<%= rs.getString("local_guardian_contact_no") %>"><br>
        <label for="previousAchievement">Previous Achievement (if any):</label>
        <textarea name="previousAchievement"><%= rs.getString("previous_achievement") %></textarea><br><br>
         <h2><label for="acadqualf"><strong>Academic Qualifications</strong><span>*</span></label></h2>

     <table>
        <tr>
            <th>Class</th>
            <th>Board/University</th>
            <th>Percentage (Aggr)</th>
            <th>Percentage (PCM/PCB/Science)</th>
            <th>Division</th>
        </tr>
        <%
// Prepared statement for 10th
PreparedStatement ps10th = con.prepareStatement("SELECT * FROM academic_qualifications WHERE personal_details_id = ? AND class = ?");
ps10th.setInt(1, rs.getInt("id"));
ps10th.setString(2, "10th");		
ResultSet rs10th = ps10th.executeQuery();
if(rs10th.next()) {
%>
        <tr>
            <td>10th</td>
            <td><input type="text" name="board10" value="<%= rs10th.getString("board_university") %>" required></td>
            <td><input type="text" name="percentageAggr10" value="<%= rs10th.getString("percentage_aggr") %>" required></td>
            <td><input type="text" name="percentagePCM10" value="<%= rs10th.getString("percentage_pcm") %>" required></td>
            <td><input type="text" name="division10" value="<%= rs10th.getString("division") %>" required></td>
        </tr>
         <%
// Prepared statement for 12th
PreparedStatement ps12th = con.prepareStatement("SELECT * FROM academic_qualifications WHERE personal_details_id = ? AND class = ?");
ps12th.setInt(1, rs.getInt("id"));
ps12th.setString(2, "12th");		
ResultSet rs12th = ps12th.executeQuery();
if(rs12th.next()) {
%>
        <tr>
            <td>12th</td>
            <td><input type="text" name="board12" value="<%= rs12th.getString("board_university") %>" required></td>
            <td><input type="text" name="percentageAggr12" value="<%= rs12th.getString("percentage_aggr") %>" required></td>
            <td><input type="text" name="percentagePCM12" value="<%= rs12th.getString("percentage_pcm") %>" required></td>
            <td><input type="text" name="division12" value="<%= rs12th.getString("division") %>" required></td>
        </tr>
         <%
// Prepared statement for Diploma
PreparedStatement psGraduation = con.prepareStatement("SELECT * FROM academic_qualifications WHERE personal_details_id = ? AND class = ?");
psGraduation.setInt(1, rs.getInt("id"));
psGraduation.setString(2, "Diploma/Graduation");		
ResultSet rsGraduation = psGraduation.executeQuery();
if(rsGraduation.next()) {
%>
        <tr>
            <td>Diploma/Graduation</td>
            <td><input type="text" name="boardGraduation" value="<%= rsGraduation.getString("board_university") %>" required></td>
            <td><input type="text" name="percentageAggrGraduation" value="<%= rsGraduation.getString("percentage_aggr") %>" required></td>
            <td><input type="text" name="percentagePCMGraduation" value="<%= rsGraduation.getString("percentage_pcm") %>" required></td>
            <td><input type="text" name="divisionGraduation" value="<%= rsGraduation.getString("division") %>" required></td>
        </tr>
    </table>
   <h4><label for="academicformfields"><strong>Note: Please type "N/A" in the fields which are not applicable!</strong><span>*</span></label></h4>
    
    
    <br>
    <input type="submit" value="Submit">

<a href="viewstudentpersonaldetails.jsp" target="_blank" class=button style='color: #ffffff;'>Download/Print Form Details</a>

    
</form>
  <% 
        } 
}}
        rs.close();
        con.close();
    %>
    <% } else {
    %>
   
    <form method="post" action="submitstudentpersonaldetails.jsp">
        <h3><label for="formfields"><strong>The fields which are not marked with a (Red star) can be left blank!</strong><span>*</span></label></h3>
    
        <label for="name">Name of the Student:<span>*</span></label>
        <input type="text" name="name" required>
        <label for="fatherName">Father's Name:<span>*</span></label>
        <input type="text" name="fatherName" required>
        <label for="universityRollNo">University Roll No.:<span>*</span></label>
        <input type="text" name="universityRollNo" required><br>
        <label for="correspondenceAddress">Correspondence Address:<span>*</span></label>
        <textarea name="correspondenceAddress" required></textarea>
        <label for="permanentAddress">Permanent Address:<span>*</span></label>
        <textarea name="permanentAddress" required></textarea><br>
        <label for="mobileNoStudent">Mobile No. (Student):<span>*</span></label>
        <input type="text" name="mobileNoStudent" required>
        <label for="mobileNoParent">Mobile No. (Parent's):<span>*</span></label>
        <input type="text" name="mobileNoParent" required>
        <label for="emailStudent">Email (Student's):<span>*</span></label>
        <input type="email" name="emailStudent" required>
        <label for="emailParent">Email (Parent's):<span>*</span></label>
        <input type="email" name="emailParent" required><br>
        <label for="occupation">Occupation of Father/Mother:<span>*</span></label>
        <input type="text" name="occupation" required>
        <label for="extraCurricularActivities">Participation in Extra Curricular Activities (during Course):</label>
        <textarea name="extraCurricularActivities"></textarea><br>
        <label for="category">Category:<span>*</span></label>
        <input type="radio" name="category" value="GEN">GEN
        <input type="radio" name="category" value="OBC">OBC
        <input type="radio" name="category" value="SC">SC
        <input type="radio" name="category" value="ST">ST
        <input type="radio" name="category" value="MINORITY">MINORITY<br>
        <label for="localGuardian">Name of Local Guardian:</label>
        <input type="text" name="localGuardian">
        <label for="localGuardianAddress">Address:</label>
        <textarea name="localGuardianAddress"></textarea>
        <label for="localGuardianContactNo">Contact No.:</label>
        <input type="text" name="localGuardianContactNo"><br>
        <label for="previousAchievement">Previous Achievement (if any):</label>
        <textarea name="previousAchievement"></textarea><br><br>
           <h2><label for="acadqualf"><strong>Academic Qualifications</strong><span>*</span></label></h2>
    <table>
        <tr>
            <th>Class</th>
            <th>Board/University</th>
            <th>Percentage (Aggr)</th>
            <th>Percentage (PCM/PCB/Science)</th>
            <th>Division</th>
        </tr>
        <tr>
            <td>10th</td>
            <td><input type="text" name="board10" required></td>
            <td><input type="text" name="percentageAggr10" required></td>
            <td><input type="text" name="percentagePCM10" required></td>
            <td><input type="text" name="division10" required></td>
        </tr>
        <tr>
            <td>12th</td>
            <td><input type="text" name="board12" required></td>
            <td><input type="text" name="percentageAggr12" required></td>
            <td><input type="text" name="percentagePCM12" required></td>
            <td><input type="text" name="division12" required></td>
        </tr>
        <tr>
            <td>Diploma/Graduation</td>
            <td><input type="text" name="boardGraduation" required></td>
            <td><input type="text" name="percentageAggrGraduation" required></td>
            <td><input type="text" name="percentagePCMGraduation" required></td>
            <td><input type="text" name="divisionGraduation" required></td>
        </tr>
    </table>
       <h4><label for="academicformfields"><strong>Note: Please type "N/A" in the fields which are not applicable!</strong><span>*</span></label></h4>
    
    <br>
    <input type="submit" value="Submit">
   
<a href="viewstudentpersonaldetails.jsp" target="_blank" class=button style='color: #ffffff;'>Download/Print Form Details</a>

    
</form>
    
    <%
    }%>
</div>

</body>
</html>  