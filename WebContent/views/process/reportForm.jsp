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
    <link href="../../studyloop/default/plugins/bower_components/multiselect/css/multi-select.css" rel="stylesheet" type="text/css" />
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
	<link href="../../studyloop/views/process/css/style.css" rel="stylesheet" type="text/css"/>
    
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
                            <h3 class="box-title">신고 운영정책을 클릭해주세요.</h3>
                            <!-- sample modal content -->
                            <!-- /.modal -->
                            <div id="responsive-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title">신고양식</h4>
                                            
                                        </div>
                                        <div class="modal-body">
                                        <form data-toggle="validator" id="report" name="report" action="updateReport.do" method="post">
										  <div class="form-group">
										  <label for="radioType" class="control-label" id="cases">신고 유형</label><br>
										    <div>
										    	  
											      <input type="radio" name="radio" id="user" value="0" required>
											      <label for="user">사용자</label>&nbsp;
											    
										      <div class="reveal-if-active">
										        <label for="which-user">사용자 닉네임을 입력해주세요.</label>
										        <input type="text" id="which-user" name="which-user" class="require-if-active" data-require-pair="#user" >
										      </div>
										    </div>
										    
										    <div>
										    	  
											      <input type="radio" name="radio" id="study" value="1" required>
											      <label for="study">스터디</label>&nbsp;
											    
										      <div class="reveal-if-active">
										        <label for="which-study-title">스터디 제목을 입력해주세요.</label>
										        <input type="text" id="which-study-title" name="which-study-title" class="require-if-active" data-require-pair="#study-title" >
										        <label for="which-study-hname">스터디 주최자의 닉네임을 입력해주세요.</label>
										        <input type="text" id="which-study-hname" name="which-study-hname" class="require-if-active" data-require-pair="#study-hname" >
										      </div>
										    </div>
										    
										    <div>
										    	  
											      <input type="radio" name="radio" id="article" value="2" required>
											      <label for="article">게시글</label>&nbsp;
											    
										      <div class="reveal-if-active">
										        <label for="which-article-hname">게시글 작성자의 닉네임을 입력해주세요.</label>
										        <input type="text" id="which-article-hname" name="which-article-hname" class="require-if-active" data-require-pair="#article-hname" >
										        <label for="which-article-stitle">해당 게시글의 스터디 제목을 입력해주세요.</label>
										        <input type="text" id="which-article-stitle" name="which-article-stitle" class="require-if-active" data-require-pair="#article-stitle" >
										         <label for="which-article-title">해당 게시글의 제목을 입력해주세요.</label>
										        <input type="text" id="which-article-title" name="which-article-title" class="require-if-active" data-require-pair="#article-title" >
										        
										      </div>
										    </div>
										    
										  </div>
										  
										 
				                                 <div class="form-group">
				                                 	<label for="selectType" class="control-label">신고 사유</label>
				                                 
						                                 <select class="form-control select2" id="reason" name="reason">
							                            	<option>신고 사유를 선택하세요</option>
							                            
							                                <option value="1">욕설</option>
							                                <option value="2">비방</option>
							                           		<option value="3">사기</option>
							                           		<option value="4">사생활 침해</option>
							                                <option value="5">불성실한 태도</option>
						                               		<option value="6">음란한 글</option>
							                                <option value="7">광고성 글</option>
							                                <option value="8">도배성 글</option>
							                                
								                        </select>
								                   
							                     </div>
				                                 
				                                <div class="form-group">
				                                    <label for="textarea" class="control-label" id="content">상세설명</label>
				                                    <textarea name="content" id="content" class="form-control"
				                                    	placeholder="신고 분류 이외의 접수 내용은 1:1 문의로 제보해주시기 바랍니다." required></textarea>
				                                    <span class="help-block with-errors">5글자 이상 작성해야 신고등록이 가능합니다.</span> </div>
				                             
					                       	    </div>
					
						                 
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                            <button type="submit" class="btn btn-danger waves-effect waves-light" onclick="updateReport()">신고하기</button>
                                        </div>
                                        
                                     	</form>
                                   
                                </div>
                                 
                             </div>
                         </div>
                     </div>
                            <img src="../../studyloop/views/process/report.png" alt="default" data-toggle="modal" data-target="#responsive-modal" class="model_img img-responsive" />
                            <!-- Button trigger modal -->
                        </div>
                    </div>
                    
                    </div>
                </div>
                <!-- /.row -->
               
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2019 &copy; StudyLoop </footer>
        
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
    <!-- Custom Theme JavaScript -->
    <script src="../../studyloop/default/js/custom.min.js"></script>
    <script src="../../studyloop/default/js/validator.js"></script>
    <script src="../../studyloop/views/process/js/reportForm.js"></script>
    <!--Style Switcher -->

    <script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>
