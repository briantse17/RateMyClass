<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="obj.DAO"%>
<%@ page import="obj.Comment"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClassPage</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<style>
* {
	box-sizing: border-box;
}

body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

body {
    background-color: rgb(243, 243, 243);
}

#cover {
	height: 100%;
	width: 100%;
	position: fixed;
	background-color: white;
	z-index: 99;
}

.lds-ring {
  display: block;
  position: relative;
  width: 80px;
  height: 80px;
  margin: 200px auto;
}
.lds-ring div {
  box-sizing: border-box;
  display: block;
  position: absolute;
  width: 100px;
  height: 100px;
  margin: 8px;
  border: 15px solid #fca8a2;
  border-radius: 50%;
  animation: lds-ring 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
  border-color: #fca8a2 transparent transparent transparent;
}
.lds-ring div:nth-child(1) {
  animation-delay: -0.45s;
}
.lds-ring div:nth-child(2) {
  animation-delay: -0.3s;
}
.lds-ring div:nth-child(3) {
  animation-delay: -0.15s;
}
@keyframes lds-ring {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

#content {
	padding: 20px 100px 60px;
}

#courseInfo {
	width: 100%;
}

.section {
	margin: 20px 0;
}

h1,h2,h3 {
	font-family: sans-serif;
}

h1 {
	font-size: 40px;
}

h2 {
	font-size: 30px;
}

h3 {
	text-align: center;
	font-size: 20px;
}

table {
    border-collapse: collapse;
    table-layout: auto;
    width: 100%;
}
#comments-container th {
	padding: 20px;
}
#comments-container tr {
    border: 1px solid lightgray;
}


#comments-container {
    margin: 80px auto;
    width: 100%;
    background-color: white;
}
.comment {
    overflow: auto;
    transition: background-color 0.5s;
    
}
.comment:hover {
    background-color: #f8cece;
}
.comment-info {
    width: 20px;
    padding: 20px;
}
.comment-content {
	padding: 15px;
	vertical-align: baseline;
	position: relative;
}
.comment-body {
	font-size: 20px;
}
.user-info {
	position: absolute;
	bottom: 15px;
	right: 15px;
	text-align: right;
}
.button-wrap {
    margin: auto;
    width: fit-content;
}

.container {
	width: 100%;
}

.classContent {
	width: 100%;
	height: 200px;
}

.modal {
	position: fixed;
	top: 0;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgba(0, 0, 0, 0.8)
}

.modal--hidden {
	display: none;
}

.modal_content {
	padding: 2rem 2rem;
	background-color: white;
	width: 400px;
}
#submitReview {
	clear: both;
	width: 100%;
}

.continueComment {
	width: 102%;
	padding: .5rem;
	border: none;
	background-color: lightgray;
	color: #fff;
	transition: all .5s ease-in-out;
	cursor: pointer;
}

.continueComment:hover {
	background-color: gray;
}

#show-modal {
	width: 100%;
	padding: .5rem;
	border: none;
	background-color: lightgray;
	color: #fff;
	transition: all .3s ease;
	cursor: pointer;
}

#show-modal:hover {
	background-color: gray;
}

.modal_close {
	float: right;
	cursor: pointer;
	font-size: 25px;
}

.submitForm {
	width: 140px;
	float: left;
}

#chars {
	float: right;
}

textarea {
	display: block;
	margin: 1em 0;
	width: 100%;
	height: 60px;
	font-size: 16px;
	font-family: serif;
}

.input {
	width: 100%;
	margin: 0 auto;
}


.form-param {
	position: relative;
	height: 40px;
}

.value {
	font-size: 30px;
	color: red;
	float: left;
	margin: 0 12px;
	position: relative;
	bottom: 10px;
}

#description {
	resize: vertical;
}

.slider {
	width: 85%;
	float: left;
}

#course-stats {
	width: 100%;
	display: table;
	border-collapse: collapse;
}

.stats-row {
	display: table-row;
}

.stats-col {
	height: 400px;
	display: table-cell;
	vertical-align: middle;
	margin: 10px;
	background-color: white;
	border: 3px solid rgb(243, 243, 243);
	z-index: 0;
}

.stats-col:hover {
	top: -2px;
	box-shadow: 0px 0px 10px 1px gray;
}

.avg-stats {
	text-align: center;
	margin: 50px 30px;
}

