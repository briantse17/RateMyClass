<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
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
			float: left;
			padding-top: 100px;
			width: 55%;
			background-color: #ffffff;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg %3E%3Cpath fill='%23f9f9f9' d='M486 705.8c-109.3-21.8-223.4-32.2-335.3-19.4C99.5 692.1 49 703 0 719.8V800h843.8c-115.9-33.2-230.8-68.1-347.6-92.2C492.8 707.1 489.4 706.5 486 705.8z'/%3E%3Cpath fill='%23f4f4f4' d='M1600 0H0v719.8c49-16.8 99.5-27.8 150.7-33.5c111.9-12.7 226-2.4 335.3 19.4c3.4 0.7 6.8 1.4 10.2 2c116.8 24 231.7 59 347.6 92.2H1600V0z'/%3E%3Cpath fill='%23eeeeee' d='M478.4 581c3.2 0.8 6.4 1.7 9.5 2.5c196.2 52.5 388.7 133.5 593.5 176.6c174.2 36.6 349.5 29.2 518.6-10.2V0H0v574.9c52.3-17.6 106.5-27.7 161.1-30.9C268.4 537.4 375.7 554.2 478.4 581z'/%3E%3Cpath fill='%23e9e9e9' d='M0 0v429.4c55.6-18.4 113.5-27.3 171.4-27.7c102.8-0.8 203.2 22.7 299.3 54.5c3 1 5.9 2 8.9 3c183.6 62 365.7 146.1 562.4 192.1c186.7 43.7 376.3 34.4 557.9-12.6V0H0z'/%3E%3Cpath fill='%23e3e3e3' d='M181.8 259.4c98.2 6 191.9 35.2 281.3 72.1c2.8 1.1 5.5 2.3 8.3 3.4c171 71.6 342.7 158.5 531.3 207.7c198.8 51.8 403.4 40.8 597.3-14.8V0H0v283.2C59 263.6 120.6 255.7 181.8 259.4z'/%3E%3Cpath fill='%23e9e9e9' d='M1600 0H0v136.3c62.3-20.9 127.7-27.5 192.2-19.2c93.6 12.1 180.5 47.7 263.3 89.6c2.6 1.3 5.1 2.6 7.7 3.9c158.4 81.1 319.7 170.9 500.3 223.2c210.5 61 430.8 49 636.6-16.6V0z'/%3E%3Cpath fill='%23eeeeee' d='M454.9 86.3C600.7 177 751.6 269.3 924.1 325c208.6 67.4 431.3 60.8 637.9-5.3c12.8-4.1 25.4-8.4 38.1-12.9V0H288.1c56 21.3 108.7 50.6 159.7 82C450.2 83.4 452.5 84.9 454.9 86.3z'/%3E%3Cpath fill='%23f4f4f4' d='M1600 0H498c118.1 85.8 243.5 164.5 386.8 216.2c191.8 69.2 400 74.7 595 21.1c40.8-11.2 81.1-25.2 120.3-41.7V0z'/%3E%3Cpath fill='%23f9f9f9' d='M1397.5 154.8c47.2-10.6 93.6-25.3 138.6-43.8c21.7-8.9 43-18.8 63.9-29.5V0H643.4c62.9 41.7 129.7 78.2 202.1 107.4C1020.4 178.1 1214.2 196.1 1397.5 154.8z'/%3E%3Cpath fill='%23ffffff' d='M1315.3 72.4c75.3-12.6 148.9-37.1 216.8-72.4h-723C966.8 71 1144.7 101 1315.3 72.4z'/%3E%3C/g%3E%3C/svg%3E");
			background-attachment: fixed;
			background-size: cover;
			height: 100%;

		}
		.background{
    		float: left;
			background-color: #ff2a17;
			background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg %3E%3Cpath fill='%23ff3b22' d='M486 705.8c-109.3-21.8-223.4-32.2-335.3-19.4C99.5 692.1 49 703 0 719.8V800h843.8c-115.9-33.2-230.8-68.1-347.6-92.2C492.8 707.1 489.4 706.5 486 705.8z'/%3E%3Cpath fill='%23ff482d' d='M1600 0H0v719.8c49-16.8 99.5-27.8 150.7-33.5c111.9-12.7 226-2.4 335.3 19.4c3.4 0.7 6.8 1.4 10.2 2c116.8 24 231.7 59 347.6 92.2H1600V0z'/%3E%3Cpath fill='%23ff5437' d='M478.4 581c3.2 0.8 6.4 1.7 9.5 2.5c196.2 52.5 388.7 133.5 593.5 176.6c174.2 36.6 349.5 29.2 518.6-10.2V0H0v574.9c52.3-17.6 106.5-27.7 161.1-30.9C268.4 537.4 375.7 554.2 478.4 581z'/%3E%3Cpath fill='%23ff5e40' d='M0 0v429.4c55.6-18.4 113.5-27.3 171.4-27.7c102.8-0.8 203.2 22.7 299.3 54.5c3 1 5.9 2 8.9 3c183.6 62 365.7 146.1 562.4 192.1c186.7 43.7 376.3 34.4 557.9-12.6V0H0z'/%3E%3Cpath fill='%23ff684a' d='M181.8 259.4c98.2 6 191.9 35.2 281.3 72.1c2.8 1.1 5.5 2.3 8.3 3.4c171 71.6 342.7 158.5 531.3 207.7c198.8 51.8 403.4 40.8 597.3-14.8V0H0v283.2C59 263.6 120.6 255.7 181.8 259.4z'/%3E%3Cpath fill='%23ff5c3e' d='M1600 0H0v136.3c62.3-20.9 127.7-27.5 192.2-19.2c93.6 12.1 180.5 47.7 263.3 89.6c2.6 1.3 5.1 2.6 7.7 3.9c158.4 81.1 319.7 170.9 500.3 223.2c210.5 61 430.8 49 636.6-16.6V0z'/%3E%3Cpath fill='%23ff4f32' d='M454.9 86.3C600.7 177 751.6 269.3 924.1 325c208.6 67.4 431.3 60.8 637.9-5.3c12.8-4.1 25.4-8.4 38.1-12.9V0H288.1c56 21.3 108.7 50.6 159.7 82C450.2 83.4 452.5 84.9 454.9 86.3z'/%3E%3Cpath fill='%23ff3f25' d='M1600 0H498c118.1 85.8 243.5 164.5 386.8 216.2c191.8 69.2 400 74.7 595 21.1c40.8-11.2 81.1-25.2 120.3-41.7V0z'/%3E%3Cpath fill='%23ff2b16' d='M1397.5 154.8c47.2-10.6 93.6-25.3 138.6-43.8c21.7-8.9 43-18.8 63.9-29.5V0H643.4c62.9 41.7 129.7 78.2 202.1 107.4C1020.4 178.1 1214.2 196.1 1397.5 154.8z'/%3E%3Cpath fill='%23ff0303' d='M1315.3 72.4c75.3-12.6 148.9-37.1 216.8-72.4h-723C966.8 71 1144.7 101 1315.3 72.4z'/%3E%3C/g%3E%3C/svg%3E");
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
		
		<a href="RegisterPage.jsp" class="signout">Sign Up</a>
		
		<form class="search_form" method="GET" action="SearchResults.jsp">
			<input name="searchField" class="search_bar" type="text" placeholder="Search for any class...">
		</form>
		
	</div>
	
	<div class="background">
		<h1 class="background_text" style="font-size: 40px; padding-top: 180px;">Welcome Back!</h1>
		<h2 class="background_text" style="font-size: 30px;">Sign in to find your perfect class</h2>
		<iframe style="margin-left: 33%;" src="https://giphy.com/embed/SvKw6Wh6zJNghaoZzK" width="200" frameBorder="0"></iframe>
	</div>
	
	<div class="login_div">
		<img class="login_icon" src="img/login_symbol.png">
		<form name="user_login" class="login_form" method="POST" action="login">
		
			<h1 class="signin_title">Sign In</h1>
						
			<div class="webflow-style-input">
				<input name="username" type="text" placeholder="Username"></input>
			</div>
			
			<div class="webflow-style-input" style="margin-top: 20px;">
				<input name="password" type="password" placeholder="Password"></input>
			</div>
			<input type="hidden" name="from" value="<%=request.getParameter("from") %>">
			<br>${message}<br>
						
			<input class="sub_button" type="submit" value="Log In">

		</form>
	</div>
	
</body>
<script type="text/javascript">
	function backToHome() {
		window.location.href = "HomePage.jsp";
	}
</script>
</html>