<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLoginProc.jsp에서 넘어온 페이지  -->
	
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<!-- 이전 페이지에서 넘겨준 것이 없기 때문에 아이디와 패스워드가 표시되지 않음 -->
	<!-- request 객체의 범위는 form action을 통해 넘겨준 JSP 파일까지만 해당됨을 알 수 있음 -->
	
	<h2>
	RequestForward 페이지입니다.<br>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %> 입니다.
	</h2>
	
</body>
</html>