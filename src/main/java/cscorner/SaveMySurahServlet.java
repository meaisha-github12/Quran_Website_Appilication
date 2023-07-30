// Save servlet code till Surah number in db


package cscorner;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;


public class SaveMySurahServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  response.setContentType("application/json");
    	    PrintWriter out = response.getWriter();

    	    // Get the JSON data from the request body
    	    String requestBody = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
    	    JSONObject jsonObject = new JSONObject(requestBody);
    	    
    	    System.out.println("running");
    	    // Fetch the surahNumber as an integer
    	    int surahNumber = jsonObject.getInt("surahNumber");
    	    String englishName = jsonObject.getString("englishName");
   
    	    

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establishing a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SavingSurah", "root", "@isha123");

            // Insert the bookmarked Surah number into the database
            String query = "INSERT INTO SurahInfo (surahNumber, englishName) VALUES (?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, surahNumber);
            pstmt.setString(2, englishName);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                // Sending JSON response indicating success
                JSONObject responseJson = new JSONObject();
                responseJson.put("success", true);
                out.println(responseJson.toString());
            } else {
                // Sending JSON response indicating failure
                JSONObject responseJson = new JSONObject();
                responseJson.put("success", false);
                out.println(responseJson.toString());
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Sending JSON response indicating failure
            JSONObject responseJson = new JSONObject();
            responseJson.put("success", false);
            out.println(responseJson.toString());
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
    }
}
