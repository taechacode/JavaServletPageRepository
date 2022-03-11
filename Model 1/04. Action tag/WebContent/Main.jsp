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
		<table border="1" width="800">
			
			<!-- Top -->
			<tr height="150">
				<td align="center" colspan="2">
				
					<!-- 로그인 정보를 Top.jsp에서 처리한 후 Main.jsp로 병합한다. -->
					<jsp:include page="Top.jsp">
						<jsp:param value="aaa" name="id"/>
					</jsp:include>
				</td>
			</tr>
			
			<!-- Left -->
			<tr height="400">
				<td align="center" width="200">
					<jsp:include page="Left.jsp"/>
				</td>
			
				<!-- Center -->
				<td align="center" width="600">
					<jsp:include page="Center.jsp"/>
				</td>
			</tr>
			
			<!-- Bottom -->
			<tr height="100">
				<td align="center" colspan="2">
					<jsp:include page="Bottom.jsp"/>
				</td>
			</tr>
			
		</table>
	</center>
	
</body>
</html>