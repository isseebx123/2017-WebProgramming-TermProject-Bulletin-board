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
	    while(rs.next()){ //�˻��� ����� �����ϸ� true
	        String ID 		  = rs.getString("ID");
	        String PW		  = rs.getString("PW"); 
	        String NAME		  = rs.getString("NAME");
	        String ACTIVATION = rs.getString("ACTIVATION");
	    	if(ACTIVATION.equals("false")){
	    		/* ���������� �������� ���̵��� ��� */
	    		result = "idNeedActivation";
	    		break;
	    	}
	    	else if(ACTIVATION.equals("true") && !PW.equals(requestPw)){
	    		/* ID�� PW�� Ʋ�� ��� */
	    		result = "pwNotCorrect";
	    		break;
	    	}
	    	else if(ACTIVATION.equals("true") && PW.equals(requestPw)){
	    		/* ID�� PW�� ��ġ�ϴ� record�� ���� ��� ���ǿ� ���, �α��� ���� ���� */
	    		result = "idExist";
	    		session.setAttribute("sessionId", ID);
	    		session.setAttribute("sessionName", NAME);
	    		break;
	    	}
	    }
	    
		/* ����� �ڹٽ�ũ��Ʈ�� �Ѱ��� */
		printWriter.print(result);
		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>