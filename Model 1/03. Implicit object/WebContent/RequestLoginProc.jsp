<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- RequestLogin���� �Ѿ�� ���̵�� �н����带 �о����  -->
	
	<%
	// ����� ������ ����Ǿ� �ִ� ��ü request�� getParameter()�� �̿��ؼ� ������� ������ ����
	// getParameter()�� String �ڷ������� ���� return�ϱ� ������ String ������ �����͸� ����
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	%>
	
	<h2>
	����� ���̵�� <%= id %> �̰� �н������ <%= pass %> �Դϴ�.
	</h2>
	
	<a href="RequestForward.jsp">���� ������</a>

</body>
</html>