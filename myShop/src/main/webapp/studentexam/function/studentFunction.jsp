<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.choongang.dbconnection.MyDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String formName = request.getParameter("formName");
String insert = "studentInsert";
String update = "studentUpdate";
String delete = "studentDelete";

System.out.print(formName);
System.out.print(formName);

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

if(formName.equals(insert)){
	try{
		int ssn = Integer.parseInt(request.getParameter("ssn"));
		String name = request.getParameter("name");
		int score = Integer.parseInt(request.getParameter("score"));
		String addr = request.getParameter("addr");

		String sql = "insert into student values(?,?,?,?)";

		
		con = MyDBConnection.getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, ssn);
		pstmt.setString(2, name);
		pstmt.setInt(3, score);
		pstmt.setString(4,addr);
		pstmt.executeUpdate();
	}catch(SQLIntegrityConstraintViolationException e){
		e.printStackTrace();
	}
	
}

if(formName.equals(update)){
	int ssn = Integer.parseInt(request.getParameter("ssn"));
	String name = request.getParameter("name");
	int score = Integer.parseInt(request.getParameter("score"));
	String addr = request.getParameter("addr");

	String sql = "update student set name = ?, score = ?, addr = ? where ssn = ?";

	con = MyDBConnection.getConnection();
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, score);
	pstmt.setString(3,addr);
	pstmt.setInt(4, ssn);
	pstmt.executeUpdate();
}

if(formName.equals(delete)){
	int ssn = Integer.parseInt(request.getParameter("ssn"));
	String name = request.getParameter("name");

	String sql = "delete from student where ssn = ? and name like ? ";

	con = MyDBConnection.getConnection();
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, ssn);
	pstmt.setString(2, name);
	pstmt.executeUpdate();
}

MyDBConnection.close(rs, pstmt, con);


%>

<script>
	location.href = "../index.jsp";
</script>
</head>
