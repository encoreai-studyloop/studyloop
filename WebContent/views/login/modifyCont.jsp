<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../../studyloop/default/plugins/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="../../studyloop/default/css/animate.css" rel="stylesheet">
    <!-- Wizard CSS -->
    <link href="../../studyloop/default/plugins/bower_components/register-steps/steps.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../studyloop/default/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="../../studyloop/default/css/colors/default.css" id="theme" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <script>
    (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-19175540-9', 'auto');
    ga('send', 'pageview');
    </script>
</head>

<body>
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>

    <section id="wrapper" class="step-register">
      	<!-- multistep form -->
		<form id="msform" name="submitform" method="post" action="inputPro.do">
        <div class="register-box">
            <div class="">
<a href="javascript:void(0)" onclick="location='main.do'" class="text-center db m-b-40"><img src="../../studyloop/views/search/images/logo.png" alt="Home" style="width:50%; height: 50%" /></a>

                    <!-- progressbar -->
                    <ul id="eliteregister">
                        <li class="active">계정을 인증하세요</li>
                        <li>기본 정보를 수정하세요</li>
                        <li>상세 정보를 수정하세요</li>
                    </ul>
                    <!-- fieldsets -->
                    <fieldset>
                        <h2 class="fs-title">${email} <br> 위 이메일로 전송된 인증번호 5자리를 입력해주세요</h2>
                        <input type="hidden" name="email" value="${email}"/>
                        <input type="text" id="vernum" name="verifynum" placeholder="인증번호 입력" />
                        <input type="button" id="verbutton" name="ver" class="action-button" value="인증" onclick="checkauthnum(${randnum})" />
                        <input type="button" id="verfinish" name="next" class="next action-button" value="다음"/>
                    </fieldset>
                    <fieldset>                   	
                        <h2 class="fs-title">기본 정보</h2>
                   <div class="form-group">
                         <div class="input-group">
                         <div class="col-lg-8">
                        <input type="text" name="name" placeholder="이름" value="${userDto.getName()}"/>
                        </div>                         
                                    <span style="padding-left: 60px" >
                                        <select class="custom-select col-8" id="inlineFormCustomSelect" name="gender">                                   
                                            <option selected>성별</option>
                                            <option value="남">남</option>
                                            <option value="여">여</option>
                                        </select>
                                        </span>
                                        </div>
             
                       </div>
                        <div class="form-group">
                              <div class="input-group">
                                   <input type="text" name="nick" class="form-control" placeholder="닉네임" value="${userDto.getNick()}">
                          			<div id="nickres">닉네임을 입력하세요</div>
                         </div>
                         </div>   
  						<div class="form-group">
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <input type="password" data-toggle="validator" data-minlength="6" class="form-control" id="inputPassword2" placeholder="Password" name="passwd" required value="${userDto.getPasswd()}">
                                            <div id="psres">비밀번호를 입력하세요</div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <input type="password" class="form-control" id="inputPasswordConfirm2" data-match="#inputPassword" data-match-error="Whoops, these don't match" name="repasswd" placeholder="Confirm" required>
                                             <div id="repsres"></div>
                                        </div>
                                    </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-12">사진 업로드</label>
                            <div class="col-sm-12">
                                <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                                    <div class="form-control" data-trigger="fileinput">
                                        <i class="glyphicon glyphicon-file fileinput-exists"></i>
                                        <span class="fileinput-filename"></span>
                                    </div>
                                    <span class="input-group-addon btn btn-default btn-file"> 
                						<span class="fileinput-new">Select file</span>
                                    <span class="fileinput-exists">Change</span>
                                    <input type="file" name="pic">
                                    </span>
                                    <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a> </div>
                            </div>
                        </div>
                        <input type="button" name="next" class="next action-button" value="다음" />                    
                    </fieldset>
                    <fieldset>
                    	<div class="input-group"> 
                    	<input type="text" name="birth" class="form-control" id="datepicker-autoclose" placeholder="생년월일" value="<fmt:formatDate value="${userDto.getBirth()}" pattern="MM/dd/yyyy"/>"><span class="input-group-addon"><i class="icon-calender"></i></span>
                        </div>
                        <input type="text" name="phone" placeholder="휴대폰 번호" value="${userDto.getPhone()}"/>
                        <input type="button" name="findadd" class="action-button" value="주소찾기" onclick="execDaumPostcode()"/>
                        <input type="text" id="zip" name="zipcode" placeholder="우편번호" value="${userDto.getZipcode()}"/>
                        <input type="text" id="add" name="address" placeholder="주소" value="${address}"/>
                        <input type="text" id="sadd" name="saddress" placeholder="상세 주소" value="${saddress}"/>
                        <input type="button" name="previous" class="previous action-button" value="이전" />
                        <input type="button" name="submit" class="submit action-button" value="수정" onclick="submitUser()" />
                    </fieldset>
                <div class="clear"></div>
            </div>
        </div>  
          </form>
    </section>
    <!-- User -->
    <script src="views/login/js/login.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="/studyloop/jquery-3.4.1.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
    <script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/register-steps/jquery.easing.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/register-steps/register-init.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="../../studyloop/default/js/jasny-bootstrap.js"></script>
    <script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../../studyloop/default/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../../studyloop/default/js/custom.min.js"></script>
    <!--Style Switcher -->
    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
	<script src="../../studyloop/default/js/validator.js"></script>
	<script>
    // Date Picker
    jQuery('.mydatepicker, #datepicker').datepicker();
    jQuery('#datepicker-autoclose').datepicker({
        autoclose: true,
        todayHighlight: true
    });
    jQuery('#date-range').datepicker({
        toggleActive: true
    });
    jQuery('#datepicker-inline').datepicker({
        todayHighlight: true
    });
    </script>
    <script>
    $(document).ready(function() {
        $(document).on("submit", "#selectbox_validate", function() {
            if ($("div#maindiv").hasClass("has-error")) {
                $(this).find(".bootstrap-select")
                    .after("<h6 class='has-error' style='color:red;'>please select any value from options.</h6>");
            }
        });
        $("#select").on("changed.bs.select", function(e) {
            if (!$("div#maindiv").hasClass("has-error")) {
                $("#selectbox_validate").find("h6.has-error").hide();
            }
        });
    });
    
	$(document).ready(
	        function(){
	        	$("body").on(
	        	        "keyup", "input[name=nick]", function(event){
	        	            $.ajax(
	        	                    {
	        	                        type:"POST",
	        	                        url:"views/login/idCheck.jsp",
	        	                        data : {
	        	                            nick : submitform.nick.value   	  
	        	                        },
	        	                        dataType:"xml",
	        	                        success:function(data){
	        	                            var res = eval("(" + $(data).find("result").text() + ")")
	        	                            if(res.result =="success"){
	        	                                $("#nickres").text(res.message).css( "color", "blue" )
	        	                    
	        	                            }
	        	                            else{
	        	                            	$("#nickres").text(res.message).css( "color", "red" )
	        	                            }
	        	                        },
	        	                   		error:function(e){  
	        	                   			$("#nickres").text(e)
	        	                   		} 
	        	                    }
	        	                    )
	        	        }) 
	        	  $("input[name=passwd]").on(
	        	          "keyup", function(event){
	        	              $("#psres").text("특수문자 영문자를 조합하세요")
	        	         
	        	          })
	             $("input[name=repasswd]").on(
	        	          "keyup", function(event){
	        	              if($("input[name=passwd]").val() == $("input[name=repasswd]").val()){
	        	                  $("#repsres").text("비밀번호가 일치합니다.").css( "color", "blue" );
	        	              }
	        	              else{
	        	                  $("#repsres").text("비밀번호를 다시 확인하세요").css( "color", "red" );
	        	              }
	        	         
	        	          })
    
	        })
	        
	      
    </script>
</body>

</html>
