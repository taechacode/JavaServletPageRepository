<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	�� �������� �α��� ������ �Ѿ���� �������Դϴ�.
	<%
	request.setCharacterEncoding("EUC-KR"); // �ѱ�ó��
	String id = request.getParameter("id"); // request��ü�� ����� ����� ���� �� id�� ����
	// response.sendRedirect("ResponseRedirect.jsp"); // �帧����
	// response.sendRedirect("ResponseRedirect.jsp?id="+id); // Parameter�� id �ѱ��
	%>

	<!-- �帧���� -->
	<!-- �Ѿ���� id ���� "mmmm"���� ���� -->
	<!-- �Ѱܹ��� ���� phone ���� �ѱ�� ���� -->
	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="mmmm" name="id"/> 
		<jsp:param value="1234" name="phone"/> 
	</jsp:forward>
	
	<h3>���̵� : <%=id %></h3>
	
</body>
</html>