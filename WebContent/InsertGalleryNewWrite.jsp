<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String savePath = "D:\\apache-tomcat-7.0.77\\webapps\\ROOT\\upload"; // 저장할 디렉토리 (절대경로)
		int sizeLimit = 5 * 1024 * 1024;
		 
        MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "euc-kr", new DefaultFileRenamePolicy());

        // 파라미터 설정
        String host = multi.getParameter("host");
        String title  = multi.getParameter("title");
        String content = multi.getParameter("content");
       
        // 넘어오는 파일 이름
        String fileName = multi.getFilesystemName("upload");

        // 파일  사이즈 받기
        int size = (int)(new File(savePath + "/" + fileName).length());
       
        // 데이터베이스 접속
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebProgrammingTermProject","WebDBID","qwer1234");

        String query = "insert into upTable values(null, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, host);
        pstmt.setString(2, title);
        pstmt.setString(3, content);
        pstmt.setString(4,  fileName);
        pstmt.setInt(5, size);
        int affectedRow = pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        if(affectedRow != 1){
			out.print("데이터 베이스 입력에 실패하였습니다");
			// 입력에 실패하였다면 서버측에 업로드 된 파일을 삭제한다.
			Enumeration enum1 = multi.getFileNames();
			while(enum1.hasMoreElements()){
				new File(savePath + "/" + multi.getFilesystemName((String)enum1.nextElement())).delete();
			}
        }else{
			response.sendRedirect("TP2_04_Gallery.jsp");
        }
	%>
</body>
</html>