package service;

import static com.smc.db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;


import org.springframework.stereotype.Service;

import vo.Chicken;
import dao.ChicDAO;

@Service
public class ChickenListService {
	public ChicDAO chicDAO = new ChicDAO();
	
	public ArrayList<Chicken> getChickenList(){
		chicDAO = ChicDAO.getInstance();
		Connection con = getConnection();
		chicDAO.setConnection(con);
		return chicDAO.selectCList();
	}
}
