package mini;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@WebServlet("/UploadDAO")
@MultipartConfig
public class UploadDAO extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SAVE_DIR = "D:/Images/";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String studentID = (String) session.getAttribute("studentID");

        String savePath = SAVE_DIR + File.separator + studentID;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        Part part = request.getPart("profilePic");
        String fileName = part.getSubmittedFileName();
        String filePath = savePath + File.separator + fileName;
        Path path = Paths.get(filePath);
        InputStream inputStream = part.getInputStream();
        Files.copy(inputStream, path);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");

            String sql = "UPDATE students SET profile_pic=? WHERE studentID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, filePath);
            statement.setString(2, studentID);
            statement.executeUpdate();

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("Upload.jsp");
    }
}
