package cscorner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Ser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Ser() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out= response.getWriter();
			response.setContentType("text/html");
			Class.forName("com.mysql.cj.jdbc.Driver");
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quran", "root", "@isha123");
		String n=request.getParameter("t1");
		String p=request.getParameter("t3");
		// checking
		PreparedStatement ps=con.prepareStatement("select username from quranuser where username=? and password=?");
		// replacing ? value from actual parameters
		ps.setString(1, n);
		ps.setString(2, p);
		// executeQyery(); will return result
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			HttpSession hs= request.getSession();
			hs.setAttribute("uname", n);
			
			response.sendRedirect("Tablepage.jsp");		
			// api show kerny k liye response,jsp or call
		
		}
		else {
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("<font color=red size=20> Login Failed</font>");
			out.println("<br>");
			out.println("<br>");
			out.println("<font color=red size=20><a href=Newlogin.jsp>             Login Again</a></font>");
		}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}

}
