package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class JjimDAO {

	private Connection conn;	//db에 접근하는 객체
	private ResultSet rs;
	
	public JjimDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bbs> getList(String userId, int pageNumber){
		String SQL = "SELECT * FROM BBS WHERE bbsId = (select bbsId from jjim where userId = ?) ORDER BY wrtingIdx DESC LIMIT 10"; 
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBoardId(rs.getInt(1));
				bbs.setWritingIdx(rs.getInt(2));
				bbs.setBbsTitle(rs.getString(3));
				bbs.setUserId(rs.getString(4));
				bbs.setBbsDate(rs.getString(5));
				bbs.setBbsContent(rs.getString(6));
				bbs.setMap(rs.getString(7));
				bbs.setBbsAvailable(rs.getInt(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}

	
	public int write(String userId, int wrtingIdx) {
		String SQL = "INSERT INTO jjim VALUES(?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, wrtingIdx);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Jjim> getJjim(String userId) {
		String SQL = "select * from jjim where userId = ?";
		ArrayList<Jjim> list = new ArrayList<Jjim>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Jjim jjim = new Jjim();
				jjim.setWrtingIdx(rs.getInt(1));
				jjim.setUserId(rs.getString(2));
				list.add(jjim);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int wrtingIdx) {
		String SQL = "DELETE FROM jjim WHERE wrtingIdx = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, wrtingIdx);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}