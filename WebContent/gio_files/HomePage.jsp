<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Search Results</title>
		<link rel="stylesheet" type="text/css" href="Header.css">
		<style>
		.center {
			margin: auto;
			width: 70%;
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
		</div>
	</body>
	<script type="text/javascript">
		
	</script>
</html>