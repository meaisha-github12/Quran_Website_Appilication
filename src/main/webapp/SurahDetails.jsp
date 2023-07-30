
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.io.IOException"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
body {
	background-color: #f1f1f1;
	color: #333;
	font-family: Arial, sans-serif;
}

.heading {
	margin-top: 200px;
	color: teal;
	margin-top: 61px;
	text-align: center;
	font-family: Arial;
	font-size: 50px;
	padding-top: 20px;
}

.Arabic {
	font-weight: bold;
	text-align: right;
	font-size: 22px;
	line-height: 2;
}

li {
	margin-bottom: 20px;
	padding: 20px;
	border-bottom: 4px solid #64CCC5;
	background-color: #f9f9f9;
	margin-top: 80px;
	margin-left: 45px;
	margin-right: 45px;
	text-align: right;
	border-radius: 8px;
}

p {
	margin: 0;
}

.sura {
	font-style: italic;
}

.arabic-text {
	font-size: 18px;
	font-size: 22px;
	line-height: 2;
	color: #176B87;
}

.translation {
	color: #555;
}

li p {
	margin: 10px;
	padding: 10px;
}

.footness {
	color: #64CCC5;
	line-height: 1.7;
}

.Arabic {
	word-spacing: 20px;
	font-weight: bold;
	text-align: right;
	font-size: 25px;
	color: 176B87;
	line-height: 2;
}

.btn {
	background-color: teal;
	color: white;
	border: none;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
	position: absolute;
	top: 10px;
	right: 10px;
}

.btn:hover {
	background-color: black;
	color: #f9f9f9;
}

.Fdiv {
	text-align: center;
	margin-top: 30px;
}

.Fdiv h2 {
	color: teal;
	    display: inline;
}

.Fdiv p {
    display: inline;
	color: #35A29F;
	margin-bottom: 10px;
	font-size: 13px;
	font-weight: bold;
}

.Fdiv h3 {
	color: #35A29F;
	    display: inline;
	margin-bottom: 10px;
	font-size: 13px;
	font-weight: bold;
}

.Fdiv:hover {
	cursor: pointer;
	color: black; /* Add the desired text color here */
}

.Fdiv p:hover {
	color: black; /* Add the desired text color here */
}

.Fdiv h2:hover {
	color: black; /* Add the desired text color here */
}

.Fdiv h3:hover {
	color: black; /* Add the desired text color here */
}

/* New style for the wrapper div */
.verse-list-wrapper {
	margin-top: 45px;
}

.word {
	color: #176B87;
}

.word:hover {
	color: black;
	cursor: pointer;
	/* Optional: Add a pointer cursor when hovering individual words */
}

Arabic:hover {
	color: white;
	background-color: black;
}

.symbol {
	color: #176B87;
}

ul {
	text-decoration: none;
}

.verse-item {
	list-style-type: none; 
}
.verse-item .fa-bookmark {
    color: teal;
    margin-right: 5px; /* Add a right margin to create space between the icon and the Ayah text */
    float: left; /* Float the icon to the left */
}

 .verse-number {
     
       display: block;
       
        top: 0;
        left: 0;
        color: teal;
        font-size: 20px;
        
        font-weight: bold;
        margin-right: 10px;
        margin-bottom: 25px;
        padding: 0 5px;
        background-color: #f9f9f9;
    }
    .verse-number:hover
    {
    color: black;
    }
    
    
    .audio{
    position: absolute;
    top: 100px;
    left: 40px;
    	color: #35A29F;
	    
    
    }
    
    .audio h3
    {
    display: inline;
    }
    
    .audio-box{
    
    margin-left: -20px;
  
    }
    
</style>

</head>

<body>
    <h1 class="heading">Quran Surah</h1>
    <div class="Fdiv">
        <%-- Get the selected Surah number from the URL parameter --%>
        <%@ page import="java.util.Map" %>
        <%@ page import="java.util.HashMap" %>
        <%@ page import="java.util.List" %>
        <%@ page import="java.util.ArrayList" %>
        <%@ page import="java.util.Arrays" %>
        <%
        String surahNumberParam = request.getParameter("surahNumber");
        int surahNumber = Integer.parseInt(surahNumberParam);

        try {
            String apiUrl = "https://api.alquran.cloud/v1/surah/" + surahNumber;

            URL url = new URL(apiUrl);
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

            System.out.println("Response Body is: " + responseBody);

            JSONObject responseJson = new JSONObject(responseBody.toString());

            if (responseJson.has("data")) {
                JSONObject surahObj = responseJson.getJSONObject("data");
                String surahName = surahObj.getString("name");
                String englishNameTranslation = surahObj.getString("englishNameTranslation");
                String revelationType = surahObj.getString("revelationType");

                int numberOfAyahs = surahObj.getInt("numberOfAyahs");

                JSONArray versesArray = surahObj.getJSONArray("ayahs");
        %>
                <h2 class="sura">
                    Arabic Name: <%=surahName%>
                </h2>
                <br>
                <br>
                <h3 class="arabic-text">
                    English Name: <%=englishNameTranslation%>
                </h3>
                <br>
                <p class="translation">
                    Revelation Type: <%=revelationType%>
                </p>
                <br>
                <p class="translation">
                    Number Of Ayahs: <%=numberOfAyahs%>
                </p>
                <br>

                <div class="verse-list-wrapper">
                    <ul class="verse-list">
                        <%
                        
                        int ayahNumber = 1;
                        for (int j = 0; j < versesArray.length(); j++) {
                            JSONObject verseObj = versesArray.getJSONObject(j);
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
                        %>
                            <li class="verse-item">
                            
                            <span class="verse-number">Ayah <%= ayahNumber %></span>
                                <span class="Arabic">
                                    <%-- The 'verseText' variable contains the Arabic text --%>
                                    <%
                                    String[] words = verseText.split("\\s+");
                                    for (String word : words) {
                                    %>
                                        <span class="word"><%=word%></span>
                                    <% } %>
                                    <span class="symbol">۝</span> <%-- Add the ۝ symbol --%>
                                    <i class="fa-regular fa-bookmark"></i> <%-- Add the Font Awesome bookmark icon here --%>
                                </span>
                                <br>
                                <span class="verse-translation"><%=verseTranslation%></span>
                                
                                
                                <% ayahNumber++; %>
                            </li>
                        <% } %>
                    </ul>
                </div>
                <a href="Tablepage.jsp" class="btn">GO back</a> <%-- Updated the href here --%>
            <% } else { %>
                <p>Data not available</p>
                <a href="MyapiResponse" class="btn">Go back</a>
            <% } %>
        <% } catch (IOException e) {
            e.printStackTrace();
            // Handle the exception here (e.g., log the error or set an error message)
        } %>
        
        
        
        
        
    </div>
    <div class= audio>
    
            
        <%-- ---------------------------------Audio  --%>
    <%
    String audioUrl = null;
    try {
        String apiUrl = "https://api.alquran.cloud/v1/surah/" + surahNumber;

        URL url = new URL(apiUrl);
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

        System.out.println("Response Body iss: " + responseBody);

        JSONObject responseJson = new JSONObject(responseBody.toString());

        if (responseJson.has("data")) {
            JSONObject surahObj = responseJson.getJSONObject("data");
            if (surahObj.has("audio")) {
                JSONObject audioObj = surahObj.getJSONObject("audio");
                if (audioObj.has("primary")) {
                    audioUrl = audioObj.getString("primary");
                }
            }
        }
    } catch (IOException e) {
        e.printStackTrace();
        // Handle the exception here (e.g., log the error or set an error message)
    }
    %>
