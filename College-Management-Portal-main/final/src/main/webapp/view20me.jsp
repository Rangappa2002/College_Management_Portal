<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - Details ME-2020</title>
<style>
	td, th {
	   text-align: center;
	   padding: 10px 10px;
	   font-size: 18px;
	}
	
	header {
    background-color: cadetblue;
    color: #fff;
    padding: 10px;
    text-align: center;
    }
    
    .btn-container {
            width: 400px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px; 
            margin-left: 40%;
        }
        
        .button-container button {
            padding: 10px 20px;
        }
      
        .btn {
            padding: 10px 20px;
            color: #fff;
            background-color: cadetblue;
            font-size: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>

</head>

<body>
<header>
	<h1>
	  Details of Students Mechanical-2020
	   </h1>
	 </header>
	 
	<div>
	<br>
	<br>
	   <table border="1" align="center">
       <tr><th>USN</th><th>Semester</th><th>Branch</th><th>Name</th><th>Email ID</th><th>Date Of Birth</th><th>Gender</th><th>Mobile Number</th><th>SSLC Marks</th><th>PUC/Dip Marks</th></tr>
<% try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");	            
    
	java.sql.Statement stmt=con.createStatement();
	
	String sql="SELECT * FROM addstudetails WHERE usn LIKE '4GH20ME%' OR usn LIKE '4gh20me%';";
	java.sql.ResultSet rs=stmt.executeQuery(sql);
	
	while(rs.next()){
		String susn = rs.getString("usn");
		String ssem = rs.getString("sem");
		String sbranch = rs.getString("branch");
		String sname = rs.getString("fname")+" "+rs.getString("lname");
		String semail = rs.getString("email");
		String sdob = rs.getString("dob");
		String sgen = rs.getString("gender");
		String smob = rs.getString("mob");
		String ssslc = rs.getString("sslc");
		String spu = rs.getString("pu");
%>
	<tr>
	<td><%= susn %></td>
	<td><%= ssem %></td>
	<td><%= sbranch %></td>
	<td><%= sname %></td>
	<td><%= semail %></td>
	<td><%= sdob %></td>
	<td><%= sgen %></td>
	<td><%= smob %></td>
	<td><%= ssslc %></td>
	<td><%= spu %></td>
	</tr>

<% }
rs.close();
con.close();
stmt.close();
}catch(Exception e){
	out.println("Error occured: "+e.getMessage());
}
%>

</table>
	</div>
	
	<div class="btn-container">
        <button class="btn" onclick="goBack()">Back</button>
        <button class="btn" onclick="download()">Download</button>
    </div>
    
    <script>
    function goBack() {
        window.location.href = 'tpopage.html'; 
    }
    
    function download() {
        var wb = XLSX.utils.table_to_book(document.querySelector('table'), {sheet: "Sheet JS"});
        var fileName = document.querySelector('h1').innerText.replace(/\s+/g, '_').toLowerCase() + '.xlsx';
        return XLSX.writeFile(wb, fileName);
    }
    </script>
</body>
</html>

