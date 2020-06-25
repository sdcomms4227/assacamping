<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reply.ReplyVO"%>
<%@page import="reply.ReplyDAO"%>
<%@page import="reply.ReplyService"%>

<%
	// String pageName = (String) session.getAttribute("boardName");
	String contextPath = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
/* 	int boardCategoryNo = Integer.parseInt((String) session.getAttribute("boardCategoryNo"));
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String userId = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	String pageNum = request.getParameter("pageNum");
	List<ReplyVO> replyList = new ReplyService().getReplyList(boardCategoryNo, boardNo); */
 	int boardCategoryNo = 1;
	int boardNo = 1;
	String userId = "hong";
	String userName = "hong";

	List<ReplyVO> replyList = new ArrayList<>();
	
		ReplyVO replyVO1 = new ReplyVO();
		replyVO1.setBoardCategoryNo(1);
		replyVO1.setBoardNo(1);
		replyVO1.setReplyNo(1);
		replyVO1.setReplyContent("test");
		replyVO1.setUserId("hong");
		replyVO1.setUserName("홍길동");
		replyVO1.setReplyRe_ref(0);
		replyVO1.setReplyRe_lev(0);
		replyVO1.setReplyRe_seq(0);
		replyVO1.setReplyWriteDate(Timestamp.valueOf(LocalDateTime.now()));
		
		ReplyVO replyVO2 = new ReplyVO();
		replyVO2.setBoardCategoryNo(2);
		replyVO2.setBoardNo(1);
		replyVO2.setReplyNo(2);
		replyVO2.setReplyContent("test");
		replyVO2.setUserId("kim");
		replyVO2.setUserName("김강열");
		replyVO2.setReplyRe_ref(0);
		replyVO2.setReplyRe_lev(0);
		replyVO2.setReplyRe_seq(0);
		replyVO2.setReplyWriteDate(Timestamp.valueOf(LocalDateTime.now()));
		
		ReplyVO replyVO3 = new ReplyVO();
		replyVO3.setBoardCategoryNo(1);
		replyVO3.setBoardNo(1);
		replyVO3.setReplyNo(3);
		replyVO3.setReplyContent("test");
		replyVO3.setUserId("chun");
		replyVO3.setUserName("천인우");
		replyVO3.setReplyRe_ref(0);
		replyVO3.setReplyRe_lev(0);
		replyVO3.setReplyRe_seq(0);
		replyVO3.setReplyWriteDate(Timestamp.valueOf(LocalDateTime.now()));
		
		replyList.add(replyVO1);
		replyList.add(replyVO2);
		replyList.add(replyVO3);
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article class="mt-5">
		<div class="row">
			<div class="col-12">
				<h3>댓글</h3>
			</div>
		</div>
		<table class="table reply-list-table">
			<colgroup>
				<col style="width:80px" />
				<col />
				<col style="width:120px" />
			</colgroup>
			<%
				if (replyList.size() > 0) {
					for (int i = 0; i < replyList.size(); i++) {
						ReplyVO replyVO = replyList.get(i);
						int beanNo = replyVO.getReplyNo();
						String beanId = replyVO.getUserId();
						String beanName = replyVO.getUserName();
						String beanContent = replyVO.getReplyContent();
						String beanDate = sdf.format(replyVO.getReplyWriteDate());
			%>
			<tr id="reply<%=beanNo%>">
				<td class="d-none d-lg-table-cell align-middle"><%=beanName%></td>
				<td class="text-left align-middle">
					<%=beanContent%>					
					<%
						if(userId!=null && userId.equals(beanId)){
					%>
						<button type="button" class="btn btn-sm btn-danger ml-2" onclick="replyDelete('<%=beanNo%>')">삭제</button>
					<%
						}
					%>
					<small class="d-block d-lg-none text-right mb-1 text-muted">
						<%=beanName%> | <%=beanDate%>
					</small>
				</td>
				<td class="d-none d-lg-table-cell text-center align-middle">
					<small><%=beanDate%></small>
				</td>
			</tr>
			<%
					}
				} else {
			%>
			<tr id="replyEmpty">
				<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</table>
		<form name="replyform">
			<table class="table reply-form-table bg-light">
				<%
					if(userId==null){
				%>
					<tr>
						<td class="py-5 text-center bg-light">로그인 한 사용자만 댓글을 작성할 수 있습니다.</td>
					</tr>
				<%
					}else{
				%>
					<colgroup class="d-lg-none">
						<col />
						<col style="width:112px" />
					</colgroup>
					<colgroup class="d-none d-lg-table-column-group">
						<col style="width:80px" />
						<col />
						<col style="width:112px" />
					</colgroup>
					<tr>
						<td class="d-none d-lg-table-cell align-middle">
							<p class="m-0"><%=userName%></p>
						</td>
						<td class="pr-0">
							<p class="d-block d-lg-none text-left mb-1 text-muted"><%=userName%></p>
							<label for="replyContent" class="d-none">내용</label>
							<input class="form-control" type="text" name="replyContent" id="replyContent" required />
						</td>
						<td class="align-bottom">
							<button type="button" class="btn btn-primary" onclick="replySubmit()">댓글쓰기</button>
						</td>
					</tr>
				<%
					}
				%>
			</table>
		</form>
	</article>
	<script>
		function replySubmit(){
			
			var boardCategoryNo = "<%=boardCategoryNo%>";
			var boardNo = "<%=boardNo%>";
			var userId = "<%=userId%>";
			var userName = "<%=userName%>";
			var replyContent = document.replyform.replyContent.value; 
			
			if(replyContent.length == 0){
				alert("댓글 내용을 입력해주세요.");
				document.replyform.replyContent.focus();
				return;
			}
			
			var _replyInfo = '{"boardCategoryNo":"'+boardCategoryNo+'","boardNo":"'+boardNo+'","userId":"'+userId+'","userName":"'+userName+'","replyContent":"'+replyContent+'"}';
						
			$.ajax({
				type : "post",
				async : "false",
				url : "<%=contextPath%>/reply/insertReply",
				data : {replyInfo : _replyInfo},
				success : function(data, status){
					var jsonInfo = JSON.parse(data);
					
					var ajaxNo = jsonInfo.replyNo;
					var ajaxName = jsonInfo.userName;
					var ajaxContent = jsonInfo.replyContent;
					var ajaxDate = jsonInfo.replyWriteDate;
					
					var str = "";					
					
					str += '<tr id="reply' + ajaxNo + '">';
					str += '	<td class="d-none d-lg-table-cell align-middle">' + ajaxName + '</td>';
					str += '	<td class="text-left align-middle">';
					str += 			ajaxContent;				
					str += '		<button type="button" class="btn btn-sm btn-danger ml-2" onclick="replyDelete(\'' + ajaxNo + '\')">삭제</button>';
					str += '		<small class="d-block d-lg-none text-right mb-1 text-muted">';
					str += 				ajaxName + ' | ' + ajaxDate;
					str += '		</small>';
					str += '	</td>';
					str += '	<td class="d-none d-lg-table-cell text-center align-middle">';
					str += '		<small>' + ajaxDate + '</small>';
					str += '	</td>';
					str += '</tr>';
					
					$(".reply-list-table").append(str);
					
					$("#replyContent").val("");
					
					if($("#replyEmpty")){
						$("#replyEmpty").remove();
					}
						
				},
				error : function(){
					alert("통신에러가 발생했습니다.");	
				}				
			});
		}
		
		function replyDelete(replyNo){
			
			var result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result){	

				var userId = "<%=userId%>";
				
				var _replyDeleteInfo = '{"userId":"'+userId+'","replyNo":"'+replyNo+'"}';
							
				$.ajax({
					type : "post",
					async : "false",
					url : "<%=contextPath%>/reply/deleteReply",
					data : {replyDeleteInfo : _replyDeleteInfo},
					success : function(data, status){
						if(data == "success"){
							var str = "<td class='alert alert-danger text-center' colspan='3'>댓글이 삭제되었습니다.</td>";						
							$("#reply" + replyNo).html(str).fadeOut(1000, function(){
								$(this).remove();
								if($(".reply-list-table").find("tr").length == 0){
									
									var emptyStr = "";
									
									emptyStr += '<tr id="replyEmpty">';
									emptyStr += '	<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>';
									emptyStr += '</tr>';
									
									$(".reply-list-table").append(emptyStr);
								}
							});
						}else{
							alert("댓글이 정상적으로 삭제되지 않았습니다.");
						}
					},
					error : function(){
						alert("통신에러가 발생했습니다.");	
					}				
				});
			}
		}
	</script>
</body>
</html>