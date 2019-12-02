<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="course.Course, course.CourseDAO, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search Results</title>
	<link rel="stylesheet" type="text/css" href="Header.css">
	<style type="text/css">
		body, html{
			height: 100%;
			margin: 0;
			padding: 0;
		}
		
		#body{
			position: relative;
			top: 80px;
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
	
	<div id="body">
		<%
		CourseDAO courseDao = new CourseDAO();
		List<Course> courses = courseDao.searchCourse(request.getParameter("searchField"));
		for(int i=0; i<courses.size(); i++) {%>
			<div>
			<a class="courseID" href="classpage?class=<%=courses.get(i).getIntCourseID()%>"><%=courses.get(i).getIntCourseID()%></a>: <a class="courseName"><%=courses.get(i).getCourseName()%></a>
			<br>
			<a><%=courses.get(i).getCourseDesc()%></a>
			</div>
		<%
		}%>
	</div>
</body>
</html>