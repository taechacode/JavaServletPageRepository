<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.MemberDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("EUC-KR");
	
		// 취미 부분은 별도로 읽어서 다시 bean 클래스에 저장
		String[] hobby = request.getParameterValues("hobby");
		// 배열에 있는 내용을 하나의 String으로 저장
		String texthobby="";
		
		for(int i = 0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}
	%>
	
		<!-- useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
		<jsp:useBean id="mbean" class="model.MemberBean">
			<jsp:setProperty name="mbean" property="*"/> <!-- 맵핑 시키기 -->
		</jsp:useBean>
	
	<%
		// 기존 취미는 주소번지가 저장되기에 위의 배열 내용을 저장한 String형 변수를 다시 입력
		mbean.setHobby(texthobby);
		
		// 데이터베이스 클래스 객체 생성
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
		
		// 회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동시킴
		response.sendRedirect("MemberList.jsp");
	%>
		오라클에 접속 완료
		
		<%-- <h2>당신의 아이디 = <%=mbean.getId() %></h2>
		<h2>당신의 취미는 = <%=mbean.getHobby() %></h2> --%>
	
</body>
</html>