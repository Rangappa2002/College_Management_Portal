<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - TPO LOGIN</title>
<link rel="stylesheet" href="style.css">

</head>

<body>
     <div class="wrapper">
		 <form action=TpoServlet method=post>
			 <h1>Login</h1>
			 <div class="ip-box">
				 <input name="tpouser" type="text" placeholder="Username" required>
			 </div>
			 <br>
			 <div class="ip-box">
				 <input name="tpopwd" id="tpopwd" type="password" placeholder="Password" required>
				 <span class="eye-icon" id="togglePasswordVisibility">&#128065;</span>
			 </div>
			 <br>
			 <br>
			 <button type="submit" class="btn">Login</button>
		</form>
	 </div>
	 
	 <script>
	const passwordInput = document.getElementById('tpopwd');
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