package mini;

import java.sql.*;
import java.util.*;

public class StudentDAO {
    private Connection connection;

    public StudentDAO() {
        try {
            // Initialize the JDBC driver and establish a connection
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Student> getStudentsByMentor(String mentorID) {
        List<Student> studentList = new ArrayList<Student>();
        try {
            // Create a SQL statement to retrieve the student data based on the mentor's ID
            String query = "SELECT studentID, name, rollno FROM students WHERE mentorID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, mentorID);

            // Execute the SQL query and retrieve the result set
            ResultSet resultSet = statement.executeQuery();

            // Loop through the result set and create a Student object for each row
            while (resultSet.next()) {
                Student student = new Student();
                student.setStudentID(resultSet.getString("studentID"));
                student.setName(resultSet.getString("name"));
                student.setRollNo(resultSet.getString("rollno"));
                studentList.add(student);
            }

            // Close the result set and statement
            resultSet.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentList;
    }
}
