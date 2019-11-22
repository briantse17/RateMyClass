<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClassPage</title>
<style>
	body, html{
		margin: 0;
		padding: 0;
		height:100%;
	}
	.container{
		width:100%;
	}
	.header{
		width:100%;
		height:180px;
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
	
	button{
		width:100%;
		padding: .5rem;
		border:none;
		background-color:lightgray;
		color: #fff;
		transition: all .3s ease;
		cursor: pointer;
	}
	
	button:hover{
		background-color: gray;
	}
	
	.modal_close{
		float:right;		
		margin-right:-2rem;
		margin-top:-1rem;
		cursor:pointer;
	}
	
	.submitForm{
		float: right;	
	}
	.wordcount{
		float: left;
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

</style>
<script>
	// AJAX CALL FOR LIKE/DISLIKE
	// Needs like value of +1 or -1, commentID, and userID
	function sendLike(likeValue, userID, commentID) {
		$.ajax({
			url: "like?likeValue=" + likeValue + "&user=" + userID + "&comment=" + commentID,
			method: "GET",
			success: function() {
				// CSS CHANGE, increment like counter
			},
			error: function(data, err, res) {
				$("#error").html(data.responseText);
			}
		})
	}
</script>
</head>
<body>
	<%@ page import="obj.Comment" %>
	<%@ page import="java.util.List" %>
	<%@ page import="obj.Course" %>

	<div class = "container">
		<div class = "header"></div>
		<div class = "classContent">
		<% Course current = (Course) request.getAttribute("Course"); %>
		<% List<Comment> comments = current.getComments(); %>
		<%= current.getCourseName() %>
		<%= current.getCurrUser() %>
		<% for (int i = 0; i < comments.size(); i++) { %>
			<div class="comment">
				<span><%= comments.get(i).getUserName() %></span>
				<span><%= comments.get(i).getCommentDate() %></span>
				<span><%= comments.get(i).getCommentBody() %></span>
				<span><%= comments.get(i).getTotalLikes() %></span>
			</div>
		<% } %>
		</div>
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
				<form id = "submitReview" action = "CommentServlet">
					<input type="hidden" id="custId" name="userID" value=12 <%-- "${user.getID}" --%>>
					<input type="hidden" id="custId" name="courseID" value=13>
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
	</div>

	
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