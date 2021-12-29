package service;
import static com.smc.db.JdbcUtil.*;
import org.springframework.stereotype.Service;
import java.sql.Connection;
import vo.Chicken;
import dao.ChicDAO;

@Service
public class ChickenInsertService {
	public ChicDAO chicDAO = new ChicDAO();

	public int insertChicken(Chicken chic) {
		chicDAO = ChicDAO.getInstance();
		Connection con = getConnection();
		chicDAO.setConnection(con);
		int cnt = chicDAO.insertChicken(chic);
		int isSuccess = 0;
		if(cnt>0) {commit(con); isSuccess = 1;}
		else if(cnt==-1) {return -1;}
		else rollback(con);
		close(con);
		return isSuccess;
	}
}
