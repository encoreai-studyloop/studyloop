<%@page import="java.util.ArrayList"%>
<%@page import="databean.CategoryDataBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
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
	<div id="wrapper">
		<!-- Top Navigation -->
		<jsp:include page="upperBar.jsp"/>
		<!-- Page Content -->
		<div id="wrapper">
			<div class="container-fluid">			
				<!--.row -->
				<div class="row bg-title">
	                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
	                        <h4 class="page-title">Faqs page</h4> </div>
	                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12"> <a href="https://themeforest.net/item/elite-admin-the-ultimate-dashboard-web-app-kit-material-design/16750820?ref=suniljoshi" target="_blank" class="btn btn-danger pull-right m-l-20 btn-rounded btn-outline hidden-xs hidden-sm waves-effect waves-light">Buy Now</a>
	                        <ol class="breadcrumb">
	                            <li><a href="#">Dashboard</a></li>
	                            <li><a href="#">Sample Pages</a></li>
	                            <li class="active">Faqs page</li>
	                        </ol>
	                    </div>
	                </div>
				
				 <div class="row">
	                    <div class="col-md-12">
	                        <h4 class="box-title m-b-20">Basic FAQs</h4>
	                        <div class="panel-group" role="tablist" aria-multiselectable="true">
	                            <div class="panel panel-default">
	                                <div class="panel-heading" role="tab" id="headingOne">
	                                    <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="font-bold"> How can i purchase my admin ? </a> </h4> </div>
	                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
	                                    <div class="panel-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer la. </div>
	                                </div>
	                            </div>
	                            <div class="panel panel-default">
	                                <div class="panel-heading" role="tab" id="headingTwo">
	                                    <h4 class="panel-title"> <a class="collapsed font-bold" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" > How to modify Navigation ? </a> </h4> </div>
	                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	                                    <div class="panel-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, </div>
	                                </div>
	                            </div>
	                            <div class="panel panel-default">
	                                <div class="panel-heading" role="tab" id="headingThree">
	                                    <h4 class="panel-title"> <a class="font-bold collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" > How to get yearly Support? </a> </h4> </div>
	                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
	                                    <div class="panel-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, inable VHS. </div>
	                                </div>
	                            </div>
	                            <div class="panel panel-default">
	                                <div class="panel-heading" role="tab" id="headingFour"> <a class="collapsed font-bold panel-title" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"> How to take a tour? </a> </div>
	                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
	                                    <div class="panel-body"> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, inable VHS. </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-md-12">
	                        <h4 class="box-title m-b-20">Advanced FAQs</h4>
	                        <div class="panel-group" id="accordion1" aria-multiselectable="true" role="tablist">
	                            <div class="panel">
	                                <div class="panel-heading" id="exampleHeadingDefaultOne" role="tab"> <a class="panel-title" data-toggle="collapse" href="#exampleCollapseDefaultOne" data-parent="#accordion1" aria-expanded="true" aria-controls="exampleCollapseDefaultOne"> Collapsible Group Item #1 </a> </div>
	                                <div class="panel-collapse collapse show" id="exampleCollapseDefaultOne" aria-labelledby="exampleHeadingDefaultOne" role="tabpanel">
	                                    <div class="panel-body"> De moveat laudatur vestra parum doloribus labitur sentire partes, eripuit praesenti congressus ostendit alienae, voluptati ornateque accusamus clamat reperietur convicia albucius, veniat quocirca vivendi aristotele errorem epicurus. Suppetet. Aeternum animadversionis, turbent cn partem porrecta c putamus diceret decore. Vero itaque incursione. </div>
	                                </div>
	                            </div>
	                            <div class="panel">
	                                <div class="panel-heading" id="exampleHeadingDefaultTwo" role="tab"> <a class="panel-title collapsed" data-toggle="collapse" href="#exampleCollapseDefaultTwo" data-parent="#accordion1" aria-expanded="false" aria-controls="exampleCollapseDefaultTwo"> Collapsible Group Item #2 </a> </div>
	                                <div class="panel-collapse collapse" id="exampleCollapseDefaultTwo" aria-labelledby="exampleHeadingDefaultTwo" role="tabpanel">
	                                    <div class="panel-body"> Praestabiliorem. Pellat excruciant legantur ullum leniter vacare foris voluptate loco ignavi, credo videretur multoque choro fatemur mortis animus adoptionem, bello statuat expediunt naturales frequenter terminari nomine, stabilitas privatio initia paranda contineri abhorreant, percipi dixerit incurreret deorsum imitarentur tenetur antiopam latinam haec. </div>
	                                </div>
	                            </div>
	                            <div class="panel">
	                                <div class="panel-heading" id="exampleHeadingDefaultThree" role="tab"> <a class="panel-title collapsed" data-toggle="collapse" href="#exampleCollapseDefaultThree" data-parent="#accordion1" aria-expanded="false" aria-controls="exampleCollapseDefaultThree"> Collapsible Group Item #3 </a> </div>
	                                <div class="panel-collapse collapse" id="exampleCollapseDefaultThree" aria-labelledby="exampleHeadingDefaultThree" role="tabpanel">
	                                    <div class="panel-body"> Horum, antiquitate perciperet d conspectum locus obruamus animumque perspici probabis suscipere. Desiderat magnum, contenta poena desiderant concederetur menandri damna disputandum corporum equidem cyrenaicisque. Defuturum ultimum ista ignaviamque iudicant feci incursione, reprimique fruenda utamur tu faciam complexiones eo, habeo ortum iucundo artes. </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <!-- .row -->
               </div>
			

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
		

		
		<!-- footer -->
		<jsp:include page="footer.jsp" flush="false" />
				
		

		</div>
		<!-- /#page-wrapper -->

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
</body>

</html>