.average {
	font-size: 30px;
	font-weight: bold;
}

.like_button {
	display: inline-block;
}

.like_button:hover {
	cursor: pointer;
}

.dislike_button {
	display: inline-block;
}

.dislike_button:hover {
	cursor: pointer;
}

.likenum {
	margin: 10px 0;
	font-size: 20px;
	text-align: center;
}

.text-container {
	text-align: left;
}

.like.selected {
	content: url("img/thumbs_up_clicked.png");
}
.search_bar::-webkit-input-placeholder{
			color: white;
		}

.dislike.selected {
	content: url("img/thumbs_down_clicked.png");
}

.like.selected:hover {
	content: url("img/thumbs_up.png");
}

.dislike.selected:hover {
	content: url("img/thumbs_down.png");
}

.like:hover {
	content: url("img/thumbs_up_clicked.png");
}

.dislike:hover {
	content: url("img/thumbs_down_clicked.png");
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	
	// AJAX CALL FOR LIKE/DISLIKE
	// Needs like value of +1 or -1, commentID, and userID
	
	// JUSTIN'S CODE
	function sendLike(likeValue, userID, commentID) {
		if (userID == -1) {
			alert("You must log in to like/dislike.");
			return;
		}
		var currLikesSelector = $("#" + commentID + " .likenum");
		let button = likeValue == 1? " .like" : " .dislike";
		var clickedButton = $("#" + commentID + button);
		console.log(likeValue + " " + userID + " " + commentID);
		$.ajax({
			url: "like?likeValue=" + likeValue + "&user=" + userID + "&comment=" + commentID + "&totalLikes=" + currLikesSelector.html(),
			method: "GET",
			success: function(res, status, xhr) {
				if (clickedButton.hasClass("selected")){
					clickedButton.removeClass("selected");
				}
				else {
					$("#" + commentID + " img").removeClass("selected");
					clickedButton.addClass("selected");
				}
				currLikesSelector.html(res);
			},
			error: function(data, err, res) {
				$("#error").html(data.responseText);
			}
		})
	}
</script>
<%@ page import="obj.Comment"%>
	<%@ page import="java.util.List"%>
	<%@ page import="obj.Course"%>
	<%@ page import="user.User"%>
	<%@ page import="java.util.Vector"%>
	<%@ page import="java.util.Collections"%>
	
	<%
		Course current = (Course) request.getAttribute("Course");
		List<Comment> comments = current.getComments();
		User currUser = (User) session.getAttribute("user");
		List<Integer> difficultyDist = current.getDifficultyDist();
		List<Integer> usefulnessDist = current.getUsefulnessDist();
		List<Integer> gradeDist = current.getGradeDist();
		for (int i = 0; i < comments.size(); i++)  
	    {  
	        int max_idx = i;  
	        for (int j = i+1; j < comments.size(); j++){
		        if (comments.get(j).getTotalLikes() > comments.get(max_idx).getTotalLikes())  {
		            max_idx = j;  
		        }
	        }
	        Collections.swap(comments,i, max_idx);
	    }  
	%>
<script type="text/javascript"
			src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
				// Load google charts
				google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				// Draw the chart and set the chart values
				function drawChart() {
				  var data = google.visualization.arrayToDataTable([
				  ['Grade', 'Value'],
				  ['A', <%=gradeDist.get(0)%>],
				  ['B', <%=gradeDist.get(1)%>],
				  ['C', <%=gradeDist.get(2)%>],
				  ['D', <%=gradeDist.get(3)%>],
				  ['F', <%=gradeDist.get(4)%>]
				]);
				  var data2 = google.visualization.arrayToDataTable([
					  ['Difficulty', 'Count', { role: "style" }],
					  ['Impossible', <%=difficultyDist.get(0)%>, '#e0440e'],
					  ['Hard', <%=difficultyDist.get(1)%>, '#e6693e'],
					  ['Average', <%=difficultyDist.get(2)%>, '#ec8f6e'],
					  ['Easy', <%=difficultyDist.get(3)%>, '#f3b49f'],
					  ['A Breeze', <%=difficultyDist.get(4)%>, '#f6c7b6']
				]);
				  
				  var data3 = google.visualization.arrayToDataTable([
					  ['Usefulness', 'Count', { role: "style" }],
					  ['Necessary', <%=usefulnessDist.get(0)%>, '#e0440e'],
					  ['Useful', <%=usefulnessDist.get(1)%>, '#e6693e'],
					  ['Average', <%=usefulnessDist.get(2)%>, '#ec8f6e'],
					  ['Not Useful', <%=usefulnessDist.get(3)%>, '#f3b49f'],
					  ['Zero Application', <%=usefulnessDist.get(4)%>, '#f6c7b6']
				]);
				  
				  var options = {
						  'width':500, 
						  'height':400,
						  legend: { position: "none" },
						  colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'], 
						  backgroundColor: { fill:'transparent' },
						  'chartArea': {'top':'0%','left': '8%','width': '100%', 'height': '100%'},
						  pieSliceText: 'label',
						  pieSliceTextStyle: {
							  fontSize: '20',
						  },
						  is3D: 'true',
						  
					};
			      var view = new google.visualization.DataView(data2);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			      var view2 = new google.visualization.DataView(data3);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			      var options2 = {
					        width: 400,
					        height: 200,
					        bar: {groupWidth: "95%"},
					        legend: { position: "none" },
					        backgroundColor: { fill:'transparent' },
					        'chartArea': {'top':'0%','left':'25%','width': '70%', 'height': '80%'}
					      };
			      
			      var options3 = {
			        width: 400,
			        height: 200,
			        bar: {groupWidth: "95%"},
			        legend: { position: "none" },
			        backgroundColor: { fill:'transparent' },
			        'chartArea': {'top':'0%','left':'25%','width': '70%', 'height': '80%'}
			      };
			      var chart = new google.visualization.BarChart(document.getElementById("bargraph"));
			      chart.draw(view, options2);
			      
			      var chart = new google.visualization.BarChart(document.getElementById("bargraph2"));
			      chart.draw(view2, options3);
				  // Display the chart inside the <div> element with id="piechart"
				  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
				  chart.draw(data, options);
				  
				  setTimeout(function() {
					  $("#cover").fadeOut(1000);
				  }, 2000);
				}
				
			</script>
</head>
<body style="margin-top: 80px;" onload="testWorker()">

	
	<!-- COMMENTS -->
	<div id="cover"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div>
	<div id="content">
	<div id="courseInfo" style="z-index:1;">

		<div id="courseTitle" class="section"><h1>${Course.courseName} ${Course.intCourseID}</h1></div>
		<div id="courseDesc" class="section">${Course.courseDesc}</div>
		<div id="course-stats" class="section">
			<div class="stats-row">
				<div class="stats-col">
					<% Float difficulty = current.getDifficulty();
					   Float usefulness = current.getUsefulness();
					   Float gpa = current.getGPA();
					%>
					<div class="avg-stats">Difficulty:<div class="average"><%= difficulty.isNaN()? "No Info" : String.format("%.2f", difficulty)%></div></div>
					<div class="avg-stats">Usefulness:<div class="average"><%= usefulness.isNaN()? "No Info" : String.format("%.2f", usefulness)%></div></div>
					<div class="avg-stats">Average GPA:<div class="average"><%=gpa.isNaN()? "No Info" : String.format("%.2f", gpa)%></div></div>
				</div>
				<div class="stats-col">
					<h3>Difficulty Distribution</h3>
					<div id="bargraph" style="z-index: 0; position: relative;"></div>
					<h3>Usefulness Distribution</h3>
					<div id="bargraph2"style="z-index: 0;position: relative;"></div>
				</div>
				<div class="stats-col">
					<h3>Grade Distribution</h3>
					<div id="piechart"style="z-index: 0;position: relative;"></div>
				</div>
			</div>
		</div>
	</div>
	<h2><%=comments.size() %> Comments</h2>
	
	<!-- USER COMMENT BOX -->
	<%
		if (currUser != null && !current.getUserCommented()) {
	%>
	<div class="newComment">
		<div class="input">
			<div class="text_area">
				<textarea id="textarea" maxlength="350"
					placeholder="Please add your comment here..." style="resize: none"></textarea>
			</div>
			<div class="submitForm">
				<button id="show-modal" onclick="toggleModal()">Continue Your Review</button>
			</div>
			<span id="chars">350 characters</span>
		</div>
	</div>
	
	<%
		}
		else if (currUser == null){%>
		<h3>Please log in to leave a comment.</h2>
			
		<% } %>

	
	<!-- /USER COMMENT BOX -->


	<!-- COMMENTS -->
	<% if (comments.size() > 0) {%>
	<table id="comments-container">
            <tbody>
            <%
			for (int i = 0; i < comments.size(); i++) {
				Comment curr = comments.get(i);
				%>
                <tr class="comment-row" id=<%=curr.getCommentID() %>>
                    <td class="comment-info">
                    	<div class="button-wrap">
	                        <button class="like_button" type="submit" style="border: 0; background: transparent" onclick="sendLike(1, <%=currUser == null? "-1" : currUser.getID() %>, <%=curr.getCommentID() %>)">
	                            <img src="thumbs_up.png" width="30px" height="30px" alt="submit" class="like<%= curr.getUserLikeValue() == 1? " selected" : ""%>"/>
	                        </button>
	                        <div class="likenum"><%=curr.getTotalLikes() %></div>
	                        <button class="dislike_button"type="submit" style="border: 0; background: transparent" onclick="sendLike(-1, <%=currUser == null? "-1" : currUser.getID() %>, <%=curr.getCommentID() %>)">
	                            <img src="thumbs_down.png" width="30px" height="30px" alt="submit" class="dislike<%= curr.getUserLikeValue() == -1? " selected" : ""%>"/>
	                        </button>
	                    </div>
                    </td>
                    <td class="comment-content"><span class="comment-body"><%=curr.getCommentBody()%></span>
                            
                    	<div class="user-info">
	                        <div><%=curr.getUserName()%></div>
	                        <div><%=curr.getCommentDate() %></div>
                       </div>
                    </td>
                </tr>
         		<% } %>
            </tbody>
        </table>
        <% } %>
        
</div>
	<%if(session.getAttribute("user") != null) {%>
	<div class="modal modal--hidden">
		<div class="modal_content">
			<div class="modal_close"><span>&times;</span></div>
			<form id="submitReview" method="POST" action="CommentServlet">
				<%currUser = (User) session.getAttribute("user"); %>
				<input type="hidden" id="custID" name="userID" value=<%=currUser.getID()%>> 
				<input type="hidden" id="custID2" name="courseID" value=<%=current.getCourseID()%>>
				
				<label class="slider_title" for="difficulty">Class Difficulty</label> 
				<div class="form-param">
					<input class="slider" type="range" name="difficulty" min="1" max="5" value="3" id="class_difficulty">
					<p class="value" id="class_d_value"></p>
				</div>
				
				<label class="slider_title" for="usefulness">Class Usefulness</label>
				<div class="form-param">
					<input class="slider" type="range" name="usefulness" min="1" max="5" value="3" id="class_usefulness">
					<p class="value" id="class_u_value"></p>
				</div>
					
				<label class="slider_title" for="workload">Class Workload</label> 
				<div class="form-param">
					<input class="slider" type="range" name="workload"min="1" max="5" value="3" id="class_workload">
					<p class="value" id="class_w_value"></p>
				</div>

				<div class="form-param">
					<label for="grade">Grade Received</label>
					<select id="grade" name="grade" form="submitReview">
						<option value="4.00">A</option>
						<option value="3.66">A-</option>
						<option value="3.33">B+</option>
						<option value="3.00">B</option>
						<option value="2.66">B-</option>
						<option value="2.33">C+</option>
						<option value="2.00">C</option>
						<option value="1.66">C-</option>
						<option value="1.33">D+</option>
						<option value="1.00">D</option>
						<option value="0.66">D-</option>
						<option value="0.00">F</option>
					</select>
				</div>
				<label for="description">Comment</label>
				<textarea id="description" name="description" maxlength="350"></textarea>
				<span id="innerchars"></span>
				<div class="form-param"><button class="continueComment" onclick="toggleModal()">Submit</button></div>
			</form>
		</div>
	</div>
	<%} %>
<!-- HEADER -->
	<div class="header" style="top: 0px;">
		<a href="HomePage.jsp" class="home_pic"><img src="home_icon.png"
			class="home_button"></a>

		<%
			if (session.getAttribute("user") != null) {
		%>
		<a href="" class="user_button"><img src="login.png"
			style="float: right; width: 50px; margin-right: 25px; margin-top: 15px;"></a>
		<a href="logout"><h4 class="signout"
				style="float: right; color: white; margin-right: 20px; font-size: 25px; margin-top: 25px;">Sign
				Out</h4></a>
		<%
			}
		%>

		<%
			if (session.getAttribute("user") == null) {
		%>
		<a href="RegisterPage.jsp" class="signout">Sign Up</a>
		<h4
			style="float: right; color: white; margin-left: 10px; margin-right: 10px; margin-top: 25px; font-size: 25px;">
			/</h4>
		<a href="LoginPage.jsp?from=classpage?<%= request.getQueryString() %>" class="signin">Sign In</a>
		<%
			}
		%>

		<form class="search_form" method="GET" action="SearchResults.jsp">
			<input name="searchField" class="search_bar" type="text"
				placeholder="Search for any class...">
		</form>
	</div>

	<!-- /HEADER -->
	<script>
		//GIOVANNI LU CODE BELOW
		var worker;
	    function testWorker() {
	        if (typeof(Worker) !== "undefined") {
	            if (typeof(worker) == "undefined") {
	                worker = new Worker("Worker.js");
	            }
	            worker.postMessage({currNumRev:<%=current.getNumOfRatings()%>,courseID:<%=current.getCourseID()%>});
	            worker.onmessage = function(event) {
	                alert(event.data);
	                worker.terminate();
	                window.location.reload();
	            };
	        } else {
	            alert("Web Workers are not supported in your browser");
	        }
	    }
	    function terminateWorker() { 
	        worker.terminate();
	        worker = undefined;
	    }
		//GIOVANNI LU CODE ABOVE
		
		//WILLIAM LIU CODE BELOW
		<%if (session.getAttribute("user") != null) { %>
		var class_d_slider = document.getElementById("class_difficulty");
		var class_u_slider = document.getElementById("class_usefulness");
		var class_w_slider = document.getElementById("class_workload");
		
		var class_d_value = document.getElementById("class_d_value");
		var class_u_value = document.getElementById("class_u_value");
		var class_w_value = document.getElementById("class_w_value");
		
		if(class_d_slider != null){
			class_d_value.innerHTML = class_d_slider.value;
			class_d_slider.oninput = function() {
				class_d_value.innerHTML = this.value;
			}
		}
		if(class_u_slider != null){
			class_u_value.innerHTML = class_u_slider.value; 
			class_u_slider.oninput = function() {
				class_u_value.innerHTML = this.value;
			}
		} 
		if(class_w_slider != null){
			class_w_value.innerHTML = class_w_slider.value; 
			class_w_slider.oninput = function() {
				class_w_value.innerHTML = this.value;
			}
		}
		
		class_d_slider.oninput = function() {
			class_d_value.innerHTML = this.value;
		}
		class_u_slider.oninput = function() {
			class_u_value.innerHTML = this.value;
		} 
		class_w_slider.oninput = function() {
			class_w_value.innerHTML = this.value;
		}
		
		//WILLIAM LIU CODE ABOVE
		var maxLength = 350;
		var text = document.getElementById("textarea");
		var wordCount = document.getElementById("chars");
		var innerTextArea = document.getElementById("description");
		var innerWordCount = document.getElementById("innerchars");

		
		text.addEventListener("keyup", function(){
			var characters = text.value.split("");
			wordCount.innerText = maxLength - characters.length + " characters";
		});
		
		innerTextArea.addEventListener("keyup", function(){
			var characters = text.value.split("");
			var innercharacters = innerTextArea.value.split("");
			innerWordCount.innerText = maxLength - innercharacters.length + " characters";
		});
		
		//function to check if any part of form is empty

		document.querySelector('#submitReview').addEventListener('submit',function(){
			var comment = document.getElementById("description").value;
			if(comment == ""){
				alert("Comment section must not be empty");
			}
			else{
				document.getElementById('form').submit();
				toggleModal();
			}
		});
		
		document.querySelector('.modal_close').addEventListener('click', toggleModal);
		//function to display pop up
		function toggleModal(){
			document.querySelector('.modal').classList.toggle('modal--hidden');		
			document.getElementById("description").value = document.getElementById('textarea').value;
			document.getElementById("innerchars").textContent = document.getElementById('chars').textContent;
		}		
		
		function textFill(){
			document.getElementById("textarea");
		}
		<%}%>
		function commentLoad(){
			table = document.getElementById("table");
		}
		
	</script>
</body>
</html>