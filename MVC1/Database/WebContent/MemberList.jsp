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

	<!-- 1. 데이터베이스에서 모든 회원의 정보를 가져옴 -->
	<!-- 2. table 태그를 이용하여 화면에 회원들의 정보를 출력 -->
	
	<%
	MemberDAO mdao = new MemberDAO();
	// 회원들의 정보가 얼마나 저장되어있는지 모르기에 가변길이인 Vector를 이용하여 데이터를 저장해줌
	Vector<MemberBean> vec = mdao.allSelectMember();
	
	%>
</body>
</html>