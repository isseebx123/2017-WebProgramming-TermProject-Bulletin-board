<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import='util.dbhelper.DBMemberUpdate' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
    //String.format()을 이용하여 Member테이블에 삽입하는 insert쿼리를 작성
    final String ID = (String)session.getAttribute("sessionId");
    final String EMAIL = request.getParameter("email");
	final String TEL = request.getParameter("tel");
	final String BIRTH = request.getParameter("birth");
    final String SQL = String.format("UPDATE member SET email='%s', tel='%s', birth='%s' WHERE id='%s'", EMAIL, TEL, BIRTH, ID);
    System.out.println(SQL);
	DBMemberUpdate dbMemberUpdate = DBMemberUpdate.getDBMemberUpdate();
   	dbMemberUpdate.updateMemberInformation(SQL);
   	%>
   	<script type='text/javascript'>alert('수정이 완료되었습니다');</script>
   	<%
    /* 게시글수정 완료이후 수정된 마이페이지로 이동 */
    String URL3 = "./TP2_01_MyPage.jsp";
    response.sendRedirect(URL3);
    %>
    
</body>
</html>