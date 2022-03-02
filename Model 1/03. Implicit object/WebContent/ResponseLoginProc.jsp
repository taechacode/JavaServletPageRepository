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
	
	// 임의적으로 id와 pass를 설정
	// (원래는 데이터베이스에 있는 정보와 대조해야함)
	String dbid ="aaaa";
	String dbpass ="1234";
	
	// 사용자로부터 넘어온 데이터를 입력 받아줌
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)) {
		
		// 아이디와 패스워드가 일치하니까 메인 페이지를 보여주어야 한다.
		// 여기서는 로그인이 성공적으로 이루어졌음을 알리기 위해 id값을 넘기지만
		// 만약 패스워드 값을 넘길 경우 URL에 노출되면 안되는데, 그때는 세션을 사용한다.
		response.sendRedirect("ResponseMain.jsp?id="+id);
	}
	
	// 만약 아이디와 패스워드가 일치하지 않을 경우
	else {
	%>
	
	<script>
		alert("아이디와 패스워드가 일치하지 않습니다.");
		history.go(-1);
	</script>
	
	<%
	}
	%>

</body>
</html>