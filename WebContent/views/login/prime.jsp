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
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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

</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="cssload-speeding-wheel"></div>
	</div>
	<div id="wrapper">
		<!-- 상단바 -->
		<jsp:include page="../search/upperBar.jsp" flush="false" />
		

	      <!-- Page Content -->
            <div class="container-fluid text-center">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Pricing page</h4> </div>
 
                </div>
                <!-- /.row -->
                <!-- .row -->
    
                        <div class="white-box text-center">
                            <div class="row pricing-plan">
                                <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                    <div class="pricing-box b-l">
                                        <div class="pricing-body">
                                            <div class="pricing-header">
                                                <h4 class="text-center">Basic</h4>
                                                <h2 class="text-center"><span class="price-sign"></span>무료</h2>
                                                <p class="uppercase"></p>
                                            </div>
                                            <div class="price-table-content">
                                                <div class="price-row"><i class="icon-user"></i> 스터디 정보 보기만 가능</div>
                                                <div class="price-row"><i class="icon-screen-smartphone"></i> 게시판 이용 불가능</div>
                                                <div class="price-row"><i class="icon-drawar"></i> 달력 기능 사용 불가능</div>
                                                <div class="price-row"><i class="icon-refresh"></i> 실시간 알림 이용 불가능</div>
                                                <div class="price-row">
                                                    <button class="btn btn-success waves-effect waves-light m-t-20" onclick="location='main.do'">그대로 유지</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-xs-12 col-sm-6 no-padding">
                                    <div class="pricing-box featured-plan">
                                        <div class="pricing-body">
                                            <div class="pricing-header">
                                                <h4 class="price-lable text-white bg-warning"> 인기</h4>
                                                <h4 class="text-center">Premium</h4>
                                                <h2 class="text-center"><span class="price-sign">월 ￦</span> 9,900</h2>
                                                
                                            </div>
                                            <div class="price-table-content">
                                                <div class="price-row"><i class="icon-user"></i>스터디 참가자 조회</div>
                                                <div class="price-row"><i class="icon-screen-smartphone"></i>스터디 게시판 이용</div>
                                                <div class="price-row"><i class="icon-drawar"></i> 달력 기능 사용</div>
                                                <div class="price-row"><i class="icon-refresh"></i> 실시간 알림 기능 이용</div>
                                                <div class="price-row">
                                                    <button id="gopay" class="btn btn-lg btn-info waves-effect waves-light m-t-20">결제하기</button>
                                                </div>
                                            </div>
                                        </div>
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
							alt="user-img" class="img-circle"> <span>Arijit Sinh
								<small class="text-muted">Offline</small>
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



	<jsp:include page="../search/footer.jsp" flush="false" />
	</div>
	<!-- /#page-wrapper -->

	<!-- /#wrapper -->
	<!-- jQuery -->

	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jscroll/2.4.1/jquery.jscroll.js"></script>
	<script type="text/javascript">
		$(document).ready(function () { 
			$('#autoScroll').jscroll({ 
				autoTrigger: true, 
				loadingHtml: '<div class="next"><img src="./images/loading.gif" alt="Loading" /></div>', 
				nextSelector: 'a.nextPage:last' 
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

	<script src="../../studyloop/default/js/cbpFWTabs.js"></script>
	<!-- payment module -->
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script type="text/javascript">
		(function() {
			[].slice.call(document.querySelectorAll('.sttabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});
		})();
		
		$("#gopay").click( 
			function() {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp40415350');
				// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				// 'import 관리자 페이지 -> 내정보 -> 가맹점식별코드
				IMP.request_pay({
					// kakao
					pg: 'kakao', // version 1.1.0부터 지원.
					pay_method: 'card', 
					// https://docs.iamport.kr/implementation/payment
					merchant_uid: 'merchant_' + new Date().getTime(), 
					// 결제창에서 보여질 이름
					name: '스터디루프 프리미엄 이용권', 
					// 가격
					amount: 8900,
					buyer_email: 'encore-ai@encore.com', 
					buyer_name: '스터디장', 
					buyer_tel: '010-1234-5678', 
					buyer_addr: '서울특별시 강남구 삼성동', 
					buyer_postcode: '123-456', 
					m_redirect_url: '/studyloop/setPrime.do?id=' + ${userDto.getId()}
					}, 
					function(rsp) { 
						console.log(rsp);
						if (rsp.success) { 
							var msg = '결제가 완료되었습니다.\n\n';
							msg += '고유ID : ' + rsp.imp_uid + '\n';
							msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
							msg += '결제 금액 : ' + rsp.paid_amount + '\n';
							msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
							alert("결제가 완료되었습니다.\n프리미엄 혜택 적용을 위해 재 로그인 해주세요")
							location = "/studyloop/setPrime.do?id=" + ${userDto.getId()}
						} else { 
							var msg = '결제에 실패했습니다.\n';
							msg += '에러내용 : ' + rsp.error_msg;
							alert(msg);
						}
					}
				);
			});
		
	</script>
</body>

</html>
