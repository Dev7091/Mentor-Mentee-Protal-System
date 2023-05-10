<!DOCTYPE html>
<html>
<head>
    <title>Academic Details</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .card {
            box-sizing: border-box;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 98%;
            margin: 50px auto 0;
            margin-top: 0px;
        }

        .button {
            display: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #00008B;
        }

        .dropdown {
             position: relative;
  display: inline-block;
  cursor: pointer;
  background-color: #32CD32; /* light green color */
  padding: 10px 25px;
  border-radius: 5px;
  color: white;
            
        }

        .dropdown-content {
            display: none;
            position: absolute;
            z-index: 1;
            top: 100%;
            left: 0;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
            padding: 12px 16px;
            cursor: pointer;
        }
        .dropdown-arrow {
    position: absolute;
    left: 168px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 18px;
    cursor: pointer;
    margin-left: 5px;
   
}
.dropdown:hover {
  background-color: #006400; /* dark green color */
}
.dropdown:hover .dropdown-arrow {
    color: black;
}


        .dropdown:hover .dropdown-content {
            display: block;
            cursor: pointer;
        }

        .frame-container {
            width: 98%;
            margin: 20px auto 0;
            border: none;
        }

        iframe {
            width: 100%;
            height: 600px;
        }
.dropdown-content a {
  color: black;
}
    </style>
</head>
<body>
    <div class="card">
        <h1>Select the Semester in which you want to upload your Academic Details</h1><br><br>
        <div class="dropdown">
            <span>Select a semester:</span>
            <div class="dropdown-content">
                <a href="assessment1.jsp" target="frame">Assessment during 1st Semester</a>
                <a href="assessment2.jsp" target="frame">Assessment during 2nd Semester</a>
                <a href="assessment3.jsp" target="frame">Assessment during 3rd Semester</a>
                <a href="assessment4.jsp" target="frame">Assessment during 4th Semester</a>
                <a href="assessment5.jsp" target="frame">Assessment during 5th Semester</a>
                <a href="assessment6.jsp" target="frame">Assessment during 6th Semester</a>
                <a href="assessment7.jsp" target="frame">Assessment during 7th Semester</a>
                <a href="assessment8.jsp" target="frame">Assessment during 8th Semester</a>
                <a href="assessment9.jsp" target="frame">Assessment during 9th Semester</a>
                <a href="assessment10.jsp" target="frame">Assessment during 10th Semester</a>
            </div>
            <div class="dropdown-arrow">&#9660;</div>
        </div>
        <div class="frame-container">
            <iframe name="frame"></iframe>
        </div>
    </div>
</body>
</html>
