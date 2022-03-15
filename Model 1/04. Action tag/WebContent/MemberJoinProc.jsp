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
	<h2>회원 정보 보기</h2>
	<%
	request.setCharacterEncoding("EUC-KR");
	%>
	
	<!-- request로 넘어온 데이터를 자바 빈즈랑 맵핑 시켜주는 useBean -->
	<jsp:useBean id="mbean" class="bean.MemberBean">
	<!-- MemberBean mbean = new MemberBean() 이렇게 객체 생성하는 것과 의미가 같음 -->
	
		<!-- JSP 내용을 Java Bean 클래스(MemberBean을 의미)에 데이터를 맵핑(넣어줌) -->
		<jsp:setProperty property="*" name="mbean"/>
		<!-- 자동으로 맵핑 시키기 -->
		
		<!-- 만약 id만 맵핑시키고 싶다면 property에 id만 적어주면 된다. -->
		<!-- <jsp:setProperty property="id" name="mbean"/> -->
		
	</jsp:useBean>
	
	<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
	<h2>당신의 비밀번호는 <jsp:getProperty property="pass1" name="mbean"/></h2>
	<h2>당신의 이메일은 <jsp:getProperty property="email" name="mbean"/></h2>
	<h2>당신의 전화는 <%=mbean.getTel() %></h2>
	
	</center>
	
</body>
</html>