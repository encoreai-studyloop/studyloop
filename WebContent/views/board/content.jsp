<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Bootstrap Core CSS --> 
    <link href="${project}bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${project}plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${project}css/animate.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="${project}plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${project}css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${project}css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="${project}css/colors/blue.css" id="theme" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
          <div class="container-fluid">

                <!-- row -->
              
                    <!-- Left sidebar -->
                
                        <div class="white-box">
                                <div class="col-lg-10 col-md-9 col-sm-8 col-xs-12 mail_listing">
                                    <div class="media m-b-30 p-t-20">
                                        <h4 class="font-bold m-t-0">${boardDto.getTitle()}</h4>
                                        <hr>
                                        <a class="pull-left" href="#"> <img class="media-object thumb-sm img-circle" src="../plugins/images/users/pawandeep.jpg" alt=""> </a>
                                        <div class="media-body"> <span class="media-meta pull-right">작성 시간 : ${boardDto.getLogtime()}<br>조회수 : ${boardDto.getReadcount()}</span>
                                            <h4 class="text-danger m-0">닉네임 : ${boardDto.getNick()}</h4> <small class="text-muted"></small> </div>
                                    </div>
									${boardDto.getContent()}
                                    <hr>                              
                                    <div class="row">
                                        <div class="col-sm-2 col-xs-4">
                                            <button type="button" class="btn btn-block btn-info" onclick="location='articledelete.do?id=${boardDto.getId()}&sid=${boardDto.getStudy_id()}'">글 삭제</button>
                                        </div>
                                        <div class="col-sm-2 col-xs-4">
                                            <button type="button" class="btn btn-block btn-info">글 수정</button>
                                        </div>
                                    </div>
                                    <%@ include file="comment.jsp" %>
                                </div>
                            </div>
                        </div>
                 
              
       
                <!-- /.row -->
                  <!-- jQuery -->
    <script src="${project}plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="${project}bootstrap/dist/js/tether.min.js"></script>
    <script src="${project}bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${project}plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="${project}plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="${project}js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="${project}js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${project}js/custom.min.js"></script>
    <script src="${project}js/jasny-bootstrap.js"></script>
    <!--Style Switcher -->
    <script src="${project}plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>