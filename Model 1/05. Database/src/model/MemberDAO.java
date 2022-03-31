package model;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

// ����Ŭ �����ͺ��̽��� �����ϰ� select, insert, update, delete �۾��� �������ִ� Ŭ����
public class MemberDAO {
	
	Connection con; // �����ͺ��̽��� ������ �� �ֵ��� ����
	PreparedStatement pstmt; // �����ͺ��̽����� ������ ��������ִ� ��ü
	ResultSet rs; // �����ͺ��̽��� ���̺��� ����� return�޾� Java�� �������ִ� ��ü
	
	// �����ͺ��̽��� ������ �� �ֵ��� �����ִ� �޼ҵ�
	public void getCon() {
		
		// Ŀ�ؼ� Ǯ(Connection Pool)�� �̿��Ͽ� DB�� ����
		try {
			
			// �ܺο��� �����͸� �о���̱� ����
			Context initctx = new InitialContext();
			
			// Tomcat ������ ������ ��Ƴ��� ������ �̵�
			Context envctx = (Context) initctx.lookup("java:comp/env");
			
			// ������ �ҽ� ��ü�� ����
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			
			// ������ �ҽ��� �������� Ŀ�ؼ��� ����
			con = ds.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// �����ͺ��̽��� �� ����� ȸ�� ������ �������ִ� �޼ҵ�
	public void insertMember(MemberBean mbean) {
		
		try {			
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
			
			// 6. ����Ŭ���� ������ ����
			pstmt.executeUpdate(); // insert, update, delete�� �� ����ϴ� �޼ҵ�
			
			// 7. �ڿ� �ݳ�
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// ��� ȸ���� ������ �������ִ� �޼ҵ� ȣ��
	public Vector<MemberBean> allSelectMember() {
		
		// ���� ���̷� �����͸� ����
		Vector<MemberBean> v = new Vector<>();
		
		// ������ �����ͺ��̽��� ����ó���� �ݵ�� �ؾ���
		try {
			
			// Ŀ�ؼ�(Connection) ����
			getCon();
			
			// ���� �غ�
			String sql = "SELECT * FROM MEMBER";
			
			// ������ ��������ִ� ��ü ����
			pstmt = con.prepareStatement(sql);
			
			// ������ �����Ų ����� �����ؼ� �޾���
			// (����Ŭ ���̺��� �˻��� ����� Java ��ü�� ����)
			rs = pstmt.executeQuery();
			
			// �ݺ����� ����ؼ� rs�� ����� �����͸� �����س��ƾ� ��
			while(rs.next()) { // ����� �����Ͱ� �������� ���� �ݺ��� ����
				MemberBean bean = new MemberBean(); // Column���� �������� �����͸� Bean Ŭ������ ����
				bean.setId(rs.getString(1)); // Column�� 1��° ���� String������ ������ (getString�� 1���� ���� ����)
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				// ��Ű¡�� MemberBean Ŭ������ Vector�� ����
				v.add(bean); // 0�������� ������� �����Ͱ� ����
			}
			
			//�ڿ� �ݳ�
			con.close();
		} catch(Exception e) {
			
		}
		
		// ��� ����� Vector�� ��ȯ
		return v;
	}
	
	// �� ȸ���� ���� ������ return�ϴ� �޼ҵ� �ۼ�
	public MemberBean oneSelectMember(String id) {
		
		// �� ȸ���� ���� ������ return�ϱ� ������ Vector�� �ƴ� bean�� �����
		MemberBean bean = new MemberBean();
		try {
			
			// Ŀ�ؼ� ����
			getCon();
			
			// ���� �غ�
			String sql="SELECT * FROM MEMBER WHERE ID = ?";
			pstmt = con.prepareStatement(sql);
			
			// �������� '?'�� ���� ����
			pstmt.setString(1, id);
			
			// ���� ����
			rs = pstmt.executeQuery();
			if(rs.next()) { // �����ִ� ���ڵ尡 �ִٸ�
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setInfo(rs.getString(8));
			}
			
			// �ڿ� �ݳ�
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// ��ȯ
		return bean;
	}
	
	// �� ȸ���� �н����� ���� ��ȯ���ִ� �޼ҵ� �ۼ�
	public String getPass(String id) {
		// String���� ��ȯ�ؾ��ϱ⿡ String ���� ����
		String pass = "";
		try {
			getCon();
			
			// ���� �غ�
			String sql = "SELECT PASS1 FROM MEMBER WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			
			// �������� '?'�� ���� ����
			pstmt.setString(1, id);
			
			// ���� ����
			rs=pstmt.executeQuery();
			if(rs.next()) {
				pass=rs.getString(1); // �н����� ���� ����� �÷� �ε��� 1
			}
			
			// �ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// ����� ��ȯ
		return pass;
	}
	
	// �� ȸ���� ������ �����ϴ� �޼ҵ�
	public void updateMember(MemberBean bean) {
		getCon();
		
		try {
			// ���� �غ�
			String sql = "UPDATE MEMBER SET EMAIL=?, TEL=? WHERE ID=?";
			
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
			
			// �������� '?'�� ���� ����
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			
			// ���� ����
			pstmt.executeUpdate();
			
			// �ڿ� �ݳ�
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// �� ȸ���� �����ϴ� �޼ҵ� �ۼ�
	public void deleteMember(String id) {
		getCon();
		
		try {
			// ���� �غ�
			String sql = "DELETE FROM MEMBER WHERE ID=?";
			
			// ���� ���� ��ü ����
			pstmt = con.prepareStatement(sql);
						
			// �������� '?'�� ���� ����
			pstmt.setString(1, id);

			// ���� ����
			pstmt.executeUpdate();
			
			// �ڿ� �ݳ�
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
