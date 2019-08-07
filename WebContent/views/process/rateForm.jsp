<%@page import="databean.AttendDataBean"%>
<%@page import="databean.UserDataBean"%>
<%@page import="java.util.List"%>
<%@page import="dbbean.ProcessDBBean"%>
<%@page import="dbbean.ProcessDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../../studyloop/default/plugins/images/favicon.png">
    <title>Elite Admin - University Admin Dashboard</title>
    <!-- Bootstrap Core CSS -->
    <link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="../../studyloop/default/css/animate.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!--alerts CSS -->
    <link href="../../studyloop/default/plugins/bower_components/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <!-- page CSS -->
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="../../studyloop/default/plugins/bower_components/custom-select/custom-select.css" rel="stylesheet" type="text/css" />
    <link href="../../studyloop/default/plugins/bower_components/switchery/dist/switchery.min.css" rel="stylesheet" />
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.css" rel="stylesheet" />
    <link href="../../studyloop/default/plugins/bower_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
    <link href="../../studyloop/default/plugins/bower_components/multiselect/css/multi-select.css" rel="stylesheet" type="text/css"/>
    
    
    <!-- Custom CSS -->
    <link href="../../studyloop/default/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="../../studyloop/default/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>


<body class="fix-sidebar">
    <!-- Preloader -->
    <div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Top Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            
        </nav>
        <!-- End Top Navigation -->
       
        <!-- Left navbar-header end -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                
                <!-- .row -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="white-box">
                            <h3 class="box-title">평점 운영정책을 클릭해주세요.</h3>
                            <!-- sample modal content -->
                            <!-- /.modal -->
                            <div id="responsive-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                    
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title">스터디 멤버에게 평점을 매겨주세요</h4>
                                            
                                        </div>
                                        <div class="modal-body">
                                          <form name="rateForm">  
                                            <div class="panel-wrapper collapse in">
			                                	<table class="table table-hover">
			                                    <thead>
			                                        <tr>
			                                            <th class="text-center">닉네임</th>
			                                            <th class="text-center">이름</th>
			                                            <th class="text-center">평점</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    	
							                        <%
							                        // 스터디 주최자가 평가 평가함
							                        List<UserDataBean> HattendCheckTable = (List<UserDataBean>)request.getAttribute("getHattendCheckTable");
							                        
							                        String ids = "";
							                        int idx = 0;
													
							                        for( int i=0; i<HattendCheckTable.size(); i++ ) { 
														UserDataBean nn = HattendCheckTable.get(i);	
														ids += Integer.toString(nn.getId()) +"a";
													%>
			                                        <tr>
			                                        	<!--주최한 사람의 테이블과 참여자의 테이블이 다름 -->
			                                            <td align="center"><%=nn.getNick()%></td>
			                                            <td align="center"><%=nn.getName()%></td>
			                                            
			                                            <td>
													       <label class="col-sm-12">평점을 매겨주세요</label>
						                                    
					                                        <select name="rate<%=idx%>" class="form-control">
					                                            <option value="1">1점</option>
					                                            <option value="2">2점</option>
					                                            <option value="3">3점</option>
					                                            <option value="4">4점</option>
					                                            <option selected="selected" value="5">5점</option>
					                                        </select>
						                                  
			                                            </td>
			                                        </tr>
			                                        <% 
			                                        idx++;
			                                        
														}
				                                    %>
			                                    </tbody>
			                                </table>
                           				 </div>	
                           				 </form>
                                	</div>
                                	
                                	<div class="modal-footer">
                                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                        <button type="submit" class="btn btn-danger waves-effect waves-light" onclick="updateRate(<%=HattendCheckTable.size()%>, '<%=ids%>')">저장하기</button>
                                    </div>
                                    
                                  
                             </div>
                         </div>
                     </div>
                            <img src="../../studyloop/views/process/rate.png" alt="default" data-toggle="modal" data-target="#responsive-modal" class="model_img img-responsive" />
                            <!-- Button trigger modal -->
                        </div>
                    </div>
                    
                    </div>
                </div>
                <!-- /.row -->
               
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2017 &copy; StudyLoop </footer>
        
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
    <script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    
    <!-- Menu Plugin JavaScript -->
    <script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../../studyloop/default/js/waves.js"></script>
    <!-- Sweet-Alert  -->
    <script src="../../studyloop/default/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="../../studyloop/default/plugins/bower_components/sweetalert/jquery.sweet-alert.custom.js"></script>
    
    <!-- 내꺼 -->
    <script src="../../studyloop/views/process/js/rateForm.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="../../studyloop/default/js/custom.min.js"></script>
    <script src="../../studyloop/default/js/validator.js"></script>
    <script src="js/mask.js"></script>
    
   
    
    <!--Style Switcher -->

    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
