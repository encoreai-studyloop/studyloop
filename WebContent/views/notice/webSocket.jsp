<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Web Socket</title>
      <script type="text/javascript" src="/studyloop/jquery-3.4.1.js"></script>
      <script>
      
         $(document).ready(

            function(){
            	var myId = $("#myId").val();
            	localStorage.setItem("myuserid", myId );
            	
               var msg = $("#display").html();
               if(!window.WebSocket){
                  msg += "지원하지 않는 브라우져<br>";
                  return;
               }
               //var ws = new WebSocket("ws://echo.websocket.org");
               var ws = new WebSocket("ws://192.168.103.55:8080/studyloop/websocket/chat");
               if(!ws){
                  msg += "서버 연결 실패<br>";
                  return;
               }else{
                  ws.onopen = function(){
                     msg += "서버 연결 성공<br>";                     
                  }
                  ws.onclose = function(){
                     msg = "서버 연결 종료<br>";
                  }
                  ws.onmessage = function(){
                	
                	 var message = event.data.split("@");
                	 if(message[0] == 'status'){
                		 if(localStorage.getItem("myuserid") == message[3]){
	                      	var currentDate = new Date();
							var rowItem = '<a href="mypage.do">';
							rowItem += '<div class="user-img">';
							rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
							rowItem += '<img src="${userDto.getPic()}" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span>';
							rowItem += '</div>';
							rowItem += '<div class="mail-contnet">';
							rowItem += '<h5> 스터디 상태 ['+message[2]+' ] 로 변경</h5>';
							rowItem += '<span class="mail-desc">'+currentDate.getHours()+"시 "+currentDate.getMinutes()+"분" +'</span> <span class="time">'+message[1] +'</span>';
							rowItem += '</div>';
							rowItem += '</a>';
						
							$('.message-center').append(rowItem);
							$('.drop-title').html('1 개의 알람이 있습니다.')
							$('.notify').html('<span class="heartbit"></span><span class="point"></span>')
							
	    	                 var messageItem = '<h4>스터디 상태가 변경되었습니다.</h4> <b>스터디 '+message[1]+'</b>가 [ '+message[2]+'] 되었습니다';
	    	                 $("#alerttopright").html(messageItem);
	    	                 $("#alerttopright").fadeToggle(350);
                		 }
                		 
                	 }
             
                	 else if(message[0] =='register'){
                		
                		if(localStorage.getItem("myuserid") == message[4]){
	                     	var currentDate = new Date();
							var rowItem = '<a href="mypage.do">';
							rowItem += '<div class="user-img">';
							rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
							rowItem += '<img src="${userDto.getPic()}" alt="user" class="img-circle"> <span class="profile-status offline pull-right"></span>';
							rowItem += '</div>';
							rowItem += '<div class="mail-contnet">';
							rowItem += '<h5>'+message[2]+'님의 스터디 신청 도착</h5>';
							rowItem += '<span class="mail-desc">'+currentDate.getHours()+"시 "+currentDate.getMinutes()+"분" +'</span>'+message[3]+'<span class="time"></span>';
							rowItem += '</div>';
							rowItem += '</a>';
						
							$('.message-center').append(rowItem);
							$('.drop-title').html('1 개의 알람이 있습니다.')
							$('.notify').html('<span class="heartbit"></span><span class="point"></span>')
							
			   	             var messageItem = '<h4>스터디 신청 알람이 도착했습니다!</h4> <b>'+message[2]+'</b> 님이 [ '+ message[3] +'] 에 신청하셨습니다';
		   	                 $("#alerttopright").html(messageItem);
		   	                 $("#alerttopright").fadeToggle(350);
                		}
                	 }
                	 else{
                		 alert("모임이건");
                	 }

                  }
               }
               
               $("input:button[value=전송]").on(
                  "click",
                  function(event){
                	  ws.send("msg");
                  }
               );    
               
               $("#studyregister").on(
                       "click",
                       function(event){
       					var userid = $("#userid").val();
    					var usernick =  $("#usernick").val();
    					var regstudytitle = $("#regstudytitle").val();
    					var studyuserid = $("#studyuserid").val();
                        ws.send("register@"+userid+"@"+usernick+"@"+regstudytitle+"@"+studyuserid);
                   
                    
                       }
                );                
               $(".studystatus").on(
                       "click",
                       function(event){
                    	  var title = $(this).children('.studytitle').val()
                    	  var targetid = $(this).children('.targetId').val()
                    	  var form = $(this).text();
                    	  console.log(title+" "+targetid + " "+ form)
                          ws.send("status@"+title+"@"+form+"@"+targetid);
                       }
                );             
            } 

           
         );

      </script>
   </head>
   <body>
 
   </body>
</html>