<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>GECH - Registration</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    
    header {
    background-color: cadetblue;
    color: #fff;
    padding: 20px;
    text-align: center;
}

    .container {
        max-width: 450px;
        margin: 50px auto;
        padding: 20px;
        background-color: #a6e7f2;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
    }
    input[type="text"],
    input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="submit"] {
        width: 100%;
        background-color: #4395ed;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .error {
        color: rgb(8, 1, 1);
        margin-top: 5px;
    }
    
     .button-container {
    display: flex;
    justify-content: center;
    width: 100%; 
  }
  
  .button-container button {
    padding: 10px 20px;
  }
  
  .btn {
    padding: 10px 20px;
    color: #fff;
    background-color: cadetblue;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 16px;
    justify-content: center;
}
</style>
</head>


<body>
<header>
<h1>Student Registration</h1>
</header>

<div class="container">
    <form action=stureg method="post" id="registrationForm" onsubmit="return validateForm()">
        <input type="text" name="usn" id="usn" placeholder="Username" pattern="[4][Gg][Hh][0-9]{2}[CEMcem][CESVcesv][0-9]{3}" title="Please enter a valid USN (e.g. 4GH20CS061)" required>
        <input type="password" name="password" id="password" placeholder="Password" pattern="(?=.*\d)(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}" title="Password must be at least 8 characters long and contain at least one number, one special character, and one uppercase letter" required>
        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
        <div id="passwordError" class="error"></div>
        <div class="button-container">
             <button class="btn">Register</button>
        </div>
    </form>
</div>

<div class="button-container">
    <button class="btn" onClick="goBack()">Back</button>
</div>

<script>
        function goBack() {
	         window.location.href = 'loginmain.html'; 
        }

    function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var passwordError = document.getElementById("passwordError");

        if (password !== confirmPassword) {
            passwordError.innerHTML = "Passwords do not match";
            return false;
        } else {
            return true;
        }
    }
</script>

</body>
</html>