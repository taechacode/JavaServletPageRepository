<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<h2>세션 네임 페이지입니다.</h2>
	
	<%
	
	// getAttribute의 전달인자 name1의 value값은 Object형이므로
	// String형 변수 name1에 저장하기 위해서 캐스팅을 해준다.
	String name1 = (String)session.getAttribute("name1");
	
	// String name1 = request.getParameter("name");
	%>
	
	<%=name1%>님 반갑습니다.

</body>
</html>