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
	
	<!-- Q. MemberUpdateForm.jsp���� 4���� �����͸� mbean���� �ѱ�µ� ��������? -->
	<!-- A. mbean���� �Ѿ���� �ʴ� ����������� null ���� ����˴ϴ�. -->
	<!-- ������ null ���� ����Ǵ� ��������� ������� ���� ���̹Ƿ� ������ �����ϴ�. -->
	
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
	<%
	MemberDAO mdao = new MemberDAO();
	
	// String������ ����Ǿ��ִ� �н����带 ������ (DB���� ������ pass ���� �����)
	String pass = mdao.getPass(mbean.getId());
	
	// �����ϱ� ���ؼ� �ۼ��� �н����� ���� ���� DB���� ������ �н����� ���� ��
	if(mbean.getPass1().equals(pass)) { // ���� �н������ DB �н����尡 ���ٸ� Member ���̺��� ����
		
		// MemberDAO Ŭ������ ȸ������ �޼ҵ带 ȣ��
		mdao.deleteMember(mbean.getId());
		response.sendRedirect("MemberList.jsp");
		
	} else {
	%>
	<script type="text/javascript">
	 alert("�н����尡 ���� �ʽ��ϴ�. �ٽ� Ȯ�����ּ���.");
	 history.go(-1);
	</script>
	<%
	}
	%>
	
</body>
</html>