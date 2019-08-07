<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		 -->
		<!-- Favicon icon -->
		<link rel="icon" type="image/png" sizes="16x16" href="../../studyloop/default/plugins/images/favicon.png">
		
		<title>${studyDto.title}</title>
		<!-- Bootstrap Core CSS -->
		<link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
		<!-- animation CSS -->
		<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
		<!-- Menu CSS -->
		<link href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
		<!-- alerts CSS -->
		<link href="../../studyloop/default/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
		<!-- morris CSS -->
		<link href="../../studyloop/default/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
		<link href="../../studyloop/default/plugins/bower_components/css-chart/css-chart.css" rel="stylesheet">
		<!-- animation CSS -->
		<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="../../studyloop/default/css/style.css" rel="stylesheet">
		<link href="${project}css/style.css" rel="stylesheet">
		<!-- color CSS -->
		<link href="../../studyloop/default/css/colors/blue.css" id="theme" rel="stylesheet">
		<!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
	</head>
	<body class="content-wrapper bg-light">
		<!-- Preloader  -->
		<div class="preloader">
		  <div class="cssload-speeding-wheel"></div>
		</div><!-- Preloader -->
		
		<div id="page-wrapper" style="margin: 0px;">
			<div class="m-0 p-0">
				<jsp:include page="../search/upperBar.jsp" flush="false"/>
			</div>
			
		<div id="view-wrapper" class="container-fluid">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<!-- .page title -->
					<hr class="m-1">
					<h2 class="page-title p-l-20 p-r-20 text-center"><br>${studyDto.title}<br><br></h2>
					<hr class="m-0">
				<!-- /.page title -->
				</div><!-- /.col-lg-8 col-md-8 col-sm-12 col-xs-12 -->
			</div>
			
			<div class="row bg-light">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<!-- study image -->
					<br><img class="img-responsive img-rounded center-block" src="${studyDto.picture}" width="750px" alt="study_image">
				<!-- /.study image -->
				
				<!-- view nav-bar
				<div class="sttabs tabs-style-bar" style="margin-top: 5px;">
					<nav id="view-navbar" class="navbar navbar-expand-xl navbar-dark" role="navigation">
						<ul class="nav">
							<li class="nav-item"><a href="#view-navbar" id="sli" class="btn btn-lg btn-outline">${tab_summary}</a></li>
							<li class="nav-item"><a href="#info" id="ili" class="btn btn-lg btn-outline">${tab_info}</a></li>
							<li class="nav-item"><a href="#attendee" id="ali" class="btn btn-lg btn-outline">${tab_attendee}</a></li>
							<li class="nav-item"><a href="#chatlink" id="cli" class="btn btn-lg btn-outline">${tab_chat}</a></li>
							<li class="nav-item"><a href="#qna" id="qli" class="btn btn-lg btn-outline">${tab_qna}</a></li>
							
						</ul>
					</nav>
				</div> -->
				<!-- /.view nav-bar -->
				
				<br>
				<div class="white-box p-t-20">
				<div class="table-responsive p-t-10">
					<table class="table">
						<tbody class="text-dark">
						<tr id="info">
							<th width="30%">${str_studyintro}</th>
							<td><pre>${studyDto.intro}</pre></td>
						</tr>
						<tr>
							<th>${str_studyform}</th>
							<td>
								<c:choose>
									<c:when test="${studyDto.term == 0}">${str_oneday}</c:when>
									<c:when test="${studyDto.term == 1}">${str_regular}</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>${str_deadline}</th>
							<td>
								<c:if test="${studyDto.deadline != null}">
									<fmt:formatDate value="${studyDto.deadline}" type="both" pattern="yyyy-MM-dd HH:00"/>
								</c:if>
								<c:if test="${studyDto.deadline == null}">
									-
								</c:if>
							</td>
						</tr>
						<tr>
							<th>${str_process}</th>
							<td>
								<pre>${studyDto.process}</pre>
							</td>
						</tr>
						<tr>
							<th>${str_target}</th>
							<td><pre>${studyDto.target}</pre></td>
						</tr>
						<tr>
							<th>${str_curriculum}</th>
							<td>
								<c:if test="${studyDto.curriculum != null}">
									<pre>${studyDto.curriculum}</pre>
								</c:if>
								<c:if test="${studyDto.curriculum == null}">
									-
								</c:if>
							</td>
						</tr>
						<tr>
							<th>${str_cost}</th>
							<td>
								<c:if test="${studyDto.scost != null}">
									<pre>${studyDto.scost}</pre>
								</c:if>
								<c:if test="${studyDto.scost == null}">
									-
								</c:if>
							</td>
						</tr>
						<tr>
							<th>${str_location}</th>
							<td>
								${locationDto.detail_loc}&nbsp;${studyDto.place}
							</td>
						</tr>
						<tr>
							<th id="attendee">${str_curpersonnel}</th>
							<td>
								${studyDto.cur_personnel+1}
							</td>
						</tr>
						<tr>
							<th>${str_maxpersonnel}</th>
							<td>
								${studyDto.max_personnel}
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<div class="white-box">
							<h4 class="box-title fw-500">${str_attendee}${str_primiumfnc}&nbsp;&nbsp;
							<c:if test="${userDto.prime == '1'}">
								<input type="button" class="btn btn-sm btn-primary" value="${btn_rmblur}" name="rmblur">
							</c:if>
							<c:if test="${userDto.prime != '1'}">
								<input type="button" class="btn btn-sm btn-warning" value="${btn_getad}" name="getad">
								<input id="sa-close" type="button">
							</c:if>
							
							</h4>
								<div class="table-responsive pro-rd p-t-10">
								<table class="table attendee-table table-bordered color-bordered-table" style="filter: blur(5px);-webkit-filter: blur(5px);">
									<tr>
										<th style = "width: 9%">${str_order}</th>
										<th style = "width: 15%">${str_school}</th>
										<th style = "width: 15%">${str_major}</th>
										<th style = "width: 9%">${str_schoolstat}</th>
										<th style = "width: 14%">${str_career}</th>
										<th style = "width: 14%">${str_langrade}</th>
										<th style = "width: 14%">${str_certificate}</th>
										<th style = "width: 9%">${str_rate}</th>
									</tr>
									<tr>
										<td>${str_master}</td>
										<td>${masterData.school_name}</td>
										<td>${masterData.school_major}</td>
										<td>${masterData.school_status}</td>
										<td>
											<c:if test="${masterData.experience != null}">
												<c:forEach var="experience" items="${masterData.experience}" varStatus="stat">
													<c:out value="${experience}"/><br>
												</c:forEach>
											</c:if>
											<c:if test="${masterData.experience == null}">
												미입력
											</c:if>
										</td>
										<td>
											<c:if test="${masterData.lang_name != null}">
												<c:forEach var="language" items="${masterData.lang_name}" varStatus="stat">
													<c:out value="${language}"/>&nbsp;
													<c:out value="${masterData.lang_score[stat.index]}"/><br>
												</c:forEach>
											</c:if>
											<c:if test="${masterData.lang_name == null}">
												미입력
											</c:if>
										</td>
										<td>
											<c:if test="${masterData.cert_name != null}">
												<c:forEach var="certificate" items="${masterData.cert_name}" varStatus="stat">
													<c:out value="${certificate}"/>&nbsp;
													<c:out value="${masterData.cert_score[stat.index]}"/><br>
												</c:forEach>
											</c:if>
											<c:if test="${masterData.cert_name == null}">
												미입력
											</c:if>
										</td>
										<td>
											<c:if test="${masterData.rate != null}">
													<c:out value="${masterData.rate}"/>
											</c:if>
											<c:if test="${masterData.rate == null}">
												미입력
											</c:if>
										</td>
									</tr>
									<c:if test="${cntAttendee == 0}">
										<tr>
											<td colspan="8" align="center" class="bg-warning">
												${msg_emptyAttendee}
											</td>
										</tr>
									</c:if>
									<c:if test="${cntAttendee != 0}">
										<c:set var="cnt" value="${0}"/>
										<c:forEach var="dataMap" items="${dataMap}">
											<c:set var="cnt" value="${cnt + 1}"/>
											<tr>
												<td align = "center">
													${cnt}	
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.school_name != null}">
														${dataMap.value.school_name}
													</c:if>
													<c:if test="${dataMap.value.school_name == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.school_major != null}">
														${dataMap.value.school_major}
													</c:if>
													<c:if test="${dataMap.value.school_major == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.school_status != null}">
														${dataMap.value.school_status}
													</c:if>
													<c:if test="${dataMap.value.school_status == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.experience != null}">
														<c:forEach var="experience" items="${dataMap.value.experience}" varStatus="stat">
															<c:out value="${experience}"/><br>
														</c:forEach>
													</c:if>
													<c:if test="${dataMap.value.experience == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.lang_name != null}">
														<c:forEach var="language" items="${dataMap.value.lang_name}" varStatus="stat">
															<c:out value="${language}"/>&nbsp;
															<c:out value="${dataMap.value.lang_score[stat.index]}"/><br>
														</c:forEach>
													</c:if>
													<c:if test="${dataMap.value.lang_name == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.cert_name != null}">
														<c:forEach var="certificate" items="${dataMap.value.cert_name}" varStatus="stat">
															<c:out value="${certificate}"/>&nbsp;
															<c:out value="${dataMap.value.cert_score[stat.index]}"/><br>
														</c:forEach>
													</c:if>
													<c:if test="${dataMap.value.cert_name == null}">
														미입력
													</c:if>
												</td>
												<td align = "center">
													<c:if test="${dataMap.value.rate != null}">
														<c:out value="${dataMap.value.rate}"/>
													</c:if>
													<c:if test="${dataMap.value.rate == null}">
														미입력
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
								</div><!-- ./table-responsive pro-rd p-t-10 -->
							
							</div><!-- ./white-box -->
							</td>
						</tr>
						<tr>
							<th colspan="2" class="text-center">${str_comment}</th>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<i class="fas fa-quote-left"></i><br><br>
									<c:if test="${studyDto.scomment != null}">
										<pre>${studyDto.scomment}</pre>
									</c:if>
									<c:if test="${studyDto.scomment == null}">
										-
									</c:if>
								<br><i class="fas fa-quote-right"></i>
							</td>
						</tr>
						<tr>
							<th colspan="2" class="text-center">${str_locinfo}</th>
						</tr>
						<tr>
							<td colspan="2" class="text-center maptd">
								<div id="map"></div>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e0b265cbd74fd6a6b07246cad7c00a3&libraries=services">
								</script>
								
								<script>
									var mapContainer = document.getElementById('map'), 
									mapOption = {
										center : new daum.maps.LatLng(${locationDto.latitude}, ${locationDto.longitude}), 
										level : 5
									};
									
									// create map
									var map = new daum.maps.Map(mapContainer, mapOption);
									
									// create object converts address to coordinates
									var geocoder = new daum.maps.services.Geocoder();
									//var myAddress = [ "서울특별시 서초구 서초3동 서초대로 46길 42" ];
									function myMarker(number, address) {
										// search coordinates with given address
										geocoder.addressSearch(
												address, 
												function(result, status) {
													// searching complete
													if (status === daum.maps.services.Status.OK) { 
														var coords = new daum.maps.LatLng(
																//result[0].y, result[0].x
																${locationDto.latitude}, ${locationDto.longitude}
															);
														// marker marks the coordinates as the result
														var marker = new daum.maps.Marker({
																map: map, 
																position: coords
															});
														// note a explanation about the location
														var infowindow = new daum.maps.InfoWindow(
															{
																// content : '<div style="width:50px;text-align:center;padding:3px 0;">I</div>'
																content : '<div style="color:red;">' + '</div>'
															});
														//infowindow.open(map, marker);
														
														// content to be on the custom overlay : HTML string or document element
														var content = '<div class="customoverlay">'
																	+ '    <span class="title">'
																	+ '<div style="font-style:normal; color:red; font-weight:bold; font-size:1.0em">'
																	+ '</div>' + ' </span>'
																	+ '</div>';
														
														// position of custom overlay
														var position = new daum.maps.LatLng(
																result[0].y, result[0].x
															);
														
														// create custom overlay
														var customOverlay = new daum.maps.CustomOverlay(
																{
																	map : map,
																	position : position,
																	content : content,
																	yAnchor : 스터디루프
																});
														
														// move center of the map to the coordinates given as result
														map.setCenter(coords);
														}
													});
										}
									for (i = 0; i < myAddress.length; i++) {
										myMarker(i + 1, myAddress[i]);
										}
								</script>
								
								
							</td>
						</tr>
						<tr>
							<th colspan="2" class="text-center"><br>
								<input class="inputbutton btn btn-main btn-dark" type="button" value="${btn_prev}" onclick="history.back()">
								<c:if test="${cntAttendee ge sessionScope.studyDto.max_personnel}">
                                                <input class="inputbutton btn btn-main btn-mute" type="button" value="${btn_applyclosed}" disabled="disabled">
                                            </c:if>
                                            <c:if test="${cntAttendee lt sessionScope.studyDto.max_personnel}">
                                                <c:if test="${sessionScope.userDto != null}">
                                                    <input class="inputbutton btn btn-main btn-primary" type="button" value="${btn_apply}" name="apply">
                                                </c:if>
                                                <c:if test="${sessionScope.userDto == null}">
                                                    <input class="inputbutton btn btn-main btn-primary" type="button" value="${btn_apply}" onclick="return signedcheck()">
                                             </c:if>
                               </c:if>
							</th>
						</tr>
						</tbody>
					</table>
				</div><!-- ./table-responsive pro-rd p-t-10 -->
				</div><!-- ./white-box p-t-20 -->
				<br>
				
				<c:if test="${userDto.prime == '1'}">
					<!-- board box -->
					<div class="white-box p-t-20">
						<hr class="m-0">
						<h3 class="p-l-20">&nbsp;&nbsp;${tab_qna}&nbsp;${str_primiumfnc}<br><br></h3>
						<hr class="m-0">
						<div id="qna" class="text-center m-0 p-0">
							<%-- <input class="inputbutton btn btn-main btn-primary" type="button" value="${tab_qna}" onclick="openqna()"> --%>
							<jsp:include page="../board/list.jsp"></jsp:include>
						</div><!-- /#qna -->
					</div><!-- /.white-box -->
				</c:if>
					
				</div><!-- /.col-lg-8 col-md-8 col-sm-12 col-xs-12 -->
				
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 p-r-10 m-b-20">
					<div class="right-sidebar shw-rside">
					<!-- .right-sidebar -->
					<aside id="view-sidebar">
						<!-- .breadcrumb -->
						<hr class="m-0">
						<ol class="breadcrumb text-center m-0">
							<li class="active p-r-20">${tab_info}</li>
						</ol>
						<!-- /.breadcrumb -->
						<div class="slimscrollright">
							<div class="r-panel-body">
								<table class="sidebar-nav table">
									<tr>
										<th>${str_spot}</th>
										<td>${locationDto.detail_loc}</td>
									</tr>
									<tr>
										<th>${str_day}</th>
										<td><!-- ${studytimeDto.sday} -->
											<c:set var="dayList" value="${fn:split(studytimeDto.sday,'@')}"/>
											<c:forEach var="day" items="${dayList}" varStatus="daystat">
												<c:choose>
													<c:when test="${day == '0'}">월</c:when>
													<c:when test="${day == '1'}">화</c:when>
													<c:when test="${day == '2'}">수</c:when>
													<c:when test="${day == '3'}">목</c:when>
													<c:when test="${day == '4'}">금</c:when>
													<c:when test="${day == '5'}">토</c:when>
													<c:when test="${day == '6'}">일</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
												<c:if test="${!daystat.last}">,&nbsp;</c:if>
											</c:forEach> 
										</td>
									</tr>
									<tr>
										<th>${str_time}</th>
										<td>${studytimeDto.stime}</td>
									</tr>
									<tr>
										<th>${str_loc}</th>
										<td>${studyDto.place}</td>
									</tr>
									<tr>
										<th>${str_acost}</th>
										<td>
											<c:if test="${studyDto.scost != null}">
												<pre>${studyDto.scost}</pre>
											</c:if>
											<c:if test="${studyDto.scost == null}">
												-
											</c:if>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="inputbutton btn btn-side btn-kakao" type="button" value="${btn_chat}" onclick="window.open('${studyDto.chat_url}', '${str_chatwith}', 'width=550, height=550, top=150, left=350')" disabled="disabled"></input><br>
											<c:if test="${cntAttendee ge sessionScope.studyDto.max_personnel}">
												<input class="inputbutton btn btn-side btn-mute" type="button" value="${btn_applyclosed}" disabled="disabled">
											</c:if>
											<c:if test="${cntAttendee lt sessionScope.studyDto.max_personnel}">
												<c:if test="${sessionScope.userDto != null}">
													<input class="inputbutton btn btn-side btn-primary" type="button" value="${btn_apply}" name="apply">
												</c:if>
												<c:if test="${sessionScope.userDto == null}">
													<input class="inputbutton btn btn-side btn-primary" type="button" value="${btn_apply}" onclick="return signedcheck()">
												</c:if>
											</c:if>
										</td>
									</tr>
								</table>
							</div><!-- /.r-panel-body -->
						</div><!-- /.slimscrollright -->
					</aside>
					<!-- /.right-sidebar -->
					</div><!-- /.white-box -->
					
				</div><!-- /.col-lg-4 col-md-4 col-sm-12 col-xs-12 p-r-10 m-b-20 -->
			</div><!-- /.row -->
			
			<div class="m-0 p-0">
				<jsp:include page="../search/footer.jsp" flush="false"/>
			</div>
		
		</div><!-- /.container-fluid -->
		</div><!-- /#page-wrapper -->


		<!-- jQuery -->
		<script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
		<script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="../../studyloop/default/bootstrap/js/carousel.js"></script>
		<script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
		<!-- Menu Plugin JavaScript -->
		<script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
		<!-- slimscroll JavaScript -->
		<script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
		<!--Wave Effects -->
		<script src="../../studyloop/default/js/waves.js"></script>
		<!-- Sweet-Alert  -->
		<script src="../../studyloop/default/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
		<script src="../../studyloop/default/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
		<!-- Custom Theme JavaScript -->
		<script src="../../studyloop/default/js/custom.min.js"></script>
		<!--Style Switcher -->
		<script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
		
		<!-- Custom -->
		<script src="${project}js/script.js"></script>
		<!-- FontAwesome -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
		<!-- for Board -->
		<script src="../../studyloop/default/plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
		
		<script>
			$( document ).ready( function() {
				var navOffset = $( '.navbar' ).offset();
				var sideOffset = $( '.right-sidebar' ).offset();
				
				// hide fake button
				$( "#sa-close" ).hide();
				
				// scroll event
				$( window ).scroll( function() {
					/* if ( $( document ).scrollTop() > navOffset.top ) {
						$( '.navbar' ).addClass( 'sticky-top' );
						}
					else {
						$( '.navbar' ).removeClass( 'sticky-top' );
						} */
					if ( $( document ).scrollTop() > sideOffset.top ) {
						$( '.right-sidebar' ).addClass( 'sticky-right' );
						}
					else {
						$( '.right-sidebar' ).removeClass( 'sticky-right' );
						}
					});
				
				// remove blur
				$("input[name=rmblur]").on( 
					"click", 
					function( event ) {
						$( ".attendee-table" ).removeAttr("style");
					}
				);
				
				
				// provide (virtual) advertisement
				$("input[name=getad]").on( 
					"click", 
					function(event) {
						if (adcheck() == true) {
							$("#sa-close").click();
							alert(pointcheck);
							$(".attendee-table").removeAttr("style");
						}
				});

				// check user already applied
				$("input[name=apply]").on("click", function(event) {
					$.ajax({
						type : "POST",
						url : "<c:url value='/getMineApplied.do'/>",
						data : {
							"user_id" : "${sessionScope.userDto.id}",
							"study_id" : "${sessionScope.studyDto.id}"
						},
						success : function(data) {
							if (data == "mystudy") {
								alert("자신이 주최한 스터디는 참여할 수 없습니다.");
							} else if (data == "exist") {
								alert("이미 참여 신청한 스터디입니다.");
							} else if (data == "joinable") {
								openapplyform();
							} else {
								alert("DB 처리에 실패했습니다.");
							}
						},
						error : function(e) {
							alert(e);
						}
					});
				});

			});
		</script>
		
	</body>
</html>
