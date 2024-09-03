<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GECH - View Student Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px; 
            margin: 50px auto;
            padding: 20px;
            background-color: #e2e1f3;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex; 
            flex-wrap: wrap; 
            justify-content: space-between; 
        }
        
         h1 {
            background-color: cadetblue;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .half-width {
            width: 48%;
        }

        .dropdown {
            width: 100%;
            margin-bottom: 20px;
            text-align: center;
        }

        .dropdown input {
            width: 60%;
            padding: 10px;
            font-size: 24px;
            border: 1px solid #1b1a1a;
            border-radius: 5px;
            background-color: #fff;
        }

        .btn-container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 20px; 
        }
        
        .button-container button {
            padding: 10px 20px;
        }
      
        .btn {
            padding: 10px 20px;
            color: #fff;
            background-color: cadetblue;
            font-size: 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .details-container {
            display: none;
            width: 100%;
            margin-top: 20px;
            padding: 20px;
            background-color: #f3f3f3;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <h1>View Student Data</h1>
    <form action="viewdetails" method="get">
    <div class="container">
		
        <div class="dropdown">
            <h2>Enter USN:</h2>
            <input type="text" id="usn" name="usn" placeholder="USN" required>
        </div>
        <div class="btn-container">
            <button class="btn">Submit</button>
        </div>
        </div>
    
         <div class="btn-container">
        <button class="btn" onclick="goBack()">Back</button>
   </div>
        <script>
         function goBack() {
	          window.location.href = 'adpage.html'; 
         }
   </script>      
</form>

</body>
</html>

