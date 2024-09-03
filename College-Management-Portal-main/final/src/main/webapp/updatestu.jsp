<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GECH - Update Student Data</title>
<link rel="stylesheet" href="adddatastyle.css">
<style>
  .button-container {
    display: flex;
    justify-content: space-between;
    width: 400px; 
  }
  .button-container button {
    padding: 10px 20px;
  }
</style>

</head>
<body>
<header>
<h1>Update Student Data </h1>
</header>
<div class="container">
<form action="updatestudent" method="post">
  <label for="name">USN:</label>
  <input type="text" id="usn" name="usn" placeholder="Enter  USN" pattern="[4][Gg][Hh][0-9]{2}[CEMcem][CESVcesv][0-9]{3}" title="Please enter a valid USN (e.g. 4GH20CS061)" required>
  <br>
  <br>
  
  <label for="name">Branch:</label>
  <div class="dropdown">
    <select id="branch" name="branch">
        <option value="" disabled selected>Select Branch</option>
        <option value="CSE">Computer Science & Engineering</option>
        <option value="ECE">Electronics & Communication</option>
        <option value="CV">Civil Engineering</option>
        <option value="ME">Mechanical Engineering</option>
       
    </select>
</div>
  <br>
  
  <label for="name">Semester:</label>
  <div class="dropdown">
    <select id="semester" name="sem">
        <option value="" disabled selected>Select Semester</option>
        <option value="1">Semester 1</option>
        <option value="2">Semester 2</option>
        <option value="3">Semester 3</option>
        <option value="4">Semester 4</option>
        <option value="5">Semester 5</option>
        <option value="6">Semester 6</option>
        <option value="7">Semester 7</option>
        <option value="8">Semester 8</option>
    </select>
   </div>
   <br>
   <br>


  <label for="name">First Name:</label>
  <input type="text" id="name" name="fname" placeholder="Enter First name" required>
  <br>
  <br>

  <label for="name">Last Name:</label>
  <input type="text" id="name" name="lname" placeholder="Enter Last name " required>
  <br>
  <br>

  <label for="email">Email id:</label>
  <input type="email" id="email" name="email" placeholder="Enter email" required>
  <br>
  <br>

  <label for="name">DOB:</label>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
  $( function() {
    $( "#dob" ).datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: "-100:+0",
      dateFormat: "yy-mm-dd"  
    });
  } );
</script>
<input type="text" id="dob" name="dob" placeholder="Select date of birth">
<br>
<br>

<label for="gender">Gender:</label>
  <select id="gender" name="gender">
    <option value="">Select gender</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
  </select>
  <br>
  <br>
  
  <label for="name">Mobile Number:</label>
  <input type="text" id="name" name="mob-no" placeholder="Enter  Mobile number" pattern="[0-9]{10}" title="Please enter a 10-digit mobile number" required>
  <br>
  <br>

  <label for="10th Marks"> 10th Marks(in %):</label>
  <input type="text" id="name" name="sslc" placeholder="Enter 10th Marks" pattern="[0-9]{1,2}(\.[0-9]{1,2})?|100(\.0{1,2})?" title="Please enter a valid percentage for 10th Marks (0-100)"  required>
  <br>
  <br>

  <label for="PUC Male">12th/Diploma Marks(in %):</label>
  <input type="text" id="name" name="pu/dip" placeholder="Enter PUC Marks" pattern="[0-9]{1,2}(\.[0-9]{1,2})?|100(\.0{1,2})?" title="Please enter a valid percentage for 10th Marks (0-100)" required>
  <br>
  <br>
  
  <div class="button-container">
    
    <button class="btn">Update</button>

    <button class="btn" onClick="goBack()">Back</button>

<script>
function goBack() {
	window.location.href = 'adpage.html'; 
}
</script>
</div>
</form>
</div>
<a href="adpage.html" style="text-align: center; display: block;">
        <h3>Home</h3>
    </a>
</body>
</html>
