<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Logout Page</title>
</head>
<body>
  <% 
    // Logout the user
    session.invalidate();
  response.sendRedirect("studentLogin.jsp");
  %>
  

</body>
</html>
