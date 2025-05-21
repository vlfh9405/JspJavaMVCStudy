package com.choongang.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyDBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/myproject?serverTimezone=UTC";
	private static final String USER ="shop";
	private static final String PASSWORD ="My123456789!!s";
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println("연결 성공");
		}catch(ClassNotFoundException e) {
			System.out.println("찾는 파일 없음");
			e.printStackTrace();
		}catch(SQLException e) {
			System.out.println("접속 실패");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs!= null) {
			try {
				rs.close();
				System.out.println("rs 닫기 성공");
			} catch (SQLException e) {
				System.out.println("rs 닫기 실패");
			}
		}
		
		if(pstmt != null) {
			try {
				pstmt.close();
				System.out.println("pstmt 닫기 성공");
			} catch (SQLException e) {
				System.out.println("pstmt 닫기 실패");
			}
		}
		
		if(con != null) {
			try {
				con.close();
				System.out.println("con 닫기 성공");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("con 닫기 실패");
			}
		}
	}
	
}
