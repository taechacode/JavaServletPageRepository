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
	
		// ��� �κ��� ������ �о �ٽ� bean Ŭ������ ����
		String[] hobby = request.getParameterValues("hobby");
		// �迭�� �ִ� ������ �ϳ��� String���� ����
		String texthobby="";
		
		for(int i = 0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}
	%>
	
		<!-- useBean�� �̿��Ͽ� �Ѳ����� �����͸� �޾ƿ� -->
		<jsp:useBean id="mbean" class="model.MemberBean">
			<jsp:setProperty name="mbean" property="*"/> <!-- ���� ��Ű�� -->
		</jsp:useBean>
	
	<%
		// ���� ��̴� �ּҹ����� ����Ǳ⿡ ���� �迭 ������ ������ String�� ������ �ٽ� �Է�
		mbean.setHobby(texthobby);
		
		// �����ͺ��̽� Ŭ���� ��ü ����
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mbean);
		
		// ȸ�� ������ �Ǿ��ٸ� ȸ�� ������ �����ִ� �������� �̵���Ŵ
		response.sendRedirect("MemberList.jsp");
	%>
		����Ŭ�� ���� �Ϸ�
		
		<%-- <h2>����� ���̵� = <%=mbean.getId() %></h2>
		<h2>����� ��̴� = <%=mbean.getHobby() %></h2> --%>
	
</body>
</html>