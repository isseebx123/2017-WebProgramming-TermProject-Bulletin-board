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
    //String.format()�� �̿��Ͽ� Member���̺� �����ϴ� insert������ �ۼ�
    final String ID = (String)session.getAttribute("sessionId");
    final String EMAIL = request.getParameter("email");
	final String TEL = request.getParameter("tel");
	final String BIRTH = request.getParameter("birth");
    final String SQL = String.format("UPDATE member SET email='%s', tel='%s', birth='%s' WHERE id='%s'", EMAIL, TEL, BIRTH, ID);
    System.out.println(SQL);
	DBMemberUpdate dbMemberUpdate = DBMemberUpdate.getDBMemberUpdate();
   	dbMemberUpdate.updateMemberInformation(SQL);
   	%>
   	<script type='text/javascript'>alert('������ �Ϸ�Ǿ����ϴ�');</script>
   	<%
    /* �Խñۼ��� �Ϸ����� ������ ������������ �̵� */
    String URL3 = "./TP2_01_MyPage.jsp";
    response.sendRedirect(URL3);
    %>
    
</body>
</html>