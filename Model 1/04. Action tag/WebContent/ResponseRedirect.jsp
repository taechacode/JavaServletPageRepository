<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>ResponseRedirect.jsp �������Դϴ�.</h2>
	<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String phone = request.getParameter("phone");
	%>
	
	<h3>���̵� : <%=id %></h3>
	<h3>��ȭ��ȣ : <%=phone %></h3>
	
</body>
</html>