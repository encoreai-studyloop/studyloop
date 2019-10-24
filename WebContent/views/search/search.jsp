<%@page import="databean.LocTmpDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="databean.CategoryDataBean"%>
<%@page import="databean.StudyDataBean"%>
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
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<link rel="icon" type="image/png" sizes="16x16"
		href="../plugins/images/favicon.png">
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
	.form-group input[type="checkbox"] {
		display: none;
	}
	
	.form-group input[type="checkbox"]+.btn-group>label span {
		width: 20px;
	}
	
	.form-group input[type="checkbox"]+.btn-group>label span:first-child {
		display: none;
	}
	
	.form-group input[type="checkbox"]+.btn-group>label span:last-child {
		display: inline-block;
	}
	
	.form-group input[type="checkbox"]:checked+.btn-group>label span:first-child
		{
		display: inline-block;
	}
	
	.form-group input[type="checkbox"]:checked+.btn-group>label span:last-child
		{
		display: none;
	}
	</style>
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
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">지역으로 검색해보세요</h4>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<div class="white-box">
				<!-- 지역 체크 부분 -->
				<form name="loclistform" method="get" action="search.do">
				<div class="[ form-group ]">
					<%
						List<LocTmpDataBean> locationList = (List<LocTmpDataBean>) request.getAttribute("locationList");
						int num = 0;
						for (int i = 0; i < locationList.size(); i++) {
							LocTmpDataBean loc = locationList.get(i);
					%>
					<input type="checkbox" name="loclist"
						id="fancy-checkbox-primary<%=++num%>" autocomplete="off" value="<%=loc.getDetail_loc()%>"/>
					<div class="[ btn-group ]"
						style="padding-top: 10px; padding-right: 10px; padding-bottom: 20px;">
						<label for="fancy-checkbox-primary<%=num%>"
							class="[ btn btn-primary ]"> <span
							class="[ glyphicon glyphicon-ok ]"></span> <span> </span>
						</label> 
						<label for="fancy-checkbox-primary<%=num%>"
							class="[ btn btn-default active ]"> <%=loc.getDetail_loc()%> (<%=loc.getNum()%>)
						</label>
					</div>
					<%
						}
					%>
					<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">원하는 요일을  선택해보세요</h4>
				</div>
				</div>
					  <div class="form-group row">
                              
                              <div class="col-sm-10">
                                 <div class="form-check">
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="0"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">월</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="1"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">화</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="2"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">수</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="3"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">목</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="4"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">금</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="5"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">토</span>
                                    </label> 
                                    <label class="custom-control custom-checkbox"> 
                                       <input class="custom-control-input" name="sday" type="checkbox" value="6"> 
                                       <span class="custom-control-indicator"></span> 
                                       <span class="custom-control-description">일</span>
                                    </label> 
                                 </div>
                              </div>
                           </div>
					<div class="pull-right" style="padding-top: 80px;">
						<button class="btn btn-block btn-outline btn-info" type="submit" >선택한 옵션으로 검색하기</button>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">스터디 검색 결과</h4>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /content -->
		</div>

		<!-- 검색결과 -->
		<div class="filter_head">
			<%
				List<StudyDataBean> studyDtoList = (List<StudyDataBean>) request.getAttribute("studyDtoList");
				int cnt = studyDtoList.size();
			%>
			<div class="num_class"
				style="padding-left: 1400px; padding-bottom: 50px"><%=cnt%> 개의 수업이 있습니다 <br> <br>
				정렬 : <select name="sortoption" onchange="sortByoption(this)">
					<option value="0">정렬기준선택</option>
					<option value="1">프리미엄 순</option>
					<option value="2">최신등록 순</option>
					<option value="3">마감임박 순</option>
				</select>
			</div>

			<div class="cards-box"
				style="padding-left: 70px; padding-right: 70px;" id="autoScroll">
				<div class="inner-box">
					<%
				if(studyDtoList.size() ==0 ){
					%>
					검색 결과가 없습니다.
					<%
				}
				else{
					for (int i = 0; i < studyDtoList.size(); i++) {
						StudyDataBean studyDto = studyDtoList.get(i);
					%>
					
				<div class="col-md-4" style="padding-bottom: 10px">
                     <div class="card mb-2">
                     		<%
                     		if(studyDto.getPrime().equals("1")){
                     			%>
                     			<div class="ribbon ribbon-bookmark ribbon-vertical-l ribbon-info ribbon-longer" >
	                           	<i class="fa fa-star"></i>
	                        	</div>
                     			<%
                     		}
                     		else{
                     		}
                     		if(studyDto.getTerm().equals("1")){
                     		}
                     		else{
                     			%>
                     			<div class="ribbon ribbon-right ribbon-default">1DAY</div>
                     			<%
                     		}
                     		%>
	                            <div class="pro-content-3-col">
	                            	                        <img class="content-3-col-md-1"  style='height: 300px; width: 100%; object-fit: contain'
                           src="<%=studyDto.getPicture()%>"
                           alt="Card image cap">
	                                <div class="pro-list-details" >
	                                <h4>
	                                	<a class="text-dark" href="view.do?sid=<%=studyDto.getId()%>"><strong><%=studyDto.getTitle()%></strong></a>
	                                </h4>
	                                <h4 class="text-danger"><small><%=studyDto.getLocation()%></small></h4> 
	                                </div>
	                            </div>
	                            	<hr class="m-0"> <span class="label pro-col-label label-white text-dark">OPEN</span>
	                            <div class="pro-list-info-3-col">
	                            	<div class="term" style="padding-bottom:5px; padding-left:10px;">
	                            		<span><i class="fa fa-check-circle"></i></span>&nbsp;
	                                    <span><b><%=studyDto.getIntro()%></b></span>
	                                </div>    	
	                                <div class="deadline" style="padding-bottom:5px; padding-left:10px;">
	                                	<span><i class="fa fa-calendar"></i></span>&nbsp;
										<%
										SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
	                                	if(studyDto.getDeadline() != null){
	                                		%>
	                                		<span><b><%=sf.format(studyDto.getDeadline())%> 모집 마감 </b></span>
	                                		<%
	                                	}
	                                	else{
	                                		%>
	                                		<span><b>제한 없음</b></span>
	                                		<%
	                                	}
	                                	%>
	                 
	                                </div>
	                                <div class="users" style="padding-bottom:5px; padding-left:10px;">
	                                	<span><i class="fa fa-users"></i></span>&nbsp;
	                                    <span><b>참석인원 : <%=studyDto.getCur_personnel()%>/<%=studyDto.getMax_personnel()%></b></span>
	                                </div>
	                                <div class="users" style="padding-bottom:5px; padding-left:10px;">
	                                	<span><i class="fa fa-users"></i></span>&nbsp;
	                                    <span><b>나와의 일치도 : <%=studyDto.getEst_rate()%></b></span>
	                                </div>
	                            </div>
	                      
                    	</div>

                  </div>   
					
					<%
						}
					}
					%>
				</div>
			</div>

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
								class="default-theme working">1</a></li>
							<li><a href="javascript:void(0)" theme="green"
								class="green-theme">2</a></li>
							<li><a href="javascript:void(0)" theme="gray"
								class="yellow-theme">3</a></li>
							<li><a href="javascript:void(0)" theme="blue"
								class="blue-theme">4</a></li>
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
									src="../plugins/images/users/varun.jpg" alt="user-img"
									class="img-circle"> <span>Varun Dhavan <small
										class="text-success">online</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/genu.jpg" alt="user-img"
									class="img-circle"> <span>Genelia Deshmukh <small
										class="text-warning">Away</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/ritesh.jpg" alt="user-img"
									class="img-circle"> <span>Ritesh Deshmukh <small
										class="text-danger">Busy</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/arijit.jpg" alt="user-img"
									class="img-circle"> <span>Arijit Sinh <small
										class="text-muted">Offline</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/govinda.jpg" alt="user-img"
									class="img-circle"> <span>Govinda Star <small
										class="text-success">online</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/hritik.jpg" alt="user-img"
									class="img-circle"> <span>John Abraham<small
										class="text-success">online</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/john.jpg" alt="user-img"
									class="img-circle"> <span>Hritik Roshan<small
										class="text-success">online</small></span></a></li>
							<li><a href="javascript:void(0)"><img
									src="../plugins/images/users/pawandeep.jpg" alt="user-img"
									class="img-circle"> <span>Pwandeep rajan <small
										class="text-success">online</small></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
		</div>



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


	<!-- footer -->
	<jsp:include page="footer.jsp" flush="false" />

	<!-- /#page-wrapper -->

	<!-- /#wrapper -->
	<!-- jQuery -->

	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#autoScroll')
									.jscroll(
											{
												autoTrigger : true,
												loadingHtml : '<div class="next"><img src="./images/loading.gif" alt="Loading" /></div>',
												nextSelector : 'a.nextPage:last'
											});
						});
	</script>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.min.js"></script>
	<script src="../../studyloop/default/js/cbpFWTabs.js"></script>
	<script type="text/javascript">
		(function() {
			[].slice.call(document.querySelectorAll('.sttabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});
		})();
	</script>
	<script>
	function sortByoption(opt){
		if(opt.value !='0'){
			location="search.do?sort="+opt.value	
		}
	}
	</script>
</body>

</html>
