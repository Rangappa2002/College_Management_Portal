package finalproject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


/**
 * Servlet implementation class AddStudentServlet
 */
@WebServlet("/addstudent")
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
			
			String susn = request.getParameter("usn");
			String sbranch = request.getParameter("branch");
			String ssem = request.getParameter("sem");
			String fn = request.getParameter("fname");
			String ln = request.getParameter("lname");
			String semail = request.getParameter("email");
			String birth = request.getParameter("dob");
			String sgen = request.getParameter("gender");
			long smob = Long.parseLong(request.getParameter("mob-no"));
			String ssslc = request.getParameter("sslc");
			String spu = request.getParameter("pu/dip");
			
			PreparedStatement ps = con.prepareStatement("select * from addstudetails where usn = ?;");			
			ps.setString(1, susn);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Student with USN "+susn+" already exists. Please enter a different USN.');");
		        out.println("window.location.href='addstupage.jsp';");
		        out.println("</script>");
			}
			else {
				ps = con.prepareStatement("insert into addstudetails (usn, branch, sem, fname, lname, email, dob, gender, mob, sslc, pu) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");			
				ps.setString(1, susn);
				ps.setString(2, sbranch);
				ps.setString(3, ssem);
				ps.setString(4, fn);
				ps.setString(5, ln);
				ps.setString(6, semail);
				ps.setString(7, birth);
				ps.setString(8, sgen);
				ps.setLong(9, smob);
				ps.setString(10, ssslc);
				ps.setString(11, spu);
						
			
			int x = ps.executeUpdate();
			if(x > 0) {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Student details of "+susn+" added successfully!!');");
		        out.println("window.location.href='addstupage.jsp';");
		        out.println("</script>");	
			}
			else {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Failed to add details!! Try again');");
		        out.println("window.location.href='addstupage.jsp';");
		        out.println("</script>");
			}
		  }
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}


