<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="dbbean.HostDBBean"%>
<%@include file="setting.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src = "${project}script.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- <meta charset="utf-8"> -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

<link rel="icon" type="image/png" sizes="16x16"
   href="../../studyloop/default/plugins/images/favicon.png">
<title>StudyLoop_HostTitle</title>
<!-- Bootstrap Core CSS -->
<link
   href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css"
   rel="stylesheet">
<link
   href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css"
   rel="stylesheet">
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
      
         <div class="row">
            <div class="col-md-12">
               <div class="white-box">
                  <h3 class="box-title m-b-0">스터디 타이틀 페이지</h3>
                  <p class="text-muted m-b-30 font-13">제목, 이미지, 카테고리, 형태(원데이,정기스터디)</p>
                  <div class="row">
                     <div class="col-sm-12 col-xs-12">
                        <form name="titleform" id="titleform" method="post" action="infoForm.do" enctype="multipart/form-data" onsubmit="return titlecheck()">
                           <div class="form-group">
                              <label for="studyHostInform">*스터디 이름</label>
                              <div class="input-group">
                                 <div class="input-group-addon">
                                    <i class="ti-book"></i>
                                 </div>
                                 <input class="form-control" id="studyHostInform" type="text" name="title"
                                    placeholder="스터디 이름을 설정해주세요">
                              </div>
                           </div>
  
                           <label for="imageEnroll">*이미지 등록</label>
                           <!--   <form class="form-horizontal"> -->
                           <div class="form-group">
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
                                       <input name="picture" type="file"></span> 
                                       <a class="input-group-addon btn btn-default fileinput-exists" href="#" data-dismiss="fileinput">Remove</a>
                                 </div>
                              </div>
                           </div>
                       
                           <div class="row">
                              <div class="col-md-12">
                                 <label for="category">*카테고리 선택</label>
                              </div>    
                                <div class="col-md-4">
                              	<div class="form-group">
                              	 <c:if test="${!empty catDtoList}"> 
                             		<select name="category" id="selectBox">
                             		<option value="" disabled selected>카테고리를 선택해주세요</option>
									  <optgroup label="<취업>">
									   	<optgroup label="대기업">
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('대기업')}">
									     		
									     		<option value="${catDto.id}">${catDto.small}</option>
											</c:if>
										</c:forEach>
									    </optgroup>
									    <optgroup label="공기업">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('공기업')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									  </optgroup>
									   <optgroup label="중소기업">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('중소기업')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									   <optgroup label="공무원">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('공무원')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									   </optgroup>
									  </optgroup>
									  
									  <optgroup label="<어학>">
									  <optgroup label="영어">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('영어')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									  </optgroup>
									   <optgroup label="중국어">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('중국어')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									  </optgroup>
									   <optgroup label="일본어">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('일본어')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									  </optgroup>
									   <optgroup label="독일어">									 
									     <c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									     	<c:if test="${catDto.middle.equals('독일어')}">
									     		<option value="${catDto.id}">${catDto.small}</option>
									     	</c:if>
									     </c:forEach>
									  </optgroup>
									  </optgroup>
									
									  <optgroup label="<자격증>">
									  	<optgroup label="컴퓨터">
										  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
										  		<c:if test="${catDto.middle.equals('컴퓨터')}">
										  			<option value="${catDto.id}">${catDto.small}</option>
										  		</c:if>
										  	</c:forEach>	
									  	</optgroup>
									  		<optgroup label="사회">
										  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
										  		<c:if test="${catDto.big.equals('자격증') && catDto.middle.equals('사회')}">
										  			<option value="${catDto.id}">${catDto.small}</option>
										  		</c:if>
										  	</c:forEach>	
									  	</optgroup>
									  		<optgroup label="요리">
											  	<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
											  		<c:if test="${catDto.middle.equals('요리')}">
											  			<option value="${catDto.id}">${catDto.small}</option>
											  		</c:if>
											  	</c:forEach>	
										  	</optgroup>
									  </optgroup>
							
									  <optgroup label="<전공>">
									  	<optgroup label="공학">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.middle.equals('공학')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  	<optgroup label="인문">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.middle.equals('인문')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  	<optgroup label="사회">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.big.equals('전공') && catDto.middle.equals('사회')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  	<optgroup label="자연과학">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.middle.equals('자연과학')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  </optgroup>
									  <optgroup label="<기타>">
									  	<optgroup label="회화">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.middle.equals('회화')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  	<optgroup label="운동">
									  		<c:forEach var="catDto" items="${catDtoList}" varStatus="i">
									  			<c:if test="${catDto.middle.equals('운동')}">
									  				<option value="${catDto.id}">${catDto.small}</option>
									  			</c:if>
									  		</c:forEach>
									  	</optgroup>
									  </optgroup>
									</select>
									</c:if>
								</div>
                              </div>
                                 
              
                            <div class="col-md-4"></div>
                             <div class="col-md-4"></div> 
                              <div class="col-md-4">
                                 <div class="form-group">
                                    <label class="control-label">*스터디 형태</label>
                                    <div class="radio-list">
                                       <label class="radio-inline p-0">
                                          <div class="radio radio-info">
                                             <input name="term" id="radio1" type="radio" value="0"> 
                                             <label for="radio1">원데이</label>
                                          </div>
                                       </label> 
                                       <label class="radio-inline">
                                          <div class="radio radio-info">
                                             <input name="term" id="radio2" type="radio" value="1"> 
                                             <label for="radio2">정기</label>
                                          </div>
                                       </label>
                                    </div>
                                 </div>
                              </div>
                  
                           		<div class="col-md-4"></div>
                             	<div class="col-md-4"></div>
                                 <div class="col-md-2">
                                          <div class="form-group row">
                                             <label class="control-label">&nbsp;*모집 인원</label>
                                             <div class="input-group">
                                                &nbsp;&nbsp;<input class="form-control" name="max_personnel" type="text" placeholder="희망 모집 인원 수">
                                                <div class="input-group-addon">명</div>
                                             </div>
                                          </div>
                                       </div>
                              
                                     <div class="col-md-4"></div>
                             		<div class="col-md-4"></div>
                                       <div class="col-md-4">
                                         <div class="form-group row">
                                    <label class="col-form-label" for="example-date-input">모집 마감일</label>
                                    <div class="col-6">
                                       	<input class="form-control" name="deadline" id="example-date-input" type="date" value="2019-08-19"> 
                                    </div>
                                 </div>
                                       </div>
                              
                           </div>
                           <input class="btn btn-success btn-md waves-effect waves-light m-r-10" type="submit" value="다음 단계로"> 
                           <input class="btn btn-inverse btn-md waves-effect waves-light" type="reset" value="취소">
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