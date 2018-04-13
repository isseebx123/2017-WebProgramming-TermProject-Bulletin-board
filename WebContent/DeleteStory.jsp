<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.dbhelper.DBBoardRemove"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제</title>
</head>
<body>
	<%
		final String TIME = request.getParameter("time"); 
		System.out.println("time:"+TIME);
		DBBoardRemove dbBoardRemove = DBBoardRemove.getDBBoardRemove();
		if(dbBoardRemove.excuteRemove(TIME)){

		final String BOARDNAME = request.getParameter("boardname");
		if(BOARDNAME != null){
			if(BOARDNAME.equals("AnonymousBoard"))	response.sendRedirect("./TP2_02_AnonymousBoard.jsp");
			else if(BOARDNAME.equals("FreeBoard"))	response.sendRedirect("./TP2_03_FreeBoard.jsp");
			else response.sendRedirect("#");
		}
		}
		else{
	%>
	<script type="text/javascript">
		alert('오류가 발생하여 게시글 삭제가 완료되지 못했습니다.');
	</script>
	<% } %>
</body>
</html>