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


public class TpoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/cmp", "root", "password");
			String tpou=request.getParameter("tpouser");
			String tpop=request.getParameter("tpopwd");
			
			PreparedStatement ps=con.prepareStatement("select tpouser from tpologin where tpouser=? and tpopwd=?");
			ps.setString(1, tpou);
			ps.setString(2, tpop);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				RequestDispatcher rd=request.getRequestDispatcher("tpopage.html");
				rd.forward(request, response);
			}
			else {
				out.println("<script type=\"text/javascript\">");
		        out.println("alert('Login Failed!! Try again');");
		        out.println("window.location.href='tpolog.jsp';");
		        out.println("</script>");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	}


