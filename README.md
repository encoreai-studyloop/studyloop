Studygroup meeting website 

* language : jsp, java 1.8, html, css, javascript
* OS evironment : windows 10
* IDE : eclipse 2019-3
* Web Server : Apache Tomcat 9.0
* DB : oracle 11g xe

How to use
1. clone repository to your local computer 
2. import project on your Eclipse IDE
3. execute studyloop.sql inside WebContent folder (recommend using sqldeveloper from oracle)
4. start url : http://localhost:8080/studyloop/main.do


* edit studyloop/views/notice/webSocket.jsp 
- var ws = new WebSocket("ws://localhost:8080/studyloop/websocket/chat");
- localhost -> my IP address to activate websocket function
