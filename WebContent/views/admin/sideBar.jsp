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
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Elite Admin Template - The Ultimate Multipurpose admin template</title>
  
</head>
<body>
<!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search hidden-sm hidden-md hidden-lg">
                        <!-- input-group -->
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
            <button class="btn btn-default" type="button"> <i class="fa fa-search"></i> </button>
            </span> </div>
                        <!-- /input-group -->
                    </li>

                    <li class="nav-small-cap m-t-10">--- Main Menu</li>
                    <li> <a href="index.html" class="waves-effect active"><i class="linea-icon linea-basic fa-fw" data-icon="v"></i> <span class="hide-menu"> 신고 확인 <span class="fa arrow"></span> <span class="label label-rouded label-custom pull-right">4</span></span></a>
                        <ul class="nav nav-second-level">
                            <li> <a href="userReport.do">유저 신고 확인</a></li>
                            <li> <a href="boardReport.do">게시글 신고 확인</a></li>
                            <li> <a href="studyReport.do">스터디 신고 확인</a></li>
                            <li> <a href="index4.html">처리 현황</a> </li>
                        </ul>
                    </li>
                    <li> <a href="javascript:void(0);" class="waves-effect"><i class="linea-icon linea-basic fa-fw text-danger" data-icon="7"></i> <span class="hide-menu text-danger"> 스터디 관리 <span class="fa arrow"></span> <span class="label label-rouded label-danger pull-right">${studynum}</span></span></a>
                        <ul class="nav nav-second-level">
                            <li> <a href="studymanage.do">스터디 확인</a> </li>
                            <li> <a href="studymanage.do">스터디 삭제</a> </li>
                        </ul>
                    </li>
                    <li><a href="inbox.html" class="waves-effect"><i data-icon=")" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">회원 관리 <span class="fa arrow"></span><span class="label label-rouded label-info pull-right">${membernum}</span></span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="userreport.do">유저 확인</a></li>
        					<li><a href="userreport.do">유저 탈퇴</a></li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="/" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">게시글 관리<span class="fa arrow"></span> <span class="label label-rouded label-info pull-right">${boardnum}</span> </span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="boardreport.do">게시글 확인</a></li>
                            <li><a href="boardreport.do">게시글 삭제</a></li>
                        </ul>
                    </li>
                    <li> <a href="#" class="waves-effect"><i data-icon="/" class="linea-icon linea-basic fa-fw"></i> <span class="hide-menu">후기 관리<span class="fa arrow"></span> <span class="label label-rouded label-info pull-right">13</span> </span></a>
                        <ul class="nav nav-second-level">
                            <li><a href="boardreport.do">후기 보기</a></li>
                            <li><a href="boardreport.do">후기 승인</a></li>
                        </ul>
                    </li>
                   </ul>
            </div>
        </div>
        <!-- Left navbar-header end -->
</body>
</html>