<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GECH - Results CS(5) - 2020</title>
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
    Results of CSE-2020(Sem 5)
    </h1>
     </header>
     
    <div>
    <br>
    <br>
       <table border="1" align="center">
       <tr><th>USN</th><th>Semester</th><th>Branch</th><th>18MAT41</th><th>18XX42</th><th>18XX43</th><th>18XX44</th><th>18XX45</th><th>18XX46</th><th>18XXL47</th><th>18XXL48</th><th>18CPC49/KAN</th></tr>
<% try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");              
    Statement stmt=con.createStatement();
    
    String sql="SELECT * FROM  sem5 WHERE branch = 'CSE' AND usn LIKE '4GH20CS%' OR usn LIKE '4gh20cs%';";
    ResultSet rs=stmt.executeQuery(sql);
    
    while(rs.next()){
        String susn = rs.getString("usn");
        String ssem = rs.getString("sem");
        String sbranch = rs.getString("branch");
        String m1 = rs.getString("18XX51");
        String m2 = rs.getString("18XX52");
        String m3 = rs.getString("18XX53");
        String m4 = rs.getString("18XX54");
        String m5 = rs.getString("18XX55");
        String m6 = rs.getString("18XX56");
        String m7 = rs.getString("18XXL57");
        String m8 = rs.getString("18XXL58");
        String m9 = rs.getString("EVS");
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
    <td><%= m9 %></td>
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