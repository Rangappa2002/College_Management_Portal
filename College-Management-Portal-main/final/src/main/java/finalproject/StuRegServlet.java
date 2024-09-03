package finalproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

@WebServlet("/stureg")
public class StuRegServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("resource")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String stureg = request.getParameter("usn");
        String sturegp = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
            
            ps = con.prepareStatement("SELECT user FROM stulogin WHERE user = ?");
            ps.setString(1, stureg);
            rs = ps.executeQuery();

            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('USN already exists! Please choose a different one.');");
                out.println("window.location.href='register.jsp';"); 
                out.println("</script>");
            } else {
                ps = con.prepareStatement("INSERT INTO stulogin (user, stupwd) VALUES (?, ?)");
                ps.setString(1, stureg);
                ps.setString(2, sturegp);

                int inserted = ps.executeUpdate();
                if (inserted > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Registered successfully!!');");
                    out.println("window.location.href='loginmain.html';");
                    out.println("</script>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
