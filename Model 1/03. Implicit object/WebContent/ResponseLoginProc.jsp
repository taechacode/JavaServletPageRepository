<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("EUC-KR");
	
	// ���������� id�� pass�� ����
	// (������ �����ͺ��̽��� �ִ� ������ �����ؾ���)
	String dbid ="aaaa";
	String dbpass ="1234";
	
	// ����ڷκ��� �Ѿ�� �����͸� �Է� �޾���
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)) {
		
		// ���̵�� �н����尡 ��ġ�ϴϱ� ���� �������� �����־�� �Ѵ�.
		// ���⼭�� �α����� ���������� �̷�������� �˸��� ���� id���� �ѱ�����
		// ���� �н����� ���� �ѱ� ��� URL�� ����Ǹ� �ȵǴµ�, �׶��� ������ ����Ѵ�.
		response.sendRedirect("ResponseMain.jsp?id="+id);
	}
	
	// ���� ���̵�� �н����尡 ��ġ���� ���� ���
	else {
	%>
	
	<script>
		alert("���̵�� �н����尡 ��ġ���� �ʽ��ϴ�.");
		history.go(-1);
	</script>
	
	<%
	}
	%>

</body>
</html>