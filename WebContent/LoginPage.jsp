<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
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
		<div id="search-section">
			<form action="SearchResults.jsp">
				<input type="text" id="search-field" name="searchField" placeholder="Search by Class name or Class ID">
				<button id="submit-button" type="submit"><img id="mag-glass" src="Images/magnifying_glass.png" alt="Search!"></button>
			</form>
		</div>
		<%
		if(session.getAttribute("user") != null) {
		%>
		<span><a href="ProfilePage.jsp">Profile</a><a href="logout" style="margin-left: 30px;">Log Out</a></span>
		<%
		}
		else {
		%>
		<span><a href="LoginPage.jsp">Login</a><a href="RegisterPage.jsp" style="margin-left: 30px;">Register</a></span>
		<%
		}
		%>
	</div>
	<div id="body">
		<div class="center" id="infoBox">
        	<form id="form" action="login" method="post">
            	<a>Username</a><br>
            	<input name="username"/>
            	<br><br>
            	<a>Password</a><br>
            	<input type="password" name="password"/>
            	<br>${message}
       	    	<br><br>           
            	<button id="login-button" type="submit">Sign In</button>
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