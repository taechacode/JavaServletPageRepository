<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLoginProc.jsp���� �Ѿ�� ������  -->
	
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<!-- ���� ���������� �Ѱ��� ���� ���� ������ ���̵�� �н����尡 ǥ�õ��� ���� -->
	<!-- request ��ü�� ������ form action�� ���� �Ѱ��� JSP ���ϱ����� �ش���� �� �� ���� -->
	
	<h2>
	RequestForward �������Դϴ�.<br>
	����� ���̵�� <%= id %> �̰� �н������ <%= pass %> �Դϴ�.
	</h2>
	
</body>
</html>