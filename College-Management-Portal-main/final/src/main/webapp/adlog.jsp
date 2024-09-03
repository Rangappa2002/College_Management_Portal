<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - ADMIN LOGIN </title>
<link rel="stylesheet" href="style.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <div class="wrapper">
		 <form action=AdminServlet method=post>
			 <h1>Login</h1>
			 <div class="ip-box">
				 <input name="uname" type="text" placeholder="Username" required>
			 </div>
			 <br>
			 <div class="ip-box">
				 <input name="pwd" id="passwordInput"  type="password" placeholder="Password" required>
				 <span class="eye-icon" id="togglePasswordVisibility">&#128065;</span>
			 </div>
			 <br>
			 
			 <br>
			 <button type="submit" class="btn">Login</button>
			 
		 </form>
	 </div>
	
	<script>
	const passwordInput = document.getElementById('passwordInput');
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