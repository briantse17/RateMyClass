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
			background-color: #ff6947;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 800 400'%3E%3Cdefs%3E%3CradialGradient id='a' cx='396' cy='281' r='514' gradientUnits='userSpaceOnUse'%3E%3Cstop offset='0' stop-color='%23dd0000'/%3E%3Cstop offset='1' stop-color='%23ff6947'/%3E%3C/radialGradient%3E%3ClinearGradient id='b' gradientUnits='userSpaceOnUse' x1='400' y1='148' x2='400' y2='333'%3E%3Cstop offset='0' stop-color='%23ff8952' stop-opacity='0'/%3E%3Cstop offset='1' stop-color='%23ff8952' stop-opacity='0.5'/%3E%3C/linearGradient%3E%3C/defs%3E%3Crect fill='url(%23a)' width='800' height='400'/%3E%3Cg fill-opacity='0.4'%3E%3Ccircle fill='url(%23b)' cx='267.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='532.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='400' cy='30' r='300'/%3E%3C/g%3E%3C/svg%3E");
			background-attachment: fixed;
			background-size: cover;
		}
		
		#body{
			text-align: center;
			margin: 0 auto;
			width: 60%;
			margin-top: 110px;
			background-color: white;
			height: 80%;
			border-radius: 5px;
			background-color: #ffffff;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 800 400'%3E%3Cdefs%3E%3CradialGradient id='a' cx='396' cy='281' r='514' gradientUnits='userSpaceOnUse'%3E%3Cstop offset='0' stop-color='%23ffffff'/%3E%3Cstop offset='1' stop-color='%23ffffff'/%3E%3C/radialGradient%3E%3ClinearGradient id='b' gradientUnits='userSpaceOnUse' x1='400' y1='148' x2='400' y2='333'%3E%3Cstop offset='0' stop-color='%23d1d1d1' stop-opacity='0'/%3E%3Cstop offset='1' stop-color='%23d1d1d1' stop-opacity='0.5'/%3E%3C/linearGradient%3E%3C/defs%3E%3Crect fill='url(%23a)' width='800' height='400'/%3E%3Cg fill-opacity='0.4'%3E%3Ccircle fill='url(%23b)' cx='267.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='532.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='400' cy='30' r='300'/%3E%3C/g%3E%3C/svg%3E");
			background-attachment: fixed;
			background-size: cover;
		}
		
		.input_bar{
			width: 43%;
			height: 100px;
			font-size: 15px;
			margin-bottom: 20px;
			padding: 8px;
			border-radius: 2px;
		}
		.sub_button{
			 background-color: rgb(221,61,44);
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
		*, *:before, *:after {
		  box-sizing: border-box;
		}
		
		.input{
		  border-style: none;
		  background: transparent;
		  outline: none;
		}
		
		.demo-flex-spacer {
		  -webkit-box-flex: 1;
		      -ms-flex-positive: 1;
		          flex-grow: 1;
		}
		
		@-webkit-keyframes gradient {
		  0% {
		    background-position: 0 0;
		  }
		  100% {
		    background-position: 100% 0;
		  }
		}
		
		@keyframes gradient {
		  0% {
		    background-position: 0 0;
		  }
		  100% {
		    background-position: 100% 0;
		  }
		}
		.webflow-style-input {
		  position: relative;
		  display: -webkit-box;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-orient: horizontal;
		  -webkit-box-direction: normal;
		      -ms-flex-direction: row;
		          flex-direction: row;
		  width: 100%;
		  height: 40px;
		  max-width: 400px;
		  margin: 0 auto;
		  border-radius: 50px;
		  padding: 0rem 1rem 0rem;
		  background: rgba(57, 63, 84, 0.1);
		}
		.webflow-style-input:after {
		  content: "";
		  position: absolute;
		  left: 0px;
		  right: 0px;
		  bottom: 0px;
		  z-index: 999;
		  height: 2px;
		  width: 88%;
		  margin: 0 auto;
		  border-bottom-left-radius: 2px;
		  border-bottom-right-radius: 2px;
		  background-position: 0% 0%;
		  background: -webkit-linear-gradient(left, pink, #ff5f6d, yellow, #ff5f6d, pink, #ff5f6d);
		  background: linear-gradient(to right, pink, #ff5f6d, yellow, #ff5f6d, pink, #ff5f6d);
		  background-size: 500% auto;
		  -webkit-animation: gradient 3s linear infinite;
		          animation: gradient 3s linear infinite;
		}
		
		.webflow-style-input input {
		  -webkit-box-flex: 1;
		      -ms-flex-positive: 1;
		          flex-grow: 1;
		  color: rgb(221,61,44);
		  font-size: 1rem;
		  line-height: 1.6rem;
		  vertical-align: middle;
		}
		.webflow-style-input input::-webkit-input-placeholder {
		  color: gray;
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
			<h1  style="color: gray; font-size: 40px; padding-top: 20px;">Class Creation<h1>
			
			<div class="webflow-style-input">
				<input class="input" name="courseName" type="text" placeholder="Course Name"></input>
			</div>
			
			<div class="webflow-style-input" style="margin-top: 30px;">
				<input class="input" name="courseID" type="text" placeholder="Course ID"></input>
			</div>

			<h1 class="input_titles">Description<h1>
			<textarea rows="5" cols="50" name="courseDesc" class="input_bar" style="resize: none"></textarea>
			<!--  <input type="text" name="courseDesc" class="input_bar">   -->
			
			<br>${message}<br>
			<input type="submit" class="sub_button">
		</form>
	</div>
</body>
</html>