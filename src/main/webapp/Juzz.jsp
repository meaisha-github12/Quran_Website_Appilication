<!DOCTYPE html>
<html>
<head>
    <title>Quran Juzz Viewer</title>
    <link rel="stylesheet" type="text/css" href="quran.css">
</head>

<style>
    body{
        text-align: center;
        color: teal;
        line-height: 1.8;
    }

    .juzz-text-container {
        max-width: 4000px;
        background-color: #f9f9f9;
        text-align: center;
        margin: 30px;
        padding: 10px;
        border: 1px solid #ccc;
        box-shadow: 3px 3px 4px 0px rgba(14, 224, 210, 0.3);
        border-radius: 4px;
    }
    
    .surah-details pre {
        font-size: 30px;
        margin-bottom: 10px;
        text-align: center;
        white-space: pre-wrap
        white-space: pre-line; 
      line-height: 3;
    }
      .surah-details pre {
        font-size: 24px;
        margin-bottom: 10px;
        text-align: center;
        white-space: pre-wrap; /* Use pre-wrap to preserve line breaks and wrap text */
        line-height: 3;
        word-wrap: break-word; 
    }
      .go-back-button {
        position: fixed;
        top: 20px;
        right: 52px;
        background-color: teal;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-family: 'Fredoka One', cursive;
        font-size: 20px;
    }
    .go-back-button:hover
    {
    color:white;
    background-color: #176B87;
    }
    h1:hover{
    color: black;
    }
</style>

<body>
    <h1>Juzz Number:${juzzNumber}</h1>
    
    <div class="juzz-text-container">
        <div class="surah-details">
            <!-- Use the <pre> tag to preserve line breaks in the ayah text -->
            <pre>${juzzText}</pre>
        </div>
    </div>
       <button class="go-back-button" onclick="goBack()">Go Back</button>

    <script>
        function goBack() {
            // JavaScript function to go back to the previous page
            window.history.back();
        }  </script>
</body>
</html>