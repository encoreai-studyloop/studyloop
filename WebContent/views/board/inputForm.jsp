<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS -->
    <link href="${project}bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${project}plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${project}css/animate.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="${project}plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${project}css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${project}css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="${project}css/colors/blue.css" id="theme" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
          <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Material Floating Form</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="https://themeforest.net/item/elite-admin-the-ultimate-dashboard-web-app-kit-material-design/16750820?ref=suniljoshi" target="_blank" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Buy Now</a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li><a href="#">Forms</a></li>
                            <li class="active">Material Floating Form</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- .row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box p-l-20 p-r-20">
                            <h3 class="box-title m-b-0">Animated Line Inputs Form With Floating Labels</h3>
                            <p class="text-muted m-b-30 font-13">Just add <code>floating-labels</code> class to the form.</p>
                            <div class="row">
                                <div class="col-md-12">
                                    <form class="floating-labels" method="post" action="boardinputpro.do">
                                    	<input type="hidden" name="wuser_id" value="${wuser_id}">
                                    	<input type="hidden" name="study_id" value="${study_id}">
                                        <div class="form-group m-b-40">
                                            <input type="text" class="form-control" id="input1" name="title" required><span class="highlight"></span> <span class="bar"></span>
                                            <label for="input1">글 제목</label>
                                        </div>
                                        <div class="form-group m-b-40">
                                            <select class="form-control p-0" id="input6"  name="articleform" required>
                                                <option value="0">일반글</option>
                                                <option value="1">비밀글</option>
                                                <option value="2">공지글(주최자만)</option>
                                            </select><span class="highlight"></span> <span class="bar"></span>
                                            <label for="input6">글 유형</label>
                                        </div>
                                        <div class="form-group m-b-5">
                                            <textarea class="form-control" rows="4" id="input7" name="content" required></textarea><span class="highlight"></span> <span class="bar"></span>
                                            <label for="input7">내용</label>
                                            <span class="help-block"><small>개인 연락을 주고 받을 수 있는 연락처 작성시 추후 불이익이 있을 수 있습니다.</small></span> 
                                        </div>
                                        <br>
                                        <div class="form-group m-b-40">
                                            <input type="password" class="form-control" id="input2" name="passwd" required><span class="highlight"></span> <span class="bar"></span>
                                            <label for="input2">비밀번호</label>
                                        </div>
                                    	<div class="pull-right">
                                    		<button class="btn btn-block btn-info" type="submit">작성</button>
                                    		<button class="btn btn-block btn-danger">돌아가기</button>
                                    	</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        	</div>
                <!-- /.row -->
                  <!-- jQuery -->
    <script src="${project}plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${project}bootstrap/dist/js/tether.min.js"></script>
    <script src="${project}bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${project}plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="${project}plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="${project}js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="${project}js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${project}js/custom.min.js"></script>
    <script src="${project}js/jasny-bootstrap.js"></script>
    <!--Style Switcher -->
    <script src="${project}plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>