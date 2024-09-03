package finalproject;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StulogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
			String stu=request.getParameter("stuname");
			String stup=request.getParameter("stupwd");
			
			PreparedStatement ps=con.prepareStatement("select user from stulogin where user=? and stupwd=?");
			ps.setString(1, stu);
			ps.setString(2, stup);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("stupage.html");
				rd.forward(request, response);
			}
			else {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Login Failed!! Try again');");
		        out.println("window.location.href='stulog.jsp';");
		        out.println("</script>");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
}


