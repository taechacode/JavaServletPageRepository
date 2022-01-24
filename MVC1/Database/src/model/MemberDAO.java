package model;

import java.sql.*;
import java.util.*;

// ����Ŭ �����ͺ��̽��� �����ϰ� select, insert, update, delete �۾��� �������ִ� Ŭ����
public class MemberDAO {
	
	// ����Ŭ�� �����ϴ� �ҽ��� �ۼ�
	String id = "system"; // ���Ӿ��̵�
	String pass = "123456";
	String url = "jdbc:oracle:thin:@localhost:1521:XE"; // ����url
	
	Connection con; // �����ͺ��̽��� ������ �� �ֵ��� ����
	PreparedStatement pstmt; // �����ͺ��̽����� ������ ��������ִ� ��ü
	ResultSet rs; // �����ͺ��̽��� ���̺��� ����� return�޾� Java�� �������ִ� ��ü
	
	// �����ͺ��̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
	public void getCon() {
		try {
			
			// 1. �ش� �����ͺ��̽��� ����Ѵٰ� ����(Ŭ������ ��� = ����Ŭ���� ���)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. �ش� �����ͺ��̽��� ����
			con = DriverManager.getConnection(url,id,pass);
			
		}catch (Exception e) {
			
		}
	}
	
	// �����ͺ��̽��� �� ����� ȸ�� ������ �������ִ� �޼ҵ�
	public void insertMember(MemberBean mbean) {
		try{
			
			getCon();
			// 3. ���� �� ���� �غ��Ͽ� ������ ����ϵ��� ����
			String sql="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?)";
			// 4. ������ ����ϵ��� ����
			PreparedStatement pstmt = con.prepareStatement(sql);
			// 5. ?�� �°� �����͸� ����
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			// 6. ����Ŭ���� ������ �����Ͻÿ�
			pstmt.executeUpdate(); // insert, update, delete �� ����ϴ� �޼ҵ�
			// 7. �ڿ� �ݳ�
			con.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// ��� ȸ���� ������ �������ִ� �޼ҵ� ȣ��
	public Vector<MemberBean> allSelectMember() {
		Vector<MemberBean> v = new Vector<>();
		
		return v;
	}
}
