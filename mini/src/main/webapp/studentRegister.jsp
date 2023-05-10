<%@ page import="java.sql.*, java.util.Random" %>
<%
String studentID = request.getParameter("studentID");
String rollno = request.getParameter("rollno");
String name = request.getParameter("name");
String password = request.getParameter("password");
String email = request.getParameter("email");
String phoneno = request.getParameter("phoneno");


if (studentID != null) {
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
Statement st = con.createStatement();
Random random = new Random();
String key = "";
for (int i = 0; i < 6; i++) {
key += (char) (random.nextInt(26) + 'A');
}
st.executeUpdate("INSERT INTO students (studentID, rollno, name, password, email, phoneno, `key`) VALUES ('" + studentID + "', '" + rollno + "', '" + name + "', '" + password + "', '" + email + "', '" + phoneno + "', '" + key + "')");
con.close();
%>

<style>
body {
  background-image: url("RegistrationSuccessful.jpg");
  background-size: cover;
  background-position: center;
		}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.card {
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  max-width: 400px;
  text-align: center;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  background-color: white;
}

.card h2 {
  font-weight: bold;
}
.card one {
  color: black;
  font-weight: bold;
}
.card p {
  color: red;
  font-weight: bold;
}

.card button {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  margin-top: 10px;
}
</style>

<div class="container">
  <div class="card">
    <h1>Registration Successful!</h1>
    <p class="one">Your registration key is: <strong><%= key %></strong> <i class="fas fa-copy copy-icon" onclick="copyKey()"></i></p>
    <p><strong>IMPORTANT!</strong> Note/Save this KEY in case you forgot your Password. This will help to recover your account.</p>
    <button onclick="location.href='studentLogin.jsp'">Go to Login Page</button>
  </div>
</div>



<%
    } catch (Exception e) {
      out.println(e);
    }
  }
%>

