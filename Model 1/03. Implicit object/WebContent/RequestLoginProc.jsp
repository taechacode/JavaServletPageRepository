<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLogin에서 넘어온 아이디와 패스워드를 읽어들임  -->
	
	<%
	// 사용자 정보가 저장되어 있는 객체 request의 getParameter()를 이용해서 사용자의 정보를 추출
	// getParameter()는 String 자료형으로 값을 return하기 때문에 String 변수로 데이터를 받음
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<h2>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %> 입니다.
	</h2>
	
	<a href="RequestForward.jsp">다음 페이지</a>

</body>
</html>