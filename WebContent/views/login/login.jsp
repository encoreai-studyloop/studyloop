<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String fail = "0";
	if(request.getParameter("fail") !=null && !request.getParameter("fail").isEmpty()){
		fail = "1";
	}
%>
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
    <!-- Custom CSS -->
    <link href="../../studyloop/default/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="../../studyloop/default/css/colors/blue.css" id="theme" rel="stylesheet">
    <link href="views/login/css/main.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body style="background-image: url('main.jpg')">
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <section id="wrapper" class="login-register">
        <div class="login-box">
            <div class="white-box">
                <form class="form-horizontal form-material" id="loginform" action="javascript:login()" method="post" name="loginform">
                	<%
                	if(fail.equals("1")){
                	%>
                		<h3 class="box-title m-b-20" style="color: red">아이디와 비밀번호를 다시 한번 확인하세요.</h3>
                	<%
                	}
                	else{
                	%>
                		<h3 class="box-title m-b-20">로그인 하세요</h3>
                	<%         		
                	}
                	%>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" placeholder="Password" name="passwd">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-primary pull-left p-t-0">
                                <input id="checkbox-signup" type="checkbox">
                                <label for="checkbox-signup"> 로그인 정보 기억 </label>
                            </div>
                            <a href="javascript:void(0)" id="to-recover" class="text-dark pull-right"><i class="fa fa-lock m-r-5"></i> 비밀번호 복구 </a> </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">로그인</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">    
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            <p>계정이 없으신가요? <a href="register.do" class="text-primary m-l-5"><b>회원가입</b></a></p>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" id="recoverform" action="index.html">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>비밀번호 찾기</h3>
                            <p class="text-muted">가입시 사용한 이메일을 입력하세요 </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-primary btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
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
    <!--Style Switcher -->
    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <script>
    	function login(){
    		var latitude = localStorage.getItem("lat");
    		var longtitude = localStorage.getItem("long");
    		
    		var f = document.loginform; //폼 name
    		var form = document.createElement("form");
    	    form.setAttribute("charset", "UTF-8");
    	    form.setAttribute("method", "Post");  //Post 방식
    	    form.setAttribute("action", "loginPro.do"); //요청 보낼 주소
    	    
    	    var hiddenField = document.createElement("input");
    	    hiddenField.setAttribute("type", "hidden");
    	    hiddenField.setAttribute("name", "email");
    	    hiddenField.setAttribute("value", f.email.value);
    	    form.appendChild(hiddenField);
    	    
    	    hiddenField = document.createElement("input");
    	    hiddenField.setAttribute("type", "hidden");
    	    hiddenField.setAttribute("name", "passwd");
    	    hiddenField.setAttribute("value", f.passwd.value);
    	    form.appendChild(hiddenField);
    	    
    	    hiddenField = document.createElement("input");
    	    hiddenField.setAttribute("type", "hidden");
    	    hiddenField.setAttribute("name", "lat");
    	    hiddenField.setAttribute("value", latitude);
    	    form.appendChild(hiddenField);
    	    
    	    hiddenField = document.createElement("input");
    	    hiddenField.setAttribute("type", "hidden");
    	    hiddenField.setAttribute("name", "long");
    	    hiddenField.setAttribute("value", longtitude);
    	    form.appendChild(hiddenField);
    	    
    	    
    	    document.body.appendChild(form);
    	    form.submit();
    	
    	}
    </script>
</body>

</html>