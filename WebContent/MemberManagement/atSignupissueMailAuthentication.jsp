<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="javax.mail.*" %>
<%@ page import ="javax.mail.Authenticator" %>
<%@ page import ="javax.mail.internet.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>issueMailAuthentication</title>
</head>
<body>
	<%!
	String senderMailAddress = "lsseebx38@gmail.com"; // SMTP�� ���� ���̵�
	String receiverMailAddress;
	
	class MyAuthentication extends Authenticator {
        PasswordAuthentication passwordAuthentication;
        public MyAuthentication(){
            String pw = "daltkdgus123*"; // SMTP�� ���� ��й�ȣ
            passwordAuthentication = new PasswordAuthentication(senderMailAddress, pw);
        }
     
        // �ý��ۿ��� ����ϴ� ��������
        public PasswordAuthentication getPasswordAuthentication() {
            return passwordAuthentication;
        }
    }
	%>
	
	<%
	request.setCharacterEncoding("euc-kr");
	receiverMailAddress = request.getParameter("email");
	
	/* �������Ͽ� ���޵Ǵ� form�±��� action��(url���)�� ���� */
	String serverURL = request.getRequestURL().toString();
	String serverURI = request.getRequestURI().toString();
	String urlTokens[] = serverURL.split("/");
	String parentURLPath = serverURL.replaceFirst(urlTokens[urlTokens.length-1], "");
	
	Properties p = System.getProperties();
    p.put("mail.smtp.starttls.enable", "true");     // gmail�� ������ true ����
    p.put("mail.smtp.host", "smtp.gmail.com");      // smtp ���� �ּ�
    p.put("mail.smtp.auth","true");                 // gmail�� ������ true ����
    p.put("mail.smtp.port", "587");                 // gmail ��Ʈ
       
    Authenticator auth = new MyAuthentication();
     
    //session ���� ��  MimeMessage����
    Session mailSession = Session.getInstance(p, auth);
    MimeMessage msg = new MimeMessage(mailSession);
     
    try{
        // �̸����� ������ �ð��� ����
        msg.setSentDate(new Date());
        InternetAddress from = new InternetAddress() ;
        from = new InternetAddress(senderMailAddress);
         
        // �̸��� �߽��ڸ� ����
        msg.setFrom(from);
        
        // �̸��� �����ڸ� ����
        InternetAddress to = new InternetAddress(receiverMailAddress);
        msg.setRecipient(Message.RecipientType.TO, to);
         
        // �̸��� ������ ����
        msg.setSubject("2017 �����α׷���(HW1) ȸ�������� ���� ������ �������ּ���.", "UTF-8");
         
        // �̸��� ������ ����
        String content = "<h1>ȸ������ ���� �ȳ�</h1>" + "<hr>" + "�Ʒ� [�����ϱ�] ��ư�� Ŭ���ϸ� ȸ�������� �Ϸ�˴ϴ�.<br/>";
        String formActionUrl = parentURLPath + "SuccessMailAuthentication.jsp";
	
        /* form�±� ���� */
        content += "<form action=\'" + formActionUrl + "\' method='post'>";
        
      	/* �Ķ���ͷ� �Ѿ�� ������ id�� ���� */
    	String id = request.getParameter("id");
        content += "<input type='hidden' name=\'" + "id" + "\' value=\'" + id + "\'/>";
        content += "<input type='submit' value='�����ϱ�'/>";
        content += "</form>";
        
        msg.setText(content, "UTF-8");
         
        // �̸��� ����� ����
        msg.setHeader("content-Type", "text/html");
         
        // �ۼ��� ����� �������� �̸����� ����
        javax.mail.Transport.send(msg);
        
        out.print("���� ������ �߼۵Ǿ����ϴ�.(" + receiverMailAddress + ")�� �߼۵� �̸����� Ȯ�� ��, �̸��Ͽ� ÷�ε� URL�� Ŭ���Ͻø� ȸ�������� �Ϸ�˴ϴ�.");
    } catch (AddressException addr_e) {
        addr_e.printStackTrace();
    } catch (MessagingException msg_e) {
        msg_e.printStackTrace();
    }

	%>
	
</body>
</html>