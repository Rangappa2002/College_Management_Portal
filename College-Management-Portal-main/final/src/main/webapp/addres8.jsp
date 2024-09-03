<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - Enter marks</title>
<link rel="stylesheet" href="adddatastyle.css">
<style>
	h2{
	background-color: lightcyan;
	text-align: center;
	padding: 10px;
}

  .container-a {
    max-width: 800px;
    margin: 8% auto ;
    padding: 10px 20px;
    background-color: lavenderblush;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.dropdown {
            width: 100%;
            margin-bottom: 20px;
            font-size: 16px;
        }

        .dropdown select {
            width: 60%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #1b1a1a;
            border-radius: 5px;
            background-color: #fff;
        }

  .button-container {
  display: flex;
  justify-content: center;
  gap: 40px; 
}

.button-container button {
  padding: 10px 20px;
}

  .drop-down {
			font-size: 24px;
		}
		
		.branch-semester-dropdowns {
        display: none;
    }
</style>
</head>


<body>
      <header>
          <h1>Semester - 8</h1>
        </header>
  <form action="" method="post" >
     <div class="container-a">
     
       <label for="USN">USN: </label>
	<input type="text" name="addusn" id="addusn" required>
	
    <label for="semester">Semester:</label>
    <select class="dropdown" name="sem" id="semView">
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

    <div class="branch-semester-dropdowns">
        <label for="cycle">Cycle:</label>
        <select class="dropdown" name="cycle" id="cycleView" disabled>
            <option value="" disabled selected>Select Cycle</option>
            <option value="CHE">Chemistry</option>
            <option value="PHY">Physics</option>
        </select>
    </div>

    <label for="branch">Branch:</label>
    <select class="dropdown" name="branch" id="branch">
        <option value="" disabled selected>Select Branch</option>
        <option value="CSE">Computer Science</option>
        <option value="ECE">Electronics & Communication</option>
        <option value="CV">Civil</option>
        <option value="ME">Mechanical</option>
    </select>

    <label for="scheme">Scheme:</label>
    <select class="dropdown" name="scheme" id="scheme">
        <option value="" disabled selected>Select Scheme</option>
        <option value="2018">2018</option>
    </select>

       <div class="admin-options">
       <label for="Sub1">18XX81: <input type="text" id="Marks" name="8m1" required><br></label>
       </div>
 
       <div class="admin-options">
       <label for="Sub1">18XX82X: <input type="text" id="Marks" name="8m2" required><br></label>
       </div>

       <div class="admin-options">
       <label for="Sub1">18XXP83: <input type="text" id="Marks" name="8m3" required><br></label>
       </div>
       
       <div class="admin-options">
       <label for="Sub1">18XXS84: <input type="text" id="Marks" name="8m4" required><br></label>
       </div>
       
       <div class="admin-options">
       <label for="Sub1">18X185: <input type="text" id="Marks" name="8m5" required><br></label>
       </div>
       
       
  
  <div class="button-container">
    
    <button class="btn">Add</button>

    <button class="btn" onclick="goBack()">Back</button>

     <script>
          function goBack() {
        	  window.location.href = 'semsel.html'; 
         }
          
          document.getElementById('semView').addEventListener('change', function () {
              var cycleDropdown = document.getElementById('cycleView').parentNode;

              // Show branch and semester dropdowns if a year is selected
              cycleDropdown.style.display = (this.value == '1' || this.value == '2') ? 'block' : 'none';

              // Enable/disable cycle dropdown based on selection
              document.getElementById('cycleView').disabled = !(this.value == '1' || this.value == '2');
              if (!(this.value == '1' || this.value == '2')) {
                  document.getElementById('cycleView').selectedIndex = 0;
              }
          });
     </script>
   </div>
  </div>
  </form>
  
  <%
if (request.getMethod().equals("POST")) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");

        String susn = request.getParameter("addusn");
        String ssem = request.getParameter("sem");
        String sbranch = request.getParameter("branch");
        String sscheme = request.getParameter("scheme");
        
        String m1 = request.getParameter("8m1");
        String m2 = request.getParameter("8m2");
        String m3 = request.getParameter("8m3");
        String m4 = request.getParameter("8m4");
        String m5 = request.getParameter("8m5");
        
        PreparedStatement ps = con.prepareStatement("select * from sem8 where usn = ?;");			
		ps.setString(1, susn);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Result of USN "+susn+" already exists. Please enter a different USN.');");
	        out.println("window.location.href='addres8.jsp';");
	        out.println("</script>");
		}
		else {
        
        ps = con.prepareStatement("insert into sem8 (usn, sem, branch, scheme, `18XX81`, `18XX82X`, `18XXP83`, `18XXS84`, `18XX185`) values (?, ?, ?, ?, ?, ?, ?, ?, ?);");
        ps.setString(1, susn);
        ps.setString(2, ssem);
        ps.setString(3, sbranch);
        ps.setString(4, sscheme);
        ps.setString(5, m1);
        ps.setString(6, m2);
        ps.setString(7, m3);
        ps.setString(8, m4);
        ps.setString(9, m5);
       
        int x = ps.executeUpdate();
		if(x > 0) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Result of "+susn+" added successfully!!');");
	        out.println("window.location.href='addres8.jsp';");
	        out.println("</script>");	
		}
		else {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Failed to add results!! Try again');");
	        out.println("window.location.href='semsel.html';");
	        out.println("</script>");
		}

      }       
    } catch (ClassNotFoundException | SQLException e) {
        
        e.printStackTrace();
        
        out.println("<script type=\"text/javascript\">");
        out.println("alert('An error occurred');");
        out.println("window.location.href='adpage.html';");
        out.println("</script>");
    }
}
%> 
<a href="adpage.html" style="text-align: center; display: block;">
        <h3>Home</h3>
    </a>
</body>
</html>
