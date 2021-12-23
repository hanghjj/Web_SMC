package dao;

import static com.smc.db.JdbcUtil.*;



import java.sql.*;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import vo.Chicken;

@Repository
public class ChicDAO 
{
	Connection con;
	private static ChicDAO cDAO;
	
	@Autowired
	public ChicDAO(){
		
	}
	
	public void setConnection(Connection con) { this.con = con;}
	
	public static ChicDAO getInstance() {
		if(cDAO==null) cDAO = new ChicDAO();
		return cDAO;
	}
	
	public ArrayList<Chicken> selectCList(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Chicken> CList = null;
		try {
			pstmt = con.prepareStatement("SELECT * FROM chicken");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				CList = new ArrayList<>();
				do {
					CList.add(new Chicken(rs.getString("name"),rs.getInt("price")));
				} while(rs.next());
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {close(rs); close(pstmt);}
		
		return CList;
	}
	
	public int insertChicken(Chicken chic) {
		PreparedStatement pstmt = null;
		int insertCount = 0;
		String Sql = "";
		
		try {
			Sql = "INSERT INTO Chicken(name,price) VALUES(?,?)";
			pstmt = con.prepareStatement(Sql);
			pstmt.setString(1, chic.getName());
			pstmt.setInt(2, chic.getPrice());
			insertCount = pstmt.executeUpdate();
		}catch(SQLIntegrityConstraintViolationException e){
			System.out.println("이미 같은 정보가 있습니다.");
			return -1;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {close(pstmt);}
		
		return insertCount;
	}
}
