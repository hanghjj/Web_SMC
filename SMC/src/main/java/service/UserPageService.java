package service;
import static com.smc.db.JdbcUtil.*;



import org.springframework.stereotype.Service;
import java.sql.Connection;
import vo.User;
import dao.UserDAO;

@Service
public class UserPageService {
	public UserDAO uDAO;
	
	public User getUinfromation(String id) {
		uDAO = UserDAO.getInstance();
		Connection con = getConnection();
		uDAO.setConnection(con);
		User u = uDAO.getInformation(id);
		close(con);
		return u;
	}
}
