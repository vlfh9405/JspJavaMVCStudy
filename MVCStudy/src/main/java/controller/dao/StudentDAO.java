package controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.choongang.dbconnection.MyDBConnection;

import controller.dto.Student;

public class StudentDAO {
	
	String sql;
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	//1. StudentList
	public List<Student> findAll(){
		List<Student> students = new ArrayList<Student>();
		sql = "select * from student";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				students.add(student);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류");
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return students;
	}
	
	public List<Student> findAll(String name){
		List<Student> students = new ArrayList<Student>();
		sql = "select * from student where name Like ?";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				students.add(student);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류");
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return students;
	}
	
	//2. student add
	public void insert(Student student) {
		sql = "insert into student values(?,?,?)";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student.getId());
			pstmt.setString(2,student.getName());
			pstmt.setString(3, student.getEmail());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//3. student select
	public Student select(int id) {
		sql = "select * from student where id = ?";
		con = MyDBConnection.getConnection();
		Student std = new Student();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				std.setId(rs.getInt(1));
				std.setName(rs.getString(2));
				std.setEmail(rs.getString(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return std;
	}
	//4. student delete
	public void delete(int id) {
		sql = "delete from student where id = ?";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	
	//5. student update
	public void update(Student student) {
		sql = "update student set name = ?, email = ? where id = ?";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, student.getName());
			pstmt.setString(2, student.getEmail());
			pstmt.setInt(3, student.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}
	//6. id 다음 값 알아내기
	public int nextId() {
		sql = "select max(id) from student";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1)+1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
		return 0;
	}
}
