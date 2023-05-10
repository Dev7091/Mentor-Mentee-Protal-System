<%@ page import="java.sql.*" %>    
<html>
<head>
<style>
 /* CSS for the card */
        .card {
           box-sizing: border-box;
            background-color: #fff;
            border-radius: 5px;
            padding: 0px;
            width: 100%;
            margin: 0;
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
			color: white;
			text-align: center;
			font-size: 14px;
			border: none;
			border-radius: 4px;
			cursor: pointer;
			text-decoration: none;
		}
		.button:hover {
            background-color: darkred;
        }	
        
</style>
</head>
<body>

<%
String studentID = request.getParameter("studentID");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
    Statement st = con.createStatement();
    String getAssessment1Query = "SELECT * FROM assessment1 WHERE studentID = '" + studentID + "'";
    ResultSet rs = st.executeQuery(getAssessment1Query);
    out.println("<div>");
    out.println("<h1>Assessment During Ist Semester</h1>");
    while(rs.next()) {
        out.println("<table>");
        out.println("<tr><th>Accommodation:</th><td>" + rs.getString("accommodation") + "</td></tr>");
        out.println("<tr><th>Mentor Name:</th><td>" + rs.getString("mentorName") + "</td></tr>");
        out.println("</table>");
    }
    out.println("</div>");
  //internals
    String getInternalAssessment1Query = "SELECT * FROM internalassessment1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
    ResultSet irs = st.executeQuery(getInternalAssessment1Query);
    out.println("<h1>Internal Marks</h1>");
    out.println("<table>");
    out.println(" <tr><th>S. No.</th><th>Subjects (Code and Name)</th><th>Marks obtained (1st Sessional)</th><th>Marks obtained (2nd Sessional)</th><th>Marks obtained (3rd Sessional)</th></tr>");
    while(irs.next()) {
        out.println("<tr>");
        out.println("<td>"+ "1" +"</td>");
        out.println("<td>" + irs.getString("subjectCode1") + "</td>");
        out.println("<td>" + irs.getString("marks11") + "</td>");
        out.println("<td>" + irs.getString("marks21") + "</td>");
        out.println("<td>" + irs.getString("marks31") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "2" +"</td>");
        out.println("<td>" + irs.getString("subjectCode2") + "</td>");
        out.println("<td>" + irs.getString("marks12") + "</td>");
        out.println("<td>" + irs.getString("marks22") + "</td>");
        out.println("<td>" + irs.getString("marks32") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "3" +"</td>");
        out.println("<td>" + irs.getString("subjectCode3") + "</td>");
        out.println("<td>" + irs.getString("marks13") + "</td>");
        out.println("<td>" + irs.getString("marks23") + "</td>");
        out.println("<td>" + irs.getString("marks33") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "4" +"</td>");
        out.println("<td>" + irs.getString("subjectCode4") + "</td>");
        out.println("<td>" + irs.getString("marks14") + "</td>");
        out.println("<td>" + irs.getString("marks24") + "</td>");
        out.println("<td>" + irs.getString("marks34") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "5" +"</td>");
        out.println("<td>" + irs.getString("subjectCode5") + "</td>");
        out.println("<td>" + irs.getString("marks15") + "</td>");
        out.println("<td>" + irs.getString("marks25") + "</td>");
        out.println("<td>" + irs.getString("marks35") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "6" +"</td>");
        out.println("<td>" + irs.getString("subjectCode6") + "</td>");
        out.println("<td>" + irs.getString("marks16") + "</td>");
        out.println("<td>" + irs.getString("marks26") + "</td>");
        out.println("<td>" + irs.getString("marks36") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>"+ "7" +"</td>");
        out.println("<td>" + irs.getString("subjectCode7") + "</td>");
        out.println("<td>" + irs.getString("marks17") + "</td>");
        out.println("<td>" + irs.getString("marks27") + "</td>");
        out.println("<td>" + irs.getString("marks37") + "</td>");
        out.println("</tr>");
    }
    out.println("</table>");
    
  //attendance
    String getAttendanceRecord1Query = "SELECT * FROM attendance_record1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
    ResultSet ars = st.executeQuery(getAttendanceRecord1Query);
    out.println("<h1>Attendance Record</h1>");
    out.println("<table>");
    out.println(" <tr><th></th><th>Just before Sess 1</th><th>Just before Sess 2</th><th>Just before PUT</th><th>Overall Remedial(if any)</th></tr>");
    while(ars.next()) {
    	out.println("<tr>");
    	out.println("<td>" + "Percentage" + "</td>");
    	out.println("<td>" + ars.getString("attendance1") + "</td>");
    	out.println("<td>" + ars.getString("attendance2") + "</td>");
    	out.println("<td>" + ars.getString("attendance3") + "</td>");
    	out.println("<td>" + ars.getString("attendance4") + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>" + "Detained" + "</td>");
    	out.println("<td>" + ars.getString("detained1") + "</td>");
    	out.println("<td>" + ars.getString("detained2") + "</td>");
    	out.println("<td>" + ars.getString("detained3") + "</td>");
    	out.println("<td>" + ars.getString("overall_detained") + "</td>");
        out.println("</tr>");
    }
    out.println("</table>");
    
  //moocscourses
    String getMoocsCourses1Query = "SELECT * FROM moocscourses1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
    ResultSet mrs = st.executeQuery(getMoocsCourses1Query);
    out.println("<h1>MooCs Courses/Coursera Certification Progress</h1>");
    out.println("<table>");
    
    out.println(" <tr><th>Name of Certification</th><th>No. of Hours</th><th>Progress</th><th>Completion Status</th></tr>");
    while(mrs.next()) {
    out.println("<tr>");
      out.println("<td>" + mrs.getString("certificationName1") + "</td>");
      out.println("<td>" + mrs.getString("certificationHours1") + "</td>");
      out.println("<td>" + mrs.getString("certificationProgress1") + "</td>");
      out.println("<td>" + mrs.getString("certificationStatus1") + "</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td>" + mrs.getString("certificationName2") + "</td>");
      out.println("<td>" + mrs.getString("certificationHours2") + "</td>");
      out.println("<td>" + mrs.getString("certificationProgress2") + "</td>");
      out.println("<td>" + mrs.getString("certificationStatus2") + "</td>");
      out.println("</tr>");
    }
      out.println("</table>");
      
    //totalperformance
      String getSemesterPerformance1Query = "SELECT * FROM semester_performance1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
      ResultSet sprs = st.executeQuery(getSemesterPerformance1Query);
      out.println("<h1>Performance in 1st Semester</h1>");
      out.println("<table>");
      out.println("<tr><th>External Marks</th><th>Internal Marks</th><th>Total Marks</th></tr>");
      while(sprs.next()) {
    	  out.println("<tr>");
    	  out.println("<td>" + sprs.getString("external_marks") + "</td>");
          out.println("<td>" + sprs.getString("internal_marks") + "</td>");
          out.println("<td>" + sprs.getString("total_marks") + "</td>");
          out.println("</tr>");
          out.println("</table>");
          
          out.println("<table>");
      out.println("<tr><th>External Percentage</th><th>Internal Percentage</th><th>Total Percentage</th></tr>");  
      out.println("<tr>");
      out.println("<td>" + sprs.getString("external_percentage") + "</td>");
      out.println("<td>" + sprs.getString("internal_percentage") + "</td>");
      out.println("<td>" + sprs.getString("total_percentage") + "</td>");
        out.println("</tr>");
        
    }
      out.println("</table>");
      
    //carryover
      String getCarryOverDetails1Query = "SELECT * FROM carry_over_details1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
      ResultSet cors = st.executeQuery(getCarryOverDetails1Query);
      out.println("<h1>Carry over if any (Provide details)</h1>");
      out.println("<table>");
      out.println("<tr><th>Sub. Code</th><th>Marks</th></tr>");
      while(cors.next()) {
    	  out.println("<tr>");
    	  out.println("<td>" + cors.getString("sub_code1") + "</td>");
          out.println("<td>" + cors.getString("marks1") + "</td>");
          out.println("</tr>");
          out.println("<tr>");
    	  out.println("<td>" + cors.getString("sub_code2") + "</td>");
          out.println("<td>" + cors.getString("marks2") + "</td>");
          out.println("</tr>");
    	 
      }
      out.println("</table>");
      
      String getachievementsDetails1Query = "SELECT * FROM carry_over_details1 WHERE assessment1_id IN (SELECT id FROM assessment1 WHERE studentID = '" + studentID + "')";
      ResultSet acors = st.executeQuery(getachievementsDetails1Query);
      out.println("<div>");
      while(acors.next()) {
    	  out.println("<table>");
    	  out.println("<tr><th style=\"width: 50%;\">Achievements</th><td style=\"width: 50%;\">" + acors.getString("achievements") + "</td></tr>");          out.println("</table>");
          out.println("</table>");
      }
      out.println("</div>");
con.close();
} catch(Exception e) {
out.println(e);
}
%>
<br>
    <button id="print-page" class="button">Print Page</button>
<script>
    // Function to open printing options for the page
    document.getElementById("print-page").addEventListener("click", function() {
        window.print();
    });
</script>            
</body>
</html>