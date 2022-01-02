package service;
import static com.smc.db.JdbcUtil.*;


import org.springframework.stereotype.Service;
import java.sql.Connection;
import vo.User;
import dao.UserDAO;

@Service
public class SignInService {
	public UserDAO uDAO;
	
	public int signin(User user) {
		uDAO = UserDAO.getInstance();
		Connection con = getConnection();
		uDAO.setConnection(con);
		boolean suc = uDAO.sign_in(user);
		int isSuccess = 0;
		if(suc){commit(con); isSuccess = 1;}
		else rollback(con);
		close(con);
		return isSuccess;
	}
}
