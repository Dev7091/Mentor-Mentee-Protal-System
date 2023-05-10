<%@ page import="java.sql.*" %>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String question = request.getParameter("question");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lab_app", "root", "root");
		PreparedStatement ps = con.prepareStatement("INSERT INTO faq (name, email, question) VALUES (?, ?, ?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, question);
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
	<title>Question Saved Success</title>
</head>
<body>
	<h1>Question Saved Successfully</h1>
	<a href="faqs.jsp">Back to Login Page</a>
</body>
</html>

