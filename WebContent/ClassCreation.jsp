<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Class Creation</title>
	<link rel="stylesheet" type="text/css" href="Header.css">
	<style type="text/css">
		body, html{
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		#body{
			text-align: center;
			margin: 0 auto;
			width: 60%;
			margin-top: 100px;
		}
		
		.input_bar{
			width: 43%;
			font-size: 15px;
			margin-bottom: 20px;
			padding: 8px;
			border-radius: 20px;
		}
		.sub_button{
			 background-color: #3CBC8D;
			 text-decoration: none;
			 cursor: pointer;
			 border: none;
			 color: white;
			 padding: 10px;
			 font-size: 15px;
			 width: 45%;
			 text-align: center;
			 border-radius: 20px;
		}
		.input_titles{
			text-align: center;
			font-size: 20px;
			color: gray;
		}
		.sub_button:hover{
			opacity: 0.8;
		}
	
	</style>
</head>
<body>
	<div class="header" style="top: 0px;">
		<a href="HomePage.jsp" class="home_pic"><img src="home_icon.png" class="home_button"></a>
	
		<% if(session.getAttribute("user") != null){%>
		<a href="" class="user_button"><img src="login.png" style="float: right; width: 50px;
			margin-right: 25px; margin-top: 15px;"></a>
		<a href="logout"><h1 class="signout" style="float: right; color: white; margin-right:20px; font-size: 25px; margin-top: 25px;">Sign Out</h1></a>
		<%}%>
		
		<% if(session.getAttribute("user") == null){%>
		<a href="RegisterPage.jsp" class="signout">Sign Up</a>
		<h1 style="float: right; color: white; margin-left: 10px; margin-right: 10px; margin-top: 25px; font-size: 25px; "> / </h1>
		<a href="LoginPage.jsp" class="signin">Sign In</a>
		<%}%>
	
		<form class="search_form" method="GET" action="SearchResults.jsp">
			<input name="searchField" class="search_bar" type="text" placeholder="Search for any class...">
		</form>
	</div>
	<div id="body">
		<form action="createCourse">
			<h1  style="color: gray; font-size: 40px;">Class Creation<h1>
			<h1 class="input_titles">Course Name<h1>
			<input type="text" name="courseName" class="input_bar">
			<h1 class="input_titles">Course ID<h1>
			<input type="text" name="courseID" class="input_bar">
			<h1 class="input_titles">Description<h1>
			<input type="text" name="courseDesc" class="input_bar">
			<br>${message}<br>
			<input type="submit" class="sub_button">
		</form>
	</div>
</body>
</html>