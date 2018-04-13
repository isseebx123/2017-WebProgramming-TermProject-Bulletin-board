<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="util.dbhelper.DBBoardLoad"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Ŀ�´�Ƽ ����Ʈ</title>
	<!-- CSS External ���� -->
	<link rel="stylesheet" type="text/css" href="./css/TP2_00_MAIN_CSS.css">
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
	<!-- ���ν��� -->
	<main>

		<%
		DBBoardLoad dbBoardLoad = DBBoardLoad.getDBBoardLoad();
		List<String> boardNames = Arrays.asList("AnonymousBoard", "FreeBoard", "Gallery");
		String result[] = dbBoardLoad.getAllBoardRecordsWithLimits();
		%>
		<section>
			<article>
				<table>
					<thead><tr>
							<td>�͸�Խ���</td>	<td></td>
					</tr></thead>
					<tbody>
					<% out.print(result[0]); %>
					</tbody>
				</table>
			</article>

			<article>
				<table>
					<thead><tr>
							<td>�����Խ���</td>	<td></td>
					</tr></thead>
					<tbody>
					<% out.print(result[1]); %>
					</tbody>
				</table>
			</article><br/>

			<article id='galleryArticle'>
				<table id='gallery'>
					<thead><tr>
							<td>������</td>	<td></td>
					</tr></thead>
					<tbody>
					<tr><td colspan="2">
					<% out.print(result[2]); %>
					</td></tr>
					</tbody>
				</table>
			</article>
		</section>

	</main>
	<!-- footer ���� -->
	<footer>
		<p>posted by <span>ChungNam National University</span>, <span>201302450</span>, Sanghyeon Lee, lsseebx38@gmail.com</p>
	</footer>
</body>
</html>