<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
    <%@page import="java.sql.*"
    
    %>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome!</title>
</head>
<style>
h1
{
text-align: center;
                font-family: "Berlin Sans FB Demi", Times, serif;
                font-size: 100px;
                 color: black;
                 margin-top:auto;
}
h2
{
text-align: center;
                font-family: "Berlin Sans FB Demi", Times, serif;
                font-size: 25px;
                 color: black;
                 margin-top:15em;
}
body
{
background-image:url("mainbga.jpg");
background-size:cover;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 15px 15px;
    text-decoration: none;
   
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
.wel{
	font-family: "Comic Sans MS", Times, serif;
    font-size: 35px;
       color: black;
       text-align:center;
       
       

}
</style>
<body>
<ul>
  <li><a href="Welcome.jsp">Home</a></li>
  <li><a href="profile.jsp">Profile</a></li>  
  
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">BANKING</a>
    <div class="dropdown-content">
      <a href="fundstransfer.html">Funds Transfer</a>
      <a href="withdrawal.html">Withdrawal</a>
      <a href="deposit.html">Deposit</a>
      <li><a href="faq.html">FAQ</a></li>
      <li><a href="changepassword.html">Change Password</a></li>  
  <li><a href="logoutservlet">Log Out</a></li>  
    </div>
  </li>
</ul>
<h1><u>Royal Bank of Madras</u></h1>




<%

String username=session.getAttribute("username").toString();
String email=session.getAttribute("email").toString();
String name=session.getAttribute("name").toString();
String address=session.getAttribute("address").toString();
String mobno=session.getAttribute("mobno").toString();
String country=session.getAttribute("country").toString();
String state=session.getAttribute("state").toString();
String age=session.getAttribute("age").toString();
String gender=session.getAttribute("gender").toString();
String acctype=session.getAttribute("acctype").toString();
String dob=session.getAttribute("dob").toString();

%>

<div class="wel">
     Welcome : <%= name %><br>
     

     
  </div> 
  
  <h2><marquee>Happy Banking to you!</marquee></h2>
  
  



</body>
</html>