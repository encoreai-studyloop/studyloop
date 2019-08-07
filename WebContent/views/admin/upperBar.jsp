<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Top Navigation -->
<nav class="navbar navbar-default navbar-static-top m-b-0">
	<div class="navbar-header" style="padding-left: 20px">
		<ul class="nav navbar-top-links navbar-right pull-right">
			<li class="nav-item"><a class="nav-link" href="#">서비스 소개</a></li>
			

			<c:if test="${userDto == null }">
				<li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="register.do">회원
					가입</a></li>
			</c:if>
			<c:if test="${userDto != null }">
				<li class="nav-item"><a class="nav-link" href="titleForm.do">스터디 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
				<li class="dropdown"><a
					class="dropdown-toggle waves-effect waves-light"
					data-toggle="dropdown" href="#"><i class="icon-envelope"></i>
						<div class="notify">
							<span class="heartbit"></span><span class="point"></span>
						</div> </a>

					<ul class="dropdown-menu mailbox animated flipInY">
						<li>
							<div class="drop-title">You have 4 new messages</div>
						</li>
						<li>
							<div class="message-center">								
								<a href="#">
									<div class="user-img">
										<img
											src="../../studyloop/default/plugins/images/users/pawandeep.jpg"
											alt="user" class="img-circle"> <span
											class="profile-status offline pull-right"></span>
									</div>
									<div class="mail-contnet">
										<h5>Pavan kumar</h5>
										<span class="mail-desc">Just see the my admin!</span> <span
											class="time">9:02 AM</span>
									</div>
								</a>
							</div>
						</li>
						<li><a class="text-center" href="javascript:void(0);"> <strong>See
									all notifications</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a
					class="dropdown-toggle waves-effect waves-light"
					data-toggle="dropdown" href="#"><i class="icon-note"></i>
						<div class="notify">
							<span class="heartbit"></span><span class="point"></span>
						</div> </a>
					<ul class="dropdown-menu dropdown-tasks animated flipInX">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">20%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">80%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="80" aria-valuemin="0"
											aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle profile-pic"
					data-toggle="dropdown" href="#"> <img
						src="../../studyloop/default/plugins/images/users/varun.jpg"
						alt="user-img" width="36" class="img-circle"><b
						class="hidden-xs">${userDto.getNick()}</b>
				</a>
					<ul class="dropdown-menu dropdown-user animated flipInY">
						<li><a href="mypage.do?id=${userDto.getId()}"><i class="ti-user"></i> 마이페이지</a></li>
						<li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
						<li><a href="#"><i class="ti-email"></i> Inbox</a></li>
						<li role="separator" class="divider"></li>
						<li role="separator" class="divider"></li>
						<li><a href="logout.do"><i class="fa fa-power-off"></i> 로그아웃</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- .Megamenu -->
				<li class="mega-dropdown"><a
					class="dropdown-toggle waves-effect waves-light"
					data-toggle="dropdown" href="#"><span class="hidden-xs">카테고리</span>
						<i class="icon-options-vertical"></i></a>
					<ul class="dropdown-menu mega-dropdown-menu animated bounceInDown">
						<li class="col-sm-2">
							<ul>
								<li class="dropdown-header">취업</li>
								<li><a href="form-basic.html">Basic Forms</a></li>
								<li><a href="form-layout.html">Form Layout</a></li>
								<li><a href="form-advanced.html">Form Addons</a></li>
								<li><a href="form-material-elements.html">Form Material</a></li>
								<li><a href="form-float-input.html">Form Float Input</a></li>
								<li><a href="form-upload.html">File Upload</a></li>
								<li><a href="form-mask.html">Form Mask</a></li>
								<li><a href="form-img-cropper.html">Image Cropping</a></li>
								<li><a href="form-validation.html">Form Validation</a></li>
							</ul>
						</li>
						<li class="col-sm-2">
							<ul>
								<li class="dropdown-header">자격증</li>
								<li><a href="form-dropzone.html">File Dropzone</a></li>
								<li><a href="form-pickers.html">Form-pickers</a></li>
								<li><a href="icheck-control.html">Icheck Form Controls</a></li>
								<li><a href="form-wizard.html">Form-wizards</a></li>
								<li><a href="form-typehead.html">Typehead</a></li>
								<li><a href="form-xeditable.html">X-editable</a></li>
								<li><a href="form-summernote.html">Summernote</a></li>
								<li><a href="form-bootstrap-wysihtml5.html">Bootstrap
										wysihtml5</a></li>
								<li><a href="form-tinymce-wysihtml5.html">Tinymce
										wysihtml5</a></li>
							</ul>
						</li>
						<li class="col-sm-2">
							<ul>
								<li class="dropdown-header">어학</li>
								<li><a href="basic-table.html">Basic Tables</a></li>
								<li><a href="table-layouts.html">Table Layouts</a></li>
								<li><a href="data-table.html">Data Table</a></li>
								<li class="hidden"><a href="crud-table.html">Crud Table</a></li>
								<li><a href="bootstrap-tables.html">Bootstrap Tables</a></li>
								<li><a href="responsive-tables.html">Responsive Tables</a></li>
								<li><a href="editable-tables.html">Editable Tables</a></li>
								<li><a href="foo-tables.html">FooTables</a></li>
								<li><a href="jsgrid.html">JsGrid Tables</a></li>
							</ul>
						</li>
						<li class="col-sm-2">
							<ul>
								<li class="dropdown-header">전공</li>
								<li><a href="flot.html">Flot Charts</a></li>
								<li><a href="morris-chart.html">Morris Chart</a></li>
								<li><a href="chart-js.html">Chart-js</a></li>
								<li><a href="peity-chart.html">Peity Charts</a></li>
								<li><a href="knob-chart.html">Knob Charts</a></li>
								<li><a href="sparkline-chart.html">Sparkline charts</a></li>
								<li><a href="extra-charts.html">Extra Charts</a></li>
							</ul>
						</li>
						<li class="col-sm-2">
							<ul>
								<li class="dropdown-header">기타</li>
								<li><a href="flot.html">Flot Charts</a></li>
								<li><a href="morris-chart.html">Morris Chart</a></li>
								<li><a href="chart-js.html">Chart-js</a></li>
								<li><a href="peity-chart.html">Peity Charts</a></li>
								<li><a href="knob-chart.html">Knob Charts</a></li>
								<li><a href="sparkline-chart.html">Sparkline charts</a></li>
								<li><a href="extra-charts.html">Extra Charts</a></li>
							</ul>
						</li>
						<li class="col-sm-12 m-t-40 demo-box">
							<div class="row">
								<div class="col-sm-2">
									<div class="white-box text-center bg-purple">
										<a
											href="http://eliteadmin.themedesigner.in/demos/eliteadmin-inverse/index.html"
											target="_blank" class="text-white"><i
											class="linea-icon linea-basic fa-fw" data-icon="v"></i><br />Demo
											1</a>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="white-box text-center bg-success">
										<a
											href="http://eliteadmin.themedesigner.in/demos/eliteadmin/index.html"
											target="_blank" class="text-white"><i
											class="linea-icon linea-basic fa-fw" data-icon="v"></i><br />Demo
											2</a>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="white-box text-center bg-info">
										<a
											href="http://eliteadmin.themedesigner.in/demos/eliteadmin-ecommerce/index.html"
											target="_blank" class="text-white"><i
											class="linea-icon linea-basic fa-fw" data-icon="v"></i><br />Demo
											3</a>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="white-box text-center bg-inverse">
										<a
											href="http://eliteadmin.themedesigner.in/demos/eliteadmin-horizontal-navbar/index3.html"
											target="_blank" class="text-white"><i
											class="linea-icon linea-basic fa-fw" data-icon="v"></i><br />Demo
											4</a>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="white-box text-center bg-warning">
										<a
											href="http://eliteadmin.themedesigner.in/demos/eliteadmin-iconbar/index4.html"
											target="_blank" class="text-white"><i
											class="linea-icon linea-basic fa-fw" data-icon="v"></i><br />Demo
											5</a>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="white-box text-center bg-danger">
										<a
											href="https://themeforest.net/item/elite-admin-responsive-web-app-kit-/16750820?ref=suniljoshi"
											target="_blank" class="text-white"><i
											class="linea-icon linea-ecommerce fa-fw" data-icon="d"></i><br />프리미엄
											구매</a>
									</div>
								</div>
							</div>
						</li>
					</ul></li>
				<!-- /.Megamenu -->
				<li class="right-side-toggle"><a
					class="waves-effect waves-light" href="javascript:void(0)"><i
						class="ti-settings"></i></a></li>
				<!-- /.dropdown -->
			</c:if>
		</ul>
	</div>
	<!-- /.navbar-header -->
	<!-- /.navbar-top-links -->
	<!-- /.navbar-static-side -->
</nav>
<!-- End Top Navigation -->
    <script>   
   
    </script> 