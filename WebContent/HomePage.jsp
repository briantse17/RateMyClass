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
	.user_button:hover{
		opacity: 0.8;
	}

</style>
<body>
	<div class="header" style="width: 100%; height: 110px; background-color: #dbdbdb; position: fixed;">
		<a href="HomePage.jsp" class="home_pic"><img src="logo.png" style="width: 200px; float: left; margin-left: 10px; margin-top: 10px;"></a>
		<form class="login_form" onsubmit="" method="GET" action=""">
			<input class="search_bar" type="text" placeholder="Search for any class..." style="float: left; width: 55%;
			 font-size: 15px; padding: 8px; border-radius: 20px; margin-top: 33px; margin-left: 8%;">
		</form>
		
		<% if(session.getAttribute("user") != null){%>
		<div>
			<a href="UserLogOutServlet" class="user_button"><img src="login_icon.png" style="float: right; width: 70px;
			margin-right: 45px; margin-top: 15px;"></a>
		</div>
		<%}%>
		<% if(session.getAttribute("user") == null){%>
		<div style="border-radius: 25px; background-color: #2e2e2e; float: right; font-size: 10px; 
		padding-right: 12px; padding-left:12px; margin-top: 25px; margin-right: 10px;">
			<a href="Register.jsp"><h1 style="float: right; color: #45ABA4;">Sign Up</h1></a>
			<h1 style="float: right; color: #45ABA4; margin-left: 3px; margin-right: 3px"> / </h1>
			<a href="Login.jsp"><h1 style="float: right; color: #45ABA4;">Sign In</h1></a>
		</div>
		<%}%>
		
	</div>
</body>
</html>