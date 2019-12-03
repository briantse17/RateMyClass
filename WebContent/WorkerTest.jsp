<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Web Workers Example</title>

    <style type="text/css">
    body {padding-top:28px;}
    .output-cont {margin-left:12%; margin-top:28px;}

    .output-cont h3 {width:200px; height:100%;}
    .output-cont button {padding:4px 8px; font-size:1.1rem; font-family:sans-serif;  }


    </style>
</head>

<body>

<div class="output-cont"><button onclick="testWorker()">start worker</button><h3 id="workerOutput"></h3><button onclick="terminateWorker()">terminate worker</button></div>
<br/>
<div class="output-cont"><button onclick="testMainThread()">start blocking thread</button><h3 id="mainThreadOutput"></h3></div>
<br/>
<div class="output-cont"><button onclick="alert('browser responsive!')">test browser responsiveness</button></div>


  <script>

    var worker;

    function testWorker() {
        if (typeof(Worker) !== "undefined") {
            if (typeof(worker) == "undefined") {
                worker = new Worker("Worker.js");
            }
            worker.postMessage({currNumRev:1,courseID:3});
            worker.onmessage = function(event) {
                document.getElementById("workerOutput").innerHTML = event.data;
            };
        } else {
            document.getElementById("workerOutput").innerHTML = "Web Workers are not supported in your browser";
        }
    }
    function terminateWorker() { 
        worker.terminate();
        worker = undefined;
    }



    function testMainThread() {
        for (var i = 0; i < 200000; i++) { 
            document.getElementById("mainThreadOutput").innerHTML = "Main Thread Counter: " + i;

        }
    }

    

  </script>

</body>

</html>