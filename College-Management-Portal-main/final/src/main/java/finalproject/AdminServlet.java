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


public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
			String auname=request.getParameter("uname");
			String apwd=request.getParameter("pwd");
			
			PreparedStatement ps=con.prepareStatement("select uname from adlogin where uname=? and password=?");
			ps.setString(1, auname);
			ps.setString(2, apwd);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("adpage.html");
				rd.forward(request, response);
			}
			else {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Login Failed!! Try again');");
		        out.println("window.location.href='adlog.jsp';");
		        out.println("</script>");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
