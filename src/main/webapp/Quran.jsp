<%@ page import="cscorner.Response.ResultItem" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quran Juzz Viewer</title>
     
</head>

<style>
        body {
              text-align: center;
            background-image: url("ii1.jpg");
            background-size: cover;
            font-family: 'Fredoka One', cursive;
            color: white;
             background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
         justify-content: center;
        overflow: hidden;
            align-items: center;
           
    /* Your existing styles */
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
}
            
        

      
     

       button {
           padding: 10px 20px; /* Increase padding to make buttons larger */
            background-color: white;
            color: #1D5D9B;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Fredoka One', cursive;
            font-size: 20px; 
            display: inline;
           
            margin-bottom: 10px;
    
        }
     
     .button-container {
            text-align: center; /* Center the buttons horizontally */
            margin-bottom: 20px;
        }
       
 .inp{
 width: 5%;
 padding: 8px;
 border: none;
 border-radius: 4px;
 }
       
        h1{
        margin-top: 180px;
        }
     button:hover{
     background-color: #176B87;
     color: white;
     }
      .go-back-button {
        position: fixed;
        top: 20px;
        left: 20px;
        background-color: deepskyblue;
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
    color: white;
    background-color: #176B87;
    }
    
    </style>

<body>
   
        <h1>Quran Juzz Viewer</h1>
          <div class="button-container">
        <form action="QuranServlet" method="get">
       
        
       <br><br>    <h3> <label for="juzzNumber" >Enter Juzz Number (1-30):</label><br><br><br></h3>
            <input type="number" name="juzzNumber" min="1" max="30" class="inp" placeholder="Enter Here" required><br><br><br><br>
            <div class="open-button-container">
          <button type="submit" name="buttonAction" value="button" class="open-button-container">Read Juzz</button>
            </div>
        </form>
       </div>
     
             <button class="go-back-button" onclick="goBack()">Go Back</button>

    <script>
        function goBack() {
            // JavaScript function to go back to the previous page
        	 window.location.href = "Tablepage.jsp";
        }  </script>
        
    
    

</body>
</html>