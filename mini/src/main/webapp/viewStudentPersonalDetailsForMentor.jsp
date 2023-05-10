<%@ page import="java.sql.*" %>
<html>
<head>
<style>
          /* CSS for the card */
        .card {
            box-sizing: border-box;
            background-color: #fff;
            border-radius: 5px;
            padding: 0;
            width: 100%;
            margin: 0;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2), 0 4px 10px 0 rgba(0, 0, 0, 0.19);
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
    
    .personal-details-table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 30px;
    }
    
    th, td {
        padding: 10px;
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
        font-size: 16px;
    }
    
    input[type="submit"]:hover {
        background-color: #00008B;
    }
    
    .button {
        display: inline-block;
        padding: 12px 20px;
        background-color: #FF0000;
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
    
    .header {
        text-align: center;
        background-color: #007bff;
        color: #fff;
        padding: 20px;
    }
    
    .header h1 {
        margin: 0;
        font-size: 40px;
    }
    
    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .alert {
        background-color: #f44336;
        color: #fff;
        padding: 20px;
        margin-bottom: 15px;
    }
    
    .alert p {
        margin: 0;
        font-size: 16px;
    }
    
    .success {
        background-color: #4CAF50;
    }
    
    .success p {
        margin: 0;
        font-size: 16px;
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
    
    // Retrieving data from the tables "personal_details" and "academic_qualifications"
    String getDetailsQuery = "SELECT * FROM personal_details WHERE studentID = '" + studentID + "'";
    ResultSet rs = st.executeQuery(getDetailsQuery);
    
    out.println("<div>");
    out.println("<h1>Personal Details</h1>");
    while(rs.next()) {
    	out.println("<table class=\"personal-details-table\">");
        out.println("<tr><th>Name:</th><td>" + rs.getString("name") + "</td></tr>");
        out.println("<tr><th>Father Name:</th><td>" + rs.getString("father_name") + "</td></tr>");
        out.println("<tr><th>University Roll No:</th><td>" + rs.getString("university_roll_no") + "</td></tr>");
        out.println("<tr><th>Correspondence Address:</th><td>" + rs.getString("correspondence_address") + "</td></tr>");
        out.println("<tr><th>Permanent Address:</th><td>" + rs.getString("permanent_address") + "</td></tr>");
        out.println("<tr><th>Mobile No (Student):</th><td>" + rs.getString("mobile_no_student") + "</td></tr>");
        out.println("<tr><th>Mobile No (Parent):</th><td>" + rs.getString("mobile_no_parent") + "</td></tr>");
        out.println("<tr><th>Email (Student):</th><td>" + rs.getString("email_student") + "</td></tr>");
        out.println("<tr><th>Email (Parent):</th><td>" + rs.getString("email_parent") + "</td></tr>");
        out.println("<tr><th>Occupation:</th><td>" + rs.getString("occupation") + "</td></tr>");
        out.println("<tr><th>Extra-curricular Activities:</th><td>" + rs.getString("extra_curricular_activities") + "</td></tr>");
        out.println("<tr><th>Category:</th><td>" + rs.getString("category") + "</td></tr>");
        out.println("<tr><th>Local Guardian:</th><td>" + rs.getString("local_guardian") + "</td></tr>");
        out.println("<tr><th>Local Guardian Address:</th><td>" + rs.getString("local_guardian_address") + "</td></tr>");
        out.println("<tr><th>Local Guardian Contact No:</th><td>" + rs.getString("local_guardian_contact_no") + "</td></tr>");
        out.println("<tr><th>Previous Achievement:</th><td>" + rs.getString("previous_achievement") + "</td></tr>");
        out.println("</table>");
    }
    out.println("</div>");

        //academic details
        String getAcademicQualificationsQuery = "SELECT * FROM academic_qualifications WHERE personal_details_id IN (SELECT id FROM personal_details WHERE studentID = '" + studentID + "')";
        ResultSet academicRS = st.executeQuery(getAcademicQualificationsQuery);
        out.println("<br>");
        out.println("<h1>Academic Qualifications</h1>");
        out.println("<table>");
        out.println("<tr><th>Class</th><th>Board/University</th><th>Percentage(Aggr)</th><th>Percentage (PCM/PCB/Science)</th><th>Division</th></tr>");
        while(academicRS.next()) {
        out.println("<tr>");
        out.println("<td>" + academicRS.getString("class") + "</td>");
        out.println("<td>" + academicRS.getString("board_university") + "</td>");
        out.println("<td>" + academicRS.getString("percentage_aggr") + "</td>");
        out.println("<td>" + academicRS.getString("percentage_pcm") + "</td>");
        out.println("<td>" + academicRS.getString("division") + "</td>");
        out.println("</tr>");
        }
        out.println("</table>");
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