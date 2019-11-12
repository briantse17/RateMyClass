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
	
	.input{
		background-color:yellow;
		width:70%;
		
	}

	textarea{
		display:block;
		margin:1em 0;
		width:70%;
		height:40px;
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
		float:right;		
	}
	
</style>
</head>
<body>
	<div class = "container">
		<div class = "header">
		</div>
		<div class = "classContent">
			
		</div>
		<div class = "responses">
			<table id="table" border="1" >
		<%-- 	<%if(JDBC.getUserComment() == null && session.getAttribute("user") != null){%>
	 --%>		
					<div class = "newComment">
						<div class = "input">
							<div class = "text_area">
								<textarea id = "textarea" maxlength = "350" placeholder = "Please add your comment here"></textarea>
							</div>
							<div class = "submitForm">
								<button id = "show-modal" onclick = "toggleModal()">Continue Your Review</button>
							</div>
							<div class = "wordcount">
								<span id="chars" >350 characters remaining</span>
							</div>
						</div>
					</div>
			<%-- <%}%> --%>
			</table>
		</div>
		<div class = "modal modal--hidden">
			<div class = "modal_content">
				<div class = "modal_close">
					<span>X</span>
				</div>
				<form id = "submitReview">
					<label for="difficulty">Class Difficulty</label>
					<input type="range" id="difficulty" name="difficulty" min="1" max="5">
					<label for= "usefulness">Class Usefulness</label>
					<input type="range" id="usefulness" name="usefulness" min="1" max="5">
					<label for = "grade">Grade Received</label>
					<select id = "grade" name = "grade" form = "submitReview">
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
					<label for = "description">Comment</label>
					<textarea id = "description" name = "description" maxlength = "350"></textarea>
					<span id="innerchars"></span>
					<button class = "continueComment">Submit</button>
				</form>
			</div>
		</div>
	</div>

	
	<script>
		var maxLength = 350;
		var text = document.getElementById("textarea");
		var wordCount = document.getElementById("chars");
		var innerTextArea = document.getElementById("description");
		var innerWordCount = document.getElementById("innerchars");

		
		text.addEventListener("keyup", function(){
			var characters = text.value.split("");
			wordCount.innerText = maxLength - characters.length + " characters remaining";
		});
		
		innerTextArea.addEventListener("keyup", function(){
			var characters = text.value.split("");
			var innercharacters = innerTextArea.value.split("");
			innerWordCount.innerText = maxLength - innercharacters.length + " characters remaining";
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
			<%-- <%
			ResultSet rs = JDBC.getComments();
			while(rs.next()){
			%>
				var comment = '<%=(String)rs.getString("Body")%>';
				var newRow = table.insertRow(table.length);
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "CommentLoad?", false);
				xhttp.send();
				var text = xhttp.responseText;
				for(var j = 0; j < 2; j++){
					var cell = newRow.insertCell(j);
					if(j == 0){
						var myImage = new Image(200,300);
						myImage.src = data.volumeInfo.imageLinks.thumbnail;
						myImage.addEventListener("click", details);
						myImage.id = url;
						cell.appendChild(myImage);
					}
					else{
						var h1 = document.createElement("H1");
						h1.append(data.volumeInfo.title);
						console.log(h1);
						var h3 = document.createElement("H3");
						h3.append(data.volumeInfo.authors[0]);
						var bold = document.createElement("B");
						bold.append("Summary: ");
						var p = document.createElement("P");	
						p.append(bold);
						if(data.volumeInfo.description == null){
							p.append("No summary available at this time.");
						}
						else{
							p.append(data.volumeInfo.description);
						}
						var button = document.createElement("button");
						button.id = url;
						button.onclick= function(){addremove('<%=(String)rs.getString("bookURL")%>')};
						button.innerHTML =  "<img src='star.png' width= '10px'> Remove";
						cell.appendChild(h1);
						cell.appendChild(h3);
						cell.appendChild(p);
						cell.append(button);

					}
				}
			<%}%> --%>
		}
		
	</script>
</body>
</html>