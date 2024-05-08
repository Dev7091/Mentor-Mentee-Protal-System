<%@ page import="java.sql.*" %>
<%
String studentID = (String) session.getAttribute("studentID");
String accommodation = request.getParameter("accommodation");
String mentorName = request.getParameter("mentorName");
String subjectCode1 = request.getParameter("subjectCode1");
String marks11 = request.getParameter("marks11");
String marks21 = request.getParameter("marks21");
String marks31 = request.getParameter("marks31");
String subjectCode2 = request.getParameter("subjectCode2");
String marks12 = request.getParameter("marks12");
String marks22 = request.getParameter("marks22");
String marks32 = request.getParameter("marks32");
String subjectCode3 = request.getParameter("subjectCode3");
String marks13 = request.getParameter("marks13");
String marks23 = request.getParameter("marks23");
String marks33 = request.getParameter("marks33");
String subjectCode4 = request.getParameter("subjectCode4");
String marks14 = request.getParameter("marks14");
String marks24 = request.getParameter("marks24");
String marks34 = request.getParameter("marks34");
String subjectCode5 = request.getParameter("subjectCode5");
String marks15 = request.getParameter("marks15");
String marks25 = request.getParameter("marks25");
String marks35 = request.getParameter("marks35");
String subjectCode6 = request.getParameter("subjectCode6");
String marks16 = request.getParameter("marks16");
String marks26 = request.getParameter("marks26");
String marks36 = request.getParameter("marks36");
String subjectCode7 = request.getParameter("subjectCode7");
String marks17 = request.getParameter("marks17");
String marks27 = request.getParameter("marks27");
String marks37 = request.getParameter("marks37");
String attendance1 = request.getParameter("attendance1");
	String detained1 = request.getParameter("detained1");
    String attendance2 = request.getParameter("attendance2");
    String detained2 = request.getParameter("detained2");
    String attendance3 = request.getParameter("attendance3");
    String detained3 = request.getParameter("detained3");
    String attendance4 = request.getParameter("attendance4");
    String overall_detained = request.getParameter("overall_detained");
    String certificationName1 = request.getParameter("certificationName1");
        String certificationHours1 = request.getParameter("certificationHours1");
        String certificationProgress1 = request.getParameter("certificationProgress1");
        String certificationStatus1 = request.getParameter("certificationStatus1");
        String certificationName2 = request.getParameter("certificationName2");
        String certificationHours2 = request.getParameter("certificationHours2");
        String certificationProgress2 = request.getParameter("certificationProgress2");
        String certificationStatus2 = request.getParameter("certificationStatus2");
        String externalMarks = request.getParameter("external_marks");
