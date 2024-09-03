<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

.admin-options {
    margin-bottom: 20px;
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
</style>
</head>

<body>
<header>
    <h1>Enter the marks</h1>
</header>

<%
    String sem = request.getParameter("sem");
    String cycle = request.getParameter("cycle");
    String tableName = "";
    if (sem != null && cycle!= null) {
        switch (sem) {
            case "1": if(cycle == "PHY"){
                         tableName = "phy_details";
                      } else {
            	          tableName = "chem_details";
                      }
                      break;
            case "2": if(cycle == "PHY"){
                           tableName = "phy_details";
                      } else {
     	                   tableName = "chem_details";
                      }
                      break;
            case "3":
                tableName = "sem3";
                break;
            case "4":
                tableName = "sem4";
                break;
            case "5":
                tableName = "sem5";
                break;
            case "6":
                tableName = "sem6";
                break;
            case "7":
                tableName = "sem7";
                break;
            case "8":
                tableName = "sem8";
                break;
           
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
            DatabaseMetaData metaData = con.getMetaData();
            ResultSet columns = metaData.getColumns(null, null, tableName, null);

            while (columns.next()) {
                String columnName = columns.getString("COLUMN_NAME");
                %>
                <div class="admin-options">
                    <label for="<%= columnName %>"><%= columnName %></label>
                    <input type="text" id="<%= columnName %>" name="<%= columnName %>" required><br><br>
                </div>
                <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
%>

<form action="entermarks" method="post">
    <input type="hidden" name="usn" value="<%= request.getParameter("usn") %>">
    <input type="hidden" name="sem" value="<%= sem %>">
    <input type="hidden" name="cycle" value="<%= request.getParameter("cycle") %>">
    <input type="hidden" name="branch" value="<%= request.getParameter("branch") %>">
    <input type="hidden" name="scheme" value="<%= request.getParameter("scheme") %>">

    <div class="button-container">
        <button class="btn">Add</button>
        <button class="btn" onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.location.href = 'addresult.jsp';
            }
        </script>
    </div>
</form>

</body>
</html>
