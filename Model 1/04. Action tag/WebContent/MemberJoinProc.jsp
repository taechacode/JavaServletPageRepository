<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<center>
	<h2>ȸ�� ���� ����</h2>
	<%
	request.setCharacterEncoding("EUC-KR");
	%>
	
	<!-- request�� �Ѿ�� �����͸� �ڹ� ����� ���� �����ִ� useBean -->
	<jsp:useBean id="mbean" class="bean.MemberBean">
	<!-- MemberBean mbean = new MemberBean() �̷��� ��ü �����ϴ� �Ͱ� �ǹ̰� ���� -->
	
		<!-- JSP ������ Java Bean Ŭ����(MemberBean�� �ǹ�)�� �����͸� ����(�־���) -->
		<jsp:setProperty property="*" name="mbean"/>
		<!-- �ڵ����� ���� ��Ű�� -->
		
		<!-- ���� id�� ���ν�Ű�� �ʹٸ� property�� id�� �����ָ� �ȴ�. -->
		<!-- <jsp:setProperty property="id" name="mbean"/> -->
		
	</jsp:useBean>
	
	<h2>����� ���̵�� <jsp:getProperty property="id" name="mbean"/></h2>
	<h2>����� ��й�ȣ�� <jsp:getProperty property="pass1" name="mbean"/></h2>
	<h2>����� �̸����� <jsp:getProperty property="email" name="mbean"/></h2>
	<h2>����� ��ȭ�� <%=mbean.getTel() %></h2>
	
	</center>
	
</body>
</html>