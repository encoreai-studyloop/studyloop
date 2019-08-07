<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<jsp:include page="../notice/webSocket.jsp"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
		<link rel="icon" type="image/png" sizes="16x16" href="../../studyloop/default/plugins/images/favicon.png">
		
		<title>${btn_apply}</title>
		<!-- Bootstrap Core CSS -->
		<link href="../../studyloop/default/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="../../studyloop/default/plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
		<!-- Menu CSS -->
		<link href="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
		<!-- Custom CSS -->
		<link href="../../studyloop/default/css/style.css" rel="stylesheet">
		<link href="${project}css/style.css" rel="stylesheet">
		<!-- Date picker plugins css -->
		<link href="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css"/>
		<!-- animation CSS -->
		<link href="../../studyloop/default/css/animate.css" rel="stylesheet">
		<!-- color CSS -->
		<link href="../../studyloop/default/css/colors/megna.css" id="theme" rel="stylesheet">
		<!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
	</head>
	<body class="content-wrapper bg-light">
		
		<!-- Preloader  -->
		<div class="preloader">
		  <div class="cssload-speeding-wheel"></div>
		</div><!-- Preloader -->
		
		
		<div id="page-wrapper" style="margin: 0px;">
		<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 class="page-title text-center banner">
				<br>${btn_apply}<br><br>
			</h2>
			
			<div class="white-box container-fluid m-0 applybox">
			<form name="applyform" method="post" action="apply.do" onsubmit="return applycheck()">
				<table class="table applytable">
					<tr>
						<th class="text-center" colspan="3">
							<!-- 저장된 정보 불러오기 버튼 -->
							<input type="button" class="inputbutton btn btn-sm btn-info" value="${btn_savedinfo}" name="loaddata">
						</th>
					</tr>
					<tr>
						<td class="text-left text-info" colspan="3">
							${str_saveguide}
						</td>
					</tr>
					<tr>
						<th rowspan="7" class="text-center">
							${str_applyinfo}
						</th>
						<td class="captd">${str_school}</td>
						<td>
							<input class="form-control" type="text" placeholder="${str_school_ex}" name="school">
							<div class="radio-list">
								<div class="radio radio-info radio-inline" style="margin-top: 11px;">
									<input type="radio" name="radio-school" id="${str_attending}" value="${str_attending}">
									<label for="radio1" style="padding-left: 0px;">${str_attending}</label>
								</div>
								<div class="radio radio-info radio-inline" style="margin-top: 11px;">
									<input type="radio" name="radio-school" id="${str_graduate}" value="${str_graduate}">
									<label for="radio2" style="padding-left: 0px;">${str_graduate}</label>
								</div>
								<div class="radio radio-info radio-inline" style="margin-top: 11px;">
									<input type="radio" name="radio-school" id="${str_dropout}" value="${str_dropout}">
									<label for="radio3" style="padding-left: 0px;">${str_dropout}</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="captd">${str_major}</td>
						<td><input class="form-control" type="text" placeholder="${str_major_ex}" name="major"></td>
					</tr>
					<tr>
						<td class="captd">${str_career}</td>
						<td>
						
						<div id="basicgrid" class="jsgrid" style="position: relative;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table id="careertab" class="jsgrid-table table table-striped table-hover">
								<tbody>
								<tr class="jsgrid-header-row">
									<td class="jsgrid-header-cell jsgrid-header-sortable">${str_workspace}</td>
									<td class="jsgrid-header-cell jsgrid-header-sortable">${str_dayworkstart}</td>
									<td class="jsgrid-header-cell jsgrid-header-sortable">${str_dayworkend}</td>
									<td><button id="addcareer" class="jsgrid-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_career}&nbsp;${str_add}">
									<i class="fas fa-plus"></i>
									</button></td>
								</tr>
								<tr class="jsgrid-filter-row">
									<td class="jsgrid-cell"><input class="form-control" type="text" placeholder="${str_career_ex}" name="career1"></td>
									<td class="jsgrid-cell jsgrid-align-center">
										<!-- start datetimepicker -->
										<div class="input-group">
											<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="workstart1"><span class="input-group-addon"><i class="icon-calender"></i></span>
										</div>
										<!-- end datetimepicker -->
									</td>
									<td class="jsgrid-cell jsgrid-align-center">
										<!-- start datetimepicker -->
										<div class="input-group">
											<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="workend1"><span class="input-group-addon"><i class="icon-calender"></i></span>
										</div>
										<!-- end datetimepicker -->
									</td>
									<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center">
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div><!-- basicgrid -->
							
						</td>
					</tr>
					<tr>
						<td class="captd">${str_langrade}</td>
						<td>
						
						<div id="basicgrid" class="jsgrid" style="position: relative;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table id="langtab" class="jsgrid-table table table-striped table-hover">
								<tbody>
								<tr class="jsgrid-header-row">
									<td class="jsgrid-header-cell jsgrid-header-sortable">${str_lang}</td>
									<td class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable">${str_exam}</td>
									<td class="jsgrid-header-cell jsgrid-header-sortable">${str_grade}</td>
									<td class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable">${str_odate}</td>
									<td><button id="addlang" class="jsgrid-button jsgrid-search-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_langrade}&nbsp;${str_add}">
									<i class="fas fa-plus"></i>
									</button></td>
								</tr>
								<tr class="jsgrid-filter-row">
									<td class="jsgrid-cell"><input type="text" class="form-control" name="lang1" placeholder="언어를 입력하세요"></td>
									<td class="jsgrid-cell"><input type="text" class="form-control" name="exam1"></td>
									<td class="jsgrid-cell"><input type="text" class="form-control" name="score1"></td>
									<td class="jsgrid-cell jsgrid-align-center">
										<!-- start datetimepicker -->
										<div class="input-group">
											<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="langodate1"><span class="input-group-addon"><i class="icon-calender"></i></span>
										</div>
										<!-- end datetimepicker -->
									</td>
									<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center">
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div><!-- basicgrid -->
						
						</td>
					</tr>
					
					<tr>
						<td class="captd">${str_certificate}</td>
						<td>
						
						<div id="basicgrid" class="jsgrid" style="position: relative;">
							<div class="jsgrid-grid-header jsgrid-header-scrollbar">
								<table id="certtab" class="jsgrid-table table table-striped table-hover">
								<tbody>
								<tr class="jsgrid-header-row">
									<td class="jsgrid-header-cell jsgrid-header-sortable" style="width: 33%;">${str_cert}</td>
									<td class="jsgrid-header-cell jsgrid-header-sortable" style="width: 33%;">${str_grade}</td>
									<td class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable" style="width: 35%;">${str_odate}</td>
									<td><button id="addcert" class="jsgrid-button jsgrid-search-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_certificate}&nbsp;${str_add}">
									<i class="fas fa-plus"></i>
									</button></td>
								</tr>
								<tr class="jsgrid-filter-row">
									<td class="jsgrid-cell"><input type="text" class="form-control" name="cert1" placeholder="${str_cert_ex}"></td>
									<td class="jsgrid-cell"><input type="text" class="form-control" name="grade1"></td>
									<td class="jsgrid-cell jsgrid-align-center">
										<!-- start datetimepicker -->
										<div class="input-group">
											<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="certodate1"><span class="input-group-addon"><i class="icon-calender"></i></span>
										</div>
										<!-- end datetimepicker -->
									</td>
									<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center">
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
						
						</td>
					</tr>
					
					<tr>
						<td class="captd">${str_purpose}</td>
						<td><input class="form-control" type="text" placeholder="${str_purpose_ex}" name="purpose"></td>
					</tr>
					<tr>
						<td class="captd">${str_goal}</td>
						<td><input class="form-control" type="text" placeholder="${str_goal_ex}" name="goal"></td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">
							${str_aintro}
						</th>
						<td><textarea class="form-control" placeholder="${str_aintro_ex}" name="attendee_intro" rows="5"></textarea></td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">
							${str_arequest}
						</th>
						<td><textarea class="form-control" placeholder="${str_arequest_ex}" name="attendee_request" rows="5"></textarea></td>
					</tr>
					<tr>
						<th class="text-center" colspan="3">
							<input id="userid" type="hidden" value="${userDto.getId()}">
							<input id="usernick" type="hidden" value="${userDto.getNick()}">
							<input id="regstudytitle" type="hidden" value="${studyDto.getTitle()}">
							<input id="studyuserid" type="hidden" value="${studyDto.getUser_id()}">
							<input id="studyregister" type="submit" class="inputbutton btn btn-lg btn-rounded" value="${btn_apply}" style="background-color: midnightblue; color: ivory;">
						</th>
					</tr>
				</table>
			</form>
			</div><!-- /.white-box -->
			
			
			</div><!-- /.col-12 -->
		</div><!-- /.row -->
		</div><!-- /.container-fluid -->
		</div><!-- /.page-wrapper -->
		
		
		<!-- jQuery -->
		<script src="../../studyloop/default/plugins/bower_components/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap Core JavaScript -->
		<script src="../../studyloop/default/bootstrap/dist/js/tether.min.js"></script>
		<script src="../../studyloop/default/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="../../studyloop/default/bootstrap//js/carousel.js"></script>
		<script src="../../studyloop/default/plugins/bower_components/bootstrap-extension/js/bootstrap-extension.min.js"></script>
		<!-- Menu Plugin JavaScript -->
		<script src="../../studyloop/default/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
		<!-- slimscroll JavaScript -->
		<script src="../../studyloop/default/js/jquery.slimscroll.js"></script>
		<!-- Custom Theme JavaScript -->
		<script src="../../studyloop/default/js/custom.min.js"></script>
		<!-- Date Picker Plugin JavaScript -->
		<script src="../../studyloop/default/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<!-- Style Switcher -->
		<script src="../../studyloop/default/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
		<!-- Custom -->
		<script src="${project}js/script.js"></script>
		<!-- Editable -->
		<script type="text/javascript" src="../../studyloop/default/plugins/bower_components/jsgrid/dist/jsgrid.min.js"></script>
		<!-- FontAwesome -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
		
		<script>
		
			$( document ).ready( function() {
				var cntCareer = 1;
				var cntLang = 1;
				var cntCert = 1;
				
				// load saved data
				$("input[name=loaddata]").on(
						"click", 
						function fn_loaddata(code) { 
							$.ajaxSettings.traditional = true;
							$.ajax({
								type: 'GET', 
								url: "<c:url value='/loadPrevData.do'/>",
								dataType : "json", 
								data: { "dataType": "init" }, 
								success: function(data) {
									$.each(data, function(k, v) {
										$("input[name=school]").val(v.school_name);
										$("input[name=major]").val(v.school_major);
										switch ( v.school_status ) {
										case "${str_attending}" : 
											$('#${str_attending}').prop('checked', true);
											break;
										case "${str_graduate}" : 
											$('#${str_graduate}').prop('checked', true);
											break;
										case "${str_dropout}" : 
											$('#${str_dropout}').prop('checked', true);
											break;
										}
										for (var i = 1; i < v.experience.length + 1; i++) {
											if (i > 1) {
												$.fn.addcareer();
											}
											$("input[name=career" + i + "]").val(v.experience[i-1]);
											$("input[name=workstart" + i + "]").val(v.exp_start[i-1]);
											$("input[name=workend" + i + "]").val(v.exp_end[i-1]);
										}
										for (var i = 1; i < v.language.length + 1; i++) {
											if (i > 1) {
												$.fn.addlang();
											}
											$("input[name=lang" + i + "]").val(v.language[i-1]);
											$("input[name=exam" + i + "]").val(v.lang_name[i-1]);
											$("input[name=score" + i + "]").val(v.lang_score[i-1]);
											$("input[name=langodate" + i + "]").val(v.lang_obtain[i-1]);
										}
										for (var i = 1; i < v.cert_name.length + 1; i++) {
											if (i > 1) {
												$.fn.addcert();
											}
											$("input[name=cert" + i + "]").val(v.cert_name[i-1]);
											$("input[name=grade" + i + "]").val(v.cert_score[i-1]);
											$("input[name=certodate" + i + "]").val(v.cert_obtain[i-1]);
										}
										$("input[name=purpose]").val(v.purpose);
										$("input[name=goal]").val(v.goal);
									})
									
								},
								error: function(request,status,error) {
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
									console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
								}
								
							});
						}
					)
					
					// Date Picker
					jQuery('.mydatepicker, #datepicker').datepicker();
					jQuery('.datepicker-autoclose').datepicker({
						autoclose: true,
						todayHighlight: true
						});
					
				$(function() {
					$('[data-toggle="tooltip"]').tooltip();
				})
				
				$('#addcareer').click(function() {
					$.fn.addcareer();
				});
				
				$('#careertab').on("click", "#delcareer", function() {
					$(this).closest("tr").remove();
				});
				
				$('#addlang').click(function() {
					$.fn.addlang();
				});
				
				$('#langtab').on("click", "#dellang", (function() {
					$(this).closest("tr").remove();
				}));
				
				$('#addcert').click(function() {
					$.fn.addcert();
				});
				
				$('#certtab').on("click", "#delcert", (function() {
					$(this).closest("tr").remove();
				}));
				
				$.fn.addcareer = function() {
					cntCareer ++;
					var rowItem = '<tr class="jsgrid-filter-row">';
					rowItem += '<td class="jsgrid-cell"><input class="form-control" type="text" placeholder="${str_career_ex}" name="career' + cntCareer + '"></td>';
					rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
					rowItem += '<div class="input-group">';
					rowItem += '<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="workstart' + cntCareer + '"> <span class="input-group-addon"><i class="icon-calender"></i></span>';
					rowItem += '</div>';
					rowItem += '</td>';
					rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
					rowItem += '<div class="input-group">';
					rowItem += '<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="workend' + cntCareer + '"> <span class="input-group-addon"><i class="icon-calender"></i></span>'; 
					rowItem += '</div>';
					rowItem += '</td>';
					rowItem += '<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center" style="width: 25px;">';
					rowItem += '<button id="delcareer" class="jsgrid-button jsgrid-clear-filter-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_career}&nbsp;${str_del}">';
					rowItem += '<i class="fas fa-minus"></i>';
					rowItem += '</button>';
					rowItem += '</td>';
					rowItem += '</tr>';
					rowItem += '<input type="hidden" id="cntcareer" name="cntcareer" value=cntCareer>'
					
					$('#careertab > tbody:last').append(rowItem);
				}
				
				$.fn.addlang = function() {
					cntLang ++;
					var rowItem = '<tr class="jsgrid-filter-row">';
					rowItem += '<td class="jsgrid-cell"><input type="text" class="form-control" name="lang' + cntLang + '" placeholder="${str_lang_ex}"></td>';
					rowItem += '<td class="jsgrid-cell"><input type="text" class="form-control" name="exam' + cntLang + '"></td>';
					rowItem += '<td class="jsgrid-cell"><input type="text" class="form-control" name="score' + cntLang + '"></td>';
					rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
					rowItem += '<div class="input-group">';
					rowItem += '<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="langodate' + cntLang + '"> <span class="input-group-addon"><i class="icon-calender"></i></span>';
					rowItem += '</div>';
					rowItem += '</td>';
					rowItem += '<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center" style="width: 25px;">';
					rowItem += '<button id="dellang" class="jsgrid-button jsgrid-clear-filter-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_langrade}&nbsp;${str_del}">';
					rowItem += '<i class="fas fa-minus"></i>';
					rowItem += '</button>';
					rowItem += '</td>';
					rowItem += '</tr>';
					
					$('#langtab > tbody:last').append(rowItem);
				}
				
				$.fn.addcert = function() {
					cntCert ++;
					var rowItem = '<tr class="jsgrid-filter-row">';
					rowItem += '<td class="jsgrid-cell"><input type="text" class="form-control" name="cert' + cntCert + '" placeholder="${str_cert_ex}"></td>';
					rowItem += '<td class="jsgrid-cell"><input type="text" class="form-control" name="grade' + cntCert + '"></td>';
					rowItem += '<td class="jsgrid-cell jsgrid-align-center">';
					rowItem += '<div class="input-group">';
					rowItem += '<input type="text" class="form-control datepicker-autoclose" id="datepicker-autoclose" placeholder="MM/DD/YYYY" name="certodate' + cntCert + '"> <span class="input-group-addon"><i class="icon-calender"></i></span>';
					rowItem += '</div>';
					rowItem += '</td>';
					rowItem += '<td class="jsgrid-cell jsgrid-control-field jsgrid-align-center" style="width: 25px;">';
					rowItem += '<button id="delcert" class="jsgrid-button jsgrid-clear-filter-button" type="button" data-toggle="tooltip" data-placement="top" title="${str_certificate}&nbsp;${str_del}">';
					rowItem += '<i class="fas fa-minus"></i>';
					rowItem += '</button>';
					rowItem += '</td>';
					rowItem += '</tr>';
					
					$('#certtab > tbody:last').append(rowItem);
				}
				
				
			});
			
		
		</script>
		
	</body>
</html>