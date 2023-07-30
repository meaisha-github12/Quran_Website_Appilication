package cscorner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class QuranServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "YOUR_API_KEY";
    private static final String BASE_URL = "http://api.alquran.cloud/v1/juz";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String juzzNumberStr = request.getParameter("juzzNumber");
        if (juzzNumberStr == null || juzzNumberStr.isEmpty()) {
            response.sendRedirect("quran.jsp");
            return;
        }

        int juzzNumber = Integer.parseInt(juzzNumberStr);
        String juzzText = getJuzzText(juzzNumber);
        request.setAttribute("juzzNumber", juzzNumber);////////
        request.setAttribute("juzzText", juzzText);

        request.getRequestDispatcher("Juzz.jsp").forward(request, response);
    }

    private String getJuzzText(int juzzNumber) throws IOException {
        String urlString = BASE_URL + "/" + juzzNumber + "/ar";
        URL url = new URL(urlString);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("X-API-Key", API_KEY);

        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
        }

        // Assuming the API returns the Juzz text as a JSON object
        String jsonResponse = response.toString();

        // Extract the Juzz text from the JSON response
        JsonObject jsonObject = JsonParser.parseString(jsonResponse).getAsJsonObject();
        JsonArray ayahsArray = jsonObject.getAsJsonObject("data").getAsJsonArray("ayahs");

        StringBuilder juzzTextBuilder = new StringBuilder();
        for (int i = 0; i < ayahsArray.size(); i++) {
            JsonObject ayahObject = ayahsArray.get(i).getAsJsonObject();
            String text = ayahObject.get("text").getAsString();
            //juzzTextBuilder.append(text).append("\n");
            text = text.trim().replaceAll("\\s+$", "");
            
            juzzTextBuilder.append(text).append("۝\n");
            
        }

        return juzzTextBuilder.toString();
    }
}