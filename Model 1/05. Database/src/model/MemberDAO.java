package model;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

// 오라클 데이터베이스에 연결하고 select, insert, update, delete 작업을 실행해주는 클래스
public class MemberDAO {
	
	Connection con; // 데이터베이스에 접근할 수 있도록 설정
	PreparedStatement pstmt; // 데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터베이스의 테이블의 결과를 return받아 Java에 저장해주는 객체
	
	// 데이터베이스에 접근할 수 있도록 도와주는 메소드
	public void getCon() {
		
		// 커넥션 풀(Connection Pool)을 이용하여 DB에 접근
		try {
			
			// 외부에서 데이터를 읽어들이기 위해
			Context initctx = new InitialContext();
			
			// Tomcat 서버에 정보를 담아놓은 곳으로 이동
			Context envctx = (Context) initctx.lookup("java:comp/env");
			
			// 데이터 소스 객체를 선언
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			
			// 데이터 소스를 기준으로 커넥션을 연결
			con = ds.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 데이터베이스에 한 사람의 회원 정보를 저장해주는 메소드
	public void insertMember(MemberBean mbean) {
		
		try {			
			getCon();
			
			// 3. 접속 후 쿼리 준비하여 쿼리를 사용하도록 설정
			String sql="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			
			// 4. 쿼리를 사용하도록 설정
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 5. ?에 맞게 데이터를 맵핑
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
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 모든 회원의 정보를 리턴해주는 메소드 호출
	public Vector<MemberBean> allSelectMember() {
		
		// 가변 길이로 데이터를 저장
		Vector<MemberBean> v = new Vector<>();
		
		// 무조건 데이터베이스는 예외처리를 반드시 해야함
		try {
			
			// 커넥션(Connection) 연결
			getCon();
			
			// 쿼리 준비
			String sql = "SELECT * FROM MEMBER";
			
			// 쿼리를 실행시켜주는 객체 선언
			pstmt = con.prepareStatement(sql);
			
			// 쿼리를 실행시킨 결과를 리턴해서 받아줌
			// (오라클 테이블의 검색된 결과를 Java 객체에 저장)
			rs = pstmt.executeQuery();
			
			// 반복문을 사용해서 rs에 저장된 데이터를 추출해놓아야 함
			while(rs.next()) { // 저장된 데이터가 남아있을 때만 반복문 실행
				MemberBean bean = new MemberBean(); // Column으로 나누어진 데이터를 Bean 클래스에 저장
				bean.setId(rs.getString(1)); // Column의 1번째 값을 String형으로 가져옴 (getString은 1부터 순서 시작)
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				// 패키징된 MemberBean 클래스를 Vector에 저장
				v.add(bean); // 0번지부터 순서대로 데이터가 저장
			}
			
			//자원 반납
			con.close();
		} catch(Exception e) {
			
		}
		
		// 모두 저장된 Vector를 반환
		return v;
	}
	
	// 한 회원에 대한 정보를 return하는 메소드 작성
	public MemberBean oneSelectMember(String id) {
		
		// 한 회원에 대한 정보만 return하기 때문에 Vector가 아닌 bean을 사용함
		MemberBean bean = new MemberBean();
		try {
			
			// 커넥션 연결
			getCon();
			
			// 쿼리 준비
			String sql="SELECT * FROM MEMBER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			
			// 쿼리문의 '?'에 값을 맵핑
			pstmt.setString(1, id);
			
			// 쿼리 실행
			rs = pstmt.executeQuery();
			if(rs.next()) { // 남아있는 레코드가 있다면
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			// 자원 반납
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// 반환
		return bean;
	}
	
	// 한 회원의 패스워드 값을 반환해주는 메소드 작성
	public String getPass(String id) {
		// String으로 반환해야하기에 String 변수 선언
		String pass = "";
		try {
			getCon();
			
			// 쿼리 준비
			String sql = "SELECT PASS1 FROM MEMBER WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			
			// 쿼리문의 '?'에 값을 맵핑
			pstmt.setString(1, id);
			
			// 쿼리 실행
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pass=rs.getString(1); // 패스워드 값이 저장된 컬럼 인덱스 1
			}
			
			// 자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 결과를 반환
		return pass;
	}
	
	// 한 회원의 정보를 수정하는 메소드
	public void updateMember(MemberBean bean) {
		getCon();
		
		try {
			// 쿼리 준비
			String sql = "UPDATE MEMBER SET EMAIL=?, TEL=? WHERE ID=?";
			
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			
			// 쿼리문의 '?'에 값을 맵핑
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			
			// 쿼리 실행
			pstmt.executeUpdate();
			
			// 자원 반납
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 한 회원을 삭제하는 메소드 작성
	public void deleteMember(String id) {
		getCon();
		
		try {
			// 쿼리 준비
			String sql = "DELETE FROM MEMBER WHERE ID=?";
			
			// 쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
						
			// 쿼리문의 '?'에 값을 맵핑
			pstmt.setString(1, id);

			// 쿼리 실행
			pstmt.executeUpdate();
			
			// 자원 반납
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
