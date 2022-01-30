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
		<h2>로그인 페이지</h2>
		
		<!-- POST 방식으로 데이터를 RequestLoginProc.jsp으로 전송 -->
		<form action="RequestLoginProc.jsp" method="post">
			<table width="400" border="1">
				<tr height="60">
					<td align="center" width="150">아이디</td>
					<td align="center" width="250">
						<input type="text" name="id">
					</td>
				</tr>
				<tr height="60">
					<td align="center" width="150">패스워드</td>
					<td align="center" width="250">
						<input type="password" name="pass">
					</td>
				</tr>
				<tr height="60">
					<td colspan="2" align="center">
					
						<!-- submit 버튼을 누르면 form action 수행 -->
						<input type="submit" value="전송">
					</td>
				</tr>
			</table>
		</form>
	</center>
	
</body>
</html>