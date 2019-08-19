<%@page import="databean.StudyRegFormDataBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="databean.CategoryDataBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
	href="../plugins/images/favicon.png">
<title>스터디루프</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme --> 
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
    <!-- toast CSS -->
    <link href="../../studyloop/default/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
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
<!--Owl carousel CSS -->
<link
	href="../../studyloop/default/plugins/bower_components/owl.carousel/owl.carousel.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="../../studyloop/default/plugins/bower_components/owl.carousel/owl.theme.default.css"
	rel="stylesheet" type="text/css" />
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
<style type="text/css">
.myborder {
    background-color:#fff;
    border-width:1px;
    border-style:solid;
    border-bottom-color:#aaa;
    border-right-color:#aaa;
    border-top-color:#ddd;
    border-left-color:#ddd;
    border-radius:3px;
    -moz-border-radius:3px;
    -webkit-border-radius:3px;
}
</style>

</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<jsp:include page="upperBar.jsp" flush="false"/>
		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">마이 페이지</h4>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<c:if test="${userDto.getPrime() == '0'}">
						<a
							href="/studyloop/primecheck.do"
							class="btn btn-warning pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">프리미엄 결제</a>
					</c:if>
					<c:if test="${userDto.getPrime() == '1'}">
						<a
							href="javascript:void(0)"
							class="btn btn-warning pull-right m-l-20 btn-rounded hidden-xs hidden-sm waves-effect waves-light">프리미엄 이용 중</a>
					</c:if>
					<ol class="breadcrumb">
						<li class="active">마이 페이지</li>
					</ol>
				</div>
			</div>

			<!-- /.row -->
			<!-- .row -->
			<div class="row">
				<div class="col-lg-4 col-md-12">
					<div class="white-box">						
								<div class="col-md-6 col-sm-4 text-center">
									<p class="text-danger">
										프리미엄 회원
										
									</p>
									<c:if test="${userDto.getPrime()=='1'}">	
									<h4><img src="../../studyloop/views/search/images/Premium.png" style="width:100px; height:100px;"></h4>					
									<h4>이용 중</h4>
									</c:if>
									<c:if test="${userDto.getPrime()!='1'}">
									<h4><a href="primecheck.do">지금 구매 하기</a></h4>
									</c:if>
								</div>
								<div class="col-md-6 col-sm-4 text-center">
									<p class="text-danger">
										나의 평점
									</p>
									<c:if test="${userDto.getRate()!=0.0}">
									<h1>${userDto.getRate()} 점</h1>
									</c:if>
									<c:if test="${userDto.getRate()==0.0}">
									<h4>반영된 평점이 없습니다.</h4>
									</c:if>
								</div>								
	
						<div class="user-btm-box">
							<!-- .row -->
							<div class="row text-center m-t-10">
								<div class="col-md-6 b-r">
									<strong>이름</strong>
									<p>${userDto.getName()}</p>
								</div>
								<div class="col-md-6">
									<strong>닉네임</strong>
									<p>${userDto.getNick()}</p>
								</div>
							</div>
							<!-- /.row -->
							<hr>
							<!-- .row -->
							<div class="row text-center m-t-10" >
								<div class="col-md-6 b-r">
									<strong>이메일</strong>
									<p class="email">${userDto.getEmail()}</p>
								</div>
								<div class="col-md-6">
									<strong>전화번호</strong>
									<p>${userDto.getPhone() }</p>
								</div>
							</div>
							<!-- /.row -->
							<hr>
							<!-- .row -->
							<div class="row text-center m-t-10">
								<div class="col-md-12">
										<input type="button" value="내 추가정보 입력 수정" class="btn btn-block btn-outline btn-rounded btn-success" onclick="openAddinfoform()">
																	
										<input type="button" value="회원정보 수정" class="btn btn-block btn-outline btn-rounded btn-info" onclick="modifyProcess()">
											
										<button class="btn btn-block btn-outline btn-rounded btn-danger" onclick="deleteProcess()">회원
											탈퇴하기</button>
								</div>
							</div>
							<hr>
							<!-- /.row -->
							<div class="row">
								<div class="col-md-4 col-sm-4 text-center">
									<p class="text-purple">
										받은 스터디 신청
									</p>
									<h1>${ruserDtoList.size()}개</h1>
								</div>
								<div class="col-md-4 col-sm-4 text-center">
									<p class="text-blue">
										신청한 스터디
									</p>
									<h1>${rstudyDtoList.size()}개</h1>
								</div>
								<div class="col-md-4 col-sm-4 text-center">
									<p class="text-danger">
										포인트
									</p>
									<h1>${userDto.getPoint()}점</h1>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-md-12">
					<div class="white-box">
						<!-- .tabs -->
						<ul class="nav customtab nav-tabs" role="tablist">
							<li role="presentation" class="nav-item"><a href="#regstudy"
								class="nav-link active" aria-controls="home" role="tab"
								data-toggle="tab" aria-expanded="true"><span
									class="visible-xs"><i class="ti-home"></i></span><span
									class="hidden-xs"> 신청한 스터디</span></a></li>
							<li role="presentation" class="nav-item"><a
								href="#openstudy" class="nav-link" aria-controls="profile"
								role="tab" data-toggle="tab" aria-expanded="false"><span
									class="visible-xs"><i class="ti-user"></i></span> <span
									class="hidden-xs"> 주최한 스터디</span></a></li>
						</ul>
						<!-- /.tabs -->
						<div class="tab-content">
							<div class="tab-pane active" id="regstudy">
								<!-- .tabs 1 -->
								<!-- Nav tabs -->
								<ul class="nav nav-tabs active" role="tablist">
									<li role="presentation" class="active nav-item"><a
										href="#regstatus" class="nav-link" aria-controls="regstatus"
										role="tab" data-toggle="tab" aria-expanded="true"><span
											class="visible-xs"><i class="ti-home"></i></span><span
											class="hidden-xs">신청현황</span></a></li>
									<li role="presentation" class="nav-item"><a
										href="#participatestudy" class="nav-link"
										aria-controls="participatestudy" role="tab" data-toggle="tab"
										aria-expanded="false"><span class="visible-xs"><i
												class="ti-user"></i></span> <span class="hidden-xs">참여중인 스터디</span></a></li>
									<li role="presentation" class="nav-item"><a
										href="#endstudy" class="nav-link" aria-controls="endstudy"
										role="tab" data-toggle="tab" aria-expanded="false"><span
											class="visible-xs"><i class="ti-email"></i></span> <span
											class="hidden-xs">종료된 스터디</span></a></li>
								</ul>
								<!-- Tab panes -->
								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="regstatus">
										<c:if test="${rstudyDtoList.size() !=0}">
										<c:forEach var="rstudyDto" items="${rstudyDtoList}" varStatus="status">
										<div class="comment-center">				
											<div class="comment-body" style="width:100%; height: 100%">
												<div class="user-img">
													<img src="${rstudyDto.getPicture()}" alt="studyimg"
														class="img-circle">
												</div>
												<div class="mail-contnet">
													<h5><a href="view.do?sid=${rstudyDto.getId()}">${rstudyDto.getTitle()}</a></h5>
													<span class="mail-desc">
													${rstudyDto.getIntro()}
													</span>
													<c:if test="${rstudyDto.getRegprocess_id() == '1' }">												
													 <span class="label label-rouded label-info">수락 대기</span>
													</c:if>	
													<c:if test="${rstudyDto.getRegprocess_id() == '3' }">												
													 <span class="label label-rouded label-info">1차 수락</span>
													 <br><br><a href="javascript:window.open('${rstudyDto.getChat_url()}', '${str_chatwith}', 'width=550, height=550, top=150, left=350')">채팅하기</a>
													</c:if>	
													<c:if test="${rstudyDto.getRegprocess_id() == '5' }">												
													 <span class="label label-rouded label-info">최종 수락</span>
													 <br><br><a href="javascript:window.open('${rstudyDto.getChat_url()}', '${str_chatwith}', 'width=550, height=550, top=150, left=350')">채팅하기</a>
													</c:if>	
													<c:if test="${rstudyDto.getRegprocess_id() == '2' }">												
													 <span class="label label-rouded label-info">1차 거절</span>
													</c:if>	
													<c:if test="${rstudyDto.getRegprocess_id() == '4' }">												
													 <span class="label label-rouded label-info">최종 거절</span>
													</c:if>																																							
													 <a
														href="javascript:registercancel(${rstudyDto.getId()})" class="action"><i
														class="ti-close text-danger"></i>  신청 철회</a><span
														class="time pull-right">신청일 : ${rstudyDto.getRegdate()}</span>
												</div>
											</div>
										</div>
										</c:forEach>
										</c:if>
										<c:if test="${rstudyDtoList.size() ==0}">
											<div class="col-md-6">
											<h3>신청한 스터디가 없습니다.</h3>
											<h4>지금 스터디를 신청해보세요!</h4>
											</div>
										</c:if>
									</div>
									<div role="tabpanel" class="tab-pane" id="participatestudy">
						                    <!-- .col -->
						                <c:if test="${pstudyDtoList.size() !=0}">
						                <c:forEach var="pstudyDto" items="${pstudyDtoList}" varStatus="status">
						                <c:if test="${pstudyDto.getChat_url() !='종료'}">
					                    <div class="row myborder" style="margin-top: 10px">			            
			                                <div class="col-md-4 col-sm-4 text-center">
			                                    <a href="contact-detail.html"><img src="${pstudyDto.getPicture()}" alt="studyimg" class="img-circle img-responsive" style="width:100%; height: 100%"></a>
			                                </div>
			                             	<div class="col-md-8 col-sm-8">
			                                    <h3 class="box-title m-b-0"><a href="view.do?sid=${pstudyDto.getId()}">${pstudyDto.getTitle()}</a></h3> <small>참여 인원 : ${pstudyDto.getCur_personnel()} / ${pstudyDto.getMax_personnel()}</small>
			                                        <address>
			                                            ${pstudyDto.getIntro()}
			                                            <br/>
			                                            <br/>
			                                             	장소 : ${pstudyDto.getLocation()} - ${pstudyDto.getPlace()}
			                                             	<br>
			                                            	오픈채팅 URL : ${pstudyDto.getChat_url() }
			                                   	<button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='attend.do?hsid=${pstudyDto.getId()}&noedit=1'">출석관리</button>
			                                   	&nbsp;&nbsp;
			                                    <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='calendar.do?sid=${pstudyDto.getId()}'">캘린더</button>
			                                        </address>
		                                	</div>                    
					                    </div>
					                    </c:if>
					                    </c:forEach>
					                    </c:if>
					                    <c:if test="${pstudyDtoList.size() == 0}">
					                    	<div class="col-md-6">
											<h3>참여중인 스터디가 없습니다.</h3>
											<h4>지금 스터디를 신청해보세요!</h4>
											</div>
					                    </c:if>
					                    <!-- /.col -->
										<div class="clearfix"></div>
									</div>
									<div role="tabpanel" class="tab-pane" id="endstudy">
										<c:forEach var="pstudyDto" items="${pstudyDtoList}" varStatus="status">
										<c:if test="${pstudyDto.getChat_url() =='종료'}">
										<div class="row myborder" style="margin-top: 10px">			            
			                                <div class="col-md-4 col-sm-4 text-center">
			                                    <a href="contact-detail.html"><img src="${pstudyDto.getPicture()}" alt="studyimg" class="img-circle img-responsive"></a>
			                                </div>
			                             	<div class="col-md-8 col-sm-8">
			                                    <h3 class="box-title m-b-0">${pstudyDto.getTitle()}</h3> <small>참여 인원 : ${pstudyDto.getCur_personnel()} / ${pstudyDto.getMax_personnel()}</small>
			                                        <address>
			                                            ${pstudyDto.getIntro()}
			                                            <br/>
			                                            <br/>
			                                             	장소 : ${pstudyDto.getLocation()} - ${pstudyDto.getPlace()}
			                                             	<br>
			                                            	오픈채팅 URL : ${pstudyDto.getChat_url() }
			                                        </address>
			                                        
			                                        <!-- if 평점 안 했으면 이 코드 쓰고 했으면 alert onclick 해주기 -->
			                                        <!-- pastudyDtoList 체크 -->
			                                        
			                                        
			                                        
			                                        <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='rateForm.do?sid=${pstudyDto.getId()}'">평점주기</button>
		                                	</div>                    
					                    </div>
										</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- /.tabs1 -->
							<!-- .tabs2 -->
							<div class="tab-pane" id="openstudy">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li role="presentation" class="nav-item"><a
										href="#myregstatus" class="nav-link"
										aria-controls="myregstatus" role="tab" data-toggle="tab"
										aria-expanded="true"><span class="visible-xs"><i
												class="ti-user"></i></span> <span class="hidden-xs">신청 현황</span></a></li>
									<li role="presentation" class="nav-item"><a
										href="#holdingstudy" class="nav-link"
										aria-controls="holdingstudy" role="tab" data-toggle="tab"
										aria-expanded="false"><span class="visible-xs"><i
												class="ti-email"></i></span> <span class="hidden-xs">주최 중인
												스터디</span></a></li>
									<li role="presentation" class="nav-item"><a
										href="#myendstudy" class="nav-link" aria-controls="myendstudy"
										role="tab" data-toggle="tab" aria-expanded="false"><span
											class="visible-xs"><i class="ti-settings"></i></span> <span
											class="hidden-xs">종료된 스터디</span></a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									
									<div role="tabpanel" class="tab-pane" id="myregstatus">
									* 닉네임을 눌러 신청서를 확인하세요
										<div class="row">
											<div class="col-md-12">
												<div class="white-box">
													<div class="table-responsive">
														
														<table class="table product-overview" id="myTable" style="margin-bottom: 60px">
															<thead>
																<tr>
																	<th>닉네임</th>
																	<th>이메일</th>
																	<th>스터디</th>
																	<th>신청일</th>
																	<th>현재상태</th>
																	<th>상태변경</th>
																</tr>
															</thead>
															<tbody>
															<c:set var="num" value="0"/>
															<c:forEach var="ruserDto" items="${ruserDtoList}" varStatus="status">
																<tr>
																	<td><a href="javascript:openapplication(${ruserDto.getId()}, ${ruserDto.getSid()})">${ruserDto.getNick()}</a></td>
																	<td>${ruserDto.getEmail()}</td>
																	<td>${ruserDto.getTitle()}</td>															
																	<td>${ruserDto.getRegdate()}</td>
																	<td>
																		<c:if test="${ruserDto.getName() eq '수락대기'}">
																		<span class="label label-info font-weight-100">${ruserDto.getName()}</span>
																		</c:if>
																		<c:if test="${ruserDto.getName() eq '1차수락'}">
																		<span class="label label-success font-weight-100">${ruserDto.getName()}</span>
																		</c:if>
																		<c:if test="${ruserDto.getName() eq '1차거절'}">
																		<span class="label label-danger font-weight-100">${ruserDto.getName()}</span>
																		</c:if>
																		<c:if test="${ruserDto.getName() eq '최종거절'}">
																		<span class="label label-danger font-weight-100">${ruserDto.getName()}</span>
																		</c:if>		
																		<c:if test="${ruserDto.getName() eq '최종수락'}">
																		<span class="label label-success font-weight-100">${ruserDto.getName()}</span>
																		</c:if>																																																											
																	</td>
																	<td>
																	<div class="btn-group">
																	<a href="#toggleStatusModal" data-toggle="dropdown" data-target="#toggleStatusModal"
																		class="text-inverse p-r-10 dropdown-toggle"
																		title="Edit"><i class="ti-marker-alt"></i></a> <a
																		href="javascript:void(0)" class="text-inverse"
																		title="Delete" data-toggle="tooltip"><i
																			class="ti-trash"></i></a>
																	
																	    <ul class="dropdown-menu" role="menu">
																	      <li><a class="studystatus" href="javascript:changeStatus(${userDto.getId()},${ruserDto.getId()},${ruserDto.getSid()},3)">1차 승인
																	      <input class="studytitle" type="hidden" value="${ruserDto.getTitle()}">
																	      <input class="targetId" type="hidden" value="${ruserDto.getId()}">
																	      </a>
																	      </li>																	
																	      <li><a class="studystatus" href="javascript:changeStatus(${userDto.getId()},${ruserDto.getId()},${ruserDto.getSid()},2)">1차 거절
																	      <input class="studytitle" type="hidden" value="${ruserDto.getTitle()}">
																	      <input class="targetId" type="hidden" value="${ruserDto.getId()}">
																	      </a>
																	      </li>
																	      <li><a class="studystatus" href="javascript:changeStatus(${userDto.getId()},${ruserDto.getId()},${ruserDto.getSid()},5)">최종 승인
																	      <input class="studytitle" type="hidden" value="${ruserDto.getTitle()}">
																	      <input class="targetId" type="hidden" value="${ruserDto.getId()}">
																	      </a>
																	      </li>
																	      <li><a class="studystatus" href="javascript:changeStatus(${userDto.getId()},${ruserDto.getId()},${ruserDto.getSid()},4)">최종 거절
																	      <input class="studytitle" type="hidden" value="${ruserDto.getTitle()}">
																	      <input class="targetId" type="hidden" value="${ruserDto.getId()}">
																	      </a>
																	      </li>
																	    </ul>
																	    
																	    <script>
																	    function changeStatus(id, tid, sid, status){									
																	    	location="mypage.do?id="+id+"&tid="+tid+"&sid="+sid+"&status="+status										
																	    }
																	    </script>
																	    
																	</div>
																</tr>
																<c:set var="num" value="${num=num+1}"/>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane" id="holdingstudy">								
					                    <!-- .col -->
					                    <c:if test="${ostudyDtoList.size() != 0}">
					                    <c:forEach var="ostudyDto" items="${ostudyDtoList}" varStatus="status">
					                    <c:if test="${ostudyDto.getChat_url() !='종료'}">
					                    <div class="row myborder" style="margin-top: 10px">			            
			                                <div class="col-md-4 col-sm-4 text-center">
			                                    <a href="contact-detail.html"><img src="${ostudyDto.getPicture()}" alt="studyimg" class="img-circle img-responsive"></a>
			                                </div>
			                                <div class="col-md-8 col-sm-8">
			                                    <h3 class="box-title m-b-0"><a href="view.do?sid=${ostudyDto.getId()}">${ostudyDto.getTitle()}</a></h3> <small>참여 인원 : ${ostudyDto.getCur_personnel()} / ${ostudyDto.getMax_personnel()}</small>
			                                        <address>
			                                            ${ostudyDto.getIntro()}
			                                            <br/>
			                                            <br/>
			                                             	장소 : ${ostudyDto.getLocation()} - ${ostudyDto.getPlace()}
			                                             	<br>
			                                            	오픈채팅 URL : ${ostudyDto.getChat_url() }
			                                    <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="closeStudy(${ostudyDto.getId()})">종료하기</button>
			                                   	<button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='attend.do?hsid=${ostudyDto.getId()}'">출석관리</button>
			                                   	&nbsp;&nbsp;
			                                    <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='calendar.do?sid=${ostudyDto.getId()}'">캘린더</button>
			                                    <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='sregister.do?sid=${ostudyDto.getId()}&form=1'">삭제/수정</button>
			                                        </address>
		                                	</div>                    
					                    </div>
					                    </c:if>
					                    </c:forEach>
					                    </c:if>
					                    <c:if test="${ostudyDtoList.size() == 0}">
					                    	<div class="col-md-6">
											<h3>주최중인 스터디가 없습니다.</h3>
											<h4>지금 스터디를 열어보세요!</h4>
											</div>
					                    </c:if>
					                    <!-- /.col -->
									</div>
									<div role="tabpanel" class="tab-pane" id="myendstudy">										
										<c:forEach var="ostudyDto" items="${ostudyDtoList}" varStatus="status">
										<c:if test="${ostudyDto.getChat_url() =='종료'}">
											 <div class="row myborder" style="margin-top: 10px">			            
			                                <div class="col-md-4 col-sm-4 text-center">
			                                    <a href="contact-detail.html"><img src="${ostudyDto.getPicture()}" alt="studyimg" class="img-circle img-responsive"></a>
			                                </div>
			                                <div class="col-md-8 col-sm-8">
			                                    <h3 class="box-title m-b-0">${ostudyDto.getTitle()}</h3> <small>참여 인원 : ${ostudyDto.getCur_personnel()} / ${ostudyDto.getMax_personnel()}</small>
			                                        <address>
			                                            ${ostudyDto.getIntro()}
			                                            <br/>
			                                            <br/>
			                                             	장소 : ${ostudyDto.getLocation()} - ${ostudyDto.getPlace()}
			                                             	<br>
			                                            	오픈채팅 URL : ${ostudyDto.getChat_url() }
			                                            	
			                                            	
			                                            	
			                                            	<!-- if 평점 안 했으면 이 코드 쓰고 했으면 alert onclick 해주기 -->
			                                    <button class="fcbtn btn btn-outline btn-primary btn-1f pull-right" onclick="location='rateForm.do?sid=${ostudyDto.getId()}'">평점주기</button>			                                   
			                                        </address>
		                                	</div>                    
					                    </div>
										</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- /.tabs2 -->
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
				<!-- .right-sidebar -->
				<div class="right-sidebar">
					<div class="slimscrollright">
						<div class="rpanel-title">
							Service Panel <span><i class="ti-close right-side-toggle"></i></span>
						</div>
						<div class="r-panel-body">
							<ul>
								<li><b>Layout Options</b></li>
								<li>
									<div class="checkbox checkbox-info">
										<input id="checkbox1" type="checkbox" class="fxhdr"> <label
											for="checkbox1"> Fix Header </label>
									</div>
								</li>
								<li>
									<div class="checkbox checkbox-warning">
										<input id="checkbox2" type="checkbox" checked="" class="fxsdr">
										<label for="checkbox2"> Fix Sidebar </label>
									</div>
								</li>
								<li>
									<div class="checkbox checkbox-success">
										<input id="checkbox4" type="checkbox" class="open-close">
										<label for="checkbox4"> Toggle Sidebar </label>
									</div>
								</li>
							</ul>
							<ul id="themecolors" class="m-t-20">
								<li><b>With Light sidebar</b></li>
								<li><a href="javascript:void(0)" theme="default"
									class="default-theme">1</a></li>
								<li><a href="javascript:void(0)" theme="green"
									class="green-theme">2</a></li>
								<li><a href="javascript:void(0)" theme="gray"
									class="yellow-theme">3</a></li>
								<li><a href="javascript:void(0)" theme="blue"
									class="blue-theme working">4</a></li>
								<li><a href="javascript:void(0)" theme="purple"
									class="purple-theme">5</a></li>
								<li><a href="javascript:void(0)" theme="megna"
									class="megna-theme">6</a></li>
								<li><b>With Dark sidebar</b></li>
								<br />
								<li><a href="javascript:void(0)" theme="default-dark"
									class="default-dark-theme">7</a></li>
								<li><a href="javascript:void(0)" theme="green-dark"
									class="green-dark-theme">8</a></li>
								<li><a href="javascript:void(0)" theme="gray-dark"
									class="yellow-dark-theme">9</a></li>
								<li><a href="javascript:void(0)" theme="blue-dark"
									class="blue-dark-theme">10</a></li>
								<li><a href="javascript:void(0)" theme="purple-dark"
									class="purple-dark-theme">11</a></li>
								<li><a href="javascript:void(0)" theme="megna-dark"
									class="megna-dark-theme">12</a></li>
							</ul>
							<ul class="m-t-20 chatonline">
								<li><b>Chat option</b></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/varun.jpg"
										alt="user-img" class="img-circle"> <span>Varun
											Dhavan <small class="text-success">online</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/genu.jpg"
										alt="user-img" class="img-circle"> <span>Genelia
											Deshmukh <small class="text-warning">Away</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/ritesh.jpg"
										alt="user-img" class="img-circle"> <span>Ritesh
											Deshmukh <small class="text-danger">Busy</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/arijit.jpg"
										alt="user-img" class="img-circle"> <span>Arijit
											Sinh <small class="text-muted">Offline</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/govinda.jpg"
										alt="user-img" class="img-circle"> <span>Govinda
											Star <small class="text-success">online</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/hritik.jpg"
										alt="user-img" class="img-circle"> <span>John
											Abraham<small class="text-success">online</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/john.jpg"
										alt="user-img" class="img-circle"> <span>Hritik
											Roshan<small class="text-success">online</small>
									</span></a></li>
								<li><a href="javascript:void(0)"><img
										src="../../studyloop/default/plugins/images/users/pawandeep.jpg"
										alt="user-img" class="img-circle"> <span>Pwandeep
											rajan <small class="text-success">online</small>
									</span></a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /.right-sidebar -->

			</div>
			<!-- /#page-wrapper -->
			<!-- .right-sidebar -->
			<div class="right-sidebar">
				<div class="slimscrollright">
					<div class="rpanel-title">
						Service Panel <span><i class="ti-close right-side-toggle"></i></span>
					</div>
					<div class="r-panel-body">
						<ul>
							<li><b>Layout Options</b></li>
							<li>
								<div class="checkbox checkbox-info">
									<input id="checkbox1" type="checkbox" class="fxhdr"> <label
										for="checkbox1"> Fix Header </label>
								</div>
							</li>
							<li>
								<div class="checkbox checkbox-warning">
									<input id="checkbox2" type="checkbox" class="fxsdr"> <label
										for="checkbox2"> Fix Sidebar </label>
								</div>
							</li>
							<li>
								<div class="checkbox checkbox-success">
									<input id="checkbox4" type="checkbox" class="open-close">
									<label for="checkbox4"> Toggle Sidebar </label>
								</div>
							</li>
						</ul>
						<ul id="themecolors" class="m-t-20">
							<li><b>With Light sidebar</b></li>
							<li><a href="javascript:void(0)" theme="default"
								class="default-theme">1</a></li>
							<li><a href="javascript:void(0)" theme="green"
								class="green-theme">2</a></li>
							<li><a href="javascript:void(0)" theme="gray"
								class="yellow-theme">3</a></li>
							<li><a href="javascript:void(0)" theme="blue"
								class="blue-theme working">4</a></li>
							<li><a href="javascript:void(0)" theme="purple"
								class="purple-theme">5</a></li>
							<li><a href="javascript:void(0)" theme="megna"
								class="megna-theme">6</a></li>
							<li><b>With Dark sidebar</b></li>
							<br />
							<li><a href="javascript:void(0)" theme="default-dark"
								class="default-dark-theme">7</a></li>
							<li><a href="javascript:void(0)" theme="green-dark"
								class="green-dark-theme">8</a></li>
							<li><a href="javascript:void(0)" theme="gray-dark"
								class="yellow-dark-theme">9</a></li>
							<li><a href="javascript:void(0)" theme="blue-dark"
								class="blue-dark-theme">10</a></li>
							<li><a href="javascript:void(0)" theme="purple-dark"
								class="purple-dark-theme">11</a></li>
							<li><a href="javascript:void(0)" theme="megna-dark"
								class="megna-dark-theme">12</a></li>
						</ul>
						<ul class="m-t-20 chatonline">
							<li><b>Chat option</b></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/varun.jpg"
									alt="user-img" class="img-circle"> <span>Varun
										Dhavan <small class="text-success">online</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/genu.jpg"
									alt="user-img" class="img-circle"> <span>Genelia
										Deshmukh <small class="text-warning">Away</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/ritesh.jpg"
									alt="user-img" class="img-circle"> <span>Ritesh
										Deshmukh <small class="text-danger">Busy</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/arijit.jpg"
									alt="user-img" class="img-circle"> <span>Arijit
										Sinh <small class="text-muted">Offline</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/govinda.jpg"
									alt="user-img" class="img-circle"> <span>Govinda
										Star <small class="text-success">online</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/hritik.jpg"
									alt="user-img" class="img-circle"> <span>John
										Abraham<small class="text-success">online</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/john.jpg"
									alt="user-img" class="img-circle"> <span>Hritik
										Roshan<small class="text-success">online</small>
								</span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../../studyloop/default/plugins/images/users/pawandeep.jpg"
									alt="user-img" class="img-circle"> <span>Pwandeep
										rajan <small class="text-success">online</small>
								</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
		</div>
		<!-- /.container-fluid -->
		<jsp:include page="footer.jsp"/>
	</div>
	<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
	<script
		src="../../studyloop/views/login/js/login.js"></script>
	<!-- jQuery -->
	<script
		src="../../studyloop/jquery-3.4.1.js"></script>
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
	<!--weather icon -->
	<script
		src="../../studyloop/default/plugins/bower_components/skycons/skycons.js"></script>
	<!--FooTable init-->
    <script src="../../studyloop/default/js/footable-init.js"></script>
	<!--Morris JavaScript -->
	<script
		src="../../studyloop/default/plugins/bower_components/raphael/raphael-min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/morrisjs/morris.js"></script>
	<!-- jQuery for carousel -->
	<script
		src="../../studyloop/default/plugins/bower_components/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/owl.carousel/owl.custom.js"></script>
	<!-- Sparkline chart JavaScript -->
	<script
		src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.charts-sparkline.js"></script>
	<!--Counter js -->
	<script
		src="../../studyloop/default/plugins/bower_components/waypoints/lib/jquery.waypoints.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/counterup/jquery.counterup.min.js"></script>
	<!-- Magnific popup JavaScript -->
	<script
		src="../../studyloop/default/plugins/bower_components/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="../../studyloop/default/js/custom.min.js"></script>
	<script src="../../studyloop/default/js/widget.js"></script>
	<!--Style Switcher -->
	<script
		src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
	<!-- icheck -->
	<script
		src="../../studyloop/default/plugins/bower_components/icheck/icheck.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/icheck/icheck.init.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.charts-sparkline.js"></script>
	<script src="../../studyloop/default/js/cbpFWTabs.js"></script>
	<script type="text/javascript">
		(function() {
			[].slice.call(document.querySelectorAll('.sttabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});
		})();
	</script>
	    <!-- Sparkline chart JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/jquery-sparkline/jquery.charts-sparkline.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#myTable').DataTable();
        $(document).ready(function() {
            var table = $('#example').DataTable({
                "columnDefs": [{
                    "visible": false,
                    "targets": 2
                }],
                "order": [
                    [2, 'asc']
                ],
                "displayLength": 25,
                "drawCallback": function(settings) {
                    var api = this.api();
                    var rows = api.rows({
                        page: 'current'
                    }).nodes();
                    var last = null;
                    api.column(2, {
                        page: 'current'
                    }).data().each(function(group, i) {
                        if (last !== group) {
                            $(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
                            last = group;
                        }
                    });
                }
            });
            // Order by the grouping
            $('#example tbody').on('click', 'tr.group', function() {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                    table.order([2, 'desc']).draw();
                } else {
                    table.order([2, 'asc']).draw();
                }
            });
        });
    });
    </script>
    <script>
    function openAddinfoform(){
    	window.open('addinfoForm.do', '${btn_apply}', 'width=527, height=700, top=35, left=155');
    }
	function openapplication( id, sid ) {
		window.open('applyResult.do?id=' + id + '&sid=' + sid, '신청서 보기', 'width=990, height=700, top=35, left=155');
	}
    function registercancel(sid){
    	if(confirm("해당 스터디 신청을 철회 하시겠습니까?") == true){
    		location = "deleteRegister.do?sid="+sid;
    	}
    }
    function closeStudy(sid){
    	if(confirm("해당 스터디를 종료처리 하시겠습니까? 종료하시면 철회할 수 없습니다.") == true){
    		location = "closeStudy.do?sid="+sid;
    	}
    }
    </script>
</body>

</html>
