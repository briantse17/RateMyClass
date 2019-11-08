<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<style>
	.sub_button:hover{
		opacity: 0.8;
	}
</style>
<body>
	<div class="login_div" style="margin: 0 auto; display: block; width: 60%; margin-top: 40px;">
		<img id="login_icon" src="login_icon.png" style="width:200px; margin: 0 auto; display: block;">
		<form name="register_user" class="login_form" onsubmit="return validate_register()" method="POST" action="HomePage.jsp" style="margin: 0 auto; width: 40%; display: block;">
		
			<h1 style="text-align: center; font-size: 40px; color: gray;">Create a new account</h1>
			
			<input name="username" class="input_bar" type="text" placeholder="Username" style="width: 100%; font-size: 15px; margin-bottom: 20px; padding: 8px; border-radius: 20px;">
			
			<input name="password" class="input_bar" type="password" placeholder="Password" style="width: 100%; font-size: 15px; margin-bottom: 20px; padding: 8px; border-radius: 20px;">
			
			<input name="confirm_password" class="input_bar" type="password" placeholder="Confirm Password" style="width: 100%; font-size: 15px; margin-bottom: 40px; padding: 8px; border-radius: 20px;">
			
			<input class="sub_button" type="submit" value="Sign Up" style="background-color: #3CBC8D; text-decoration: none; cursor: pointer; border: none; color: white; padding: 10px;
			 font-size: 15px; width: 104%;text-align: center; border-radius: 20px;">
			 
			 <% if(request.getAttribute("message") != null);{%>
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