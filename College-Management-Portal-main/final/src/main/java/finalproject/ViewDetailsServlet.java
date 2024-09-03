package finalproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

/**
 * Servlet implementation class ViewDetailsServlet
 */
@WebServlet("/viewdetails")
public class ViewDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");

            String susn = request.getParameter("usn");
            st = con.prepareStatement("select * from addstudetails where usn = ?;");
            st.setString(1, susn);
            resultSet = st.executeQuery();
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>GECH - Student Detail</title>");
            out.println("<style>");
            out.println("header {");
            out.println("    background-color: cadetblue;");
            out.println("    color: #fff;");
            out.println("    padding: 10px;");
            out.println("    text-align: center;");
            out.println("}");
            out.println(".btn {");
            out.println("    background-color: cadetblue;");
            out.println("    color: #fff;");
            out.println("    padding: 10px 20px;");
            out.println("    border: none;");
            out.println("    border-radius: 5px;");
            out.println("    cursor: pointer;");
            out.println("    transition: background-color 0.3s;");
            out.println("    font-size: 16px;");
            out.println("}");
            out.println(".button-container {");
            out.println("    display: flex;");
            out.println("    justify-content: center;");
            out.println("    width: 100%;");
            out.println("}");
            out.println("th, td {");
            out.println("    padding: 10px 10px;");
            out.println("    text-align: center;");
            out.println("    font-size: 18px;");
            out.println("}");
            out.println(".button-container button{");
            out.println("    padding: 10px 20px;");
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            
            out.println("<header>");
            out.println("<h1>Student Detail</h1>");
            out.println("</header>");
            out.println("<br>");
            out.println("<br>");

            if (!resultSet.next()) {
                // No records found for the provided USN, display an alert message
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Cannot view Student with USN " + susn + " details. Enter existing USN.');");
                out.println("window.location.href='viewdata.jsp';");
                out.println("</script>");
            } else {
                // Records found, display details in a styled table
                out.println("<table border='1' align='center'>");
                out.println("<thead><tr><th>USN</th><th>Semester</th><th>Branch</th><th>Name</th><th>Email ID</th><th>DOB</th><th>Gender</th><th>Mobile Number</th><th>SSLC Marks</th><th>PUC/Dip Marks</th></tr></thead>");
                out.println("<tbody>");
                do {
                    out.println("<tr>");
                    out.println("<td>" + resultSet.getString("usn") + "</td>");
                    out.println("<td>" + resultSet.getString("sem") + "</td>");
                    out.println("<td>" + resultSet.getString("branch") + "</td>");
                    out.println("<td>" + resultSet.getString("fname") + " " + resultSet.getString("lname") + "</td>");
                    out.println("<td>" + resultSet.getString("email") + "</td>");
                    out.println("<td>" + resultSet.getString("dob") + "</td>");
                    out.println("<td>" + resultSet.getString("gender") + "</td>");
                    out.println("<td>" + resultSet.getString("mob") + "</td>");
                    out.println("<td>" + resultSet.getString("sslc") + "</td>");
                    out.println("<td>" + resultSet.getString("pu") + "</td>");
                    out.println("</tr>");
                } while (resultSet.next());
                out.println("</tbody>");
                out.println("</table>");
                out.println("<br>");
                out.println("<div class=\"button-container\">");
                out.println("<button class=\"btn\" onclick=\"window.location.href='viewdata.jsp';\">Back</button>");
                out.println("</div>");
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (resultSet != null) resultSet.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


