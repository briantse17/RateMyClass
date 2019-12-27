<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<link rel="stylesheet" type="text/css" href="css/Header.css">
	<style type="text/css">
		.search_bar::-webkit-input-placeholder{
			color: white;
		}
		body, html{
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		.login_div{
			float: right;
			width: 55%;
			padding-top: 100px;
			background-color: #c7c7c7;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg stroke='%23000' stroke-width='66.7' stroke-opacity='0' %3E%3Ccircle fill='%23c7c7c7' cx='0' cy='0' r='1800'/%3E%3Ccircle fill='%23cacaca' cx='0' cy='0' r='1700'/%3E%3Ccircle fill='%23cdcdcd' cx='0' cy='0' r='1600'/%3E%3Ccircle fill='%23d1d1d1' cx='0' cy='0' r='1500'/%3E%3Ccircle fill='%23d4d4d4' cx='0' cy='0' r='1400'/%3E%3Ccircle fill='%23d7d7d7' cx='0' cy='0' r='1300'/%3E%3Ccircle fill='%23dadada' cx='0' cy='0' r='1200'/%3E%3Ccircle fill='%23dedede' cx='0' cy='0' r='1100'/%3E%3Ccircle fill='%23e1e1e1' cx='0' cy='0' r='1000'/%3E%3Ccircle fill='%23e4e4e4' cx='0' cy='0' r='900'/%3E%3Ccircle fill='%23e8e8e8' cx='0' cy='0' r='800'/%3E%3Ccircle fill='%23ebebeb' cx='0' cy='0' r='700'/%3E%3Ccircle fill='%23eeeeee' cx='0' cy='0' r='600'/%3E%3Ccircle fill='%23f2f2f2' cx='0' cy='0' r='500'/%3E%3Ccircle fill='%23f5f5f5' cx='0' cy='0' r='400'/%3E%3Ccircle fill='%23f8f8f8' cx='0' cy='0' r='300'/%3E%3Ccircle fill='%23fcfcfc' cx='0' cy='0' r='200'/%3E%3Ccircle fill='%23ffffff' cx='0' cy='0' r='100'/%3E%3C/g%3E%3C/svg%3E");
			background-attachment: fixed;
			background-size: cover;
			height: 100%;
		}
		.background{
			float: right;
			background-color: #d32a14;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg stroke='%23000000' stroke-width='66.7' stroke-opacity='0' %3E%3Ccircle fill='%23d32a14' cx='0' cy='0' r='1800'/%3E%3Ccircle fill='%23d62f1a' cx='0' cy='0' r='1700'/%3E%3Ccircle fill='%23d83420' cx='0' cy='0' r='1600'/%3E%3Ccircle fill='%23db3826' cx='0' cy='0' r='1500'/%3E%3Ccircle fill='%23dd3d2c' cx='0' cy='0' r='1400'/%3E%3Ccircle fill='%23e04232' cx='0' cy='0' r='1300'/%3E%3Ccircle fill='%23e34738' cx='0' cy='0' r='1200'/%3E%3Ccircle fill='%23e54b3e' cx='0' cy='0' r='1100'/%3E%3Ccircle fill='%23e85044' cx='0' cy='0' r='1000'/%3E%3Ccircle fill='%23ea554b' cx='0' cy='0' r='900'/%3E%3Ccircle fill='%23ed5a51' cx='0' cy='0' r='800'/%3E%3Ccircle fill='%23ef5e57' cx='0' cy='0' r='700'/%3E%3Ccircle fill='%23f2635d' cx='0' cy='0' r='600'/%3E%3Ccircle fill='%23f56863' cx='0' cy='0' r='500'/%3E%3Ccircle fill='%23f76d69' cx='0' cy='0' r='400'/%3E%3Ccircle fill='%23fa716f' cx='0' cy='0' r='300'/%3E%3Ccircle fill='%23fc7675' cx='0' cy='0' r='200'/%3E%3Ccircle fill='%23ff7b7b' cx='0' cy='0' r='100'/%3E%3C/g%3E%3C/svg%3E");
			background-attachment: fixed;
			background-size: cover;
			width: 45%;
    		height: 100%;
		}
		
		.login_icon{
			width:200px;
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

		.sub_button{
			 background-color: rgb(221,61,44);
			 text-decoration: none;
			 cursor: pointer;
			 border: none;
			 color: white;
			 padding: 10px;
			 font-size: 15px;
			 width: 100%;
			 text-align: center;
			 border-radius: 20px;
		}
	
		.sub_button:hover{
			opacity: 0.8;
		}
		.user_button:hover{
			opacity: 0.8;
		}
		.background_text{
			text-align: center;
			color: white;
		}
		*, *:before, *:after {
		  box-sizing: border-box;
		}
		
		input {
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
	<div class="header">
		<a href="HomePage.jsp" class="home_pic"><img src="img/home_icon.png" class="home_button"></a>
		
		<a href="LoginPage.jsp" class="signout">Sign In</a>
		
		<form class="search_form" method="GET" action="SearchResults.jsp">
			<input name="searchField" class="search_bar" type="text" placeholder="Search for any class...">
		</form>
	</div>
	
	
	<div class="background">
		<h1 class="background_text" style="font-size: 40px; padding-top: 180px;">Hello!</h1>
		<h2 class="background_text" style="font-size: 30px;">Create an account to find your perfect class</h2>
		<iframe style="margin-left: 26%;" src="https://giphy.com/embed/YRmmo1Obhdr7S8EI2A" width="300" frameBorder="0"></iframe>
	</div>
	
	<div class="login_div" >
		<img class="login_icon" src="img/login_symbol.png">
		<form name="user_login" class="login_form" method="POST" action="register">
		
			<h1 class="signin_title">Register</h1>
			
			<div class="webflow-style-input">
				<input name="username" type="text" placeholder="Username"></input>
			</div>
			
			<div class="webflow-style-input" style="margin-top: 20px;">
				<input name="password" type="password" placeholder="Password"></input>
			</div>
			<div class="webflow-style-input" style="margin-top: 20px;">
				<input name="password-conf" type="password" placeholder="Confirm Password"></input>
			</div>
			
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