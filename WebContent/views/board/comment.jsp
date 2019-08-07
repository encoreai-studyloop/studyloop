<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="./views/board/style.css" rel="stylesheet">
 <script src="../../studyloop/jquery-3.4.1.js"></script>
</head>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>댓글</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <button type="button" onclick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="board_id" name="board_id" value="${boardDto.getId()}" />        
        <input type="hidden" id="study_id" name="study_id" value="${studyDto.getId()}" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){ 
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#content").val("");
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
/*
 * 댓글 삭제하기(Ajax)
 */
 $(document).on("click", "#delbtn", function() {
		var btn = $(this);
		var tr = btn.parent().parent();
		var td = tr.children();
		var comment_id = td.eq(1).text();
		var delconfirm = "댓글을 삭제하시겠습니까?";
		
		if ( confirm( delconfirm ) ) {
			fn_delcomment( comment_id );
		}
	});
	
 function fn_delcomment(comment_id){ 
	   $.ajax({
	       type: 'POST',
	       url: "<c:url value='/board/delComment.do'/>",
	       data: {
	       	"comment_id": comment_id
	       }, 
	       success : function(data){
	           if(data=="success")
	           {
	               getCommentList();
	           }
	       },
	       error:function(request,status,error){
	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	       
	   });
	}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"&nbsp;/&nbsp;작성 시간 : "+data[i].regdate+"</strong></h6>";
                    html += "<tr><td class='contd'>" + data[i].content + "</td>";
                    html += "<td class='hiddentd'>" + data[i].id + "</td>";
                    html += "<td><input type='button' id='delbtn' class='btn btn-sm btn-mute' value='댓글 삭제'></td></tr>";

                    html += "</table></div>";
                    html += "</div>";
                }
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
 
</body>
</html>
