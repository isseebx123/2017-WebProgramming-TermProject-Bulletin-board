<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.dbhelper.DBBoardLoad"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 보기</title>
	<!-- CSS External 정의 -->
	<link rel="stylesheet" type="text/css" href="./css/TP2_00_MAIN_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_08_LOOKSTORY_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_10_BOARD_IMG_MAIN_ASIDE_CSS.css">
	<!-- JS External 정의 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/TP2_00_MAIN_JS.js"></script>
	<script type="text/javascript" src="./js/TP2_08_LOOKSTORY_JS.js"></script>
	<script type="text/javascript" src="./js/webSocket_JS.js" charset="UTF-8"></script>
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
	String time = request.getParameter("time");
	DBBoardLoad dbBoardLoad = DBBoardLoad.getDBBoardLoad();
	ResultSet rs = dbBoardLoad.getStoryRecord(time);
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
		<form method="post">
		<input id="boardname" type="hidden" name="boardname" value="<% out.print(request.getParameter("boardname")); %>">
		<table>
			<thead>
				<tr>
					<td>제목</td>
					<td id="title"><% out.print(rs.getString("title")); %></td>
					<td class="titleTD">작성자</td>
					<td id="id"><% out.print(request.getParameter("id")); %></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td></td>
					<td class="titleTD">시간</td>
					<td id="time"><% out.print(request.getParameter("time")); %></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><% out.print(rs.getString("content")); } %></td>
				</tr>
			</tbody>
			<tfoot><tr>
				<td colspan="4">
					<input type="button" value="수정" onclick="isHost('modify')"/>
					<input type="button" value="삭제" onclick="isHost('remove')"/>
					<input type="button" value="목록" onclick="location.href=
					<%
					final String BOARDNAME = request.getParameter("boardname");
					if(BOARDNAME != null){
						if(BOARDNAME.equals("AnonymousBoard")) out.print("'TP2_02_AnonymousBoard.jsp'");
						else if(BOARDNAME.equals("FreeBoard")) out.print("'TP2_03_FreeBoard.jsp'");
						else if(BOARDNAME.equals("Gallery")) out.print("'TP2_04_Gallery.jsp'");
						else out.print("#");
					}
					%>"/>
				</td>
			</tr></tfoot>
		</table>
		<br/>
		
		</form>
	</main>
		<!-- footer 시작 -->
	<footer>
		<p>posted by <span>ChungNam National University</span>, <span>201302450</span>, Sanghyeon Lee, lsseebx38@gmail.com</p>
	</footer>
</body>
</html>