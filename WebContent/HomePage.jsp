<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="test.css">
<link rel="stylesheet" type="text/css" href="Header.css">
<meta charset="UTF-8">
<title>Home Page</title>
<script src="test.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
	        $(document).on("click", "#cACCT", function() {
	        	$('#ACCT').empty();
	            $.get("Courses?id=ACCT", function(responseJson) {
	            	var $ul = $("<ul>").appendTo($("#ACCT"));
	            	$.each(responseJson, function(index, item) {
	            		$("<li>").html(item).appendTo($ul);
	            	});
	            });
	        });
            $(document).on("click", "#cBUAD", function() {
            	$('#BUAD').empty();
            	$.get("Courses?id=BUAD", function(responseJson) {
            		var $ul = $("<ul>").appendTo($("#BUAD"));
            		$.each(responseJson, function(index, item) {
            			$("<li>").html(item).appendTo($ul);
            		});
            	});
            });
            $(document).on("click", "#cCSCI", function() {
            	$('#CSCI').empty();
                $.get("Courses?id=CSCI", function(responseJson) {
                	var $ul = $("<ul>").appendTo($("#CSCI"));
                	$.each(responseJson, function(index, item) {
                		$("<li>").html(item).appendTo($ul);
                	});
                });
            });
        </script>
	<style type="text/css">
		body, html{
			height: 100%;
			margin: 0;
			padding: 0;
		}
		#tab-body {
			padding-top: 80px;
		}
		
		.login_div{
			margin: 0 auto;
			display: block;
			width: 60%;
			padding-top: 100px;
		}
		
		.login_form{
			margin: 0 auto;
			width: 40%;
			display: block;
			margin-bottom: 100px;
		}
	
	</style>
</head>
<body>
	<div class="header">
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
	<div id="tab-body">
		<div class="tab">
			<button class="tabs" onclick="section(event, 'BUAD')" id="cBUAD">BUAD</button>
			<button class="tabs" onclick="section(event, 'CSCI')" id="cCSCI">CSCI</button>
			<button class="tabs" onclick="section(event, 'EE')" id="cEE">EE</button>
			<button class="tabs" onclick="section(event, 'MATH')" id="cMATH">MATH</button>
		</div>
		
		<div id="BUAD" class="sectionContent">
		</div>
					
		<div id="CSCI" class="sectionContent">
		</div>
		
		<div id="EE" class="sectionContent">
		</div>
		
		<div id="MATH" class="sectionContent">
		</div>
		
	</div>
</body>
<script>document.getElementById("cACCT").click();</script>
</html>