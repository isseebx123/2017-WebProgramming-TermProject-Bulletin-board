<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="./css/Signup.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/Signup.js" charset="utf-8"></script>
<title>Sign-up</title>
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
	<header>
	<div>
		2017 �� ���α׷��� TP2<br />�� ����� "TP2"���񽺸� �̿��ϱ� ���ؼ��� ȸ������� �Ϸ� �ؾ��մϴ�.
	</div>
	</header>
	<main>
	<div>
		<form id="form" action="atSignupissueMailAuthentication.jsp"
			onsubmit="return false;"
			onkeydown="if(event.keyCode==13) return false;" method="post">
			<table>
				<thead>
					<tr>
						<td colspan="3"><input id="agreementInput" type="checkbox" />�����
							�����մϴ�.</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ID</td>
						<td><input id="idInput" name="id" type="text" placeholder="���� or ����"
							onchange="setNeedCheckDuplicate()"/></td>
						<td><input type="button" value="�ߺ� üũ" onclick="idDuplicationCheck()" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input id="pwInput" name="password" type="password" placeholder="���� + ����, 8�ڸ� �̻�" onchange="isEqualPasswordConfirm()"/></td>
					</tr>
					<tr>
						<td>Password Ȯ��</td>
						<td><input id="pwConfirmInput" type="password" onchange="isEqualPasswordConfirm()" /></td>
					</tr>
					<tr>
						<td>�̸�</td>
						<td><input id="nameInput" name="name" type="text"
							placeholder="���ڿ��� �Է� ����" onchange="isNameValidate()" /></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><input id="telephoneInput" name="telephone" type="tel"
							placeholder="ex)01(0)-000(0)-0000" onchange="isTelephoneValidate()" /></td>
					</tr>
					<tr>
						<td>�̸���</td>
						<td><input id="emailInput" name="email" type="email" onchange="isEmailValidate()" /></td>
					</tr>
					<tr>
						<td>�������</td>
						<td><input id="birthInput" name="birth" type="date" /></td>
					</tr>
					<tr>
						<td colspan="3"><input type="submit" value="ȸ������"
							onclick="submitClickValidationCheck()" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	</main>
	<footer> </footer>
</body>
</html>