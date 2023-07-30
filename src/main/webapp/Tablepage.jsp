

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<title>Surah Table</title>
<style>
body {
	background-color: #f1f1f1;
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin-top: 70px;
	margin-left: 35px;
	margin-right: 35px;
}

.surah {
	width: 45%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	box-shadow: 3px 3px 4px 0px rgba(14, 224, 210, 0.3);
	border-radius: 4px;
}



.surah-number {
	/* Add display flex and justify-content space-between to align items */
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-weight: bold;
	font-size: 20px;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 10px;
	color: teal;
}

/* Add a margin to the bookmark icon to create space between the icon and the Surah number */


/* Style for teal-colored bookmark icon */
.bookmarked .fa-bookmark {
	color: teal;
}

.surah-name-Eng {
	margin-top: 5px;
	font-size: 16px;
	margin-left: 10px;
	margin-bottom: 10px;
}

.surah-name-Arb {
	margin-top: 5px;
	font-size: 16px;
	direction: rtl;
	text-align: right;
	font-size: 20px;
	margin-right: 10px;
	margin-bottom: 10px;
}

.surah-button {
	margin-top: 10px;
	background-color: teal;
	color: white;
	border: none;
	padding: 8px 12px;
	border-radius: 4px;
	margin-left: 10px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

.surah-button:hover {
	background-color: #64CCC5;
}

.pgheading {
	text-align: center;
	color: teal;
	margin-top: 40px;
}



.fa-bookmark {
	margin-left: 5px;
	cursor: pointer; /* Add this line to set the cursor to a pointer */
}
       
        
        
        .jbutton{
         margin-top: 10px;
	background-color: teal;
	color: white;
	border: none;
	padding: 8px 12px;
	border-radius: 4px;
	margin-left: 665px;
	margin-top: 20px;
	cursor: pointer;
	text-decoration: none;
	
	font-size: 14px;
       
        }
             .goback{
         margin-top: 10px;
	background-color: teal;
	color: white;
	border: none;
	padding: 10px 14px;
	border-radius: 4px;
	
	margin-top: 20px;
	cursor: pointer;
	text-decoration: none;
	
	font-size: 14px;
		font-size: 14px;
	position:absolute;
	top: 0;
	left: 50px;
       
        }
      

        button:hover{
      pointer: cursor;
      background-color: #176B87;
      
      }  

     .fa-bookmark.bookmarked {
            color: teal;
        }

  

   .bookmarked:hover{
        background-color:  #A1CCD1;
    }
      
      
      
</style>
</head>
<body>

	<h1 class="pgheading">Quran Verses</h1>
		<a href="Quran.jsp" ><button class="jbutton">Read Juzz</button></a>
<a href="Newlogin.jsp" ><button class="goback">Login Again</button></a>
	<div class="container" id="surahContainer">
		<!-- Surah data will be populated here -->
	</div>

	<!--************************************ JavaScript****************************************** -->


	<script>
                 // Helper function to create the bookmark icon
                  function createBookmarkIcon() {
                  const bookmarkIconElement = document.createElement("i");
                  bookmarkIconElement.classList.add("fa-regular", "fa-bookmark", "bookmarked"); // Add the "bookmarked" class initially
                  
                  
                  return bookmarkIconElement;
}


                    // Helper function to extract the Surah number from the Surah element
                   //Takes bookmarkIcon as argum, used to extract Surah Number 
                 function extractSurahNumber(bookmarkIcon) {
                  // is used to find the nearest ancestor element of the bookmarkIcon that has the class name "surah-number."
                //  bookmarkIcon.parentElement: This retrieves the parent element of the bookmarkIcon,
                 const surahNumberElement = bookmarkIcon.parentElement.querySelector(".surah-number");
                  // reterive content of surah numb
                 const surahNumberText = surahNumberElement.textContent;
                  //if surahNumberText is "Surah 1," this expression will match "1."
                 const surahNumberMatch = surahNumberText.match(/(\d+)/);
                  //if else,  is the value returned if surahNumberMatch is truthy (i.e., if a match is found). 
                  //It takes the first matched group (which represents the Surah number) and converts it to an integer using parseInt.
                  return surahNumberMatch ? parseInt(surahNumberMatch[0]) : null;
}

                 // Function to add event listener to bookmark icons
             function attachBookmarkListeners() {
            const bookmarkIcons = document.querySelectorAll(".fa-bookmark");
            console.log("Number of bookmark icons:", bookmarkIcons.length);
            for (const bookmarkIcon of bookmarkIcons) {
                console.log("Attaching event listener to bookmark icon");
                bookmarkIcon.addEventListener("click", function (event) {
                    event.preventDefault();
                    console.log("Bookmark icon clicked!");
                    const surahNumber = extractSurahNumber(bookmarkIcon.parentElement);
                    console.log("Surah Number:", surahNumber);
                    bookmarkIcon.classList.toggle("bookmarked");
                    bookmarkIcon.classList.toggle("unbookmarked");
                    if (surahNumber !== null) {
                        SaveMySurahServlet(surahNumber);
                    }
                });
            }
        }


      //*****************************************Function to save Surah data***************************************************

                 
                function SaveMySurahServlet(surahNumber, englishName) {
    console.log("Saving Surah:", surahNumber);

               try {
                 // Create the data object with the surahNumber
                 //This line creates a data object contains the surahNumber to be sent to the backend. The surahNumber is passed as an argument to the function.
               const data = {
            surahNumber: surahNumber,
            englishName: englishName,
        };

                 // Fetch options for the POST request
                 const fetchOptions = {
                   method: "POST",
                   body: JSON.stringify(data),
                   headers: {
                     "Content-Type": "application/json",
                   },
                 };

                 // Make the POST request to the backend (SaveServlet)
                 fetch("SaveMySurahServlet", fetchOptions)
                   .then(response => response.json())
                   .then(responseData => {
                     // Handle the response from the backend (you can customize this based on your requirements)
                     if (responseData.success) {
                       alert("Surah bookmarked successfully!");
                       // Toggle the bookmark icon
                       const surahNumberElement = document.getElementById(`surahNumber_${surahNumber}`);
                       const bookmarkIcon = surahNumberElement.querySelector(".fa-bookmark");
                       bookmarkIcon.classList.toggle("bookmarked"); // Toggle the "bookmarked" class
                     } else {
                       alert("Failed to save the bookmark.");
                     }
                   })
                   .catch(error => {
                     console.error("Error saving the bookmark:", error);
                   });
               } catch (error) {
                 console.error("Error saving the bookmark:", error);
               }
             }// end save surh

    
    

//************************************ async function fetchSurahData()****************************************************************
    // Function to fetch Surah data from the API
  // Function to fetch Surah data from the API
// Function to fetch Surah data from the API
async function fetchSurahData() {
    const apiUrl = "https://api.alquran.cloud/v1/surah";

    try {
        const response = await fetch(apiUrl);
        const data = await response.json();
        const surahContainer = document.getElementById("surahContainer");

        if (!data || !data.data || data.data.length === 0) {
            surahContainer.innerHTML = "<p>No Surah data available.</p>";
            return;
        }

        surahContainer.innerHTML = "";

        data.data.forEach(surah => {
            const surahElement = document.createElement("div");
            surahElement.classList.add("surah");

            const surahNumberElement = document.createElement("div");
            surahNumberElement.classList.add("surah-number");
            surahNumberElement.textContent = "Surah " + surah.number;
            surahElement.appendChild(surahNumberElement);

            const bookmarkIcon = createBookmarkIcon();
            surahNumberElement.appendChild(bookmarkIcon);

            const surahNameEngElement = document.createElement("div");
            surahNameEngElement.classList.add("surah-name-Eng");
            surahNameEngElement.textContent = surah.englishName;
            surahElement.appendChild(surahNameEngElement);

            const surahNameArbElement = document.createElement("div");
            surahNameArbElement.classList.add("surah-name-Arb");
            surahNameArbElement.textContent = surah.name;
            surahElement.appendChild(surahNameArbElement);

            const surahButtonElement = document.createElement("a");
            surahButtonElement.classList.add("surah-button");
            surahButtonElement.textContent = "Read";
            surahButtonElement.href = "MyapiResponse?surahNumber=" + surah.number;
            surahElement.appendChild(surahButtonElement);

            surahContainer.appendChild(surahElement);

            bookmarkIcon.addEventListener("click", function (event) {
                event.preventDefault();
                console.log("Bookmark icon clicked!");
                const surahNumber = extractSurahNumber(bookmarkIcon.parentElement);
                console.log("Surah Number:", surahNumber);
                const englishName = surah.englishName; // Accessing the englishName property
                console.log("Surah English Name:", englishName);
                bookmarkIcon.classList.toggle("bookmarked");
                bookmarkIcon.classList.toggle("unbookmarked");
                if (surahNumber !== null) {
                    SaveMySurahServlet(surahNumber, englishName); // Pass englishName to the function
                }
            });
        });

        attachBookmarkListeners();
    } catch (error) {
        console.error("Error fetching Surah data:", error);
        const surahContainer = document.getElementById("surahContainer");
        surahContainer.innerHTML = "<p>Failed to fetch Surah data.</p>";
    }
}


    document.addEventListener("DOMContentLoaded", () => {
      console.log("DOMContentLoaded event triggered");
      // Call the fetchSurahData function to populate the container after the page is loaded
      fetchSurahData();
    });
  </script>
</body>
</html>
