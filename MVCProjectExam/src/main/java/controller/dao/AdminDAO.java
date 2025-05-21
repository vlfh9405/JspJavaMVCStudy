package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.choongang.dbconnection.MyDBConnection;


import controller.dto.Admin;


public class AdminDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//1.로그인 세션 값 넘겨주기
	public Admin login(String id , String pw) {
	    con = MyDBConnection.getConnection();
	    Admin admin = null;
	    sql = "select * from admin where admin_id = ? and admin_pwd = ?";
	    
	    try {
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        pstmt.setString(2, pw);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            admin = new Admin();
	            admin.setUid(rs.getInt(1));
	            admin.setAdminId(rs.getString(2));
	            admin.setAdminPwd(rs.getString(3));
	            admin.setAdminName(rs.getString(4));
	            admin.setAdminEmail(rs.getString(5));
	            admin.setRole(rs.getString(6));
	            admin.setCreateDate(rs.getString(7));
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        MyDBConnection.close(rs, pstmt, con);
	    }

	    return admin; // ❗ 로그인 실패 시 null 반환
	}
	
	
}
