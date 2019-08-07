<%@page import="databean.StudyDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<script src="${project}script.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
	href="../../studyloop/plugins/images/favicon.png">
<title>StudyLoop_HostInform</title>
<!-- Bootstrap Core CSS -->
<link
	href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
<!-- Menu CSS -->
<link
	href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet">
<!-- animation CSS -->
<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../../studyloop/default/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="../../studyloop/default/css/colors/default-dark.css"
	id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-19175540-9', 'auto');
	ga('send', 'pageview');
</script>
</head>

<body class="fix-sidebar">
<jsp:include page="../search/upperBar.jsp"/>
	<div id="page-wrapper" style="margin: 0px;">
	
		<div class="container-fluid">
			<!-- .row -->
			<div class="row bg-title"
				style="background: url(../../studyloop/plugins/images/heading-title-bg.jpg) no-repeat center center/cover;">
				<div class="col-lg-12">
					<h4 class="page-title">스터디 삭제</h4>
				</div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<ol class="breadcrumb pull-left">
						<li><a href="#">Study Loop </a></li>
						<li class="active">&nbsp;We_Study</li>
					</ol>
				</div>
			</div>
						<form>
								<div><h2>등록하신 스터디가 삭제되었습니다.</h2></div>						
										<br><br><br><br><br><br><br><br><br>
															
									<input class="btn btn-warning waves-effect waves-light m-r-10"
										type="button" onclick="window.location.href='main.do'" value="메인페이지로">
									<input class="btn btn-success waves-effect waves-light m-r-10"
										type="button" onclick="window.location.href='mypage.do'" value="마이페이지로"> 
								</form>
							</div>
						</div>
				
		
		
<jsp:include page="../search/footer.jsp" flush="false"/>
	

	<!-- jQuery -->
	<script
		src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
	<script
		src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
	<!-- Menu Plugin JavaScript -->
	<script
		src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
	<!--slimscroll JavaScript -->
	<script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="../../studyloop/default/js/waves.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="../../studyloop/default/js/custom.min.js"></script>
	<script src="../../studyloop/default/js/jasny-bootstrap.js"></script>
	<!--Style Switcher -->
	<script
		src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>