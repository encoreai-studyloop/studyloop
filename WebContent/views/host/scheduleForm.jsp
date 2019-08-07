<%@page import="java.util.ArrayList"%>
<%@page import="databean.LocationDataBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src = "${project}script.js"></script>
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" type="image/png" sizes="16x16"
   href="../../studyloop/plugins/images/favicon.png">
<title>StudyLoop_HostSchedule</title>
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
<script src="${project}script.js"></script>
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
            style="background: url(../plugins/images/heading-title-bg.jpg) no-repeat center center/cover;">
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
                  <h3 class="box-title m-b-0">스터디 스케줄 페이지</h3>
                  <p class="text-muted m-b-30 font-13">장소, 비용, 시간(요일, 시간, 날짜 선택 가능), 추가코멘트</p>
                  <div class="row">
                     <div class="col-sm-12 col-xs-12">
                        <form id="scheduleform" name="scheduleform" method="post" action="sregister.do" enctype="multipart/form-data" onsubmit="return schedulecheck()">
                           <div class="row">
                              <div class="col-md-12">
                                 <label for="category">*스터디 장소</label>
                              </div><br><br>
                         
                              &nbsp;<div class="col-md-3">
                              	<div class="form-group">    
                              <c:if test="${!empty locDtoList}"> 	
                              <select name="location" id="selectBox" class="city">
                              <option value="" disabled selected>스터디 장소를 선택해주세요</option>
								  <optgroup label="서울">
								  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
								  	<c:if test="${locDto.state_city == '서울'}">
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
								  
								  <optgroup label="경기">
								  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
								  	<c:if test="${locDto.state_city =='경기'}">
								   <option value="${locDto.id}">${locDto.detail_loc}</option> 
								   </c:if>
								    </c:forEach>
								  </optgroup>
								  
								  <optgroup label="인천">
								  <c:forEach var="locDto" items="${locDtoList}" varStatus="i">
								  	<c:if test="${locDto.state_city == '인천'}">
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
												<input class="form-control" name="spelocation"
													id="spelocation" type="text"
													placeholder="구체적인 스터디장소를 기입해주세요 (ex.강남역 파스쿠찌)">
												</div> 
                                 </div>
                              </div>     
                           </div>

                           <div class="row">
                              <div class="col-md-12">
                                 <label class="control-label">*회비</label>
                              </div>
                              <div class="col-md-6">
                                 <div class="form-group">
                                    <!--    <label class="control-label">회비 유무</label> -->
                                    <div class="radio-list">
                                       <label class="radio-inline p-0">
                                          <div class="radio radio-info">
                                             <input name="scostopt" id="radio1" type="radio" value="opt1"> 
                                             <label for="radio1">있음</label>
                                          </div>
                                       </label> 
                                       <label class="radio-inline">
                                          <div class="radio radio-info">
                                             <input name="scostopt" id="radio2" type="radio"value="opt2"> 
                                             <label for="radio2">없음</label>
                                          </div>
                                       </label>
                                    </div>
                                 </div>
                              </div>
                              
                              <div class="col-md-6">
                                 <div class="form-group">
                                    <div class="input-group">
                                       <div class="input-group-addon">￦</div>
                                       <input class="form-control" name=scost id="studyHostInform" type="text" placeholder="예상비용을 기입해주세요">
                                    </div>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="form-group row">
                              <label class="col-2 col-form-label" for="example-time-input">*스터디 요일</label>
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

                           <div class="form-group row">
                              <label class="col-2 col-form-label" for="example-time-input">*스터디 시간</label>
                              <div class="col-10">
                                 <input class="form-control" name="stime" id="example-time-input" type="time" value="13:45:00">
                              </div>
                           </div>

                           <div class="form-group row">
                              <label class="col-2 col-form-label" for="example-date-input">*스터디 시작일</label>
                              <div class="col-10">
                                 <input class="form-control" name="sdate" id="example-date-input" type="date" value="2019-08-19">
                              </div>
                           </div>

                           <div class="form-group">
                              <label for="comment">추가코멘트</label>
                              <div class="input-group">
                                 <div class="input-group-addon">
                                    <i class="ti-book"></i>
                                 </div>
                                 <textarea class="form-control" name="scomment" placeholder="(선택사항) 장소, 일정 등에 관한 추가 코멘트를 작성해주세요"></textarea>
                              </div>
                           </div>

                           <input class="btn btn-warning waves-effect waves-light m-r-10"
                              type="button" onclick="backtoprev()" value="이전 단계로">
                           <input class="btn btn-info waves-effect waves-light m-r-10" type="submit" value="등록" onclick="registeralert();"> 
                           <input class="btn btn-inverse waves-effect waves-light" type="reset" value="취소">
                           
                           <script type="text/javascript">
                           		function registeralert(){
                           			alert("새 스터디 등록이 완료되었습니다.");
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
   


	<script>
	function backtoprev(){
		history.go(-1);
	}
	</script>

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