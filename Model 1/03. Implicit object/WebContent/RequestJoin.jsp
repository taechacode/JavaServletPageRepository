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
	<h2>회원 가입</h2>
	
	<!-- POST 방식으로 데이터를 RequestJoinProc.jsp으로 전송 -->
	<form action="RequestJoinProc.jsp" method="post">
		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350" align="center">
				
					<!-- input 박스에 이름(name)을 부여해야 서버에서 박스별 데이터 구분 가능 -->
					<input type="text" name="id" size="40" placeholder="id 넣으세요">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드</td>
				<td width="350" align="center">
					<input type="password" name="pass1" size="40" placeholder="비밀번호는 영문과 숫자만 넣어주세요.">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">패스워드확인</td>
				<td width="350" align="center">
					<input type="password" name="pass2" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">이메일</td>
				<td width="350" align="center">
					<input type="email" name="email" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350" align="center">
					<input type="tel" name="tel" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 관심분야</td>
				<td width="350" align="center">
					<input type="checkbox" name="hobby" value="캠핑">캠핑&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="등산">등산&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화">영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서">독서&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 직업은?</td>
				<td width="350" align="center">
					<select name="job">
						<option value="교사">교사</option>
						<option value="변호사">변호사</option>
						<option value="의사">의사</option>
						<option value="기술사">기술사</option>
					</select>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">당신의 연령은</td>
				<td width="350" align="center">
					<input type="radio" name="age" value="10">10대&nbsp;&nbsp;
					<input type="radio" name="age" value="20">20대&nbsp;&nbsp;
					<input type="radio" name="age" value="30">30대&nbsp;&nbsp;
					<input type="radio" name="age" value="40">40대&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">하고싶은말</td>
				<td width="350" align="center">
					<textarea rows="5" cols="40" name="info"></textarea>
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
				
					<!-- submit 버튼을 누르면 form action 수행 -->
					<input type="submit" value="회원 가입">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	</center>
	
</body>
</html>