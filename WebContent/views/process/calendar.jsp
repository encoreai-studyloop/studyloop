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
<!-- Calendar CSS -->
<link
	href="../../studyloop/default/plugins/bower_components/calendar/dist/fullcalendar.css"
	rel="stylesheet" />
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
		<jsp:include page="../search/upperBar.jsp" />
		<!-- Page Content -->
		<div class="container-fluid">
			<div class="row bg-title">
				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
					<h4 class="page-title">Calendar Page</h4>
				</div>
				<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
					<ol class="breadcrumb">
						<li class="active">Calendar Page</li>
					</ol>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-md-3">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="white-box">
								<h3 class="box-title">스터디 참여자 </h3>
								<div class="table-responsive">
									<table class="table color-table primary-table">
										<thead>
											<tr>	
												<th>스터디장</th>										
												<th>이름</th>
												<th>닉네임</th>										
											</tr>
										</thead>
										<tbody>
											<c:forEach var="userDto" items="${userDtoList}">
											<tr>
												<c:if test="${userDto.email == null }">
												<td></td>
												</c:if>
												<c:if test="${userDto.email != null }">												
												<td>주최자</td>
												</c:if>
												<td>${userDto.name}</td>
												<td>${userDto.nick}</td>							
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

						</div>

					<div class="white-box">
						<h3 class="box-title">끌어서 이벤트를 추가해 보세요.</h3>
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div id="calendar-events" class="m-t-20">
									<div class="calendar-events" data-class="bg-info">
										<i class="fa fa-circle text-info"></i> My Event One
									</div>
									<div class="calendar-events" data-class="bg-success">
										<i class="fa fa-circle text-success"></i> My Event Two
									</div>
									<div class="calendar-events" data-class="bg-danger">
										<i class="fa fa-circle text-danger"></i> My Event Three
									</div>
									<div class="calendar-events" data-class="bg-warning">
										<i class="fa fa-circle text-warning"></i> My Event Four
									</div>
								</div>
								<!-- checkbox -->
								<div class="checkbox">
									<input id="drop-remove" type="checkbox"> <label
										for="drop-remove"> 끌어서 삭제하기 </label>
								</div>
								<a href="#" data-toggle="modal" data-target="#add-new-event"
									class="btn btn-lg m-t-40 btn-danger btn-block waves-effect waves-light">
									<i class="ti-plus"></i> 새 이벤트 추가
								</a>
								<button class="schedulesave btn btn-info">일정 저장</button> 
								<button class="btn btn-success" onclick="location='mypage.do'">마이페이지로 돌아가기</button> 
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					
					<input type="hidden" id="study_id" value="${study_id}">
					<div class="white-box">
						<div id="calendar"></div>
					</div>
					
				</div>
			</div>
			<!-- /.row -->
			<!-- BEGIN MODAL -->
			<div class="modal none-border" id="my-event">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">
								<strong>이벤트 추가</strong>
							</h4>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-white waves-effect"
								data-dismiss="modal">닫기</button>
							<button type="button"
								class="btn btn-success save-event waves-effect waves-light">이벤트
								생성</button>
							<button type="button"
								class="btn btn-danger delete-event waves-effect waves-light"
								data-dismiss="modal">삭제</button>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal Add Category -->
			<div class="modal fade none-border" id="add-new-event">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">
								<strong>추가</strong> a category
							</h4>
						</div>
						<div class="modal-body">
							<form role="form">
								<div class="row">
									<div class="col-md-6">
										<label class="control-label">카테고리 분류</label> <input
											class="form-control form-white" placeholder="Enter name"
											type="text" name="category-name" />
									</div>
									<div class="col-md-6">
										<label class="control-label">카테고리 색 선택</label> <select
											class="form-control form-white"
											data-placeholder="Choose a color..." name="category-color">
											<option value="success">출석</option>
											<option value="danger">모임</option>
											<option value="info">개인과제</option>
											<option value="primary">단체과제</option>
											<option value="warning">자료준비</option>
											<option value="inverse">기타</option>
										</select>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-danger waves-effect waves-light save-category"
								data-dismiss="modal">Save</button>
							<button type="button" class="btn btn-white waves-effect"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- END MODAL -->
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
		<div class="jumbotron text-center" style="margin-bottom: 0">
			<p>Footer</p>
		</div>
		<footer class="footer text-center"> 2017 &copy; Elite Admin
			brought to you by themedesigner.in </footer>
	</div>
	<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
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
	<!-- Calendar JavaScript -->
	<script
		src="../../studyloop/default/plugins/bower_components/calendar/jquery-ui.min.js"></script>
	<script
		src="../../studyloop/default/plugins/bower_components/moment/moment.js"></script>
	<script
		src='../../studyloop/default/plugins/bower_components/calendar/dist/fullcalendar.js'></script>
	<script
		src="../../studyloop/default/plugins/bower_components/calendar/dist/cal-init.js"></script>

	<script src="../../studyloop/default/js/cbpFWTabs.js"></script>

	<script>
    jQuery("button.schedulesave").click(function() {
    	var eventlist = $("#calendar").fullCalendar('clientEvents')
    	var event = []
    	var ids = JSON.parse(localStorage.getItem("ids"));
    	console.log(eventlist)
    	$.each(eventlist, function(i, obj) {
    		start=moment(obj.start).format('Y-MM-DD HH:mm:ss');
    		end=moment(obj.end).format('Y-MM-DD HH:mm:ss'); 

           	event.push({id : obj.id, title: obj.title, start: start, end: end, className : obj.className[0], allDay: obj.allDay});
        
        });   	
		var jsonData = JSON.stringify(event);		
		jQuery.ajaxSettings.traditional = true;
        $.ajax({
            url: "/studyloop/updatecalendar.do",
            type: "POST",
            data: { 
            		calendarDate:$('#calendar').fullCalendar('getDate').format('YYYYMMDD'),
            		study_id : $('#study_id').val(),
            		events : jsonData,
            		ids : ids
            	  },
            success: function(data){
                    location="calendar.do?sid="+data
           
            },
            error:function(request,status,error){
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
           });
    });


		(function() {
			[].slice.call(document.querySelectorAll('.sttabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});
		})();
	</script>

</body>

</html>
