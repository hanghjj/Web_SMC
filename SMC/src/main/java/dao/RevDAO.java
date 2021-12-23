package dao;
import static com.smc.db.JdbcUtil.*;

import java.sql.*;
import org.springframework.stereotype.Repository;

import vo.Review;

@Repository
public class RevDAO {
	Connection con;
	private static RevDAO rDAO;
	
	public void setConnection(Connection con) { this.con = con;}
	
	public static RevDAO getInstance() {
		if(rDAO==null) rDAO = new RevDAO();
		return rDAO;
	}
	
	public int insertReview(Review rev) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int insertCount = 0;
		String Sql = "";
		String Sql2 = "update review set code = (select code from chicken where review.name = chicken.name)";
		try {
			Sql = "insert into review(code,name,grade,text) values(?,?,?,?)";
			pstmt = con.prepareStatement(Sql);
			pstmt.setInt(1,1);
			pstmt.setString(2, rev.getName());
			pstmt.setInt(3,rev.getGrade());
			pstmt.setString(4, rev.getText());
			insertCount = pstmt.executeUpdate();
			pstmt2 = con.prepareStatement(Sql2);
			insertCount+=pstmt2.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e){
			System.out.println("이미 같은 정보가 있습니다.");
			return -1;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { close(pstmt); close(pstmt2);}
		
		return insertCount;
	}
}
