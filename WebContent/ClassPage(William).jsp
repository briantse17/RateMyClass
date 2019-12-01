<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="obj.DAO" %>
<%@ page import="obj.Comment" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClassPage</title>
<link rel="stylesheet" type="text/css" href="Header.css">
<style>
	body, html{
		margin: 0;
		padding: 0;
		height:100%;
	}
	.container{
		width:100%;
	}

	.classContent{
		width:100%;
		height:200px;
	}	
	
	.modal {
		position:absolute;
		top:0;
		height:100%;
		width: 100%;
		display:flex;
		justify-content:center;
		align-items:center;
		background-color:rgba(0,0,0,0.8)
	}
	
	.modal--hidden{
		display:none;
	}
	
	.modal_content{
		padding:2rem 4rem;
		background-color:white;
	}
	
	input{
		width:100%;
		height:20px;
		margin-bottom:20px;
	}
	
	.continueComment{
		width:100%;
		padding: .5rem;
		border:none;
		background-color:lightgray;
		color: #fff;
		transition: all .3s ease;
		cursor: pointer;
	}

	
	.continueComment:hover{
		background-color: gray;
	}
		
	#show-modal{
		width:100%;
		padding: .5rem;
		border:none;
		background-color:lightgray;
		color: #fff;
		transition: all .3s ease;
		cursor: pointer;
	}
	#show-modal:hover{
		background-color: gray;
	}
	.modal_close{
		float:right;		
		margin-right:-2rem;
		margin-top:-1rem;
		cursor:pointer;
	}
	
	.submitForm{
		width: 140px;	
	}
	.wordcount{
		float: right;
	}
	textarea{
		display:block;
		margin:1em 0;
		width:100%;
		height:40px;
	} 
	.input{
		width:50%;
		margin: 0 auto;
	}	

	.value{
		font-size: 30px;
		height: 0px;
		color: red;
		position: relative;
		left: 90%;
		background-color: blue;
		width: 30px;
		margin-left: 20px;
	}
	.slider{
		width: 90%;
	}
	.comment{
		padding-top: 200px;
		background-color: gray;
		width: 50%;
		margin: 0 auto;
		text-align: center;
	}
	
	.like_button{
		display: inline-block;
	}
	.like_button:hover{
		cursor: pointer;
		
	}
	.dislike_button{
		display: inline-block;
	}
	.dislike_button:hover{
		cursor: pointer;
	}
	.likenum{
		padding-bottom: 40px;
		font-size: 20px;
	}
	.button-wrap{
		text-align: left;
		
	}
	.text-container{
		text-align: left;
	}
	.like_selected{
		content: url("thumbs_up_clicked.png");
	}
	.dislike_selected{
		content: url("thumbs_up_clicked.png");
	}
	.like_selected:hover{
		content: url("thumbs_up.png");
	}
	.dislike_selected:hover{
		content: url("thumbs_down.png");
	}
	.like:hover{
		content: url("thumbs_up_clicked.png");
	}
	.dislike:hover{
		content: url("thumbs_down_clicked.png");
	}
	
		

