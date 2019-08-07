<%@page import="databean.StudyDataBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="databean.AttendDataBean"%>
<%@page import="databean.UserDataBean"%>
<%@page import="java.util.List"%>
<%@page import="dbbean.ProcessDBBean"%>
<%@page import="dbbean.ProcessDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>

	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <link rel="icon" type="image/png" sizes="16x16" href="../../studyloop/default/plugins/images/favicon.png">
	    <title>StudyLoop</title>
	    <!-- Bootstrap Core CSS -->
	    <link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
	    <link href="../../studyloop/default/plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
	    <link href="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
	    <link href="../../studyloop/default/plugins/bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	    <link href="../../studyloop/default/plugins/bower_components/icheck/skins/all.css" rel="stylesheet">
	    <link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
	    <!-- Daterange picker plugins css -->
	    <link href="../../studyloop/default/plugins/bower_components/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
	    <link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
	    
	    <!-- Menu CSS -->
	    <link href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
	    <!-- animation CSS -->
	    <link href="../../studyloop/default/animate.css" rel="stylesheet">
	    <!-- toast CSS -->
	    <link href="../../studyloop/default/plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
	    <!-- Custom CSS -->
	    <link href="../../studyloop/default/css/style.css" rel="stylesheet">
	    <!-- color CSS -->
	    <link href="../../studyloop/default/css/colors/megna.css" id="theme" rel="stylesheet">
	
	</head>
		<%--  <%
		    List<UserDataBean> HattendCheckTable = (List<UserDataBean>)request.getAttribute("getHattendCheckTable");
			
		 %> --%>
<body class="fix-sidebar">
<!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
    <jsp:include page="../search/upperBar.jsp"/>
    
