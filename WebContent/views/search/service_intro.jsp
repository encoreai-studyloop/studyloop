<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>스터디루프</title>
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
	<!-- morris CSS -->
	<link
		href="../../studyloop/default/plugins/bower_components/morrisjs/morris.css"
		rel="stylesheet">
	<link
		href="../../studyloop/default/plugins/bower_components/css-chart/css-chart.css"
		rel="stylesheet">
	<!-- animation CSS -->
	<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../../studyloop/default/css/style.css" rel="stylesheet">
	<!-- color CSS -->
	<link href="../../studyloop/default/css/colors/blue.css" id="theme"
		rel="stylesheet">
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
		<!-- 상단바 -->
		<jsp:include page="upperBar.jsp" flush="false" />
		
		<!-- Page Content -->
		<div id="wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">Service Introduction</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<a href="primecheck.do" target="_blank"
							class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">프리미엄
							구매</a>
						<ol class="breadcrumb">
							<li><a href="#">Dashboard</a></li>
							<li class="active">Widgets</li>
						</ol>
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div><!-- container-fluid -->
		</div><!-- wrapper -->
		
		<!-- footer -->
		<jsp:include page="footer.jsp" flush="false" />
		
	</div>

</body>
</html>