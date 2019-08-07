<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="setting.jsp"%>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>${studyDto.getTitle()}</title>
    <!-- Bootstrap Core CSS -->
    <link href="${project}bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${project}plugins/bower_components/bootstrap-extension/css/bootstrap-extension.css" rel="stylesheet">
    <link href="${project}plugins/bower_components/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css" />
    <!-- Menu CSS -->
    <link href="${project}plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="${project}css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${project}css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="${project}css/colors/megna.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
    <link href="./views/board/style.css" rel="stylesheet">

</head>
<body>

 <!-- Page Content -->
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <!-- <h3 class="box-title m-b-0">${str_qna}</h3>
                            <hr> -->
                            <div class="table-responsive">
                                <table id="myTable" class="table table-striped">
                                    <thead>
                                        <tr>
                                        	<th>공지</th>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>닉네임</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="boardDto" items="${boardDtoList}" varStatus="status">
	                                        <tr>
	                                        	<td>${boardDto.getNotice()}</td>
	                                            <td>
	                                            	<c:if test="${boardDto.getNotice() == 1}">
	                                            		<div class="ribbon-wrapper"><div class="ribbon ribbon-bookmark ribbon-danger">공지</div></div>
	                                            	</c:if>
	                                            	<c:if test="${boardDto.getNotice() == 0}">
	                                            		${boardDto.getId()}
	                                            	</c:if>
	                                            </td>
	                                            <td><a href="boardcontent.do?bid=${boardDto.getId()}">${boardDto.getTitle()}</a></td>
	                                            <td>${boardDto.getNick()}</td>
	                                            <td>${boardDto.getLogtime()}</td>
	                                            <td>${boardDto.getReadcount()}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
      			<button type="button" class="pull-right btn btn-block btn-info" onclick="location='boardInput.do'">글 작성하기</button>
      
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
    <script src="${project}plugins/bower_components/datatables/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			//$('#myTable').DataTable();
			var table = $('#myTable').DataTable({
				"columnDefs": [{
					"visible": false,
					"targets": 0
					}],
				"order": [
					[0, 'desc']
					],
				"displayLength": 25,
				"drawCallback": function(settings) {
					var api = this.api();
					var rows = api.rows({
						page: 'current'
						}).nodes();
					var last = null;

					api.column(0, {
						page: 'current'
					}).data().each(function(group, i) {
						if (last !== group) {
							/* $(rows).eq(i).before(
									'<div class="ribbon-wrapper"><div class="ribbon ribbon-bookmark ribbon-warning">공지</div>'
									);
							$(rows).eq(i).attr('id', 'notice-content');
							$(rows).after(
									'</div>'
									); */
								last = group;
							}
						});
				}
			});
			
			// order by grouping
			$('#myTable tbody').on('click', 'tr.group', function() {
				var currentOrder = table.order()[0];
				
				if (currentOrder[0] === 1 && currentOrder[1] === 'asc') {
					table.order([1, 'desc']).draw();
				} else {
					table.order([1, 'asc']).draw();
				}
			});
		});
	</script>
    <!--Style Switcher -->
    <script src="${project}plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>