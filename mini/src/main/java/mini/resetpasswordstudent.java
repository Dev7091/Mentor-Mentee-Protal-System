package mini;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;

public class resetpasswordstudent {
    
    // method to send OTP to user's email
    public static void sendOTP(HttpServletRequest email) {
        ForgetPassword.main(email);
    }

    public static boolean verifyOTP(String email, String otp) {
        // database credentials
        String url = "jdbc:mysql://localhost:3306/lab_app";
        String user = "root";
        String password = "root";

        try {
            // connect to the database
            Connection conn = DriverManager.getConnection(url, user, password);

            // prepare the query to read OTP from database
            String query = "SELECT otp FROM students WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, email);

            // execute the query and check if any row is returned
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String dbOtp = rs.getString("otp");
                if (dbOtp.equals(otp)) {
                    return true; // OTP verified successfully
                }
            }

            // close the database connection
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // OTP verification failed
    }

    public static boolean resetPassword(String email, String newPassword) {
        // database credentials
        String url = "jdbc:mysql://localhost:3306/lab_app";
        String user = "root";
        String password = "root";

        try {
            // connect to the database
            Connection conn = DriverManager.getConnection(url, user, password);

            // prepare the query to update password
            String query = "UPDATE students SET password = ? WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, email);

            // execute the query and check if any row is affected
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return true; // password updated successfully
            }

            // close the database connection
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false; // password update failed
    }
}
