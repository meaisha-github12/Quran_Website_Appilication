<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<title>SignUp</title>
<style>
  body {
    background-image: url("ii6.jpg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
 font-family: 'Fredoka One', cursive;
   text-shadow: 5px 1px 2px rgba(0, 0, 0, 0.8);
  }
  
  .container {
    padding-bottom: 40px;
     padding-left: 60px;
      padding-right: 60px;
       padding-top: 10px;
    background-color: transparent;
    border-radius: 25px;
    text-align: center;
    color: white;
    border: 2px solid white;
  }
  
  .heading {
    margin-bottom: 35px;
  }
  .heading h1{
  color:white;
  }
    ::placeholder {
            color: white; /* Replace "red" with the desired color */
        }
  
   .heading p{
  color:#FFB84C;
  }
  .container .group {
     margin-top: 10px;
    margin-bottom: 10px;
   
  }
  
  .container .group label {
    display: inline-block;
    width: 30px;
    text-align: left;
       
  }
  
  .container .group input {
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 200px;
  }
  
  .container .checkbox-container {
    text-align: left;
    margin-bottom: 20px;
  }
  
  .container .checkbox-label {
    margin-left: 5px;
  
  }
  
.container input[type="submit"] {
    padding: 10px 20px;
    background-color: #F86F03; /* Set button background to transparent */
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-family: 'Fredoka One', cursive;
    font-size: 16px;
  }
  
  .container input[type="submit"]:hover {
    background-color: orange;
    color: white ;
  }
  .container input[type="text"],
.container input[type="password"],
.container input[type="email"],
.container input[type="tel"] {
  
 padding-top: 10px;
 padding:8px;
  margin-bottom: 10px;
  margin-top: 10px;
  border-radius: 5px;
  box-sizing: border-box;
  font-size: 14px;
   background-color: transparent;
   color: white;
  font-family: Arial;
  border:2px solid white;

}
.container .checkbox-container input[type="checkbox"]:checked::before {
    content: "\f00c";
    display: inline-block;
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    font-size: 18px;
    
    color: #FFB84C; /* Set checkbox tick color to #FFB84C */
  }
   .Acc a {
    cursor: pointer;
    text-decoration: none;
    font-size: 12px;
    color: white;
  }
  
  .Acc a:hover {
    text-decoration: underline;
  
  }
      .error {
        color: red;
        font-size: 14px;
        margin-top: 5px;
         margin-left: 40px;
         font-weight: bold;
         border:2px solid red;
         display: inline-block;
    }
    .checkbox-label:hover
    {
    color: orange;
    }
    
</style>
</head>
<body>
  <div class="container">
   <div class=heading>
    <h1>SignUp</h1>
   
    </div>
    <form action="Signservlet" method="post">
      <div class="group">
        <label for="username"><i class="fas fa-user"></i></label>
        <input type="text" id="username" name="t1" autocomplete="off" required placeholder="Enter Your Name">
      </div>
      
      <div class="group">
        <label for="mail"><i class="fa fa-envelope" aria-hidden="true"></i></label>
        <input type="email" id="mail" name="t2" autocomplete="off" required placeholder="Enter Email">
      </div>
    
      <div class="group">
        <label for="password"><i class="fa fa-lock" aria-hidden="true"></i></label>
        <input type="password" id="password" name="t3" autocomplete="off" required placeholder="Enter Password">
      </div>
    
      <div class="group">
        <label for="confpass"><i class="fa fa-lock" aria-hidden="true"></i></label>
        <input type="password" id="confpass" name="t4" autocomplete="off" required placeholder="Confirm Password">
      </div>
      <br>
   
   
      <div class="checkbox-container">
        <input type="checkbox" id="terms" name="terms" required>
        <label for="terms" class="checkbox-label">I agree to the Terms and Conditions</label><br>
      </div>
   <br>
  
      <input class=" button" type="submit" value="Register">
    </form>
    <br>
    <br>
    <div class="Acc">
    <a href="Newlogin.jsp">Already have an account</a>
  </div>
  </div>
</body>
</html>
