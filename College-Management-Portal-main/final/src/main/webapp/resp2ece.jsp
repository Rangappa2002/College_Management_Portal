<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - Results(2) - 2020</title>
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
    Results - 2020 - Sem 2(P cycle)
    </h1>
     </header>
     
    <div>
    <br>
    <br>
       <table border="1" align="center">
      <tr><th>USN</th><th>Semester</th><th>Branch</th><th>18MAT21</th><th>18PHY22</th><th>18ELE23</th><th>18CIV24</th><th>18EGDL25</th><th>18PHYL26</th><th>18ELEL27</th><th>18EGH28</th></tr>
<% try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");              
    Statement stmt=con.createStatement();
    
    String sql="SELECT * FROM  phy_cycle2 WHERE branch = 'ECE';";
    ResultSet rs=stmt.executeQuery(sql);
    
    while(rs.next()){
    	String susn = rs.getString("usn");
        String ssem = rs.getString("sem");
        String sbranch = rs.getString("branch");
        String m1 = rs.getString("18MAT21");
        String m2 = rs.getString("18PHY22");
        String m3 = rs.getString("18ELE23");
        String m4 = rs.getString("18CIV24");
        String m5 = rs.getString("18EGDL25");
        String m6 = rs.getString("18PHYL26");
        String m7 = rs.getString("18ELEL27");
        String m8 = rs.getString("18EGH28");
%>
    <tr>
    <td><%= susn %></td>
    <td><%= ssem %></td>
    <td><%= sbranch %></td>
    <td><%= m1 %></td>
    <td><%= m2 %></td>
    <td><%= m3 %></td>
    <td><%= m4 %></td>
    <td><%= m5 %></td>
    <td><%= m6 %></td>
    <td><%= m7 %></td>
    <td><%= m8 %></td>
    </tr>
<% }
rs.close();
con.close();
stmt.close();
}catch(Exception e){
    out.println("Error occurred: "+e.getMessage());
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
        window.location.href = 'viewresult.html'; 
    }

    function download() {
        var wb = XLSX.utils.table_to_book(document.querySelector('table'), {sheet: "Sheet JS"});
        var fileName = document.querySelector('h1').innerText.replace(/\s+/g, '_').toLowerCase() + '.xlsx';
        return XLSX.writeFile(wb, fileName);
    }
    </script>
    <a href="adpage.html" style="text-align: center; display: block;">
        <h3>Home</h3>
    </a>
</body>
</html>