<!-- Left navbar-header -->
	
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="linea-icon linea-basic fa-fw text-danger" data-icon="7"></i> <span class="hide-menu text-danger">주최중인 스터디<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        
                   <%--      
                        <%
                         
                        List<StudyDataBean> studyDtoList = (List<StudyDataBean>)request.getAttribute("studyDtoList");
							for (int i=0; i<studyDtoList.size(); i++) {
						%> --%>
						<c:forEach var="studyDto" items="${studyDtoList}">
                        	
                            <li><a href="attend.do?hsid=${studyDto.id}">${studyDto.title}</a></li>
                      <%--   <%
					}
                        %> --%>
                        </c:forEach>
                        </ul>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="linea-icon linea-basic fa-fw text-danger" data-icon="7"></i> <span class="hide-menu text-danger">참여중인 스터디<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                        
                      <%--   <%
                    
                        
                        List<StudyDataBean> ateeDtoList = (List<StudyDataBean>)request.getAttribute("ateeDtoList");
							for (int i=0; i<ateeDtoList.size(); i++) {
						%> --%>
                        <c:forEach var="ateeDto" items="${ateeDtoList}">
                            <li><a href="attend.do?hsid=${ateeDto.id}&noedit=1">${ateeDto.title}</a></li>
                      <%--   <%
					}
                        %> --%>
                            
                        </c:forEach>
                        </ul>
                    </li>
                    
                    <!-- 참여중인 스터디를 눌렀을 경우 출석관리 탭을 disabled로 바꿔주기 -->
                      
	                    
                    <li class="nav-small-cap">--- 날짜검색</li>
                    
                     <div class="example">
                       <%
                        //현재날짜 가져오기
                        Date today = new Date();
   						SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
   						SimpleDateFormat string = new SimpleDateFormat("dd@MM@yyyy");
   						
                       %>
                     
                      <div class="input-daterange input-group" id="date-range">
                          <input type="text" class="form-control" name="start" id="datepicker-autoclose" placeholder="<%=date.format(today)%>"/>
                          <span class="input-group-addon bg-info b-0 text-white">to</span>
                          <input type="text" class="form-control" name="end" id="datepicker-autoclose" placeholder="<%=date.format(today)%>"/>
                      </div>
                  	</div>
                        
                         
                         
	                  <li class="nav-small-cap">---출석현황</li>
	
	                    <div class="input-group">
	                        <ul class="icheck-list">
	                        
	                            <li>
	                                <input type="checkbox" class="check" id="flat-checkbox-a" data-checkbox="icheckbox_flat-green">
	                                <label for="flat-checkbox-a">출석</label>
	                            
	                                <input type="checkbox" class="check" id="flat-checkbox-b" checked data-checkbox="icheckbox_flat-yellow">
	                                <label for="flat-checkbox-b">지각</label>
	                            
	                                <input type="checkbox" class="check" id="flat-checkbox-c" checked data-checkbox="icheckbox_flat-red">
	                                <label for="flat-checkbox-c">결석</label>
	                            </li>
	                        </ul>
	                    </div>
	                  
	                   <div class="button-box">
	                         
		                   	<button class="btn btn-success waves-effect waves-light" type="button"><span class="btn-label"><i class="fa fa-check"></i></span>필터적용</button>
		                   	<button class="btn btn-fail waves-effect waves-light" type="button"><span class="btn-label"><i class="fa ti-close"></i></span>초기화</button>
	                        
	                   </div>
               	</ul>
            </div>
        </div>
    
	<!-- Left Sidebar End -->

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                 
                    <!-- Nav tabs -->
                    	<div data-example-id="togglable-tabs" class="bs-example bs-example-tabs">
                             <ul role="tablist" class="nav nav-tabs" id="myTabs">
                                
	                             <li class="active nav-item" role="presentation"><a aria-expanded="true" class="nav-link" aria-controls="attend_main" data-toggle="tab" role="tab" id="home-tab" href="#attend_main">출석관리</a></li>
	                             <li role="presentation" class="nav-item"><a aria-controls="attend_list" class="nav-link" data-toggle="tab" id="profile-tab" role="tab" href="#attend_list" aria-expanded="false">출석부 리스트</a></li> 
                             </ul>
                        
                             
                             <!-- Tab panes -->
                             <div class="tab-content">
                                <!-- attend_main 내용 -->
                                <div role="tabpanel" class="tab-pane active" id="attend_main">
                                	 <div class="row">
					                    <div class="col-sm-12">
					                        <div class="white-box">
					                            <h3 class="box-title m-b-0">출석관리</h3>
					                            
					                            <hr>
					                            
					                            <p class="text-muted m-b-30">Check the attendance</p>
					                            <!-- select All -->
			                    				<div class="col-sm-14">
			                        
						                            <div class="button-box">
						                                <div class="btn-group m-r-10">
						                                    <button aria-expanded="false" data-toggle="dropdown" class="btn btn-info dropdown-toggle waves-effect waves-light" type="button">Select All <span class="caret"></span></button>
						                        
		 				                                    <% 
						                                    	List<UserDataBean> HattendCheckTable =(List<UserDataBean>)request.getAttribute("getHattendCheckTable");
						                                    	for(int num=0; num<HattendCheckTable.size(); num++) {
						                                    %>
						                                    <ul role="menu" class="dropdown-menu">
						                                        <li><a href="#" id="all" onclick="selectAll(<%=num%>, 0)">모두 출석</a></li>
						                                        <li><a href="#" id="all" onclick="selectAll(<%=num%>, 1)">모두 지각</a></li>
						                                        <li><a href="#" id="all" onclick="selectAll(<%=num%>, 2)">모두 결석</a></li>
						                                        <li><a href="#" id="all" onclick="selectAll(<%=num%>, 3)">모두 취소</a></li>
						                                        
						                                    </ul>
						                                    <%
						                                    
						                                    }
						                                    %>
						                                    
						                                    <button type="button" class="fcbtn btn btn-info btn-outline btn-1f" onclick="save()">저장</button>
						                                </div>
						                                
						                            </div>
				                        
				                   				</div>
				                   				<!-- select All End -->
					                            
					                            
				                            	<div class="table-responsive">
				                            	<form name="attendCheck" id="attendCheck">
				                            		<input type="hidden" name="noedit" value="${noedit}">				                            
				                                	<table id="myTable" class="table table-striped">
					                                    <thead>
					                                        <tr>
					                                            <th>닉네임</th>
					                                            <th>이름</th>
					                                            <th>날짜</th>
					                                            <th>출석체크</th>
					                                        </tr>
					                                    </thead>
					                                    <tbody>
					                 					
	                                					<%
	                                					int idx = 0;
	                                					int hsid = (Integer)request.getAttribute("hsid");
															for( int i=0; i<HattendCheckTable.size(); i++ ) {
																UserDataBean nn = HattendCheckTable.get(i);	
														%>
					                                    
					                                        <tr>
					                                            <td><%=nn.getNick()%></td>
					                                            <td><%=nn.getName()%></td>
					                                            <td><%=date.format(today)%></td>					                                            
					                                            <td>
					                                           		<c:if test="${noedit == null}">
					                                            	<ul class="icheck-list">
									                                   <li>						                                   		
									                                       <input type="radio" class="check" id="flat-radio-a<%=nn.getId()%>" name="flat-radio<%=idx%>" data-radio="icheckbox_flat-green" value="0">
									                                       <label for="flat-radio-a<%=nn.getId()%>">출석</label> &nbsp;&nbsp;
									                                   
									                                       <input type="radio" class="check" id="flat-radio-b<%=nn.getId()%>" name="flat-radio<%=idx%>" data-radio="icheckbox_flat-yellow" value="1" >
									                                       <label for="flat-radio-b<%=nn.getId()%>">지각</label> &nbsp;&nbsp;
									                                   
									                                       <input type="radio" class="check" id="flat-radio-c<%=nn.getId()%>" name="flat-radio<%=idx%>" data-radio="icheckbox_flat-red" value="2">
									                                       <label for="flat-radio-c<%=nn.getId()%>">결석</label> &nbsp;&nbsp;&nbsp;
									                                   	
								                                   			<input type="button" class="btn btn-info btn-outline" value="저장" name = "save" onclick="updateStatus(<%=hsid%>, <%=nn.getId()%>, '<%=string.format(today)%>', <%=idx%>)">  
								 											
									                                   						                                   		
									                                   </li>
								                               		</ul>
								                               		</c:if>
								                               		<c:if test="${noedit != null}">
								                               			스터디 장만 이용할 수 있습니다.
								                               		</c:if>
					                                            </td>
					                                        </tr>
					                                        <%
					                                        idx ++;
																}
														
					                                        %>
					                                    </tbody>
				                                	</table>
				                                	</form>
				                           		 </div>
				                        	</div>
				                    	</div>
                           			</div>
                           		</div>
                           		<!-- Attend Main 내용 End -->
                             		
                       			<!-- attend_list 내용 -->
                                <div role="tabpanel" class="tab-pane" id="attend_list">
                                    
                                    <div class="row">
					                    <div class="col-sm-12">
					                        <div class="white-box">
					                            <h4 class="box-title m-b-0">출석부 리스트</h4>
					                           
					                           	<hr>
					                           
					                            <p class="text-muted m-b-30">Export data to Copy, CSV, Excel, PDF & Print</p>
					                            <div class="table-responsive">
					                            <c:if test="${atckDtoList == null }">
					                            </c:if>
					                                <table id="example23" class="display nowrap" cellspacing="0" width="100%">
					                                    <thead>
					                                        <tr>
					                                            <th>닉네임</th>
					                                            <th>이름</th>
					                                            <th>날짜</th>
					                                            <th>출석현황</th>
					                                        </tr>
					                                    </thead>
					                                    <tbody>					                        
					                                    	<c:if test="${atckDtoList == null }">
															 데이터가 없습니다.
					                                        </c:if>
					                                        <c:if test="${atckDtoList != null }">
					                                        <c:forEach var="atckDto" items="${atckDtoList}">
					                                        <tr>
					                                            <td>${atckDto.nick}</td>
					                                            <td>${atckDto.name}</td>
					                                            <td><fmt:formatDate value="${atckDto.attend_date}" type="date" pattern="yyyy/MM/dd"/></td>
					                                			<c:if test="${atckDto.attendance == 0 }">
					                                            <td>출석</td>
					                                            </c:if>
					                                            <c:if test="${atckDto.attendance == 1 }">
					                                            <td>지각</td>
					                                            </c:if>
					                                            <c:if test="${atckDto.attendance == 2 }">
					                                            <td>결석</td>
					                                            </c:if>					                                            					                                            
					                                        </tr>
					                                        </c:forEach>
					                                        </c:if>
					                                    </tbody>
					                                </table>
					                            </div>
					                        </div>
					                    </div>
					                </div>
                                </div>
                          </div> <!-- tab panes -->
               		</div> <!-- Nav Tabs -->
           	</div>
           	<!-- /.container-fluid -->
           	
            <footer class="footer text-center"> 2017 &copy; Elite Admin brought to you by themedesigner.in </footer>
       
       </div>
       <!-- page wrapper End -->
      
	</div>
	<!-- Wrapper -->
            
    <!-- jQuery -->
    <script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
    <script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <script src="../../studyloop/default/js/wp-sidebar.js"></script>
    <!--slimscroll JavaScript -->
    <script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../../studyloop/default/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../../studyloop/default/js/custom.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/datatables/jquery.dataTables.min.js"></script>

   <!-- Scheduler -->
    <script src="../../studyloop/default/plugins/bower_components/date-paginator/moment.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/date-paginator/bootstrap-datepaginator.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/icheck/icheck.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/icheck/icheck.init.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    
    <!-- 내꺼 -->
    <script src="../../studyloop/views/process/js/attend.js"></script>

    <!--Style Switcher -->
    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
