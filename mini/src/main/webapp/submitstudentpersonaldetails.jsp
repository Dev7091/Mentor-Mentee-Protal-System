<%@ page import="java.sql.*" %>
<%
String studentID = (String) session.getAttribute("studentID");
String name = request.getParameter("name");
String fatherName = request.getParameter("fatherName");
String universityRollNo = request.getParameter("universityRollNo");
String correspondenceAddress = request.getParameter("correspondenceAddress");
String permanentAddress = request.getParameter("permanentAddress");
String mobileNoStudent = request.getParameter("mobileNoStudent");
String mobileNoParent = request.getParameter("mobileNoParent");
String emailStudent = request.getParameter("emailStudent");
String emailParent = request.getParameter("emailParent");
String occupation = request.getParameter("occupation");
String extraCurricularActivities = request.getParameter("extraCurricularActivities");
String category = request.getParameter("category");
String localGuardian = request.getParameter("localGuardian");
String localGuardianAddress = request.getParameter("localGuardianAddress");
String localGuardianContactNo = request.getParameter("localGuardianContactNo");
String previousAchievement = request.getParameter("previousAchievement");
String board10 = request.getParameter("board10");
String percentageAggr10 = request.getParameter("percentageAggr10");
String percentagePCM10 = request.getParameter("percentagePCM10");
String division10 = request.getParameter("division10");
String board12 = request.getParameter("board12");
String percentageAggr12 = request.getParameter("percentageAggr12");
String percentagePCM12 = request.getParameter("percentagePCM12");
String division12 = request.getParameter("division12");
String boardGraduation = request.getParameter("boardGraduation");
String percentageAggrGraduation = request.getParameter("percentageAggrGraduation");
String percentagePCMGraduation = request.getParameter("percentagePCMGraduation");
String divisionGraduation = request.getParameter("divisionGraduation");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");

    // Check if data already exists in personal_details table using studentID
    String checkPersonalDetailsQuery = "SELECT id FROM personal_details WHERE studentID=?";
    PreparedStatement psCheckPersonalDetails = con.prepareStatement(checkPersonalDetailsQuery);
    psCheckPersonalDetails.setString(1, studentID);
    ResultSet rsCheckPersonalDetails = psCheckPersonalDetails.executeQuery();

    if (rsCheckPersonalDetails.next()) {
        int personalDetailsID = rsCheckPersonalDetails.getInt("id");
        // Update data in personal_details table
        String updatePersonalDetailsQuery = "UPDATE personal_details SET name=?, father_name=?, university_roll_no=?, correspondence_address=?, permanent_address=?, mobile_no_student=?, mobile_no_parent=?, email_student=?, email_parent=?, occupation=?, extra_curricular_activities=?, category=?, local_guardian=?, local_guardian_address=?, local_guardian_contact_no=?, previous_achievement=? WHERE id=?";
        PreparedStatement psUpdatePersonalDetails = con.prepareStatement(updatePersonalDetailsQuery);
        psUpdatePersonalDetails.setString(1, name);
        psUpdatePersonalDetails.setString(2, fatherName);
        psUpdatePersonalDetails.setString(3, universityRollNo);
        psUpdatePersonalDetails.setString(4, correspondenceAddress);
        psUpdatePersonalDetails.setString(5, permanentAddress);
        psUpdatePersonalDetails.setString(6, mobileNoStudent);
        psUpdatePersonalDetails.setString(7, mobileNoParent);
        psUpdatePersonalDetails.setString(8, emailStudent);
        psUpdatePersonalDetails.setString(9, emailParent);
        psUpdatePersonalDetails.setString(10, occupation);
        psUpdatePersonalDetails.setString(11, extraCurricularActivities);
        psUpdatePersonalDetails.setString(12, category);
        psUpdatePersonalDetails.setString(13, localGuardian);
        psUpdatePersonalDetails.setString(14, localGuardianAddress);
        psUpdatePersonalDetails.setString(15, localGuardianContactNo);
        psUpdatePersonalDetails.setString(16, previousAchievement);
        psUpdatePersonalDetails.setInt(17, personalDetailsID);
        psUpdatePersonalDetails.executeUpdate();

        // Update data in academic_qualifications table for 10th class
        String updateAcademicDetailsQuery10 = "UPDATE academic_qualifications SET board_university=?, percentage_aggr=?, percentage_pcm=?, division=? WHERE personal_details_id=? AND class=?";
        PreparedStatement psUpdateAcademicDetails10 = con.prepareStatement(updateAcademicDetailsQuery10);
        psUpdateAcademicDetails10.setString(1, board10);
        psUpdateAcademicDetails10.setString(2, percentageAggr10);
        psUpdateAcademicDetails10.setString(3, percentagePCM10);
        psUpdateAcademicDetails10.setString(4, division10);
        psUpdateAcademicDetails10.setInt(5, personalDetailsID);
        psUpdateAcademicDetails10.setString(6, "10th");
        psUpdateAcademicDetails10.executeUpdate();

        // Update data in academic_qualifications table for 12th class
        String updateAcademicDetailsQuery12 = "UPDATE academic_qualifications SET board_university=?, percentage_aggr=?, percentage_pcm=?, division=? WHERE personal_details_id=? AND class=?";
        PreparedStatement psUpdateAcademicDetails12 = con.prepareStatement(updateAcademicDetailsQuery12);
        psUpdateAcademicDetails12.setString(1, board12);
        psUpdateAcademicDetails12.setString(2, percentageAggr12);
        psUpdateAcademicDetails12.setString(3, percentagePCM12);
        psUpdateAcademicDetails12.setString(4, division12);
        psUpdateAcademicDetails12.setInt(5, personalDetailsID);
        psUpdateAcademicDetails12.setString(6, "12th");
        psUpdateAcademicDetails12.executeUpdate();
        // Update data in academic_qualifications table for Graduation/Diploma
        String updateAcademicDetailsQueryGraduation = "UPDATE academic_qualifications SET board_university=?, percentage_aggr=?, percentage_pcm=?, division=? WHERE personal_details_id=? AND class=?";

        PreparedStatement psUpdateAcademicDetailsGraduation = con.prepareStatement(updateAcademicDetailsQueryGraduation);
        psUpdateAcademicDetailsGraduation.setString(1, boardGraduation);
        psUpdateAcademicDetailsGraduation.setString(2, percentageAggrGraduation);
        psUpdateAcademicDetailsGraduation.setString(3, percentagePCMGraduation);
        psUpdateAcademicDetailsGraduation.setString(4, divisionGraduation);
        psUpdateAcademicDetailsGraduation.setInt(5, personalDetailsID);
        psUpdateAcademicDetailsGraduation.setString(6, "Diploma/Graduation");
        psUpdateAcademicDetailsGraduation.executeUpdate();
        
        out.println("<script>");
        out.println("alert('Data Updated successfully!');");
        out.println("window.location.href='studentaccount.jsp';");
        out.println("</script>");
    } else {
    	String insertPersonalDetailsQuery = "INSERT INTO personal_details (name, father_name, university_roll_no, correspondence_address, permanent_address, mobile_no_student, mobile_no_parent, email_student, email_parent, occupation, extra_curricular_activities, category, local_guardian, local_guardian_address, local_guardian_contact_no, previous_achievement, studentID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE name = VALUES(name), father_name = VALUES(father_name), university_roll_no = VALUES(university_roll_no), correspondence_address = VALUES(correspondence_address), permanent_address = VALUES(permanent_address), mobile_no_student = VALUES(mobile_no_student), mobile_no_parent = VALUES(mobile_no_parent), email_student = VALUES(email_student), email_parent = VALUES(email_parent), occupation = VALUES(occupation), extra_curricular_activities = VALUES(extra_curricular_activities), category = VALUES(category), local_guardian = VALUES(local_guardian), local_guardian_address = VALUES(local_guardian_address), local_guardian_contact_no = VALUES(local_guardian_contact_no), previous_achievement = VALUES(previous_achievement), studentID = VALUES(studentID)";
        PreparedStatement psInsertPersonalDetails = con.prepareStatement(insertPersonalDetailsQuery);
        psInsertPersonalDetails.setString(1, name);
        psInsertPersonalDetails.setString(2, fatherName);
        psInsertPersonalDetails.setString(3, universityRollNo);
        psInsertPersonalDetails.setString(4, correspondenceAddress);
        psInsertPersonalDetails.setString(5, permanentAddress);
        psInsertPersonalDetails.setString(6, mobileNoStudent);
        psInsertPersonalDetails.setString(7, mobileNoParent);
        psInsertPersonalDetails.setString(8, emailStudent);
        psInsertPersonalDetails.setString(9, emailParent);
        psInsertPersonalDetails.setString(10, occupation);
        psInsertPersonalDetails.setString(11, extraCurricularActivities);
        psInsertPersonalDetails.setString(12, category);
        psInsertPersonalDetails.setString(13, localGuardian);
        psInsertPersonalDetails.setString(14, localGuardianAddress);
        psInsertPersonalDetails.setString(15, localGuardianContactNo);
        psInsertPersonalDetails.setString(16, previousAchievement);
        psInsertPersonalDetails.setString(17, studentID);
        int rowsAffected = psInsertPersonalDetails.executeUpdate();

        // Get personal_details_id from personal_details table using studentID
        String getPersonalDetailsIDQuery = "SELECT id FROM personal_details WHERE studentID=?";
        PreparedStatement psGetPersonalDetailsID = con.prepareStatement(getPersonalDetailsIDQuery);
        psGetPersonalDetailsID.setString(1, studentID);
        ResultSet rsGetPersonalDetailsID = psGetPersonalDetailsID.executeQuery();

        if (rsGetPersonalDetailsID.next()) {
            int personalDetailsID = rsGetPersonalDetailsID.getInt("id");

            // Insert or update data in academic_qualifications table
            String insertAcademicDetailsQuery = "INSERT INTO academic_qualifications (personal_details_id, class, board_university, percentage_aggr, percentage_pcm, division) VALUES (?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE board_university = VALUES(board_university), percentage_aggr = VALUES(percentage_aggr), percentage_pcm = VALUES(percentage_pcm), division= VALUES(division)";
         
                
                // Insert or Update data in academic_qualifications table for 10th class
                PreparedStatement psInsertUpdateAcademicDetails = con.prepareStatement(insertAcademicDetailsQuery);
                psInsertUpdateAcademicDetails.setInt(1, personalDetailsID);
                psInsertUpdateAcademicDetails.setString(2, "10th");
                psInsertUpdateAcademicDetails.setString(3, board10);
                psInsertUpdateAcademicDetails.setString(4, percentageAggr10);
                psInsertUpdateAcademicDetails.setString(5, percentagePCM10);
                psInsertUpdateAcademicDetails.setString(6, division10);
                psInsertUpdateAcademicDetails.executeUpdate();
                
                // Insert or Update data in academic_qualifications table for 12th class
                psInsertUpdateAcademicDetails.setInt(1, personalDetailsID);
                psInsertUpdateAcademicDetails.setString(2, "12th");
                psInsertUpdateAcademicDetails.setString(3, board12);
                psInsertUpdateAcademicDetails.setString(4, percentageAggr12);
                psInsertUpdateAcademicDetails.setString(5, percentagePCM12);
                psInsertUpdateAcademicDetails.setString(6, division12);
                psInsertUpdateAcademicDetails.executeUpdate();
                
                // Insert or Update data in academic_qualifications table for Graduation/Diploma
                psInsertUpdateAcademicDetails.setInt(1, personalDetailsID);
                psInsertUpdateAcademicDetails.setString(2, "Diploma/Graduation");
                psInsertUpdateAcademicDetails.setString(3, boardGraduation);
                psInsertUpdateAcademicDetails.setString(4, percentageAggrGraduation);
                psInsertUpdateAcademicDetails.setString(5, percentagePCMGraduation);
                psInsertUpdateAcademicDetails.setString(6, divisionGraduation);
                psInsertUpdateAcademicDetails.executeUpdate();
                
                
                out.println("<script>");
                out.println("window.location.href='studentaccount.jsp';");
                out.println("alert('Data inserted successfully!');");
                out.println("window.location.href='studentaccount.jsp';");
                out.println("</script>");
            } else {
            	out.println("<script>");
            	out.println("alert('Failed to insert data!');");
            	 out.println("window.location.href='studentaccount.jsp';");
            	out.println("</script>");
            }
        
    }     
    con.close();

}catch(Exception e) {
out.println(e);
}

%>  