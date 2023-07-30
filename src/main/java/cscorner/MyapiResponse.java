package cscorner;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyapiResponse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String apiEndpoint = "https://api.alquran.cloud/v1/surah";

        try {
            URL url = new URL(apiEndpoint);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            int responseCode = connection.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder responseBody = new StringBuilder();
            String line;
            
            
            

            while ((line = reader.readLine()) != null) {
                responseBody.append(line);
            }

            reader.close();

            System.out.println("Response Body: " + responseBody);

            JSONObject responseJson = new JSONObject(responseBody.toString());

            if (responseJson.has("data") && responseJson.get("data") instanceof JSONArray) {
                JSONArray surahArray = responseJson.getJSONArray("data");
                StringBuilder surahHtml = new StringBuilder();
                surahHtml.append("<h1>All Surah Ayat</h1>");

                for (int i = 0; i < surahArray.length(); i++) {
                    JSONObject surahObj = surahArray.getJSONObject(i);
                    int surahNumber = surahObj.getInt("number");
                    String surahName = surahObj.getString("name");
                    String englishNameTranslation = surahObj.getString("englishNameTranslation");
                    surahHtml.append("<div class=\"surah-box\">");
                    surahHtml.append("<h2>Surah ").append(surahNumber).append(": ").append(surahName).append("</h2>");
                    surahHtml.append("<p class=\"surah-english-name\">: ").append(englishNameTranslation)
                            .append("</p>");

                    // Fetch detailed surah data including Arabic text
                    String apiUrl = "https://api.alquran.cloud/v1/surah/" + surahNumber;
                    URL surahUrl = new URL(apiUrl);
                    HttpURLConnection surahConnection = (HttpURLConnection) surahUrl.openConnection();
                    surahConnection.setRequestMethod("GET");

                    int surahResponseCode = surahConnection.getResponseCode();
                    System.out.println("Surah Response Code: " + surahResponseCode);

                    BufferedReader surahReader = new BufferedReader(
                            new InputStreamReader(surahConnection.getInputStream()));
                    StringBuilder surahResponseBody = new StringBuilder();
                    String surahLine;

                    while ((surahLine = surahReader.readLine()) != null) {
                        surahResponseBody.append(surahLine);
                    }

                    surahReader.close();

                    System.out.println("Surah Response Body: " + surahResponseBody);

                    JSONObject surahResponseJson = new JSONObject(surahResponseBody.toString());
                    if (surahResponseJson.has("data")) {
                        JSONObject surahData = surahResponseJson.getJSONObject("data");
                        JSONArray versesArray = surahData.getJSONArray("ayahs");

                        for (int j = 0; j < versesArray.length(); j++) {
                            JSONObject verseObj = versesArray.getJSONObject(j);
                            int ayahNumber = verseObj.getInt("number"); // Fetch the Ayah number
                            String verseText = verseObj.getString("text");
                            String verseTranslation = "";

                            if (verseObj.has("translations")) {
                                JSONArray translationsArray = verseObj.getJSONArray("translations");
                                for (int k = 0; k < translationsArray.length(); k++) {
                                    JSONObject translationObj = translationsArray.getJSONObject(k);
                                    if (translationObj.has("text") && translationObj.getString("language").equals("en")) {
                                        verseTranslation = translationObj.getString("text");
                                        break;
                                    }
                                }
                            }

                            boolean isEndOfAyah = verseText.endsWith("۝");
                            if (isEndOfAyah) {
                                // Remove ۝ from the verseText (We'll add it at the end after the translation)
                                verseText = verseText.substring(0, verseText.length() - 1);
                            }

                            surahHtml.append("<div class=\"verse-item\">");
                            surahHtml.append("<li class=\"surah-ayah-number\">Ayah ").append(ayahNumber)
                                    .append("</li>");
                            surahHtml.append("<li class=\"surah-arabic\">").append(verseText).append("</li>" + "۝");
                            surahHtml.append("<li class=\"surah-translation\">").append(verseTranslation)
                                    .append("</li>");

                            // Add ۝ at the end of the verse text if it's the end of a complete Arabic line (ayah)
                            if (isEndOfAyah) {
                                surahHtml.append("<li class=\"end-of-ayah\">۝</li>");
                            }

                            surahHtml.append("</div>");
                        }
                    }

                    surahHtml.append("<a href=\"SurahDetails.jsp?surahNumber=").append(surahNumber)
                            .append("\" class=\"read-button\">Read</a>");
                    surahHtml.append("</div>");
                }

                request.setAttribute("surahHtml", surahHtml.toString());
            } else {
                request.setAttribute("surahHtml", "No Surah data available.");
            }

            RequestDispatcher rd = request.getRequestDispatcher("SurahDetails.jsp");
            rd.forward(request, response);
            connection.disconnect();
        } 
        
        
        
        catch (IOException | JSONException e) {
            e.printStackTrace();
        }
    }
}
