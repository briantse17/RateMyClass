<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<style>
	body, html{
		height: 100%;
		margin: 0;
		padding: 0;
	}
	.sub_button:hover{
		opacity: 0.8;
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
		<a href="LoginPage.jsp"><h1 style="float: right; color: white; margin-top: 25px; font-size: 25px; margin-right:25px;">Sign In</h1></a>
		<%}%>
	</div>
	
	<div class="login_div" style="margin: 0 auto; display: block; width: 60%; padding-top: 100px;">
		<img id="login_icon" src="login_image.png" style="width:300px; margin: 0 auto; display: block;">
		<form name="register_user" class="login_form" onsubmit="return validate_register()" method="POST" action="HomePage.jsp" style="margin: 0 auto; width: 40%; display: block;">
		
			<h1 style="text-align: center; font-size: 40px; color: gray;">Create a new account</h1>
			
			<input name="username" class="input_bar" type="text" placeholder="Username" style="width: 100%; font-size: 15px; margin-bottom: 20px; padding: 8px; border-radius: 20px;">
			
			<input name="password" class="input_bar" type="password" placeholder="Password" style="width: 100%; font-size: 15px; margin-bottom: 20px; padding: 8px; border-radius: 20px;">
			
			<input name="confirm_password" class="input_bar" type="password" placeholder="Confirm Password" style="width: 100%; font-size: 15px; margin-bottom: 40px; padding: 8px; border-radius: 20px;">
			
			<input class="sub_button" type="submit" value="Sign Up" style="background-color: #3CBC8D; text-decoration: none; cursor: pointer; border: none; color: white; padding: 10px;
			 font-size: 15px; width: 105%;text-align: center; border-radius: 20px;">
			 
			 <% if(request.getAttribute("user") == null);{%>
			 <p id="results" style="color: red; font-size: 16px; padding-left: 10px;"><%=request.getAttribute("message")%></p>
			 <%}%><br/>
			
		</form>
	</div>
	<script>
		function validate_register(){
			var xhttp = new XMLHttpRequest();
			xhhtp.open("POST", "UserRegisterServlet?username=" + document.register_user.username.value + 
					"&password=" + document.register_user.password.value, "&passwordConf=" + document.register_user.confirm_password.value, false);
			xhttp.send();
			if(xhttp.responseText.trim().length > 0){
				document.getElementById("formerror").innerHTML = xhttp.responseText;
				return false;
			}
			return true;
		}
	</script>
</body>
</html>