<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
        <jsp:include page="upperBar.jsp" flush="false" />
        <!-- Page Content -->
        <div id="wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Customer Service Center</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="primecheck.do" target="_blank"
                            class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">프리미엄
                            구매</a>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">CSC</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
            <!-- container-fluid -->
            <div class="center-container">
                <div class="cont" style="margin:50px">
                    <h1 class="title">도움이 필요하신가요? Do YOU need HELP?</h1>
                    <h2 class="title">위스터디센터는 언제나 최선을 다하겠습니다</h2>
                    <div class="row" style="margin-top:2opx; margin-bottom:50px;">
                        <div class="white-box"
                            style="width:300px; height:100px; margin-bottom:10px; margin-right:20px">
                            <div class="user-bg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"></a>
                                        <h3 class="text-white">
                                            위스터디센터 운영 시간 <span><br>평일 오전 9시 ~ 오후 6시 <br>
                                                점심시간 : 오후 1~2시 <br> 공휴일 휴무 </span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="white-box"
                            style="width:300px; height:100px; margin-bottom:10px; margin-right:20px">
                            <div class="user-bg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"></a>
                                        <h3 class="text-white">
                                            전화 및 팩스 문의 <br>
                                            <span>전화문의 02-754-7301 /<br> 팩스문의 02-754-7305
                                            </span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="white-box"
                            style="width:300px; height:100px; margin-bottom:10px; margin-right:20px">
                            <div class="user-bg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"></a>
                                        <h3 class="text-white">
                                            이메일 문의 <span>encore-aistudy@gmail.com</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="map" style="margin-top:50px;">
                        <h2 class="title" style="margin-top:50px;"> INFORMATION & MAP </h2>
                            <p style="margin-top:10px">
                                <em class="link"> <a href="javascript:void(0);"
                                    onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
                                        혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요. </a>
                                </em>
                            </p>
                            
                            <div id="map" style="width:100%; height:600px;"></div>
                            
                            <script type="text/javascript"
                                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e0b265cbd74fd6a6b07246cad7c00a3&libraries=services">
                            </script>
                        
                        
                            <script>
                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center : new daum.maps.LatLng(37.490763, 127.010499), // 지도의 중심좌표
                                    level : 4
                                // 지도의 확대 레벨
                                };
                        
                                // 지도를 생성합니다    
                                var map = new daum.maps.Map(mapContainer, mapOption);
                        
                                // 주소-좌표 변환 객체를 생성합니다
                                var geocoder = new daum.maps.services.Geocoder();
                        
                                var myAddress = [ "서울특별시 서초구 서초3동 서초대로 46길 42" ];
                        
                                function myMarker(number, address) {
                                    // 주소로 좌표를 검색합니다
                                    geocoder.addressSearch(
                                                    //'충북 청주시 흥덕구 진재로 30 연정빌딩',
                                                    address,
                                                    function(result, status) {
                                                        // 정상적으로 검색이 완료됐으면 
                                                        if (status === daum.maps.services.Status.OK) {
                        
                                                            var coords = new daum.maps.LatLng(
                                                                    result[0].y, result[0].x);
                        
                                                            // 결과값으로 받은 위치를 마커로 표시합니다
                                                            
                                                            var marker = new daum.maps.Marker({
                                                                map : map,
                                                                position : coords
                                                            });
                                                             
                        
                                                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                                                            
                                                            var infowindow = new daum.maps.InfoWindow(
                                                                    {
                                                                        // content : '<div style="width:50px;text-align:center;padding:3px 0;">I</div>'
                                                                        content : '<div style="color:red;">' +  string + '</div>'
                                                                    });
                                                            infowindow.open(map, marker);
                                                             
                        
                                                            // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                                            var content = '<div class="customoverlay">'
                                                                    + '    <span class="title">'
                                                                    + '<div style="font-style:normal; color:red; font-weight:bold; font-size:1.0em">'
                                                                    + string + '</div>' + '</span>'
                                                                    + '</div>';
                        
                                                            // 커스텀 오버레이가 표시될 위치입니다 
                                                            var position = new daum.maps.LatLng(
                                                                    result[0].y, result[0].x);
                        
                                                            // 커스텀 오버레이를 생성합니다
                                                            var customOverlay = new daum.maps.CustomOverlay(
                                                                    {
                                                                        map : map,
                                                                        position : position,
                                                                        content : content,
                                                                        yAnchor : 엔코아
                                                                    });
                        
                                                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                                            map.setCenter(coords);
                                                        }
                                                    });
                                                }
                                        
                                                for (i = 0; i < myAddress.length; i++) {
                                                    myMarker(i + 1, myAddress[i]);
                                                }
                            </script>         
                            
                            
                            </div><!-- class map -->
                                <div class="location" style="margin-top:50px">
                                    <strong>
                                        서울특별시 서초구 서초3동 서초대로 46길 42 엔코아타워<br> 
                                        42, Seocho-daero 46-gil, Seocho-gu, Seoul, 06648, Rep. of KOREA 
                                    </strong>
                                </div>
                            </div>
                            <!-- footer -->
                            <jsp:include page="footer.jsp" flush="false" />
                        </div>
                        <!-- content -->
                        
                    </div>
                    <!-- /#wrapper -->
                    <!-- jQuery -->
                    <script
                        src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
                    <!-- Bootstrap Core JavaScript-->
                    <script
                        src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
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
</body>
</html>