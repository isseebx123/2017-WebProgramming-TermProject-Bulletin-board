<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="./css/Login.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/Login.js" charset="utf-8"></script>
<title>login page</title>
</head>
<body>
	<nav>
		<ul id = "MenuUl">
			<li class="Menu" id="MyPage"><a href="../TP2_01_MyPage.jsp">����������</a></li>
			<li class="Menu" id="AnonymousBoard"><a href="../TP2_02_AnonymousBoard.jsp">�͸�Խ���</a></li>
			<li class="Menu" id="FreeBoard"><a href="../TP2_03_FreeBoard.jsp">�����Խ���</a></li>
			<li id="buffalo"><a href="../TP2_00_Main.jsp"><img src="../img/nav/buffalo.png" alt="buffalo.img"></a></li>
			<li class="Menu" id="Gallery"><a href="../TP2_04_Gallery.jsp">������</a></li>
			<li class="Menu" id="GuestBook"><a href="../TP2_05_GuestBook.jsp">����</a></li>
			<li class="Menu" id="SearchItem"><a href="../TP2_06_SearchItem.jsp">�ڷ�˻�</a></li>
		</ul>
	</nav>
	<main>
	<form method="post" action="./setSessionToMain">
	<table>
		<tbody>
			<tr>
				<td class="menu">ID</td>
				<td><input id="idInput" type="text" name="id" placeholder="���� or ����" /></td>
			</tr>
			<tr>
				<td class="menu">Password</td>
				<td><input id="pwInput" type="password" name="pw" placeholder="�ҹ���+�빮��+Ư������+����, 6�ڸ� �̻�" /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="�α���" onclick="checkIdAndPw()" /> 
					<input type="button" value="ȸ������" onclick="location.href='Signup.jsp'" />
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	</main>
</body>
</html>