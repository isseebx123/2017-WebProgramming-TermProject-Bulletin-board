<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="util.dbhelper.DBBoardLoad"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>글 수정</title>
	<!-- CSS External 정의 -->
	<link rel="stylesheet" type="text/css" href="./css/TP2_00_MAIN_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_07_NEWWRITE_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_10_BOARD_IMG_MAIN_ASIDE_CSS.css">
	<!-- JS External 정의 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<header>
		<ul id = "MemberUl">
			<%
				try{
					String sessionName = (String)session.getAttribute("sessionName");
					if(sessionName == null){
			%>
				<li><a href='./MemberManagement/Login.jsp'>로그인</a></li>
				<li>|</li>
				<li><a href='./MemberManagement/Signup.jsp'>회원가입</a></li>
				<li>|</li>
				<li><a href='#'>ID/PW찾기</a></li>
			<%
					} else {
			%>
				<li><% out.println(session.getAttribute("sessionName") + "님 어서오세요."); %></li>
				<li>|</li>
				<li><a href='./MemberManagement/Logout.jsp'>로그아웃</a></li>
			<%
					}
				} catch(Exception e){
					System.out.println("TP2_00_Main의 세션에서 로그인 정보를 받아오는 과정에서 예외가 발생하였습니다.");
				}
			%>
		</ul>
	</header>
	<!-- nav (Menu bar) -->
	<nav>
		<ul id = "MenuUl">
			<li class="Menu" id="MyPage"><a href="./TP2_01_MyPage.jsp">마이페이지</a></li>
			<li class="Menu" id="AnonymousBoard"><a href="./TP2_02_AnonymousBoard.jsp">익명게시판</a></li>
			<li class="Menu" id="FreeBoard"><a href="./TP2_03_FreeBoard.jsp">자유게시판</a></li>
			<li id="buffalo"><a href="./TP2_00_Main.jsp"><img src="./img/nav/buffalo.png" alt="buffalo.img"></a></li>
			<li class="Menu" id="Gallery"><a href="./TP2_04_Gallery.jsp">갤러리</a></li>
			<li class="Menu" id="GuestBook"><a href="./TP2_05_GuestBook.jsp">방명록</a></li>
			<li class="Menu" id="SearchItem"><a href="./TP2_06_SearchItem.jsp">자료검색</a></li>
		</ul>
	</nav>
	
	<%
	final String TIME = request.getParameter("time");
	DBBoardLoad dbBoardLoad = DBBoardLoad.getDBBoardLoad();
	ResultSet rs = dbBoardLoad.getStoryRecord(TIME);
	
	if(rs.next()){
	%>
	<!-- 메인시작 -->
	<main>
		<!-- aside 시작 -->
		<aside>
			<fieldset>
	        <textarea id="messageWindow" rows="30" cols="20" readonly="true"></textarea>
	        <br/>
	        <input id="inputMessage" type="text"/>
	        <input type="submit" value="send" onclick="send()" />
	    	</fieldset>
		</aside>
		<form action="./ModifyStory.jsp" method="post" name="newBulletin">
		<input type="hidden" name="time" value="<% out.print(request.getParameter("time"));%>">
		<input type="hidden" name="boardname" value="<% out.print(request.getParameter("boardname"));%>">
		<input type="hidden" name="id" value="<% out.print((String)session.getAttribute("sessionId"));%>">
		<table>
			<thead>
				<tr>
					<td>제목</td>
					<td><input id = "titleInput" name = "title" type="text" value="<% out.print((String)rs.getString("title")); %>"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="file"></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan = "2"><textarea name="content" id="contentInput" ><% out.print((String)rs.getString("content")); }%></textarea></td>
				</tr>
			</tbody>
			<tfoot><tr>
				<td></td><td></td><td></td>
			</tr></tfoot>
		</table>
		<br/>
		<input id="submit" type="button" value="취소" onclick="location.href=
			<%
			final String BOARDNAME = request.getParameter("boardname");
			if(BOARDNAME != null){
				if(BOARDNAME.equals("AnonymousBoard")) out.print("'TP2_02_AnonymousBoard.jsp'");
				else if(BOARDNAME.equals("FreeBoard")) out.print("'TP2_03_FreeBoard.jsp'");
				else if(BOARDNAME.equals("Gallery")) out.print("'TP2_04_Gallery.jsp'");
				else out.print("#");
			}
			%>"/>
		<input id="submit" type="submit" value="게시물수정" />
		</form>
	</main>
		<!-- footer 시작 -->
	<footer>
		<p>posted by <span>ChungNam National University</span>, <span>201302450</span>, Sanghyeon Lee, lsseebx38@gmail.com</p>
	</footer>
</body>
</html>