String internalMarks = request.getParameter("internal_marks");
String totalMarks = request.getParameter("total_marks");
String externalPercentage = request.getParameter("external_percentage");
String internalPercentage = request.getParameter("internal_percentage");
String totalPercentage = request.getParameter("total_percentage");
String sub_code1 = request.getParameter("sub_code1");
   String sub_code2 = request.getParameter("sub_code2");
   String marks1 = request.getParameter("marks1");
   String marks2 = request.getParameter("marks2");
   String achievements = request.getParameter("achievements");

   try {
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
	    
	    // Check if data already exists in assessment1 table using studentID
    String checkAssessment1Query = "SELECT id FROM assessment1 WHERE studentID=?";
    PreparedStatement psCheckAssessment1 = con.prepareStatement(checkAssessment1Query);
    psCheckAssessment1.setString(1, studentID);
    ResultSet rsCheckAssessment1 = psCheckAssessment1.executeQuery();
    
    if (rsCheckAssessment1.next()) {
        int assessment1ID = rsCheckAssessment1.getInt("id");
        //update data in assessment1
                String updateAssessment1Query = "UPDATE assessment1 SET accommodation=?, mentorName=? WHERE id=?";
                PreparedStatement psUpdateAssessment1 = con.prepareStatement(updateAssessment1Query);
                psUpdateAssessment1.setString(1, accommodation);
                psUpdateAssessment1.setString(2, mentorName);
                psUpdateAssessment1.setInt(3, assessment1ID);

                psUpdateAssessment1.executeUpdate();

                String updateInternalAssessment1Query = "UPDATE internalassessment1 SET subjectCode1=?, marks11=?, marks21=?, marks31=?, subjectCode2=?, marks12=?, marks22=?, marks32=?, subjectCode3=?, marks13=?, marks23=?, marks33=?, subjectCode4=?, marks14=?, marks24=?, marks34=?, subjectCode5=?, marks15=?, marks25=?, marks35=?, subjectCode6=?, marks16=?, marks26=?, marks36=?, subjectCode7=?, marks17=?, marks27=?, marks37=? WHERE assessment1_id=?";
                PreparedStatement psUpdateInternalAssessment1 = con.prepareStatement(updateInternalAssessment1Query);
                psUpdateInternalAssessment1.setString(1, subjectCode1);
                psUpdateInternalAssessment1.setString(2, marks11);
                psUpdateInternalAssessment1.setString(3, marks21);
                psUpdateInternalAssessment1.setString(4, marks31);
                psUpdateInternalAssessment1.setString(5, subjectCode2);
                psUpdateInternalAssessment1.setString(6, marks12);
                psUpdateInternalAssessment1.setString(7, marks22);
                psUpdateInternalAssessment1.setString(8, marks32);
                psUpdateInternalAssessment1.setString(9, subjectCode3);
                psUpdateInternalAssessment1.setString(10, marks13);
                psUpdateInternalAssessment1.setString(11, marks23);
                psUpdateInternalAssessment1.setString(12, marks33);
                psUpdateInternalAssessment1.setString(13, subjectCode4);
                psUpdateInternalAssessment1.setString(14, marks14);
                psUpdateInternalAssessment1.setString(15, marks24);
                psUpdateInternalAssessment1.setString(16, marks34);
                psUpdateInternalAssessment1.setString(17, subjectCode5);
                psUpdateInternalAssessment1.setString(18, marks15);
                psUpdateInternalAssessment1.setString(19, marks25);
                psUpdateInternalAssessment1.setString(20, marks35);
                psUpdateInternalAssessment1.setString(21, subjectCode6);
                psUpdateInternalAssessment1.setString(22, marks16);
                psUpdateInternalAssessment1.setString(23, marks26);
                psUpdateInternalAssessment1.setString(24, marks36);
                psUpdateInternalAssessment1.setString(25, subjectCode7);
                psUpdateInternalAssessment1.setString(26, marks17);
                psUpdateInternalAssessment1.setString(27, marks27);
                psUpdateInternalAssessment1.setString(28, marks37);
                psUpdateInternalAssessment1.setInt(29, assessment1ID);
                psUpdateInternalAssessment1.executeUpdate();
                
                String updateAttendanceRecord1Query = "UPDATE attendance_record1 SET attendance1=?, detained1=?, attendance2=?, detained2=?, attendance3=?, detained3=?, attendance4=?, overall_detained=? WHERE assessment1_id=?";
                PreparedStatement psUpdateAttendanceRecord1 = con.prepareStatement(updateAttendanceRecord1Query);
                psUpdateAttendanceRecord1.setString(1, attendance1);
                psUpdateAttendanceRecord1.setString(2, detained1);
                psUpdateAttendanceRecord1.setString(3, attendance2);
                psUpdateAttendanceRecord1.setString(4, detained2);
                psUpdateAttendanceRecord1.setString(5, attendance3);
                psUpdateAttendanceRecord1.setString(6, detained3);
                psUpdateAttendanceRecord1.setString(7, attendance4);
                psUpdateAttendanceRecord1.setString(8, overall_detained);
                psUpdateAttendanceRecord1.setInt(9, assessment1ID);
                psUpdateAttendanceRecord1.executeUpdate();

        
        String updateMoocsCourses1Query = "UPDATE moocscourses1 SET certificationName1=?, certificationHours1=?, certificationProgress1=?, certificationStatus1=?, certificationName2=?, certificationHours2=?, certificationProgress2=?, certificationStatus2=? WHERE assessment1_id=?";
        PreparedStatement psUpdateMoocsCourses1 = con.prepareStatement(updateMoocsCourses1Query);
        psUpdateMoocsCourses1.setString(1, certificationName1);
        psUpdateMoocsCourses1.setString(2, certificationHours1);
        psUpdateMoocsCourses1.setString(3, certificationProgress1);
        psUpdateMoocsCourses1.setString(4, certificationStatus1);
        psUpdateMoocsCourses1.setString(5, certificationName2);
        psUpdateMoocsCourses1.setString(6, certificationHours2);
        psUpdateMoocsCourses1.setString(7, certificationProgress2);
        psUpdateMoocsCourses1.setString(8, certificationStatus2);
        psUpdateMoocsCourses1.setInt(9, assessment1ID);
        psUpdateMoocsCourses1.executeUpdate();
        
        String updateSemesterPerformance1Query = "UPDATE semester_performance1 SET external_marks=?, internal_marks=?, total_marks=?, external_percentage=?, internal_percentage=?, total_percentage=? WHERE assessment1_id=?";
        PreparedStatement psUpdateSemesterPerformance1 = con.prepareStatement(updateSemesterPerformance1Query);
        psUpdateSemesterPerformance1.setString(1, externalMarks);
        psUpdateSemesterPerformance1.setString(2, internalMarks);
        psUpdateSemesterPerformance1.setString(3, totalMarks);
        psUpdateSemesterPerformance1.setString(4, externalPercentage);
        psUpdateSemesterPerformance1.setString(5, internalPercentage);
        psUpdateSemesterPerformance1.setString(6, totalPercentage);
        psUpdateSemesterPerformance1.setInt(7, assessment1ID);
        psUpdateSemesterPerformance1.executeUpdate();
        // error aa sakti hai
        String updateCarryOverDetails1Query = "UPDATE carry_over_details1 SET sub_code1=?, marks1=?, sub_code2=?, marks2=?, achievements=? WHERE assessment1_id=?";
        PreparedStatement psUpdateCarryOverDetails1 = con.prepareStatement(updateCarryOverDetails1Query);
        psUpdateCarryOverDetails1.setString(1, sub_code1);
        psUpdateCarryOverDetails1.setString(3, marks1);
        psUpdateCarryOverDetails1.setString(2, sub_code2);
        psUpdateCarryOverDetails1.setString(4, marks2);
        psUpdateCarryOverDetails1.setString(5, achievements);
        psUpdateCarryOverDetails1.setInt(6, assessment1ID);
        psUpdateCarryOverDetails1.executeUpdate();
        
        out.println("<script>");
    	out.println("alert('Data Updated Successfully!');");
    	
    	out.println("</script>");
        } else {
        
           String insertAssessment1Query = "INSERT INTO assessment1 (accommodation, mentorName, studentID) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE accommodation = VALUES(accommodation), mentorName = VALUES(mentorName), studentID = VALUES(studentID)";
           PreparedStatement psInsertAssessment1 = con.prepareStatement(insertAssessment1Query);
           psInsertAssessment1.setString(1, accommodation);
           psInsertAssessment1.setString(2, mentorName);
           psInsertAssessment1.setString(3, studentID);

           int rowsAffected = psInsertAssessment1.executeUpdate();
           
        // Get if data already exists in assessment1 table using studentID
           String getAssessment1IDQuery = "SELECT id FROM assessment1 WHERE studentID=?";
           PreparedStatement psGetAssessment1ID = con.prepareStatement(getAssessment1IDQuery);
           psGetAssessment1ID.setString(1, studentID);
           ResultSet rsGetAssessment1ID = psGetAssessment1ID.executeQuery();
        
        if (rsGetAssessment1ID.next()) {
            int assessment1ID = rsGetAssessment1ID.getInt("id");
            //insert data in internal assessment1
			String insertInternalAssessment1Query = "INSERT INTO internalassessment1 (assessment1_id, subjectCode1, marks11, marks21, marks31, subjectCode2, marks12, marks22, marks32, subjectCode3, marks13, marks23, marks33, subjectCode4, marks14, marks24, marks34, subjectCode5, marks15, marks25, marks35, subjectCode6, marks16, marks26, marks36, subjectCode7, marks17, marks27, marks37) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE subjectCode1=VALUES(subjectCode1), marks11=VALUES(marks11), marks21=VALUES(marks21), marks31=VALUES(marks31), subjectCode2=VALUES(subjectCode2), marks12=VALUES(marks12), marks22=VALUES(marks22), marks32=VALUES(marks32), subjectCode3=VALUES(subjectCode3), marks13=VALUES(marks13), marks23=VALUES(marks23), marks33=VALUES(marks33), subjectCode4=VALUES(subjectCode4), marks14=VALUES(marks14), marks24=VALUES(marks24), marks34=VALUES(marks34), subjectCode5=VALUES(subjectCode5), marks15=VALUES(marks15), marks25=VALUES(marks25), marks35=VALUES(marks35), subjectCode6=VALUES(subjectCode6), marks16=VALUES(marks16), marks26=VALUES(marks26), marks36=VALUES(marks36), subjectCode7=VALUES(subjectCode7), marks17=VALUES(marks17), marks27=VALUES(marks27), marks37=VALUES(marks37)";            PreparedStatement psInsertInternalAssessment1 = con.prepareStatement(insertInternalAssessment1Query);
            psInsertInternalAssessment1.setInt(1, assessment1ID);
            	psInsertInternalAssessment1.setString(2, subjectCode1);
                psInsertInternalAssessment1.setString(3, marks11);
                psInsertInternalAssessment1.setString(4, marks21);
                psInsertInternalAssessment1.setString(5, marks31);
                psInsertInternalAssessment1.setString(6, subjectCode2);
                psInsertInternalAssessment1.setString(7, marks12);
                psInsertInternalAssessment1.setString(8, marks22);
                psInsertInternalAssessment1.setString(9, marks32);
                psInsertInternalAssessment1.setString(10, subjectCode3);
                psInsertInternalAssessment1.setString(11, marks13);
                psInsertInternalAssessment1.setString(12, marks23);
                psInsertInternalAssessment1.setString(13, marks33);
                psInsertInternalAssessment1.setString(14, subjectCode4);
                psInsertInternalAssessment1.setString(15, marks14);
                psInsertInternalAssessment1.setString(16, marks24);
                psInsertInternalAssessment1.setString(17, marks34);
                psInsertInternalAssessment1.setString(18, subjectCode5);
                psInsertInternalAssessment1.setString(19, marks15);
                psInsertInternalAssessment1.setString(20, marks25);
                psInsertInternalAssessment1.setString(21, marks35);
                psInsertInternalAssessment1.setString(22, subjectCode6);
                psInsertInternalAssessment1.setString(23, marks16);
                psInsertInternalAssessment1.setString(24, marks26);
                psInsertInternalAssessment1.setString(25, marks36);
                psInsertInternalAssessment1.setString(26, subjectCode7);
                psInsertInternalAssessment1.setString(27, marks17);
                psInsertInternalAssessment1.setString(28, marks27);
                psInsertInternalAssessment1.setString(29, marks37);
                psInsertInternalAssessment1.executeUpdate();
                
                String insertAttendanceRecord1Query = "INSERT INTO attendance_record1 (assessment1_id, attendance1, detained1, attendance2, detained2, attendance3, detained3, attendance4, overall_detained) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE attendance1 = VALUES(attendance1), detained1 = VALUES(detained1), attendance2 = VALUES(attendance2), detained2 = VALUES(detained2), attendance3 = VALUES(attendance3), detained3 = VALUES(detained3), attendance4 = VALUES(attendance4), overall_detained = VALUES(overall_detained)";
                
               PreparedStatement psInsertAttendanceRecord1 = con.prepareStatement(insertAttendanceRecord1Query);
                psInsertAttendanceRecord1.setInt(1, assessment1ID);
                psInsertAttendanceRecord1.setString(2, attendance1);
                psInsertAttendanceRecord1.setString(3, detained1);
                psInsertAttendanceRecord1.setString(4, attendance2);
                psInsertAttendanceRecord1.setString(5, detained2);
                psInsertAttendanceRecord1.setString(6, attendance3);
                psInsertAttendanceRecord1.setString(7, detained3);
                psInsertAttendanceRecord1.setString(8, attendance4);
                psInsertAttendanceRecord1.setString(9, overall_detained);
                psInsertAttendanceRecord1.executeUpdate();
                
                String insertMoocsCourses1Query = "INSERT INTO moocscourses1 (assessment1_id, certificationName1, certificationHours1, certificationProgress1, certificationStatus1, certificationName2, certificationHours2, certificationProgress2, certificationStatus2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE certificationName1 = VALUES(certificationName1), certificationHours1 = VALUES(certificationHours1), certificationProgress1 = VALUES(certificationProgress1), certificationStatus1 = VALUES(certificationStatus1), certificationName2 = VALUES(certificationName2), certificationHours2 = VALUES(certificationHours2), certificationProgress2 = VALUES(certificationProgress2), certificationStatus2 = VALUES(certificationStatus2)";
                PreparedStatement psInsertMoocsCourses1 = con.prepareStatement(insertMoocsCourses1Query);
                psInsertMoocsCourses1.setInt(1, assessment1ID);
                psInsertMoocsCourses1.setString(2, certificationName1);
                psInsertMoocsCourses1.setString(3, certificationHours1);
                psInsertMoocsCourses1.setString(4, certificationProgress1);
                psInsertMoocsCourses1.setString(5, certificationStatus1);
                psInsertMoocsCourses1.setString(6, certificationName2);
                psInsertMoocsCourses1.setString(7, certificationHours2);
                psInsertMoocsCourses1.setString(8, certificationProgress2);
                psInsertMoocsCourses1.setString(9, certificationStatus2);
                psInsertMoocsCourses1.executeUpdate();
                
                String insertSemesterPerformance1Query = "INSERT INTO semester_performance1 (assessment1_id, external_marks, internal_marks, total_marks, external_percentage, internal_percentage, total_percentage) VALUES (?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE external_marks = VALUES(external_marks), internal_marks = VALUES(internal_marks), total_marks = VALUES(total_marks), external_percentage = VALUES(external_percentage), internal_percentage = VALUES(internal_percentage), total_percentage = VALUES(total_percentage)";
                PreparedStatement psInsertSemesterPerformance1 = con.prepareStatement(insertSemesterPerformance1Query);
                psInsertSemesterPerformance1.setInt(1, assessment1ID);
                psInsertSemesterPerformance1.setString(2, externalMarks);
                psInsertSemesterPerformance1.setString(3, internalMarks);
                psInsertSemesterPerformance1.setString(4, totalMarks);
                psInsertSemesterPerformance1.setString(5, externalPercentage);
                psInsertSemesterPerformance1.setString(6, internalPercentage);
                psInsertSemesterPerformance1.setString(7, totalPercentage);
                psInsertSemesterPerformance1.executeUpdate();
                
                String insertCarryOverDetails1Query = "INSERT INTO carry_over_details1 (assessment1_id, sub_code1, marks1, sub_code2, marks2, achievements) VALUES (?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE sub_code1=VALUES(sub_code1), marks1=VALUES(marks1), sub_code2=VALUES(sub_code2), marks2=VALUES(marks2), achievements=VALUES(achievements)";
                PreparedStatement psInsertCarryOverDetails1 = con.prepareStatement(insertCarryOverDetails1Query);
                psInsertCarryOverDetails1.setInt(1, assessment1ID);
                psInsertCarryOverDetails1.setString(2, sub_code1);
                psInsertCarryOverDetails1.setString(3, marks1);
                psInsertCarryOverDetails1.setString(4, sub_code2);
                psInsertCarryOverDetails1.setString(5, marks2);
                psInsertCarryOverDetails1.setString(6, achievements);
                psInsertCarryOverDetails1.executeUpdate();
                
                out.println("<script>");
            	out.println("alert('Data Inserted Successfully!');");
            
            	out.println("</script>");
            } else {
            	out.println("<script>");
            	out.println("alert('Failed to insert data!');");
            
            	out.println("</script>");
            }
        
    }     
    con.close();

}catch(Exception e) {
out.println(e);
}

%>  