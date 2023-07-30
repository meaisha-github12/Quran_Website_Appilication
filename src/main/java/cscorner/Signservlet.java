package cscorner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signservlet")
public class Signservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("t1");
        String email = request.getParameter("t2");
        String pass = request.getParameter("t3");
        String confirmPassword = request.getParameter("t4"); 
        String terms = request.getParameter("terms");
        
        // Establishing a database connection
        Connection conn = null;
        PreparedStatement pstmt = null;
        PrintWriter out = response.getWriter();
        
        // The hasError boolean variable is used to track whether any input validation errors occur.
        boolean hasError = false;


        if (name.length() < 4 || name.length() >= 10) {
            // JavaScript code to display the alert message
            String errorMessage = "Invalid UserName. User name should be between 4 and 9 characters.";
            String script = "<script>window.alert('" + errorMessage + "');</script>";

            // Write the script to the response output
            response.setContentType("text/html");
           
            out.println(script);

            hasError = true;
        }



        if (pass.length() < 4 || pass.length() >= 15) {
            // JavaScript code to display the alert message
            String errorMessage = "Invalid Password. Password should be between 4 and 14 characters.";
            String script = "<script>function showAlert() { window.alert('" + errorMessage + "'); }</script>";

            // Write the script to the response output
            response.setContentType("text/html");
          
            out.println(script);

            // Call the JavaScript function to show the alert
            out.println("<script>showAlert();</script>");

            hasError = true;
        }

  
        if (!pass.matches("^(?=.*[A-Za-z])(?=.*\\d).{8,}$")) {
            // JavaScript code to display the alert message
            String errorMessage = "Enter a password with at least one letter, one digit, and be at least 8 characters long.";
            String script = "<script>function showAlert() { window.alert('" + errorMessage + "'); }</script>";

            // Write the script to the response output
            response.setContentType("text/html");
           
            out.println(script);

            // Call the JavaScript function to show the alert
            out.println("<script>showAlert();</script>");

            hasError = true;
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            out.println("<p class='error'>Enter Correct Email</p>");
            out.println("<br>");
            hasError = true;
        }
        if (!pass.equals(confirmPassword)) {
            out.println("<script>");
            out.println("alert('Passwords do not match');");
            out.println("</script>");
            hasError = true;
        }
        if (terms == null) {
            out.println("<p class='error'>Please agree to the Terms and Conditions</p>");
            out.println("<br>");
            hasError = true;
        }

        if (!hasError) {
            try {
                // Establishing a database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quran", "root", "@isha123");

                // Checking if the username already exists in the database
                String query = "INSERT INTO quranuser (username, email, password, confirmPassword) VALUES (?, ?, ?, ?)";

                // Preparing the SQL statement
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, pass);
                pstmt.setString(4, confirmPassword);
               
             
                pstmt.executeUpdate();
              

                // Redirecting to a success page
                response.sendRedirect("Newlogin.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                // Redirecting to an error page
                response.sendRedirect("error.jsp");
            } finally {
                // Closing the resources (prepared statement and database connection)
                try {
                    if (pstmt != null)
                        pstmt.close();
                    if (conn != null)
                        conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            // Handle the case where input validation fails
            // Include the form again with error messages
            RequestDispatcher rd = request.getRequestDispatcher("NewFile.jsp");
            rd.include(request, response);
        }
    }
}
