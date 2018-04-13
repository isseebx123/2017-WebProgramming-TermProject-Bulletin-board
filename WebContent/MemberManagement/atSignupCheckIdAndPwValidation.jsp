<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.regex.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		PrintWriter printWriter;
		String requestId;
		String requestPw;
		String idRegExp = "^[a-zA-Z]{6,10}$"; // 아이디의 정규표현식
		String pwRegExp = "^.*(?=^.{6,20}$)(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=\\[\\];:,<.>/?*-[_]\\(\\)\\{\\}`~\"\'\\|]).*$"; // 패스워드의 정규표현식 
	%>
	<%
		printWriter = response.getWriter();

		requestId = request.getParameter("id");
		requestPw = request.getParameter("pw");
		Pattern patternId = Pattern.compile(idRegExp);
		Pattern patternPw = Pattern.compile(pwRegExp);
		Matcher matcherId = patternId.matcher(requestId);
		Matcher matcherPw = patternPw.matcher(requestPw);

		boolean isMatchId = matcherId.matches();
		boolean isMatchPw = matcherPw.matches();

		if (!isMatchId) {
			printWriter.print("idFalse");
		} else if (!isMatchPw) {
			printWriter.print("pwFalse");
		} else {
			printWriter.print("true");
		}

		printWriter.flush();
		printWriter.close();
	%>
</body>
</html>