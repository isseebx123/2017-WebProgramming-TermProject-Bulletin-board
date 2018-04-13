<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="util.dbhelper.DBBoardLoad"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�� ����</title>
	<!-- CSS External ���� -->
	<link rel="stylesheet" type="text/css" href="./css/TP2_00_MAIN_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_07_NEWWRITE_CSS.css">
	<link rel="stylesheet" type="text/css" href="./css/TP2_10_BOARD_IMG_MAIN_ASIDE_CSS.css">
	<!-- JS External ���� -->
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
				<li><a href='./MemberManagement/Login.jsp'>�α���</a></li>
				<li>|</li>
				<li><a href='./MemberManagement/Signup.jsp'>ȸ������</a></li>
				<li>|</li>
				<li><a href='#'>ID/PWã��</a></li>
			<%
					} else {
			%>
				<li><% out.println(session.getAttribute("sessionName") + "�� �������."); %></li>
				<li>|</li>
				<li><a href='./MemberManagement/Logout.jsp'>�α׾ƿ�</a></li>
			<%
					}
				} catch(Exception e){
					System.out.println("TP2_00_Main�� ���ǿ��� �α��� ������ �޾ƿ��� �������� ���ܰ� �߻��Ͽ����ϴ�.");
				}
			%>
		</ul>
	</header>
	<!-- nav (Menu bar) -->
	<nav>
		<ul id = "MenuUl">
			<li class="Menu" id="MyPage"><a href="./TP2_01_MyPage.jsp">����������</a></li>
			<li class="Menu" id="AnonymousBoard"><a href="./TP2_02_AnonymousBoard.jsp">�͸�Խ���</a></li>
			<li class="Menu" id="FreeBoard"><a href="./TP2_03_FreeBoard.jsp">�����Խ���</a></li>
			<li id="buffalo"><a href="./TP2_00_Main.jsp"><img src="./img/nav/buffalo.png" alt="buffalo.img"></a></li>
			<li class="Menu" id="Gallery"><a href="./TP2_04_Gallery.jsp">������</a></li>
			<li class="Menu" id="GuestBook"><a href="./TP2_05_GuestBook.jsp">����</a></li>
			<li class="Menu" id="SearchItem"><a href="./TP2_06_SearchItem.jsp">�ڷ�˻�</a></li>
		</ul>
	</nav>
	
	<%
	final String TIME = request.getParameter("time");
	DBBoardLoad dbBoardLoad = DBBoardLoad.getDBBoardLoad();
	ResultSet rs = dbBoardLoad.getStoryRecord(TIME);
	
	if(rs.next()){
	%>
	<!-- ���ν��� -->
	<main>
		<!-- aside ���� -->
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
					<td>����</td>
					<td><input id = "titleInput" name = "title" type="text" value="<% out.print((String)rs.getString("title")); %>"></td>
				</tr>
				<tr>
					<td>÷������</td>
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
		<input id="submit" type="button" value="���" onclick="location.href=
			<%
			final String BOARDNAME = request.getParameter("boardname");
			if(BOARDNAME != null){
				if(BOARDNAME.equals("AnonymousBoard")) out.print("'TP2_02_AnonymousBoard.jsp'");
				else if(BOARDNAME.equals("FreeBoard")) out.print("'TP2_03_FreeBoard.jsp'");
				else if(BOARDNAME.equals("Gallery")) out.print("'TP2_04_Gallery.jsp'");
				else out.print("#");
			}
			%>"/>
		<input id="submit" type="submit" value="�Խù�����" />
		</form>
	</main>
		<!-- footer ���� -->
	<footer>
		<p>posted by <span>ChungNam National University</span>, <span>201302450</span>, Sanghyeon Lee, lsseebx38@gmail.com</p>
	</footer>
</body>
</html>