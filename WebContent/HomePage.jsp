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
        	$("<div style=\"text-align: center;\"><h1>ACCT</h1></div>").appendTo($("#ACCT"));
            $.get("Courses?id=ACCT", function(responseJson) {
            	var $ul = $("<ul>").appendTo($("#ACCT"));
            	$.each(responseJson, function(index, item) {
            		$("<li>").html("<table style=\"border-collapse: collapse; width:100%; background-color: #ffcccc; padding: 10px; border: 3px solid #ff6600;\">"+item+"</table>").appendTo($ul);
            	});
            });
        });
            $(document).on("click", "#cBUAD", function() {
            	$('#BUAD').empty();
            	$("<div style=\"text-align: center;\"><h1>BUAD</h1></div>").appendTo($("#BUAD"));
            	$.get("Courses?id=BUAD", function(responseJson) {
            		var $ul = $("<ul>").appendTo($("#BUAD"));
            		$.each(responseJson, function(index, item) {
            			$("<li>").html("<table style=\"border-collapse: collapse; width:100%; background-color: #ffcccc; padding: 10px; border: 3px solid #ff6600;\">"+item+"</table>").appendTo($ul);
            		});
            	});
            });
            $(document).on("click", "#cCSCI", function() {
            	$('#CSCI').empty();
            	$("<div style=\"text-align: center;\"><h1>CSCI</h1></div>").appendTo($("#CSCI"));
                $.get("Courses?id=CSCI", function(responseJson) {
                	var $ul = $("<ul>").appendTo($("#CSCI"));
                	$.each(responseJson, function(index, item) {
                		$("<li>").html("<table style=\"border-collapse: collapse; width:100%; background-color: #ffcccc; padding: 10px; border: 3px solid #ff6600;\">"+item+"</table>").appendTo($ul);
                	});
                });
            });
            $(document).on("click", "#cMATH", function() {
	        	$('#MATH').empty();
	        	$("<div style=\"text-align: center;\"><h1>MATH</h1></div>").appendTo($("#MATH"));
	            $.get("Courses?id=MATH", function(responseJson) {
	            	var $ul = $("<ul>").appendTo($("#MATH"));
	            	$.each(responseJson, function(index, item) {
	            		$("<li>").html("<table style=\"border-collapse: collapse; width:100%; background-color: #ffcccc; padding: 10px; border: 3px solid #ff6600;\">"+item+"</table>").appendTo($ul);
	            	});
	            });
	        });
            
        </script>
	<style type="text/css">
		body, html{
			margin: 0;
			padding: 0;
		}
		#tab-body {
			padding-top: 80px;
		}
		#body{
			text-align: center;
			margin: 0 auto;
			width: 60%;
			margin-top: 100px;
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
	<div class="header" style="top: 0px;">
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
	
	<div id="body">
		<div id="tab-body">
			<div class="tab">
				<button class="tabs" onclick="section(event, 'ACCT')" id="cACCT">ACCT</button>
				<button class="tabs" onclick="section(event, 'BUAD')" id="cBUAD">BUAD</button>
				<button class="tabs" onclick="section(event, 'CSCI')" id="cCSCI">CSCI</button>
				<button class="tabs" onclick="section(event, 'MATH')" id="cMATH">MATH</button>
			</div>
			
			<div id="ACCT" class="sectionContent">

			</div>
			
			<div id="BUAD" class="sectionContent">
			</div>
						
			<div id="CSCI" class="sectionContent">

			</div>
			
			<div id="MATH" class="sectionContent">

			</div>
			
			
		</div>
		</div>
</body>
<script>document.getElementById("cACCT").click();</script>
</html>