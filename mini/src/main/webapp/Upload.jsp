<%@ page import="java.io.*, java.sql.*, mini.UploadDAO" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Image Upload</title>
</head>
<body>
	<h1>Image Upload</h1>
	<form action="Upload.jsp" method="post" enctype="multipart/form-data">
		<label for="profilePic">Select an image to upload:</label>
		<input type="file" id="profilePic" name="profilePic"><br><br>
		<input type="submit" value="Upload">
	</form>

	<h1>Uploaded Image</h1>
	<%
		String studentID = (String) session.getAttribute("studentID");
		String imagePath = "D:/Images/" + studentID + "/";
		String profilePicPath = (String) request.getAttribute("profilePicPath");
		if (profilePicPath != null) {
			imagePath = profilePicPath;
		}

		File folder = new File(imagePath);
		File[] fileList = folder.listFiles();
		if (fileList != null) {
			for (File file : fileList) {
				if (file.isFile() && file.getName().toLowerCase().endsWith(".jpg")) {
					String fileName = file.getName();
					String imageUrl = imagePath + fileName;
	%>
	<img src="<%=imageUrl%>" alt="<%=fileName%>">
	<%
				}
			}
		}
	%>
</body>
</html>
