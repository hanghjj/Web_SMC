package service;
import static com.smc.db.JdbcUtil.*;


import org.springframework.stereotype.Service;
import java.sql.Connection;
import vo.User;
import dao.UserDAO;

@Service
public class SignUpService {
	public UserDAO uDAO;
	
	public int signup(User user) {
		uDAO = UserDAO.getInstance();
		Connection con = getConnection();
		uDAO.setConnection(con);
		int cnt = uDAO.sign_up(user);
		int isSuccess = 0;
		if(cnt>0) {commit(con); isSuccess = 1;}
		else if(cnt==-1) {return -1;}
		else rollback(con);
		close(con);
		return isSuccess;
	}
}
