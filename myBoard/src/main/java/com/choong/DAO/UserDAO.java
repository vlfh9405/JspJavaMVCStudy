package com.choong.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.choong.DTO.UserDTO;

import dbconnection.MyDBConnection;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String USER_GET = "select * from users where id = ?";
	private String USER_DELETE = "delete from users where id = ?";
	private String USER_LIST = "select * from users";
	private String USER_INSERT = "insert into users values(?, ?, ?, ?)";
	private String USER_UPDATE = "update users set name = ?, role = ? where id = ?";
	
	
	//회원 상세 조회
	public UserDTO getUser(String id) {
		UserDTO userDTO = null;
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(USER_GET);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
//				userDTO = new UserDTO(rs.getString("id"), rs.getString("password"), rs.getString("name"), rs.getString("role"));
				userDTO = new UserDTO();
				userDTO.setId(rs.getString("id"));
				userDTO.setPassword(rs.getString("password"));
				userDTO.setName(rs.getString("name"));
				userDTO.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return userDTO;
	}
	
	//회원 삭제
	public void deleteUser(String id) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(USER_DELETE);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//회원 수정
	public void updateUser(UserDTO dto) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(USER_UPDATE);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getRole());
			pstmt.setString(3, dto.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//회원 등록
	public void insertUser(UserDTO dto) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(USER_INSERT);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getRole());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
	//회원 목록 조회
	public List<UserDTO> getUser(){
		con = MyDBConnection.getConnection();
		UserDTO dto = null;
		List<UserDTO> users = new ArrayList<UserDTO>();
		try {
			pstmt = con.prepareStatement(USER_LIST);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setRole(rs.getString("role"));
				
				users.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}

		return users;
	}
	
	
	
}
