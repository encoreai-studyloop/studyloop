<%@page import="databean.StudyDataBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="databean.CategoryDataBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
		<jsp:include page="upperBar.jsp" flush="false"/>
		            <div class="fix-width text-center banner-part">
                        <div class="min-h">
                            <h1 class="banner-title"></h1></div>
                    </div>
		<!-- Page Content -->
		<div id="wrapper">
			<div class="container-fluid">
				<div class="row bg-title">
					<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
						<h4 class="page-title">STUDY LOOP</h4>
					</div>
					<div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
						<c:if test="${userDto != null }">
						<a
							href="primecheck.do"
							target="_blank"
							class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">프리미엄 구매</a>
						</c:if>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- .row -->
				<div class="carousel slide" id="carousel-211883">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-211883"></li>
						<li data-slide-to="1" data-target="#carousel-211883"
							class="active"></li>
						<li data-slide-to="2" data-target="#carousel-211883"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="../../studyloop/views/search/images/study1.jpg" style="width: 100%; height: 500px;">
							<div class="carousel-caption">
								<h4>아직도 혼자 공부하니?</h4> 
								<p>다같이 즐겁게 공부하자!</p>
							</div>
						</div>
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="../../studyloop/views/search/images/study2.jpg" style="width: 100%; height: 500px;">
							<div class="carousel-caption">
								<h4></h4>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="../../studyloop/views/search/images/study3.jpg" style="width: 100%; height: 500px;">
							<div class="carousel-caption">
								<h4></h4>
								<p></p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-211883"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-211883"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>
			<section>
				<div class="sttabs tabs-style-bar">
					<nav>
						<ul>
							<li><a href="#section-bar-1" class="sticon ti-home"><span>취업</span></a></li>
							<li><a href="#section-bar-2" class="sticon ti-trash"><span>자격증</span></a></li>
							<li><a href="#section-bar-3" class="sticon ti-stats-up"><span>어학</span></a></li>
							<li><a href="#section-bar-4" class="sticon ti-upload"><span>전공</span></a></li>
							<li><a href="#section-bar-5" class="sticon ti-settings"><span>기타</span></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-bar-1">
							<div class="vtabs">
								<ul class="nav tabs-vertical">
									<%
										ArrayList<String> middle = new ArrayList<String>();
										Set<String> set = ((CategoryDataBean) request.getAttribute("categoryDto")).getJob().keySet();
										Iterator<String> it = set.iterator();
										while (it.hasNext()) {
											String link = "";
											String key = (String) it.next();
											if (key.equals("대기업")) {
												link = "big";
												middle.add(link);
												middle.add(key);
											} else if (key.equals("중소기업")) {
												link = "middle";
												middle.add(link);
												middle.add(key);
											} else if (key.equals("공기업")) {
												link = "public";
												middle.add(link);
												middle.add(key);
											}
											else if (key.equals("공무원")) {
												link = "gong";
												middle.add(link);
												middle.add(key);
											}
											
									%>
									<li class="tab nav-item"><a data-toggle="tab"
										class="nav-link" href="#<%=link%>" aria-expanded="false">
											<span class="visible-xs"></span><span class="hidden-xs"><%=key%></span>
									</a></li>
									<%
										}
									%>
								</ul>
						
								<div class="tab-content">
									<%
									for(int i=0; i< middle.size();i+=2){									
									if(i==0){
									%>
									<div id="<%=middle.get(i)%>" class="tab-pane active">
									<%
									}
									else{
									%>
									<div id="<%=middle.get(i)%>" class="tab-pane">
									<%
									}
									%>
										<div class="row el-element-overlay m-b-40">
											<div class="col-md-12">
												<h4>
													세부 카테고리를 선택해주세요
												</h4>
												<hr>
											</div>
											<!-- /.usercard -->			
											<%
											ArrayList<String> list = ((CategoryDataBean) request.getAttribute("categoryDto")).getJob().get(middle.get(i+1));
											for(int j=0; j<list.size(); j++){
											%>							
											<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
												<div class="white-box">
													<div class="el-card-item">
														<div class="el-card-avatar el-overlay-1" style="width: 200px; height: 200px;"> 
															<img src="../../studyloop/views/search/images/<%=list.get(j)%>.jpg" style="width: 200px; height: 200px;"/>
															<div class="el-overlay" style="width: 200px; height: 200px;">
																<ul class="el-info">
																	<li><a
																		class="btn default btn-outline"
																		href="search.do?cat=<%=list.get(j)%>"><i
																			class="icon-magnifier"></i></a></li>
																</ul>
															</div>
														</div>
														<div class="el-card-content">
															<h3 class="box-title"><%=list.get(j)%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
											<!-- /.usercard-->
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</section>
						<section id="section-bar-2">
							<div class="vtabs">
								<ul class="nav tabs-vertical">
									<%							
										ArrayList<String> middle2 = new ArrayList<String>();
										Set<String> set2 = ((CategoryDataBean) request.getAttribute("categoryDto")).getCertificate().keySet();
										Iterator<String> it2 = set2.iterator();
										while (it2.hasNext()) {
											String link = "";
											String key = (String) it2.next();								
											if (key.equals("컴퓨터")) {
												link = "computer";
												middle2.add(link);
												middle2.add(key);
											} else if (key.equals("요리")) {
												link = "cook";
												middle2.add(link);
												middle2.add(key);
											} else if (key.equals("사회")) {
												link = "social";
												middle2.add(link);
												middle2.add(key);
											}
									%>
									<li class="tab nav-item"><a data-toggle="tab"
										class="nav-link" href="#<%=link%>" aria-expanded="false">
											<span class="visible-xs"></span><span class="hidden-xs"><%=key%></span>
									</a></li>
									<%
										}
									%>
								</ul>
						
								<div class="tab-content">
									<%
									for(int i=0; i< middle2.size();i+=2){									
									if(i==0){
									%>
									<div id="<%=middle2.get(i)%>" class="tab-pane active">
									<%
									}
									else{
									%>
									<div id="<%=middle2.get(i)%>" class="tab-pane">
									<%
									}
									%>
										<div class="row el-element-overlay m-b-40">
											<div class="col-md-12">
												<h4>
													세부 카테고리를 선택해주세요
												</h4>
												<hr>
											</div>
											<!-- /.usercard -->			
											<%
											ArrayList<String> list = ((CategoryDataBean) request.getAttribute("categoryDto")).getCertificate().get(middle2.get(i+1));
											for(int j=0; j<list.size(); j++){
											%>							
											<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
												<div class="white-box">
													<div class="el-card-item">
														<div class="el-card-avatar el-overlay-1" style="width: 200px; height: 200px;">
															<img src="../../studyloop/views/search/images/<%=list.get(j)%>.jpg" style="width: 200px; height: 200px;"/>
															<div class="el-overlay" style="width: 200px; height: 200px;">
																<ul class="el-info">
																	<li><a
																		class="btn default btn-outline"
																		href="search.do?cat=<%=list.get(j)%>"><i
																			class="icon-magnifier"></i></a></li>
																</ul>
															</div>
														</div>
														<div class="el-card-content">
															<h3 class="box-title"><%=list.get(j)%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
											<!-- /.usercard-->
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</section>
						<section id="section-bar-3">
							<div class="vtabs">
								<ul class="nav tabs-vertical">
									<%
										ArrayList<String> middle3 = new ArrayList<String>();
										Set<String> set3 = ((CategoryDataBean) request.getAttribute("categoryDto")).getLanguage().keySet();
										
										Iterator<String> it3 = set3.iterator();
										while (it3.hasNext()) {
											String link = "";
											String key = (String) it3.next();								
											if (key.equals("영어")) {
												link = "en";
												middle3.add(link);
												middle3.add(key);
											} else if (key.equals("일본어")) {
												link = "jp";
												middle3.add(link);
												middle3.add(key);
											} else if (key.equals("중국어")) {
												link = "ch";
												middle3.add(link);
												middle3.add(key);
											}
											else if (key.equals("독일어")) {
												link = "gm";
												middle3.add(link);
												middle3.add(key);
											}
									%>
									<li class="tab nav-item"><a data-toggle="tab"
										class="nav-link" href="#<%=link%>" aria-expanded="false">
											<span class="visible-xs"></span><span class="hidden-xs"><%=key%></span>
									</a></li>
									<%
										}
									%>
								</ul>
						
								<div class="tab-content">
									<%
									for(int i=0; i< middle3.size();i+=2){									
									if(i==0){
									%>
									<div id="<%=middle3.get(i)%>" class="tab-pane active">
									<%
									}
									else{
									%>
									<div id="<%=middle3.get(i)%>" class="tab-pane">
									<%
									}
									%>
										<div class="row el-element-overlay m-b-40">
											<div class="col-md-12">
												<h4>
													세부 카테고리를 선택해주세요
												</h4>
												<hr>
											</div>
											<!-- /.usercard -->			
											<%
											ArrayList<String> list = ((CategoryDataBean) request.getAttribute("categoryDto")).getLanguage().get(middle3.get(i+1));
											for(int j=0; j<list.size(); j++){
											%>							
											<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
												<div class="white-box">
													<div class="el-card-item">
														<div class="el-card-avatar el-overlay-1" style="width: 200px; height: 200px;">
															<img src="../../studyloop/views/search/images/<%=list.get(j)%>.jpg" style="width: 200px; height: 200px;"/>
															<div class="el-overlay" style="width: 200px; height: 200px;">
																<ul class="el-info">
																	<li><a
																		class="btn default btn-outline"
																		href="search.do?cat=<%=list.get(j)%>"><i
																			class="icon-magnifier"></i></a></li>
																</ul>
															</div>
														</div>
														<div class="el-card-content">
															<h3 class="box-title"><%=list.get(j)%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
											<!-- /.usercard-->
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</section>
						<section id="section-bar-4">
							<div class="vtabs">
								<ul class="nav tabs-vertical">
									<%
										ArrayList<String> middle4 = new ArrayList<String>();

										Set<String> set4 = ((CategoryDataBean) request.getAttribute("categoryDto")).getMajor().keySet();

										Iterator<String> it4 = set4.iterator();
										while (it4.hasNext()) {
											String link = "";
											String key = (String) it4.next();	
										
											if (key.equals("공학")) {
												link = "com";
												middle4.add(link);
												middle4.add(key);
											} else if (key.equals("인문")) {
												link = "hum";
												middle4.add(link);
												middle4.add(key);
											} else if (key.equals("사회")) {
												link = "soc";
												middle4.add(link);
												middle4.add(key);
											} else if (key.equals("자연과학")) {
												link = "nat";
												middle4.add(link);
												middle4.add(key);
											}
									%>
									<li class="tab nav-item"><a data-toggle="tab"
										class="nav-link" href="#<%=link%>" aria-expanded="false">
											<span class="visible-xs"></span><span class="hidden-xs"><%=key%></span>
									</a></li>
									<%
										}
									%>
								</ul>
						
								<div class="tab-content">
									<%
									for(int i=0; i< middle4.size(); i+=2){	
									if(i==0){
									%>
									<div id="<%=middle4.get(i)%>" class="tab-pane active">
									<%
									}
									else{
									%>
									<div id="<%=middle4.get(i)%>" class="tab-pane">
									<%
									}
									%>
										<div class="row el-element-overlay m-b-40">
											<div class="col-md-12">
												<h4>
													세부 카테고리를 선택해주세요
												</h4>
												<hr>
											</div>
											<!-- /.usercard -->			
											<%
											ArrayList<String> list = ((CategoryDataBean) request.getAttribute("categoryDto")).getMajor().get(middle4.get(i+1));
											for(int j=0; j<list.size(); j++){
											%>							
											<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
												<div class="white-box">
													<div class="el-card-item">
														<div class="el-card-avatar el-overlay-1" style="width: 200px; height: 200px;">
															<img src="../../studyloop/views/search/images/<%=list.get(j)%>.jpg" style="width: 200px; height: 200px;"/>
															<div class="el-overlay" style="width: 200px; height: 200px;">
																<ul class="el-info">
																	<li><a
																		class="btn default btn-outline"
																		href="search.do?cat=<%=list.get(j)%>"><i
																			class="icon-magnifier"></i></a></li>
																</ul>
															</div>
														</div>
														<div class="el-card-content">
															<h3 class="box-title"><%=list.get(j)%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
											<!-- /.usercard-->
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</section>
						<section id="section-bar-5">
							<div class="vtabs">
								<ul class="nav tabs-vertical">
									<%
								
										ArrayList<String> middle5 = new ArrayList<String>();
										Set<String> set5 = ((CategoryDataBean) request.getAttribute("categoryDto")).getEtc().keySet();
										
										Iterator<String> it5 = set5.iterator();
										while (it5.hasNext()) {
											String link = "";
											String key = (String) it5.next();								
											if (key.equals("운동")) {
												link = "excersize";
												middle5.add(link);
												middle5.add(key);
											} 
											else if(key.equals("회화")){
												link = "speaking";
												middle5.add(link);
												middle5.add(key);
											}
									%>
									<li class="tab nav-item"><a data-toggle="tab"
										class="nav-link" href="#<%=link%>" aria-expanded="false">
											<span class="visible-xs"></span><span class="hidden-xs"><%=key%></span>
									</a></li>
									<%
										}
									%>
								</ul>
								<div class="tab-content">
									<%
									for(int i=0; i< middle5.size();i+=2){									
									if(i==0){
									%>
									<div id="<%=middle5.get(i)%>" class="tab-pane active">
									<%
									}
									else{
									%>
									<div id="<%=middle5.get(i)%>" class="tab-pane">
									<%
									}
									%>
										<div class="row el-element-overlay m-b-40">
											<div class="col-md-12">
												<h4>
													세부 카테고리를 선택해주세요
												</h4>
												<hr>
											</div>
											<!-- /.usercard -->			
											<%
											ArrayList<String> list = ((CategoryDataBean) request.getAttribute("categoryDto")).getEtc().get(middle5.get(i+1));
											for(int j=0; j<list.size(); j++){
											%>							
											<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
												<div class="white-box">
													<div class="el-card-item">
														<div class="el-card-avatar el-overlay-1" style="width: 200px; height: 200px;">
															<img src="../../studyloop/views/search/images/<%=list.get(j)%>.jpg" style="width: 200px; height: 200px;"/>
															<div class="el-overlay" style="width: 200px; height: 200px;"> 
																<ul class="el-info">
																<li><a
																		class="btn default btn-outline"
																		href="search.do?cat=<%=list.get(j)%>"><i
																			class="icon-magnifier"></i></a></li>
																</ul>
															</div>
														</div>
														<div class="el-card-content">
															<h3 class="box-title"><%=list.get(j)%></h3>
														</div>
													</div>
												</div>
											</div>
											<%
											}
											%>
											<!-- /.usercard-->
										</div>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</section>
					</div>
					<!-- /content -->
				</div>
			</section>
			<!-- /.row -->

        <!--Carousel Wrapper-->
         <div id="multi-item-example1"
            class="carousel slide carousel-multi-item1" data-ride="carousel">
            <div class = "near_study_rec">
               <div class="title" style="padding-left:80px"><strong>인근 스터디 추천</strong></div>
               <div class="sub_title" style="padding-left:80px">접속 위치 근방 10km 이내에 위치한 스터디들 입니다.</div>
            </div>
            <!--Controls-->
            <div class="controls-top" style="padding-left:720px">
               <a class="btn-floating-center" href="#multi-item-example1" data-slide="prev">
                  <i class="fa fa-chevron-left"></i></a> 
               <a class="btn-floating-center" href="#multi-item-example1" data-slide="next">
                  <i class="fa fa-chevron-right"></i></a>
            </div>
            <!--/.Controls-->
            <br>
            <!--Indicators-->
            <ol class="carousel-indicators">
               <li data-target="#multi-item-example1" data-slide-to="0"
                  class="active"></li>
               <li data-target="#multi-item-example1" data-slide-to="1"></li>
               <li data-target="#multi-item-example1" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

            <!--Slides-->
            <div class="white-box">
            <div class="carousel-inner" role="listbox">

               <!--First slide-->
               <%
               
		
			    SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
				
				
               ArrayList<StudyDataBean> studyDtoList =  (ArrayList<StudyDataBean>) request.getAttribute("nstudyDtoList");
               int cnt =0;
               int lim = 0;
               if(studyDtoList == null){
            	   %>
            	   최근 일주일 사이 등록된 스터디가 없습니다.
            	   <%
               }
               else{
            	int size = 0;
            	if(studyDtoList.size()%3 == 0){
            		size = studyDtoList.size()/3-1;
            	}
            	else{
            		size = studyDtoList.size()/3;
            	}   
               for(int i=0; i<=size; i++){         
                  if(i==0){
                     %>
               <div class="carousel-item active">
                  <% 
                  }
                  else{
                     %>
               <div class="carousel-item">
                     <%
                  }   
                  while(cnt < studyDtoList.size()){
                     if(lim ==3){
                        lim=0;
                        break;
                     }
                     StudyDataBean studyDto = studyDtoList.get(cnt);
                     lim++;
                     cnt++;
                     %>
                  <div class="col-md-4">
                     <div class="card mb-2">
                     		<%
                     		if(studyDto.getPrime().equals("1")){
                     			%>
	                     		<div class="ribbon ribbon-bookmark ribbon-vertical-l ribbon-info ribbon-longer" >
		                           <i class="fa fa-star"></i>
		                        </div>
                     			<%		
                     		}
                     		if(studyDto.getTerm().equals("0")){
                     			%>
                     			<div class="ribbon ribbon-right ribbon-default">1DAY</div>
                     			<%
                     		}
                     		%>     
	                            <div class="pro-content-3-col">
	                         <%
	                         if(studyDto.getPicture().equals("pic")){
	                        	%>
	                 		<img class="content-3-col-md-1"  style='height: 100%; width: 100%; object-fit: contain'
                           src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
                           alt="Card image cap">
	                        	<% 
	                         }
	                         else{
		                        %>
		                   <img class="content-3-col-md-1"  style='height: 300px; width: 100%; object-fit: contain'
                           src="<%=studyDto.getPicture()%>"
                           alt="Card image cap">   	
		                        <% 
	                         }
	                         %>
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
	                                <div class="users" style="padding-bottom:5px; padding-left:10px;" >
	                                	<span><i class="fa fa-users"></i></span>&nbsp;
	                                    <span><b>참석인원 : <%=studyDto.getCur_personnel()%>/<%=studyDto.getMax_personnel()%></b></span>
	                                </div>
	                            </div>
	                      
                    	</div>
                  
                  </div>      
                     <%
                  }
                  
                  %>
                  </div>
                  <%
                 
               }
               }
               %>         
               <!--/.First slide-->
            </div>
            <!--/.Slides-->
         </div>
         </div>
         <!--/.Carousel Wrapper-->
         <br>
         <br>
         <br>
         <br>
         
         <!--Carousel Wrapper-->
         <div id="multi-item-example2"
            class="carousel slide carousel-multi-item2" data-ride="carousel">
            <div class = "near_study_rec">
               <div class="title" style="padding-left:80px"><strong>최근 핫한 스터디 추천</strong></div>
               <div class="sub_title" style="padding-left:80px">최근 신청자가 몰리는 스터디를 추천합니다.</div>
            </div>
            <!--Controls-->
            <div class="controls-top" style="padding-left:720px">
               <a class="btn-floating-center" href="#multi-item-example2" data-slide="prev">
                  <i class="fa fa-chevron-left"></i></a> 
               <a class="btn-floating-center" href="#multi-item-example2" data-slide="next">
                  <i class="fa fa-chevron-right"></i></a>
            </div>
            <!--/.Controls-->
            <br>
            <!--Indicators-->
            <ol class="carousel-indicators">
               <li data-target="#multi-item-example2" data-slide-to="0"
                  class="active"></li>
               <li data-target="#multi-item-example2" data-slide-to="1"></li>
               <li data-target="#multi-item-example2" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

             <!--Slides-->
            <div class="white-box">
            <div class="carousel-inner" role="listbox">

               <!--First slide-->
               <%
               ArrayList<StudyDataBean> studyDtoList2 =  (ArrayList<StudyDataBean>) request.getAttribute("hstudyDtoList");
               cnt =0;
               lim = 0;
               if(studyDtoList2 == null){
            	   %>
            	   최근 핫한 스터디가 없습니다.
            	   <%   
               }
               else{
               	int size = 0;
               	if(studyDtoList2.size()%3 == 0){
               		size = studyDtoList2.size()/3-1;
               	}
               	else{
               		size = studyDtoList2.size()/3;
               	}  
               for(int i=0; i<=size; i++){
                  
                  if(i==0){
                     %>
               <div class="carousel-item active">
                  <% 
                  }
                  else{
                     %>
               <div class="carousel-item">
                     <%
                  }   
                  while(cnt < studyDtoList2.size()){
                     if(lim ==3){
                        lim=0;
                        break;
                     }
                     StudyDataBean studyDto = studyDtoList2.get(cnt);
                     lim++;
                     cnt++;
                     %>
                  <div class="col-md-4">
                     <div class="card mb-2">
                         	<%
                     		if(studyDto.getPrime().equals("1")){
                     			%>
	                     		<div class="ribbon ribbon-bookmark ribbon-vertical-l ribbon-info ribbon-longer" >
		                           <i class="fa fa-star"></i>
		                        </div>
                     			<%		
                     		}
                     		if(studyDto.getTerm().equals("0")){
                     			%>
                     			<div class="ribbon ribbon-right ribbon-default">1DAY</div>
                     			<%
                     		}
                     		%>     
	                            <div class="pro-content-3-col">
	                         <%
	                         if(studyDto.getPicture().equals("pic")){
	                        	%>
	                 		<img class="content-3-col-md-1"  style='height: 100%; width: 100%; object-fit: contain'
                           src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
                           alt="Card image cap">
	                        	<% 
	                         }
	                         else{
		                        %>
		                   <img class="content-3-col-md-1"  style='height: 300px; width: 100%; object-fit: contain'
                           src="<%=studyDto.getPicture()%>"
                           alt="Card image cap">   	
		                        <% 
	                         }
	                         %>
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
	                            </div>
	                      
                    	</div>
                  
                  </div>      
                     <%
                  }
                  
                  %>
                  </div>
                  <%
               }
               }
               %>         
               <!--/.First slide-->
            </div>
            <!--/.Slides-->
         </div>
         </div>
         <!--/.Carousel Wrapper-->
         
         
         
         
         
         
         <br>
         <br>
         <br>
         <br>
         
         
         <!--Carousel Wrapper-->
         <div id="multi-item-example3"
            class="carousel slide carousel-multi-item3" data-ride="carousel">
            <div class = "near_study_rec">
               <div class="title" style="padding-left:80px"><strong>프리미엄 스터디 추천</strong></div>
               <div class="sub_title" style="padding-left:80px">프리미엄 회원들을 위한 스터디 추천</div>
            </div>
            <!--Controls-->
            <div class="controls-top" style="padding-left:720px">
               <a class="btn-floating-center" href="#multi-item-example3" data-slide="prev">
                  <i class="fa fa-chevron-left"></i></a> 
               <a class="btn-floating-center" href="#multi-item-example3" data-slide="next">
                  <i class="fa fa-chevron-right"></i></a>
            </div>
            <!--/.Controls-->
            <br>
            <!--Indicators-->
            <ol class="carousel-indicators">
               <li data-target="#multi-item-example3" data-slide-to="0"
                  class="active"></li>
               <li data-target="#multi-item-example3" data-slide-to="1"></li>
               <li data-target="#multi-item-example3" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

               <!--Slides-->
            <div class="white-box">
            <div class="carousel-inner" role="listbox">

               <!--First slide-->
               <%
               ArrayList<StudyDataBean> studyDtoList3 =  (ArrayList<StudyDataBean>) request.getAttribute("pstudyDtoList");
               cnt =0;
               lim = 0;
	           	int size = 0;
	           	if(studyDtoList3.size()%3 == 0){
	           		size = studyDtoList3.size()/3-1;
	           	}
	           	else{
	           		size = studyDtoList3.size()/3;
	           	}  
               for(int i=0; i<=size; i++){
                  
                  if(i==0){
                     %>
               <div class="carousel-item active">
                  <% 
                  }
                  else{
                     %>
               <div class="carousel-item">
                     <%
                  }   
                  while(cnt < studyDtoList3.size()){
                     if(lim ==3){
                        lim=0;
                        break;
                     }
                     StudyDataBean studyDto = studyDtoList3.get(cnt);
                     lim++;
                     cnt++;
                     %>
                  <div class="col-md-4">
                     <div class="card mb-2">
	                        <div class="ribbon ribbon-bookmark ribbon-vertical-l ribbon-info ribbon-longer" >
	                           <i class="fa fa-star"></i>
	                        </div> 
	                            <div class="pro-content-3-col">
	                         <%
	                         if(studyDto.getPicture().equals("pic")){
	                        	%>
	                 		<img class="content-3-col-md-1"  style='height: 100%; width: 100%; object-fit: contain'
                           src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
                           alt="Card image cap">
	                        	<% 
	                         }
	                         else{
		                        %>
		                   <img class="content-3-col-md-1"  style='height: 300px; width: 100%; object-fit: contain'
                           src="<%=studyDto.getPicture()%>"
                           alt="Card image cap">   	
		                        <% 
	                         }
	                         %>
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
	                            </div>
	                      
                    	</div>                 
                  </div>      
                     <%
                  }
                  
                  %>
                  </div>
                  <%
                 
               }
               %>         
               <!--/.First slide-->
            </div>
            <!--/.Slides-->
         </div>
         </div>
         <!--/.Carousel Wrapper-->
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
		<jsp:include page="footer.jsp" flush="false"/>
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

	<script src="../../studyloop/default/js/cbpFWTabs.js"></script>
	<script type="text/javascript">
		(function() {
			[].slice.call(document.querySelectorAll('.sttabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});
		})();
	</script>
	<!-- jQuery for typing -->
    <script src="../../studyloop/default/plugins/bower_components/typed.js-master/dist/typed.min.js"></script>
    <script>
    $(function() {
        $(".banner-title").typed({
            strings: ["스터디루프에서 목적에 딱 맞는 스터디를 찾아보세요", "원하는 스터디를 빠르고 쉽게 찾을 수 있습니다"],
            typeSpeed: 50,
            loop: true
        });
    });
    </script>
 	<script>
    $(document).ready(function() {        
        // Geolocation API에 액세스할 수 있는지를 확인
        if (navigator.geolocation) {
            //위치 정보를 얻기
            navigator.geolocation.getCurrentPosition (showLocation);
        } else {
            alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
        }
    });
    
    function showLocation(pos){
    	localStorage.setItem("lat", pos.coords.latitude)
    	localStorage.setItem("long", pos.coords.longitude)
    	//alert(pos.coords.latitude+"  "+pos.coords.longitude)
    	
    }
    
 	</script>
   
</body>

</html>
