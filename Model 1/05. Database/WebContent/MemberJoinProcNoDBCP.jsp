<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		
		// ����Ŭ�� �����ϴ� �ҽ��� �ۼ� (Connection Pool�� ������� ���� ���)	
		String id = "system"; // ���Ӿ��̵�
		String pass = "123456";
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; // ����url
	
		try {
			
			// 1. �ش� �����ͺ��̽��� ����Ѵٰ� ���� (Ŭ������ ��� = ����Ŭ���� ���)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. �ش� �����ͺ��̽��� ����
			Connection con = DriverManager.getConnection(url,id,pass);
			
			// 3. �����ͺ��̽� ���� �� ������ �غ�
			String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			// 4. ������ ����ϵ��� ����
			// (PreparedStatement�� JSP���� ������ ����� �� �ְԲ� ����)
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 5. '?'�� �°� �����͵��� ���ν����ֱ�
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			// 6. ����Ŭ���� ������ ����
			pstmt.executeUpdate(); // insert, update, delete�� �� ����ϴ� �޼ҵ�
						
			// 7. �ڿ� �ݳ�
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
	����Ŭ�� ���� �Ϸ�
		
</body>
</html>