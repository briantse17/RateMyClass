<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<link rel="stylesheet" type="text/css" href="Header.css">
	<style type="text/css">
		#body {
			margin-top: 50px;
        	border-top: solid 1px lightgrey;
        	padding-top: 15px;
        }
        
        .center {
			margin: auto;
			width: 70%;
		}
		
		#infoBox {
			margin-top: 50px;
			text-align: left;
		}
		
		#form * {
			width: 100%;
		}
		
		input {
			height: 20px;
			border-radius: 2px;
			border: 1px solid lightgrey;
		}
		
		#login-button {
        	height: 30px;
        	border-radius: 2px;
        	background-color: lightgrey;
        	text-color: white;
        }
	</style>
</head>
<body>
	<div id="header" class="center">
		<img src="Images/bookworm.png" alt="bookworm" id="logo" onclick="backToHome()">
		<div id="search-section">
			<form action="BookSearchServlet">
				<input type="text" id="search-field" name="searchField" placeholder="What book is on your mind?">
				<button id="submit-button" type="submit"><img id="mag-glass" src="Images/magnifying_glass.png" alt="Search!"></button>
			</form>
		</div>
	</div>
	<div id="body">
		<div class="center" id="infoBox">
        	<form id="form" action="register" method="post">
            	<a>Username</a><br>
            	<input name="username" size="30" />
            	<br><br>
            	<a>Password</a><br>
            	<input type="password" name="password" size="30" />
            	<br><br>
            	<a>Confirm Password</a><br>
            	<input type="password" name="password-conf" size="30" />
            	<br>${message}
            	<br><br>           
            	<button id = "login-button" type="submit">Register</button>
        	</form>
    	</div>
	</div>
</body>
<script type="text/javascript">
	function backToHome() {
		window.location.href = "HomePage.jsp";
	}
</script>
</html>