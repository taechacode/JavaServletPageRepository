<%@ page import="model.MemberBean" %>
<%@ page import="model.MemberDAO" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 1. �����ͺ��̽����� ��� ȸ���� ������ ������ -->
	<!-- 2. table �±׸� �̿��Ͽ� ȭ�鿡 ȸ������ ������ ��� -->
	
	<%
	MemberDAO mdao = new MemberDAO();
	// ȸ������ ������ �󸶳� ����Ǿ��ִ��� �𸣱⿡ ���������� Vector�� �̿��Ͽ� �����͸� ��������
	Vector<MemberBean> vec = mdao.allSelectMember();
	
	%>
</body>
</html>