</style>
<script>
	// AJAX CALL FOR LIKE/DISLIKE
	// Needs like value of +1 or -1, commentID, and userID
	
	// JUSTIN'S CODE
	function sendLike(likeValue, userID, commentID) {
		var currLikesSelector = $("#" + commentID + " .likenum");
		let button = likeValue == 1? " .like" : " .dislike";
		var clickedButton = $("#" + commentID + button);
		$.ajax({
			url: "like?likeValue=" + likeValue + "&user=" + userID + "&comment=" + commentID + "&totalLikes=" + currLikesSelector.html(),
			method: "GET",
			success: function(res, status, xhr) {
				if (clickedButton.hasClass("selected")){
					clickedButton.removeClass("selected");
				}
				else {
					$("#" + commentID + " button").removeClass("selected");
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
</head>
<body>
	<!-- HEADER -->
	<div class="header">
		<a href="HomePage.jsp" class="home_pic"><img src="home_icon.png" class="home_button"></a>
		
		<% if(session.getAttribute("user") != null){%>
		<a href="" class="user_button"><img src="login.png" style="float: right; width: 50px;
			margin-right: 25px; margin-top: 15px;"></a>
		<a href="UserLogOutServlet"><h1 class="signout" style="float: right; color: white; margin-right:20px; font-size: 25px; margin-top: 25px;">Sign Out</h1></a>
		<%}%>
		
		<% if(session.getAttribute("user") == null){%>
		<a href="RegisterPage.jsp" class="signout">Sign Up</a>
		<h1 style="float: right; color: white; margin-left: 10px; margin-right: 10px; margin-top: 25px; font-size: 25px; "> / </h1>
		<a href="LoginPage.jsp" class="signin">Sign In</a>
		<%}%>
	
		<form class="search_form" onsubmit="" method="GET" action="">
			<input class="search_bar" type="text" placeholder="Search for any class...">
		</form>
	</div>
	<!-- /HEADER -->
	
	
	
	
	<!-- COMMENTS -->
	<%@ page import="obj.Comment" %>
	<%@ page import="java.util.List" %>
	<%@ page import="obj.Course" %>	
	<% Course current = (Course) request.getAttribute("Course"); %>
	<% List<Comment> comments = current.getComments();  %>
	
	${Course.courseName}
	${Course.intCourseID}
	${Course.courseDesc}
	<% for (int i = 0; i < comments.size(); i++) {
		Comment curr = comments.get(i);%>
			<!-- COMMENTS -->
		<div class="comment" id=<%=curr.getCommentID() %>>
			<div class="text-container">
				<span><%= curr.getUserName() %></span>
				<br></br>
				<span><%= curr.getCommentDate() %></span>
				<br></br>
				<span><%= curr.getCommentBody() %></span>
				<br></br>
			</div>
			
			<div class="button-wrap">
				<button class="like_button" type="submit" style="border: 0; background: transparent" onclick="sendLike(1, 1, <%=curr.getCommentID() %>)">
	   				<img src="thumbs_up.png" width="20px" height="20px" alt="submit" class="like<%= curr.getUserLikeValue() == 1? "_selected" : ""%>"/>
				</button>
				<span class="likenum"><%= curr.getTotalLikes() %></span>
				<button class="dislike_button"type="submit" style="border: 0; background: transparent" onclick="sendLike(-1, 1, <%=curr.getCommentID() %>)">
	   				<img src="thumbs_down.png" width="20px" height="20px" alt="submit" class="dislike<%= curr.getUserLikeValue() == -1? "_selected" : ""%>"/>
				</button>
			</div>
		</div>
	<% } %>
	
	<!-- USER COMMENT BOX -->
	<div class = "responses">
		<table id="table" border="1" >
			<div class = "newComment">
				<div class = "input">
					<div class = "text_area">
						<textarea id = "textarea" maxlength = "350" placeholder = "Please add your comment here" style="resize: none"></textarea>
					</div>
					<div class = "submitForm">
						<button id = "show-modal" onclick = "toggleModal()">Continue Your Review</button>
					</div>
					<div class = "wordcount">
						<span id="chars" >350 characters</span>
					</div>
				</div>
			</div>
		</table>
	</div>
	<div class = "modal modal--hidden">
		<div class = "modal_content"  style="width: 40%;">
			<div class = "modal_close">
				<span>X</span>
			</div>
			<form id = "submitReview">
				<label class="slider_title" for="difficulty">Class Difficulty</label>
				<input class="slider" type="range" name="difficulty" min="1" max="5" value="3" id="class_difficulty">
				<p style="bottom: 78px;" class="value" id="class_d_value"></p>
				
				<label class="slider_title" for= "usefulness" style="position: relative; bottom: 40px;">Class Usefulness</label>
				<input class="slider" type="range" name="usefulness" min="1" max="5" value="3" id="class_usefulness" style="position: relative; bottom: 40px;">
				<p style="bottom: 120px;" class="value" id="class_u_value"></p>
				
				
				<label for = "grade" style="position: relative; bottom: 80px;">Grade Received</label>
				<select id = "grade" name = "grade" form = "submitReview" style="position: relative; bottom: 80px;">
					<option value = "4.00">A</option>
					<option value = "3.66">A-</option>
					<option value = "3.33">B+</option>
					<option value = "3.00">B</option>
					<option value = "2.66">B-</option>
					<option value = "2.33">C+</option>
					<option value = "2.00">C</option>
					<option value = "1.66">C-</option>
					<option value = "1.33">D+</option>
					<option value = "1.00">D</option>
					<option value = "0.66">D-</option>						
					<option value = "0.00">F</option>
				</select> <br>
				<label style="position: relative; bottom: 30px;" for = "description">Comment</label>
				<textarea style="position: relative; bottom: 40px;" id = "description" name = "description" maxlength = "350" style="resize: none"></textarea>
				<span style="position: relative; bottom: 50px;" id="innerchars"></span>
				<button class = "continueComment">Submit</button>
			</form>
		</div>
	</div>
	<!-- /USER COMMENT BOX -->
	
	<script>
		//WILLIAM LIU CODE BELOW
		var class_d_slider = document.getElementById("class_difficulty");
		var class_u_slider = document.getElementById("class_usefulness");
		
		var class_d_value = document.getElementById("class_d_value");
		var class_u_value = document.getElementById("class_u_value");
		
		class_d_value.innerHTML = class_d_slider.value;
		class_u_value.innerHTML = class_u_slider.value; 
		
		class_d_slider.oninput = function() {
			class_d_value.innerHTML = this.value;
		}
		class_u_slider.oninput = function() {
			class_u_value.innerHTML = this.value;
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
				alert("here");
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
		
		function commentLoad(){
			table = document.getElementById("table");
		}
		
	</script>
</body>
</html>