<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - STUDENT LOGIN</title>
<link rel="stylesheet" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
     <div class="wrapper">
		 <form action=StulogServlet method=post>
			 <h1>Login</h1>
			 <div class="ip-box">
				 <input name="stuname" type="text" placeholder="Enter your username"  pattern="[4][Gg][Hh][0-9]{2}[CEMcem][CESVcesv][0-9]{3}" title="Please enter a valid USN (e.g.:4GH20CS061)" required>
			 </div>
			 <br>
			 <div class="ip-box">
				 <input name="stupwd" id="stupwd" type="password" placeholder="Enter your password" required>
				 <span class="eye-icon" id="togglePasswordVisibility">&#128065;</span>
			 </div>
			 <br>
			 <br>
			 <button type="submit" class="btn">Login</button>
		 </form>
	 </div>
	 
	 <script>
	const passwordInput = document.getElementById('stupwd');
    const togglePasswordVisibility = document.getElementById('togglePasswordVisibility');
    
    togglePasswordVisibility.addEventListener('click', function() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            togglePasswordVisibility.innerHTML = '&#128064;';
        } else {
            passwordInput.type = 'password';
            togglePasswordVisibility.innerHTML = '&#128065;'; 
        }
    });

    </script> 
</body>
</html>