<% String[][] audioData = {
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/001.mp3", "Audio 1"},
        {"https://download.quranicaudio.com/quran/huthayfi/002.mp3", "Audio 2"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/003.mp3", "Audio 3"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/004.mp3", "Audio 4"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/005.mp3", "Audio 5"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/006.mp3", "Audio 6"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/007.mp3", "Audio 7"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/008.mp3", "Audio 8"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/009.mp3", "Audio 9"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/010.mp3", "Audio 10"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/011.mp3", "Audio 11"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/012.mp3", "Audio 12"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/013.mp3", "Audio 13"},
        {"https://download.quranicaudio.com/quran/abdullaah_3awwaad_al-juhaynee/0014.mp3", "Audio 14"},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/015.mp3", "Audio 15"},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/016.mp3", " Audio 16"},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/017.mp3", "Audio 17 "},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/018.mp3", "Audio 18 "},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/019.mp3", "Audio 19 "},
        {"https://download.quranicaudio.com/quran/abdullaah_basfar/020.mp3", "Audio 20 "},
       
        
        
        // ...
    }; %>

    <%-- Get the selected Surah number from the URL parameter --%>
    <% int surahNumbers = Integer.parseInt(request.getParameter("surahNumber")); %>

    <%-- Check if the surahNumber is valid --%>
    <% if (surahNumber > 0 && surahNumber <= audioData.length) { %>
        <div class="surah-details">
            <h3>Surah <%= surahNumber %>: <%= audioData[surahNumber - 1][1] %></h3>
            <%-- Display the audio player for the specific Surah --%>
            <div class="audio-box">
            
                <audio controls>
                    <source src="<%= audioData[surahNumber - 1][0] %>" type="audio/mpeg">
                </audio>
            </div>
        </div>
    <% } else { %>
        <p>Invalid Surah number or Surah not found.</p>
    <% } %>
    </div>
 
    <script>
    // Get all bookmark icons by class name
    const bookmarkIcons = document.querySelectorAll('.fa-regular.fa-bookmark');
    console.log("click 1");
    // Add click event listener to each bookmark icon
    bookmarkIcons.forEach((icon) => {
    	 console.log("click 2");
        icon.addEventListener('click', (event) => {
        	 console.log("click 3");
            // Find the nearest parent <li> element which contains the Ayah number
            const verseListItem = event.target.closest('.verse-item');
            console.log("click 4");

            if (verseListItem) {
                // Get the Ayah number from the verseListItem
                 console.log("click 5");
                const ayahNumber = verseListItem.querySelector('.verse-number').textContent;
                console.log("click 6");
                // Call a function to save the Ayah number (you can replace this with your preferred method)
                saveAyahNumber(ayahNumber);
                console.log("click 7");
                // Optional: Provide visual feedback to the user (e.g., change the icon color, show a message, etc.)
                icon.style.color = 'teal'; // Change the icon color to teal to indicate that it's bookmarked
                alert('Verse ' + ayahNumber + ' has been bookmarked!');
                console.log("click 8");
            }
        });
    });

    // Function to save the Ayah number (replace this with your preferred saving method)
// ... Other code ...

function saveAyahNumber(ayahNumber) {
    // Prepare the data to be sent (in this case, we're sending a JSON object)
    const data = { ayahNumber: ayahNumber };

    // Prepare the fetch options
    const fetchOptions = {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json",
        },
    };

    // Make the POST request to the backend (Mark servlet)
    fetch("Mark.java", fetchOptions)
        .then(response => response.json())
        .then(data => {
            // Handle the response data here (if needed)
            console.log(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
/////////////////
      // JavaScript to control audio playback
        const audioPlayer = document.querySelector('audio');

        // Play the audio when the page loads
        audioPlayer.play();

        // Stop the audio when the window is closed
        window.onbeforeunload = function () {
            audioPlayer.pause();
        };


</script>
</body>

</html>
