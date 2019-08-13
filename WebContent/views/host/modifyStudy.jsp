<%@page import="databean.StudyDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<script src="${project}script.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- <script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script> -->
<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
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
					<h4 class="page-title">스터디 수정</h4>
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
						<h3 class="box-title m-b-0">스터디 수정</h3>
						<p class="text-muted m-b-30 font-13">등록  내용을 수정해주세요
						</p>
						<div class="row">
							<div class="col-sm-12 col-xs-12">
								<form id="modifyform" name="modifyform" method="post" action="smodifyPro.do?sid=${studyDto.getId()}&stid=${studyDto.getStudytime_id()}"  enctype="multipart/form-data"
									onsubmit="return modifycheck();">
									<input type="hidden" name="sid" value="${studyDto.id}">
									<div class="form-group">

										<label for="studyHostInform">*스터디 이름</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-book"></i>
											</div>
											<input class="form-control" id="studyHostInform" type="text"
												name="modtitle" value="${studyDto.title}">
										</div>
									</div>

									<label for="imageEnroll">*이미지 등록</label>
									<!--   <form class="form-horizontal"> -->
									 <div class="form-group">
									<img src="${studyDto.picture}">	
		                              <label class="col-sm-12">File upload</label>
		                              <div class="col-sm-12">
		                                 <div class="fileinput fileinput-new input-group"
		                                    data-provides="fileinput">
		
		                                    <div class="form-control" data-trigger="fileinput">
		                                       <i class="glyphicon glyphicon-file fileinput-exists"></i> <span
		                                          class="fileinput-filename"></span>
		                                    </div>
		                                    <span class="input-group-addon btn btn-default btn-file">
		                                       <span class="fileinput-new">Select file</span> 
		                                       <span class="fileinput-exists">Change</span> 
		                                       <input name="modpicture" type="file"></span> 
		                                       <a class="input-group-addon btn btn-default fileinput-exists" href="#" data-dismiss="fileinput">Remove</a>
		                                 </div>
		                              </div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<label for="category">*카테고리 선택</label>
										</div>
										<div class="col-md-12">
											<div class="form-group">
			                              <c:if test="${!empty catDtoList}"> 
			                             		<select name="modcategory" id="selectBox">
			                             		<option value="" disabled selected>수정하실 카테고리를 선택해주세요</option>
												  <optgroup label="<취업>">
												   	<optgroup label="대기업">
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '대기업'}">
												     		<option value="${catDto}">${catDto.small}</option>
														</c:if>
													</c:forEach>
												    </optgroup>
												    <optgroup label="공기업">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '공기업'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												  </optgroup>
												   <optgroup label="중소기업">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '중소기업'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												   <optgroup label="공무원">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '공무원'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												   </optgroup>
												  </optgroup>
												  
												  <optgroup label="<어학>">
												  <optgroup label="영어">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '영어'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												  </optgroup>
												   <optgroup label="중국어">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '중국어'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												  </optgroup>
												   <optgroup label="일본어">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '일본어'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												  </optgroup>
												   <optgroup label="독일어">									 
												     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												     	<c:if test="${catDto.middle == '독일어'}">
												     		<option value="${catDto}">${catDto.small}</option>
												     	</c:if>
												     </c:forEach>
												  </optgroup>
												  </optgroup>
												
												  <optgroup label="<자격증>">
												  	<optgroup label="컴퓨터">
													  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
													  		<c:if test="${catDto.middle=='컴퓨터'}">
													  			<option value="${catDto.id}">${catDto.small}</option>
													  		</c:if>
													  	</c:forEach>	
												  	</optgroup>
												  		<optgroup label="사회">
													  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
													  		<c:if test="${catDto.big=='자격증' && catDto.middle=='사회'}">
													  			<option value="${catDto.id}">${catDto.small}</option>
													  		</c:if>
													  	</c:forEach>	
												  	</optgroup>
												  		<optgroup label="요리">
														  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
														  		<c:if test="${catDto.middle=='요리'}">
														  			<option value="${catDto.id}">${catDto.small}</option>
														  		</c:if>
														  	</c:forEach>	
													  	</optgroup>
												  </optgroup>
										
												  <optgroup label="<전공>">
												  	<optgroup label="공학">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.middle=='공학'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  	<optgroup label="인문">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.middle=='인문'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  	<optgroup label="사회">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.big=='전공' && catDto.middle=='사회'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  	<optgroup label="자연과학">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.middle=='공학'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  </optgroup>
												  <optgroup label="<기타>">
												  	<optgroup label="회화">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.middle=='회화'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  	<optgroup label="회화">
												  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
												  			<c:if test="${catDto.middle=='운동'}">
												  				<option value="${catDto.id}">${catDto.small}</option>
												  			</c:if>
												  		</c:forEach>
												  	</optgroup>
												  </optgroup>
												</select>
												</c:if>
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">*스터디 형태</label>
												<c:if test="${studyDto.getTerm() ==0 }">
													<div class="radio-list">
													<label class="radio-inline p-0">
														<div class="radio radio-info">
															<input name="modterm" id="radio1" type="radio" value="0" checked="checked">
															<label for="radio1">원데이</label>
														</div>
													</label> <label class="radio-inline">
														<div class="radio radio-info">
															<input name="modterm" id="radio2" type="radio" value="1">
															<label for="radio2">정기</label>
														</div>
													</label>
												</div> 
												</c:if>
												<c:if test="${studyDto.getTerm() ==1}">
													<div class="radio-list">
													<label class="radio-inline p-0">
														<div class="radio radio-info">
															<input name="modterm" id="radio1" type="radio" value="0">
															<label for="radio1">원데이</label>
														</div>
													</label> <label class="radio-inline">
														<div class="radio radio-info">
															<input name="modterm" id="radio2" type="radio" value="1" checked="checked">
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
													<input class="form-control" name="modmax_personnel"
														type="text" value="${studyDto.max_personnel}">
													<div class="input-group-addon">명</div>
												</div>
											</div>
										</div>
										<div class="col-md-4"></div>

									   <div class="col-md-4">
                                         <div class="form-group row">
		                                    <label class="col-form-label" for="example-date-input">모집 마감일</label>
		                                    <div class="col-6">
		                                     
		                                       	<input class="form-control" name="moddeadline" id="example-date-input" type="date" value="<fmt:formatDate value="${studyDto.deadline}" type="date" pattern="yyyy-MM-dd"/>"> 
		                                    </div>
		                                 </div>
                                       </div>
									</div>
									<div class="form-group">
										<label for="studyInfo">*스터디 소개</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-book"></i>
											</div>
											<input class="form-control" name="modintro" id="studyInfo"
												value="${studyDto.intro}"/>
										</div>
									</div>
									<div class="form-group">
										<label for="processInfo">*진행방식</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-blackboard"></i>
											</div>
											<textarea class="form-control" name="modprocess"
												id="processInfo"
												rows="20">${studyDto.process}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="targetInfo">*모집대상</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-star"></i>
											</div>
											<textarea class="form-control" name="modtarget" id="targetInfo"
											 rows="20">${studyDto.target}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="curriculumInfo">세부 커리큘럼</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-pencil"></i>
											</div>
											<textarea class="form-control" name="modcurriculum"
												id="curriculumInfo"
												rows="20">${studyDto.curriculum}</textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="chatLink">*채팅 링크</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-pencil"></i>
											</div>
											<textarea class="form-control" name="modchat_url" id="chatLink"
												>${studyDto.chat_url}</textarea>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<label for="category">*스터디 장소</label>
										</div>
									 &nbsp;<div class="col-md-3">
									
		                              	<div class="form-group">
					                              <c:if test="${!empty locDtoList}"> 	
					                              <select name="modlocation" id="selectBox" class="city">
					                              <option value="" disabled selected>수정하실 스터디 장소를 선택해주세요</option>
													  <optgroup label="서울">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city =='서울'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
					
													  <optgroup label="경기">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city =='경기'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
													  
													  <optgroup label="인천">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city =='인천'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
													  
													  <optgroup label="부산">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city == '부산'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
													
													  <optgroup label="대구">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city == '대구'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
													  
													  <optgroup label="울산">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city == '울산'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													    </c:forEach>
													  </optgroup>
													  
													  <optgroup label="경상도">
													  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
													  	<c:if test="${locDto.state_city == '경상도'}">
													   <option value="${locDto.id}">${locDto.detail_loc}</option> 
													   </c:if>
													   </c:forEach>
													  </optgroup>
													  
												</select>
												</c:if>
								
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="input-group">
													<div class="input-group-addon"><i class="ti-home">&nbsp;세부 장소</i></div>
												<input class="form-control" name="modspelocation"
													id="spelocation" type="text"
													value="${studyDto.place}">
												</div> 
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<label class="control-label">*회비</label>
										</div>
		
										<div class="col-md-2">
											<div class="form-group">
												<div class="input-group">
													<div class="input-group-addon">￦</div>
													<input class="form-control" name=modscost id="studyHostInform"
														type="text" value="${studyDto.scost}">
												</div>
											</div>
										</div>
									</div>
									
 							<div class="form-group row">
                              	<label class="col-2 col-form-label" for="example-time-input">*스터디 요일</label>
									<div class="col-sm-10">
											<div class="form-check">
												<c:if test="${studytimeDto.getSday().indexOf('0') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="0" checked="checked"> <span class="custom-control-indicator"></span>
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('0') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="0"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">월</span>
												</label> 
												</c:if>
									
												<c:if test="${studytimeDto.getSday().indexOf('1') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="1" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">화</span>
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('1') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="1"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">화</span>
												</label> 
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('2') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="2" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">수</span>
												</label> 
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('2') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="2"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">수</span>
												</label> 
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('3') > -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="3" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">목</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('3') == -1}">
												<label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="3"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">목</span>
												</label>
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('4') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="4" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">금</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('4') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="4"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">금</span>
												</label>
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('5') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="5" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">토</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('5') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="5"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">토</span>
												</label>
												</c:if>
												
												<c:if test="${studytimeDto.getSday().indexOf('6') > -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="6" checked="checked"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">일</span>
												</label>
												</c:if>
												<c:if test="${studytimeDto.getSday().indexOf('6') == -1}">
												 <label class="custom-control custom-checkbox"> <input
													class="custom-control-input" name="sday" type="checkbox"
													value="6"> <span class="custom-control-indicator"></span>
													<span class="custom-control-description">일</span>
												</label>
												</c:if>
											</div>
										</div>
								 	</div>

									  <div class="form-group row">
			                              <label class="col-2 col-form-label" for="example-time-input">*스터디 시간</label>
			                              <div class="col-10">
			                                 <input class="form-control" name="modstime" id="example-time-input" type="time" value="${studytimeDto.stime}">
			                              </div>
			                           </div>

									<div class="form-group row">
										<label class="col-2 col-form-label" for="example-date-input">*스터디
											시작일</label>
										<div class="col-10">
										
											<input class="form-control" name="modsdate"
												id="example-date-input" type="date" value="<fmt:formatDate value="${studytimeDto.sdate}" type="date" pattern="yyyy-MM-dd"/>" >
										</div>
					
									</div>

									<div class="form-group">
										<label for="exampleInputEmail1">추가코멘트</label>
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-book"></i>
											</div>
											
											<textarea class="form-control" name="modscomment">${studyDto.scomment}</textarea>
										</div>
									</div>

						
									<input class="btn btn-success waves-effect waves-light m-r-10"
										type="submit" onclick="modifyalert()" value="확인">
									<input class="btn btn-inverse waves-effect waves-light" type="button"
										onclick="window.location.href='main.do'" value="취소">
								
									<script type="text/javascript">
							 
										function modifyalert(){
											//if(result!=0){
												alert("수정");
											/* }else{
												alert("실패");
											} */
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
<!-- 	<script src="../../studyloop/default/js/custom.min.js"></script> -->
	<script src="../../studyloop/default/js/jasny-bootstrap.js"></script>
	<!--Style Switcher -->
	<script
		src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>