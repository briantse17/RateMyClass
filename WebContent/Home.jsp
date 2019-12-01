<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="HomePage.css">
<link rel='stylesheet' href = 'test.css'>
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
	            		$("<li>").text(item).appendTo($ul);
	            	});
	            });
	        });
            $(document).on("click", "#cBUAD", function() {
            	$('#BUAD').empty();
            	$.get("Courses?id=BUAD", function(responseJson) {
            		var $ul = $("<ul>").appendTo($("#BUAD"));
            		$.each(responseJson, function(index, item) {
            			$("<li>").text(item).appendTo($ul);
            		});
            	});
            });
            $(document).on("click", "#cCSCI", function() {
            	$('#CSCI').empty();
                $.get("Courses?id=CSCI", function(responseJson) {
                	var $ul = $("<ul>").appendTo($("#CSCI"));
                	$.each(responseJson, function(index, item) {
                		$("<li>").text(item).appendTo($ul);
                	});
                });
            });
        </script>
</head>
<body>
	<div id="body">

					<div class="tab">
					  <button class="tabs" onclick="section(event, 'ACCT')" id="cACCT">ACCT</button>
					  <button class="tabs" onclick="section(event, 'BUAD')" id="cBUAD">BUAD</button>
					  <button class="tabs" onclick="section(event, 'CSCI')" id="cCSCI">CSCI</button>
					</div>

					<div id="ACCT" class="sectionContent">
					  <h3>ACCT</h3>
					  <p>ACCT101</p>
					</div>
					
					<div id="BUAD" class="sectionContent">
					  <h3>BUAD</h3>
					  <p>BUAD101</p>
					</div>
					
					<div id="CSCI" class="sectionContent">
					  <h3>CSCI</h3>
					  <p>CSCI101</p>
					</div>
	</div>
</body>
<script>document.getElementById("cACCT").click();</script>
</html>