<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.io.*" %>
<%@page import="util.dbhelper.DBconn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter printWriter = response.getWriter();
		String requestCheckId = request.getParameter("id"); //id를 받아옴
		String requestCheckIdFullName = requestCheckId + ".txt";
		boolean isDuplicate = false;
		
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from Member where ID='" + requestCheckId + "'";
	    ResultSet rs = st.executeQuery(sql);
	    if(rs.next()){ //검색된 결과가 존재하면 true
	    	isDuplicate = true;
	    }
		
		/* 결과를 자바스크립트로 넘겨줌 */
		printWriter.print(isDuplicate);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>