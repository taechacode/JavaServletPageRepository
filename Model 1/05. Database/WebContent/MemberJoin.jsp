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
	<h2>ȸ�� ����</h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">���̵�</td>
				<td width="350" align="center">
					<input type="text" name="id" size="40" placeholder="id ��������">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�н�����</td>
				<td width="350" align="center">
					<input type="password" name="pass1" size="40" placeholder="��й�ȣ�� ������ ���ڸ� �־��ּ���.">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�н�����Ȯ��</td>
				<td width="350" align="center">
					<input type="password" name="pass2" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�̸���</td>
				<td width="350" align="center">
					<input type="email" name="email" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">��ȭ��ȣ</td>
				<td width="350" align="center">
					<input type="tel" name="tel" size="40">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����� ���ɺо�</td>
				<td width="350" align="center">
					<input type="checkbox" name="hobby" value="ķ��">ķ��&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="���">���&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="��ȭ">��ȭ&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="����">����&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����� ������?</td>
				<td width="350" align="center">
					<select name="job">
						<option value="����">����</option>
						<option value="��ȣ��">��ȣ��</option>
						<option value="�ǻ�">�ǻ�</option>
						<option value="�����">�����</option>
					</select>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����� ������</td>
				<td width="350" align="center">
					<input type="radio" name="age" value="10">10��&nbsp;&nbsp;
					<input type="radio" name="age" value="20">20��&nbsp;&nbsp;
					<input type="radio" name="age" value="30">30��&nbsp;&nbsp;
					<input type="radio" name="age" value="40">40��&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�ϰ������</td>
				<td width="350" align="center">
					<textarea rows="5" cols="40" name="info"></textarea>
				</td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="submit" value="ȸ�� ����">
					<input type="reset" value="���">
				</td>
			</tr>
		</table>
	</form>
	</center>
	
</body>
</html>