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
	String senderMailAddress = "lsseebx38@gmail.com"; // SMTP용 구글 아이디
	String receiverMailAddress;
	
	class MyAuthentication extends Authenticator {
        PasswordAuthentication passwordAuthentication;
        public MyAuthentication(){
            String pw = "daltkdgus123*"; // SMTP용 구글 비밀번호
            passwordAuthentication = new PasswordAuthentication(senderMailAddress, pw);
        }
     
        // 시스템에서 사용하는 인증정보
        public PasswordAuthentication getPasswordAuthentication() {
            return passwordAuthentication;
        }
    }
	%>
	
	<%
	request.setCharacterEncoding("euc-kr");
	receiverMailAddress = request.getParameter("email");
	
	/* 인증메일에 전달되는 form태그의 action값(url경로)을 구함 */
	String serverURL = request.getRequestURL().toString();
	String serverURI = request.getRequestURI().toString();
	String urlTokens[] = serverURL.split("/");
	String parentURLPath = serverURL.replaceFirst(urlTokens[urlTokens.length-1], "");
	
	Properties p = System.getProperties();
    p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
    p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
    p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
    p.put("mail.smtp.port", "587");                 // gmail 포트
       
    Authenticator auth = new MyAuthentication();
     
    //session 생성 및  MimeMessage생성
    Session mailSession = Session.getInstance(p, auth);
    MimeMessage msg = new MimeMessage(mailSession);
     
    try{
        // 이메일을 보내는 시간을 설정
        msg.setSentDate(new Date());
        InternetAddress from = new InternetAddress() ;
        from = new InternetAddress(senderMailAddress);
         
        // 이메일 발신자를 설정
        msg.setFrom(from);
        
        // 이메일 수신자를 설정
        InternetAddress to = new InternetAddress(receiverMailAddress);
        msg.setRecipient(Message.RecipientType.TO, to);
         
        // 이메일 제목을 설정
        msg.setSubject("2017 웹프로그래밍(HW1) 회원가입을 위해 인증을 진행해주세요.", "UTF-8");
         
        // 이메일 내용을 설정
        String content = "<h1>회원가입 인증 안내</h1>" + "<hr>" + "아래 [인증하기] 버튼을 클릭하면 회원가입이 완료됩니다.<br/>";
        String formActionUrl = parentURLPath + "SuccessMailAuthentication.jsp";
	
        /* form태그 생성 */
        content += "<form action=\'" + formActionUrl + "\' method='post'>";
        
      	/* 파라미터로 넘어온 인자중 id를 전달 */
    	String id = request.getParameter("id");
        content += "<input type='hidden' name=\'" + "id" + "\' value=\'" + id + "\'/>";
        content += "<input type='submit' value='인증하기'/>";
        content += "</form>";
        
        msg.setText(content, "UTF-8");
         
        // 이메일 헤더를 설정
        msg.setHeader("content-Type", "text/html");
         
        // 작성한 내용과 제목으로 이메일을 보냄
        javax.mail.Transport.send(msg);
        
        out.print("인증 메일이 발송되었습니다.(" + receiverMailAddress + ")로 발송된 이메일을 확인 후, 이메일에 첨부된 URL을 클릭하시면 회원가입이 완료됩니다.");
    } catch (AddressException addr_e) {
        addr_e.printStackTrace();
    } catch (MessagingException msg_e) {
        msg_e.printStackTrace();
    }

	%>
	
</body>
</html>