<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- Animation CSS -->
    <link href="../../studyloop/default/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../studyloop/default/css/style.css" rel="stylesheet">
    <!-- color CSS you can use different color css from css/colors folder -->
    <!-- We have chosen the skin-blue (blue.css) for this starter
          page. However, you can choose any other skin from folder css / colors .
-->
    <link href="../../studyloop/default/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Page Content -->
                <!-- .row -->
                <!-- .chat-row -->
                <div class="chat-main-box">
                    <!-- .chat-left-panel -->
                    <div class="chat-left-aside">
                        <div class="open-panel"><i class="ti-angle-right"></i></div>
                        <div class="chat-left-inner">
                            <div class="form-material">
                                <input class="form-control p-20" type="text" placeholder="Search Contact"> </div>
                            <ul class="chatonline style-none">
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/varun.jpg" alt="user-img" class="img-circle"> <span>Varun Dhavan <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)" class="active"><img src="../plugins/images/users/genu.jpg" alt="user-img" class="img-circle"> <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/ritesh.jpg" alt="user-img" class="img-circle"> <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/arijit.jpg" alt="user-img" class="img-circle"> <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/govinda.jpg" alt="user-img" class="img-circle"> <span>Govinda Star <small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/hritik.jpg" alt="user-img" class="img-circle"> <span>John Abraham<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/john.jpg" alt="user-img" class="img-circle"> <span>Hritik Roshan<small class="text-success">online</small></span></a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)"><img src="../plugins/images/users/pawandeep.jpg" alt="user-img" class="img-circle"> <span>Pwandeep rajan <small class="text-success">online</small></span></a>
                                </li>
                                <li class="p-20"></li>
                            </ul>
                        </div>
                    </div>
                    <!-- .chat-left-panel -->
                    <!-- .chat-right-panel -->
                    <div class="chat-right-aside">
                        <div class="chat-main-header">
                            <div class="p-20 b-b">
                                <h3 class="box-title">Chat Message</h3> </div>
                        </div>
                        <div class="chat-box">
                            <ul class="chat-list slimscroll p-t-30" id="chatbox" style="overflow-y: auto">                
                            </ul>
                            <div class="row send-chat-box">
                                <div class="col-sm-12">
                                    <textarea class="form-control" placeholder="Type your message" id="msg"></textarea>
                                    <div class="custom-send"><a href="javacript:void(0)" class="cst-icon" data-toggle="tooltip" title="Insert Emojis"><i class="ti-face-smile"></i></a> <a href="javacript:void(0)" class="cst-icon" data-toggle="tooltip" title="File Attachment"><i class="fa fa-paperclip"></i></a>
                                        <button class="btn btn-danger btn-rounded" type="button" onclick="sendMessage();">Send</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- .chat-right-panel -->
                </div>
            </div>
    
        <!-- /#page-wrapper -->
    
    <!-- /#wrapper -->
    <script>
   	function sendMessage(){    
   		var comment = $("#msg").val();
	    var today = new Date();
		var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        my = '<li>'+
    	'<div class="chat-image"> <img alt="male" src="../../default/plugins/images/users/ritesh.jpg"> </div>'+
    	'<div class="chat-body">'+
        '<div class="chat-text">'+
        '<h4>나</h4>'+
        '<p>'+comment+ '</p> <b>'+time+'</b> </div>'+
 		'</div>'+
		'</li>'
		
        $("#chatbox").append(my);
        $(this).val("");

   		var data = {
   		    	'queryInput':
		    		{'text':
		    			{'text':comment,'languageCode':'ko'}
		    		},
		    	'queryParams':
		    		{'timeZone':'Asia/Seoul'}
		    }
   		$.ajax({
   		    contentType: 'application/json;charset=utf-8',
   		    type: 'POST',
   		    dataType: 'json',
   		    url: "https://dialogflow.googleapis.com/v2/projects/newagent-vytmwu/agent/sessions/6fffdbe7-256d-9484-9764-058e0303a570:detectIntent",
   		    data: JSON.stringify(data),
   		  	headers: {
   		    	"Authorization": "Bearer " + "ya29.c.ElqGBzwYm-kcT41aaR7YglWz8VAf7cIRGHptvFmjJcGCJ6LozqITqX4clnExy2yv0RpR7WAI2PIA5jas8_sSg4MRdekoBlldC31_or0fwNle8I2QSPMjPKfZaIM"
   		  	},
   		    error: function (data) {
   		        console.log(data);
   		    },
   		    success: function (data) {   		      
   		        chatbot = '<li class="odd">'+
	            	'<div class="chat-image"> <img alt="male" src="images/bot.png"> </div>'+
	            	'<div class="chat-body">'+
	                '<div class="chat-text">'+
	                '<h4>ChatBot</h4>'+
	                '<p>'+data.queryResult.fulfillmentText+ '</p> <b>'+time+'</b> </div>'+
	         		'</div>'+
        		'</li>'	  
   		     	$( '#chatbox' ).append(chatbot)
   		    	$( '#chatbox' ).animate({scrollTop: $( '#chatbox' ).prop("scrollHeight")}, 500);
   		    }
   		});
   	}
    </script>

    <!-- jQuery -->
    <script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
    <script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../../studyloop/default/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../../studyloop/default/js/custom.min.js"></script>
    <script src="../../studyloop/default/js/chat.js"></script>
    <!--Style Switcher -->
    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <script>
    $(document).ready(
    	    $(function() {
    	        $("#msg").keypress(function (e) {
    	            if(e.which == 13 && !e.shiftKey) {
    	                //submit form via ajax, this is not JS but server side scripting so not showing here
    	                var today = new Date();
   		  				var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();  		  				
   		  				var comment = $("#msg").val();    
   		  				
	    	            my = '<li>'+
	                	'<div class="chat-image"> <img alt="male" src="../../studyloop/default/plugins/images/users/ritesh.jpg"> </div>'+
	                	'<div class="chat-body">'+
	                    '<div class="chat-text">'+
	                    '<h4>나</h4>'+
	                    '<p>'+comment+ '</p> <b>'+time+'</b> </div>'+
	             		'</div>'+
	            		'</li>'
    	                $("#chatbox").append(my);
    	                $(this).val("");
    	                e.preventDefault();
    	                    	                   
    	           		var data = {
    	           		    	'queryInput':
    	        		    		{'text':
    	        		    			{'text':comment,'languageCode':'ko'}
    	        		    		},
    	        		    	'queryParams':
    	        		    		{'timeZone':'Asia/Seoul'}
    	        		    }
    	           		$.ajax({
    	           		    contentType: 'application/json;charset=utf-8',
    	           		    type: 'POST',
    	           		    dataType: 'json',
    	           		    url: "https://dialogflow.googleapis.com/v2/projects/newagent-vytmwu/agent/sessions/6fffdbe7-256d-9484-9764-058e0303a570:detectIntent",
    	           		    data: JSON.stringify(data),
    	           		  	headers: {
    	           		    	"Authorization": "Bearer "+"ya29.c.ElqHBzBV4gsVacOUCEaVdXnwyK5FDRl2_b2nhXEaC4aS0_kuVSjOGg9Xy9qVjsRmx67llRn2nH7zagyABFwDE00AijAuYbjnM9NUEf_8QBbQel2wDQiqhLC3pNw"

    	           		  	},
    	           		    error: function (data) {
    	           		        console.log(data);
    	           		    },
    	           		    success: function (data) {   		      
    	           		     	var today = new Date();
    	           		  		var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    	           		        chatbot = '<li class="odd">'+
    	        	            	'<div class="chat-image"> <img alt="male" src="images/bot.png"> </div>'+
    	        	            	'<div class="chat-body">'+
    	        	                '<div class="chat-text">'+
    	        	                '<h4>ChatBot</h4>'+
    	        	                '<p>'+data.queryResult.fulfillmentText+ '</p> <b>'+time+'</b> </div>'+
    	        	         		'</div>'+
    	                		'</li>'	  
    	           		     	$( '#chatbox' ).append(chatbot)
    	           		     	$( '#chatbox' ).animate({scrollTop: $( '#chatbox' ).prop("scrollHeight")}, 500);
    	           		    }
    	           		});	                
    	            }
    	        });
    	    }));
    </script>
</body>

</html>
