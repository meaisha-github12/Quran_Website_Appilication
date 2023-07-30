<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Surah Ayat</title>
    
<style>
        body {
            font-family: Arial, sans-serif;
        }

        .surah-box {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            box-shadow: 3px 3px 4px 0px rgba(14, 224, 210, 0.3);
            border-radius: 4px;
            background-color: #f7f7f7;
        }

        h1 {
            text-align: center;
            color: teal;
            margin-top: 40px;
        }

        h2 {
            margin-top: 20px;
            color: teal;
        }

        .surah-arabic {
            font-size: 24px;
            margin-bottom: 10px;
            text-align: center;
        }

        .surah-translation {
            font-size: 16px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .read-button {
            margin-top: 10px;
            background-color: teal;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .audio-button{
  
            background-color: teal;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            position: absolute;
            display: inline-block;
           
              position: absolute;
  
      
          
            left: 1400px;
            
            background-color: teal;
    
    

        }
     
       
 .audio-button:hover {
            background-color: #64CCC5;
        }
        .read-button:hover {
            background-color: #64CCC5;
        }
    </style>
</head>
<body>
    <%-- Use the surahHtml attribute to display the Surah data --%>
    <%= request.getAttribute("surahHtml") %>

    <a href="response.jsp" class="btn">Go back</a>
     
  
</body>
</html>