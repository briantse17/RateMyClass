<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<link rel="stylesheet" type="text/css" href="Header.css">
	<style type="text/css">
		body, html{
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		.login_div{
			margin: 0 auto;
			display: block;
			width: 60%;
			padding-top: 60px;
		}
		
		.login_icon{
			width:300px;
			margin: 0 auto;
			display: block;
		}
		
		.login_form{
			margin: 0 auto;
			width: 40%;
			display: block;
			margin-bottom: 60px;
		}
		
		.signin_title{
			text-align: center;
			font-size: 40px;
			color: gray;
		}
		
		.input_bar{
			width: 100%;
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
			 width: 105%;
			 text-align: center;
			 border-radius: 20px;
		}
	
		.sub_button:hover{
			opacity: 0.8;
		}
		.user_button:hover{
			opacity: 0.8;
		}
		
	</style>
</head>
<body>
	<div class="header">
		<a href="HomePage.jsp" class="home_pic"><img src="home_icon.png" class="home_button"></a>
		
		<a href="LoginPage.jsp" class="signout">Sign In</a>
		
		<form class="search_form" method="GET" action="SearchResults.jsp">
			<input name="searchField" class="search_bar" type="text" placeholder="Search for any class...">
		</form>
	</div>
	
	<div class="login_div" >
		<img class="login_icon" src="login_image.png">
		<form name="user_login" class="login_form" method="POST" action="register">
		
			<h1 class="signin_title">Register</h1>
			
			<input name="username" class="input_bar" type="text" placeholder="Username">
			
			<input name="password" class="input_bar" type="password" placeholder="Password">
			
			<input name="password-conf" class="input_bar" type="password" placeholder="Confirm Password" style="margin-bottom: 40px;">
			<br>${message}<br>
						
			<input class="sub_button" type="submit" value="Sign Up">
		</form>
	</div>
</body>
<script type="text/javascript">
	function backToHome() {
		window.location.href = "HomePage.jsp";
	}
</script>
</html>