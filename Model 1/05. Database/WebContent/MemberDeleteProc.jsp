<%@page import="model.MemberDAO"%>
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
	%>
	
	<!-- Q. MemberUpdateForm.jsp에서 4개의 데이터만 mbean으로 넘기는데 괜찮나요? -->
	<!-- A. mbean에서 넘어오지 않는 멤버변수에는 null 값이 저장됩니다. -->
	<!-- 하지만 null 값이 저장되는 멤버변수는 사용하지 않을 것이므로 문제가 없습니다. -->
	
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
	<%
	MemberDAO mdao = new MemberDAO();
	
	// String형으로 저장되어있는 패스워드를 가져옴 (DB에서 가져온 pass 값이 저장됨)
	String pass = mdao.getPass(mbean.getId());
	
	// 수정하기 위해서 작성한 패스워드 값과 기존 DB에서 가져온 패스워드 값을 비교
	if(mbean.getPass1().equals(pass)) { // 기존 패스워드와 DB 패스워드가 같다면 Member 테이블을 수정
		
		// MemberDAO 클래스의 회원수정 메소드를 호출
		mdao.deleteMember(mbean.getId());
		response.sendRedirect("MemberList.jsp");
		
	} else {
	%>
	<script type="text/javascript">
	 alert("패스워드가 맞지 않습니다. 다시 확인해주세요.");
	 history.go(-1);
	</script>
	<%
	}
	%>
	
</body>
</html>