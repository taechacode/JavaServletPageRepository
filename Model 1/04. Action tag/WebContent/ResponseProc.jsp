<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	이 페이지는 로그인 정보가 넘어오는 페이지입니다.
	<%
	request.setCharacterEncoding("EUC-KR"); // 한글처리
	String id = request.getParameter("id"); // request객체에 담겨진 사용자 정보 중 id만 추출
	// response.sendRedirect("ResponseRedirect.jsp"); // 흐름제어
	// response.sendRedirect("ResponseRedirect.jsp?id="+id); // Parameter로 id 넘기기
	%>

	<!-- 흐름제어 -->
	<!-- 넘어받은 id 값을 "mmmm"으로 변경 -->
	<!-- 넘겨받지 않은 phone 값도 넘기기 가능 -->
	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="mmmm" name="id"/> 
		<jsp:param value="1234" name="phone"/> 
	</jsp:forward>
	
	<h3>아이디 : <%=id %></h3>
	
</body>
</html>