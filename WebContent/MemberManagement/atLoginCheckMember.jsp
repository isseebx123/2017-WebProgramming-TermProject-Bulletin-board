<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
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
		String requestId = request.getParameter("id");
		String requestPw = request.getParameter("pw");
		String result = "idNotExist";
		
		Connection conn = DBconn.getConnection();
	    Statement st = conn.createStatement();
	    String sql = "Select * from Member where ID='" + requestId + "'";
	    ResultSet rs = st.executeQuery(sql);
	    while(rs.next()){ //검색된 결과가 존재하면 true
	        String ID 		  = rs.getString("ID");
	        String PW		  = rs.getString("PW"); 
	        String NAME		  = rs.getString("NAME");
	        String ACTIVATION = rs.getString("ACTIVATION");
	    	if(ACTIVATION.equals("false")){
	    		/* 메일인증을 진행중인 아이디인 경우 */
	    		result = "idNeedActivation";
	    		break;
	    	}
	    	else if(ACTIVATION.equals("true") && !PW.equals(requestPw)){
	    		/* ID의 PW가 틀린 경우 */
	    		result = "pwNotCorrect";
	    		break;
	    	}
	    	else if(ACTIVATION.equals("true") && PW.equals(requestPw)){
	    		/* ID와 PW가 일치하는 record가 있을 경우 세션에 등록, 로그인 성공 진행 */
	    		result = "idExist";
	    		session.setAttribute("sessionId", ID);
	    		session.setAttribute("sessionName", NAME);
	    		break;
	    	}
	    }
	    
		/* 결과를 자바스크립트로 넘겨줌 */
		printWriter.print(result);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>