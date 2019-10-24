<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${userDto != null and userDto.getPrime() == '1'}">
<input id="myId" type="hidden" value="${userDto.getId()}">
<jsp:include page="../notice/webSocket.jsp"/>
</c:if>

<script src="../../studyloop/views/search/js/search.js"></script>
<link href="../../studyloop/default/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
<!-- Top Navigation -->
 <!-- Start an Alert -->
 <div id="alerttopright" class="myadmin-alert myadmin-alert-img alert-info myadmin-alert-top-right"> 
 	<img src="../plugins/images/users/genu.jpg" class="img" alt="img">
 		<a href="#" class="closed">&times;</a>
</div>
<nav class="navbar navbar-default navbar-static-top m-b-0">
	<div class="navbar-header" style="padding-left: 20px">
		<ul class="nav navbar-top-links navbar-left pull-left">
			<li class="nav-item"><a href="main.do"><img alt="logo" src="../../studyloop/views/search/images/logotp.png" style="width: 100px; height: 50px"></a></li>
			<li>
				<form role="search" class="app-search hidden-xs" name="searchform" action="search.do">
                    <input type="text" placeholder="참여하고 싶은 수업을 검색해보세요!"
                        class="form-control" name="searchVal"> <a href="javascript:void(0);" onclick="searchByKeyword()"><i
                        class="fa fa-search"></i></a>
                </form>
			</li>
		</ul>
		<ul class="nav navbar-top-links navbar-right pull-right">
			<li class="nav-item"><a class="nav-link" href="live_chat.do" target="_blank">실시간 문의</a></li>		
			<li class="nav-item"><a class="nav-link" href="service_intro.do">서비스 소개</a></li>
			<c:if test="${userDto == null }">
				<li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="register.do">회원
					가입</a></li>
			</c:if>
			<c:if test="${userDto != null }">
				<li class="nav-item"><a class="nav-link" href="titleForm.do">스터디 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
				<li class="dropdown"><a
					class="dropdown-toggle waves-effect waves-light"
					data-toggle="dropdown" href="#"><i class="icon-envelope"></i>
						<div class="notify">
						</div> </a>

					<ul class="dropdown-menu mailbox animated flipInY">
						<li>
							<div class="drop-title"></div>
						</li>
						<li>
							<div class="message-center">
							</div>
						</li>
						<li><a class="text-center" href="javascript:deleteAllnotification()"> <strong>모든 알림 삭제</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
	
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle profile-pic"
					data-toggle="dropdown" href="#"><b
						class="hidden-xs">${userDto.getNick()} 님</b>
				</a>
					<ul class="dropdown-menu dropdown-user animated flipInY">
						<li><a href="mypage.do?id=${userDto.getId()}"><i class="ti-user"></i> 마이페이지</a></li>
						<li><a href="reportForm.do"><i class="ti-wallet"></i> 신고하기</a></li>
					
						<li role="separator" class="divider"></li>
						<li role="separator" class="divider"></li>
						<li><a href="logout.do"><i class="fa fa-power-off"></i> 로그아웃</a></li>
					</ul> <!-- /.dropdown-user --></li>
				
				<!-- /.dropdown -->
			</c:if>
		</ul>
	</div>
	<!-- /.navbar-header -->
	<!-- /.navbar-top-links -->
	<!-- /.navbar-static-side -->
</nav>
<!-- End Top Navigation -->
	<script src="../studyloop/jquery-3.4.1.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
    <script src="../../studyloop/default/js/toastr.js"></script>
    <script>   
    //Alerts
    $(".myadmin-alert .closed").click(function(event) {
        $(this).parents(".myadmin-alert").fadeToggle(350);
        return false;
    });
    /* Click to close */
    $(".myadmin-alert-click").click(function(event) {
        $(this).fadeToggle(350);
        return false;
    });
    
    function deleteAllnotification(){
		$('.message-center').html("도착한 알람이 없습니다.");
		$('.drop-title').html(0 +' 개의 알람이 있습니다.')
		$('.notify').html('')
    }
   
    </script> 