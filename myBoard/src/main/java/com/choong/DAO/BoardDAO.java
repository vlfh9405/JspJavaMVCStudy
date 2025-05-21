package com.choong.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.choong.DTO.BoardDTO;

import dbconnection.MyDBConnection;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String BOARD_INSERT ="insert into board(seq, title, writer, content) values(null,?,?,?)";
	private String BOARD_UPDATE ="update board set title=?, content=? where seq=?";
	private String BOARD_DELETE ="delete from board where seq=?";
	private String BOARD_GET ="select * from board where seq=?";
	private String BOARD_GETALL ="select * from board order by seq desc";
	
	//검색 관련
	private String BOARD_LIST_T ="select * from board where title like ? order by seq desc";
	private String BOARD_LIST_C ="select * from board where content like ? order by seq desc";
	
	//1. 게시글 등록
	public void insertBoard(BoardDTO dto) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(BOARD_INSERT);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//2. 게시글 수정
	public void updateBoard(BoardDTO dto) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(BOARD_UPDATE);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getSeq());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//3. 게시글 삭제
	public void deleteBoard(int seq) {
		con = MyDBConnection.getConnection();
		try {
			pstmt = con.prepareStatement(BOARD_DELETE);
			pstmt.setInt(1, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
	}
	
	//4. 게시글 상세 조회
	public BoardDTO findBoard(int seq) {
		con = MyDBConnection.getConnection();
		BoardDTO board = null;
		try {
			pstmt = con.prepareStatement(BOARD_GET);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getTimestamp("regDate"));
				board.setCnt(rs.getInt("cnt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return board;
	}
	
	
	//5. 게시글 리스트 조회
	public List<BoardDTO> searchBoardList(BoardDTO dto){
		con = MyDBConnection.getConnection();
		BoardDTO board = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			if(dto.getSearchCondition().equalsIgnoreCase("title")) {
				pstmt = con.prepareStatement(BOARD_LIST_T);
			}else if (dto.getSearchCondition().equalsIgnoreCase("content")){
				pstmt = con.prepareStatement(BOARD_LIST_C);				
			}
			
			String searchKeyword = "%" + dto.getSearchKeyword() + "%";
			pstmt.setString(1, searchKeyword);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardDTO();
				board.setSeq(rs.getInt("seq"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setRegDate(rs.getTimestamp("regDate"));
				board.setCnt(rs.getInt("cnt"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return boardList;
	}
	
	//6. 게시글 전체 조회
	public List<BoardDTO> boardList(BoardDTO dto){
		con = MyDBConnection.getConnection();
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			pstmt = con.prepareStatement(BOARD_GETALL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setSeq(rs.getInt("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegDate(rs.getTimestamp("regDate"));
				dto.setCnt(rs.getInt("cnt"));
				boardList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			MyDBConnection.close(rs, pstmt, con);
		}
		return boardList;
	}
}
