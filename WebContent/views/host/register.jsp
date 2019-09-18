<%@page import="databean.StudyDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<script src="${project}script.js"></script>
<script type="text/javascript" src="<c:url value="/jauery-3.4.1.js"/>"></script>
<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
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
<!-- <link
	href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css"
	rel="stylesheet"> -->
<!-- animation CSS -->
<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../../studyloop/default/css/style.css" rel="stylesheet">
<!-- color CSS -->
<link href="../../studyloop/default/css/colors/blue-dark.css"
	id="theme" rel="stylesheet">
<link href="views/login/css/main.css" rel="stylesheet">
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


<body style="background-image: url('main.jpg')">
	<jsp:include page="../search/upperBar.jsp"/>
	<div id="page-wrapper" style="margin: 0px;">
	
		<div class="container-fluid">
			<!-- .row -->
			<div class="row bg-title"
				style="background: url(../../studyloop/plugins/images/heading-title-bg.jpg) no-repeat center center/cover;">
				<div class="col-lg-12">
					<h4 class="page-title">새 스터디 시작</h4>
				</div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<ol class="breadcrumb pull-left">
						<li><a href="#">Study Loop </a></li>
						<li class="active">&nbsp;We_Study</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->
			<!--.row-->
			<div class="row">
				<div class="col-md-12">
					<div class="white-box">
						<h3 class="box-title m-b-0">스터디 등록 완료</h3>
						<p class="text-muted m-b-30 font-13">등록  내용을 확인해주세요
						</p>
						<div class="row">
							<div class="col-sm-12 col-xs-12">
								<form id="registerform" name="registerform" method="post" enctype="multipart/form-data">

									<div class="form-group">
									<input type="hidden" name="studyId" value="${studyDto.id}"/>
										
										<div class="col-md-12">
											<div class="form-group row">
												<label class="control-label">*스터디 이름</label>
												<div class="input-group">
													<div class="input-group-addon">
														<i class="ti-book"></i>
													</div>
													<input class="form-control" name="title"
														type="text" value="${studyDto.title}" readonly="readonly">
												</div>
											</div>
										</div>
					
									<label for="imageEnroll">*이미지 등록</label>
									<div class="form-group">
										<img src="${studyDto.picture}">		
									</div>
							
									<div class="row">
										<div class="col-md-12">
											<label for="category">*카테고리 선택</label>
										</div>
										<div class="col-md-4">
											<div class="form-group">

												<div class="col-md-6">
													<div class="form-group">
														<input class="form-control" name="category" type="text" value="${studyDto.category}" readonly>
													</div>
												</div>
												
				
											</div>
										</div>
										<div class="col-md-4"></div>
										<div class="col-md-4"></div>

										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">*스터디 형태</label>
												<c:if test="${studyDto.getTerm()=='0'}">
												<div class="radio-list">
													<label class="radio-inline p-0">
														<div class="radio radio-info">
															<input name="term" id="radio1" type="radio" value="0" checked="checked" onclick="return false;">
															<label for="radio1">원데이</label>
														</div>
													</label> <label class="radio-inline">
														<div class="radio radio-info">
															<input name="term" id="radio2" type="radio" value="1" onclick="return false;">
															<label for="radio2">정기</label>
														</div>
													</label>
												</div> 
												</c:if>
												<c:if test="${studyDto.getTerm()=='1'}">
													<div class="radio-list">
													<label class="radio-inline p-0">
														<div class="radio radio-info">
															<input name="term" id="radio1" type="radio" value="0" onclick="return false;">
															<label for="radio1">원데이</label>
														</div>
													</label> <label class="radio-inline">
														<div class="radio radio-info">
															<input name="term" id="radio2" type="radio" value="1" checked="checked" onclick="return false;">
															<label for="radio2">정기</label>
														</div>
													</label>
												</div> 
												</c:if>
												
											</div>
										</div>
										

										<div class="col-md-2">
											<div class="form-group row">
												<label class="control-label">*모집 인원</label>
												<div class="input-group">
													<input class="form-control" name="max_personnel"
														type="text" value="${studyDto.max_personnel}" readonly="readonly">
													<div class="input-group-addon">명</div>
												</div>
											</div>
										</div>
										
										<div class="col-md-4"></div>

										<div class="col-md-5">
											<div class="form-group row">
												<label class="col-form-label" for="example-date-input">&nbsp;&nbsp;&nbsp;&nbsp;모집마감일
														&nbsp;&nbsp;
													<fmt:formatDate value="${studyDto.deadline}" type="date" pattern="yyyy-MM-dd"/>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="studyInfo">*스터디 소개</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-book"></i>
											</div>
											<input class="form-control" name="intro" id="studyInfo"
												value="${studyDto.intro}" readonly/>
										</div>
									</div>
									<div class="form-group">
										<label for="processInfo">*진행방식</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-blackboard"></i>
											</div>
											<textarea class="form-control" name="process"
												id="processInfo"
												readonly="readonly" rows="10">${studyDto.process}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="targetInfo">*모집대상</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-star"></i>
											</div>
											<textarea class="form-control" name="target" id="targetInfo"
												readonly="readonly" rows="10">${studyDto.target}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="curriculumInfo">세부 커리큘럼</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-pencil"></i>
											</div>
											<textarea class="form-control" name="curriculum"
												id="curriculumInfo"
												readonly="readonly" rows="10">${studyDto.curriculum}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="chatLink">*채팅 링크</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-pencil"></i>
											</div>
											<textarea class="form-control" name="chat_url" id="chatLink"
												readonly>${studyDto.chat_url}</textarea>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label for="category">*스터디 장소</label>
										</div>
										<div class="col-md-6"></div>
										<div class="col-md-3">
											<div class="form-group">
												<input class="form-control" name="location" id="location" type="text" value="${studyDto.location}" readonly>
											</div>
										</div>
										
										<!-- <div class="col-md-6"> -->
											<div class="form-group">
												<div class="input-group">
													<div class="input-group-addon"><i class="ti-home">&nbsp;세부 장소</i></div>
												<input class="form-control" name="spelocation"
													id="spelocation" type="text"
													value="${studyDto.place}" readonly>
												</div> 
											</div>
									<!-- 	</div> -->
										
										<div class="col-md-6"></div>
										
									</div>

									<div class="row">
										<div class="col-md-12">
											<label class="control-label">*회비</label>
										</div>
										
										<div class="col-md-2">
											<div class="form-group">
												<div class="input-group">
													<div class="input-group-addon">￦</div>
													<input class="form-control" name=scost id="studyHostInform"
														type="text" value="${studyDto.scost}" readonly>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-2 col-form-label" for="example-time-input">*스터디
											요일</label>
							
									<div class="col-sm-10">
											<div class="form-check">
												<c:if test="${studytimeDto.getSday().indexOf('0') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="0" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">월</span>
												
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('0') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="0" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">월</span>
												</label> 
												</c:if>
									
												<c:if test="${studytimeDto.getSday().indexOf('1') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="1" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">화</span>
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('1') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="1" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">화</span>
												</label> 
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('2') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="2" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">수</span>
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('2') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="2" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">수</span>
												</label> 
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('3') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="3" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">목</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('3') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="3" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">목</span>
												</label>
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('4') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="4" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">금</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('4') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="4" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">금</span>
												</label>
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('5') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="5" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">토</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('5') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="5" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">토</span>
												</label>
												</c:if>
												
													<c:if test="${studytimeDto.getSday().indexOf('6') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="6" checked="checked" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">일</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('6') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="6" onclick="return false;"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">일</span>
												</label>
												</c:if>
											</div>
										</div>
								</div> 
									
									
									<div class="form-group row">
										<label class="col-2 col-form-label" for="example-time-input">*스터디
											시간</label>
										<div class="col-2">
											<input class="form-control" name="stime"
												id="example-time-input"  value="${studytimeDto.stime}" readonly>
										</div>
									</div>

									<div class="col-md-5">
											<div class="form-group row">
												<label class="col-form-label" for="example-date-input">*스터디 시작일
														&nbsp;&nbsp;
													<fmt:formatDate value="${studytimeDto.sdate}" type="date" pattern="yyyy-MM-dd"/>
												</label>
											</div>
										</div>

									<div class="form-group row">
										<label for="exampleInputEmail1">추가코멘트</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-book"></i>
											</div>
											<textarea class="form-control" name="scomment"
												id="exampleInputEmail1"
												readonly>${studyDto.scomment}</textarea>
										</div>
									</div>

										<input class="btn btn-warning waves-effect waves-light m-r-10"
										type="button" onclick="window.location.href='smodify.do?sid=${studyDto.getId()}'" value="수정">
										<input class="btn btn-success waves-effect waves-light m-r-10"
										type="button" onclick="window.location.href='main.do'" value="확인"> 
										 <input class="btn btn-inverse waves-effect waves-light" type="button"
										onclick="removeCheck(${studyDto.getId()})" value="삭제">
						
										
									<script type="text/javascript">
									function removeCheck(sid) {
										 if (confirm("정말 삭제하시겠습니까?") == true){
										     document.location.href="sdeletePro.do?sid="+sid;
										 }else{  
										     return false;
										 }
									}
									</script> 

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../search/footer.jsp" flush="false"/>
	</div>


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
<!-- 	<script
		src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script> -->
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