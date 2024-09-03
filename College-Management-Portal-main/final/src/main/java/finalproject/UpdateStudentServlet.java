package finalproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


/**
 * Servlet implementation class UpdateStudentServlet
 */
@WebServlet("/updatestudent")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement check = null;
        ResultSet rscheck = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");

            String susn = request.getParameter("usn");
            String sbranch = request.getParameter("branch");
            String ssem = request.getParameter("sem");
            String fn = request.getParameter("fname");
            String ln = request.getParameter("lname");
            String semail = request.getParameter("email");
            String birth = request.getParameter("dob");
            String sgen = request.getParameter("gender");

            String mob = request.getParameter("mob-no");
            long smob = 0;
            if (mob != null && !mob.isEmpty()) {
                smob = Long.parseLong(mob);
            }

            String ssslc = request.getParameter("sslc");
            String spu = request.getParameter("pu/dip");

            check = con.prepareStatement("select count(*) from addstudetails where usn = ?");
            check.setString(1, susn);
            rscheck = check.executeQuery();
            rscheck.next();

            int cnt = rscheck.getInt(1);
            if (cnt > 0) {
                PreparedStatement update = con.prepareStatement("update addstudetails set branch = ?, sem = ?, fname = ?, lname = ?, email = ?, dob = ?, gender = ?, mob = ?, sslc = ?, pu = ? WHERE usn = ?");
                update.setString(1, sbranch);
                update.setString(2, ssem);
                update.setString(3, fn);
                update.setString(4, ln);
                update.setString(5, semail);
                update.setString(6, birth);
                update.setString(7, sgen);
                update.setLong(8, smob);
                update.setString(9, ssslc);
                update.setString(10, spu);
                update.setString(11, susn);

                int uprows = update.executeUpdate();
                update.close();

                if (uprows > 0) {
                	out.println("<script type=\"text/javascript\">");
    		        out.println("alert('Student details of "+susn+" updated successfully!!');");
    		        out.println("window.location.href='updatestu.jsp';");
    		        out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Update Failed!! Try again');");
                    out.println("window.location.href='updatestu.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Student not found');");
                out.println("window.location.href='updatestu.jsp';");
                out.println("</script>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Database error occurred');");
            out.println("window.location.href='updatestu.jsp';");
            out.println("</script>");
            e.printStackTrace();
        } finally {
            try {
                if (rscheck != null) {
                    rscheck.close();
                }
                if (check != null) {
                    check.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
