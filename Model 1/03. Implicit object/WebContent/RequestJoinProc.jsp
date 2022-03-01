<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<center>
	
	<h2>회원 정보 보기</h2>
	<%
		// post 방식으로 데이터가 넘어올 때 한글 정보가 깨질 수 있기에
		request.setCharacterEncoding("EUC-KR");
	
		// 각종 사용자로부터 넘어온 데이터를 저장함
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		// getParameterValues는 하나의 name에서 여러 value 값들이 넘어올 때
		// []배열 타입으로 값들을 묶어서 반환(return)해줌
		String[] hobby = request.getParameterValues("hobby");
		
		String job = request.getParameter("job");
		String age = request.getParameter("age");
		String info = request.getParameter("info");
		
		if(!pass1.equals(pass2)) {
	%>
			
		<script type="text/javascript">
			alert("비밀번호가 틀립니다."); // 경고창
			history.go(-1); // 이전 페이지로 이동
		</script>	
	
	<%
		}
	%>
	
	<table width="400" border="1">
		<tr height="50">
			<td width="150" align="center">아이디</td>
			<td width="350" align="center">
				<%= id %>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">이메일</td>
			<td width="350" align="center">
				<%= email %>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">전화번호</td>
			<td width="350" align="center">
				<%= tel %>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">당신의 관심분야</td>
			<td width="350" align="center">
				<%
					// 만약 그냥 hobby만 출력하면 반환(return) 받은 배열의 주소값만 출력된다.
					// 그래서 반복문을 통해 배열 전체를 순회하면서 들어있는 정보를 하나씩 출력해준다.
					for(int i = 0; i < hobby.length; i++) {
						out.write(hobby[i] + " ");
					}
				%>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">직업은</td>
			<td width="350" align="center">
				<%= job %>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">연령은</td>
			<td width="350" align="center">
				<%= age %>
			</td>
		</tr>
		<tr height="50">
			<td width="150" align="center">하고싶은말</td>
			<td width="350" align="center">
				<%= info %>
			</td>
		</tr>
	</table>
	
	</center>
	
</body>
</html>