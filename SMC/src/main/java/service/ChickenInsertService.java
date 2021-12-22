package service;
import static com.smc.db.JdbcUtil.*;

import java.sql.Connection;
import vo.Chicken;
import dao.ChicDAO;


public class ChickenInsertService {
	public ChicDAO chicDAO = new ChicDAO();

	public boolean insertChicken(Chicken chic) {
		chicDAO = ChicDAO.getInstance();
		Connection con = getConnection();
		chicDAO.setConnection(con);
		int cnt = chicDAO.insertChicken(chic);
		boolean isSuccess = false;
		if(cnt>0) {commit(con); isSuccess = true;}
		else rollback(con);
		
		close(con);
		return isSuccess;
	}
}
