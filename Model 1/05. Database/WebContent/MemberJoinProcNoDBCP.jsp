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
	
		// 취미 부분은 별도로 읽어서 다시 bean 클래스에 저장
		String[] hobby = request.getParameterValues("hobby");
		// 배열에 있는 내용을 하나의 String으로 저장
		String texthobby="";
		
		for(int i = 0; i < hobby.length; i++) {
			texthobby += hobby[i] + " ";
		}
	%>
	
		<!-- useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
		<jsp:useBean id="mbean" class="model.MemberBean">
			<jsp:setProperty name="mbean" property="*"/> <!-- 맵핑 시키기 -->
		</jsp:useBean>
	
	<%
		// 기존 취미는 주소번지가 저장되기에 위의 배열 내용을 저장한 String형 변수를 다시 입력
		mbean.setHobby(texthobby);
		
		// 오라클에 접속하는 소스를 작성 (Connection Pool을 사용하지 않을 경우)	
		String id = "system"; // 접속아이디
		String pass = "123456";
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; // 접속url
	
		try {
			
			// 1. 해당 데이터베이스를 사용한다고 선언 (클래스를 등록 = 오라클용을 사용)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 해당 데이터베이스에 접속
			Connection con = DriverManager.getConnection(url,id,pass);
			
			// 3. 데이터베이스 접속 후 쿼리문 준비
			String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			// 4. 쿼리를 사용하도록 설정
			// (PreparedStatement는 JSP에서 쿼리를 사용할 수 있게끔 해줌)
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 5. '?'에 맞게 데이터들을 맵핑시켜주기
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			// 6. 오라클에서 쿼리를 실행
			pstmt.executeUpdate(); // insert, update, delete할 때 사용하는 메소드
						
			// 7. 자원 반납
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	
	오라클에 접속 완료
		
</body>
</html>