package dao;
import static com.smc.db.JdbcUtil.*;


import java.sql.*;

import org.springframework.stereotype.Repository;

import vo.User;

@Repository
public class UserDAO {
	Connection con;
	private static UserDAO uDAO;
	
	
	public void setConnection(Connection con) { this.con = con;}
	
	public static UserDAO getInstance() {
		if(uDAO==null) uDAO = new UserDAO();
		return uDAO;
	}
	
	public int sign_up(User user) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		String Sql = "";
		
		try {
			Sql = "INSERT INTO Users values(?,?,?)";
			pstmt = con.prepareStatement(Sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2,user.getPass());
			pstmt.setString(3, user.getName());
			insertCount = pstmt.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e){
			System.out.println("중복된 아이디가 있습니다");
			e.printStackTrace();
			return -1;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {close(pstmt);}
		
		return insertCount;
	}
	public boolean sign_in(User user){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("SELECT id,password FROM users where id = ?");
			pstmt.setString(1, user.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(user.getPass())) {
					return true;
				}
				else {
					System.out.println("비밀번호가 일치하지 않습니다.");
					return false;
				}
			}
			else {System.out.println("등록된 아이디가 없습니다.");
				return false;
			
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {close(rs); close(pstmt);}
		
		return true;
	}
}
