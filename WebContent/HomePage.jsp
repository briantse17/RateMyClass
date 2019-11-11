<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
</head>
<style>
	body, html{
		height: 100%;
		margin: 0;
		padding: 0;
	}
	h1:hover{
		opacity: 0.8;
	}
	.user_button:hover{
		opacity: 0.8;
	}

</style>
<body>
	<div class="header" style="width: 100%; height: 80px; background-color: #f02618; position: fixed;">
		<a href="HomePage.jsp" class="home_pic"><img src="home_icon.png" style="width: 200px; float: left; margin-left: 15px; margin-top: 3px;"></a>
		
		<form class="login_form" onsubmit="" method="GET" action=""">
			<input class="search_bar" type="text" placeholder="Search for any class..." style="float: left; width: 60%; font-size: 13px; padding: 12px;
			 border-radius: 20px; margin-top: 20px; margin-left: 3%; background-color:#a81b11; border: none; outline: none; color: white;">
		</form>
		
		
		<% if(session.getAttribute("user") != null){%>
		<a href="" class="user_button"><img src="login.png" style="float: right; width: 50px;
			margin-right: 25px; margin-top: 15px;"></a>
		<a href="UserLogOutServlet"><h1 class="signout" style="float: right; color: white; margin-right:20px; font-size: 25px; margin-top: 25px;">Sign Out</h1></a>
		<%}%>
		
		<% if(session.getAttribute("user") == null){%>
		<a href="RegisterPage.jsp"><h1 style="float: right; color: white; margin-right:25px; margin-top: 25px; font-size: 25px;">Sign Up</h1></a>
		<h1 style="float: right; color: white; margin-left: 10px; margin-right: 10px; margin-top: 25px; font-size: 25px; "> / </h1>
		<a href="LoginPage.jsp"><h1 style="float: right; color: white; margin-top: 25px; font-size: 25px;">Sign In</h1></a>
		<%}%>
		
	</div>
</body>
</html>