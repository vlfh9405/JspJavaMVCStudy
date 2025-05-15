package controller.dao;
// db에 자료 전달 db 자료 가져와 처리

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.choongang.dbconnection.MyDBConnection;

import controller.dto.Student;

public class StudentDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//1.학생 등록
	public void insert(Student student) {
		String sql = "insert into student values(?, ?, ?)";
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, student.getId());
			pstmt.setString(2, student.getName());
			pstmt.setString(3,student.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		
	}// end of insert
	
	//2. 학생 리스트
	public List<Student> findAll() {
		List<Student> students = new ArrayList<Student>();
		String sql = "select * from student";
		
		try {
			con = MyDBConnection.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Student student = new Student();
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setEmail(rs.getString(3));
				students.add(student);
			}
		}catch(SQLException e) {
			System.out.println("sql 오류");
			e.printStackTrace();
		}finally{
			MyDBConnection.close(rs, pstmt, con);
		}
		return students;
	}// end of findAll;
}
