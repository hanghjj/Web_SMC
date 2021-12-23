package service;

import static com.smc.db.JdbcUtil.*;

import java.sql.Connection;
import vo.Review;
import dao.RevDAO;

public class ReviewInsertService {
	public RevDAO  rDAO = new RevDAO();
	
	public int insertRev(Review rev) {
		rDAO = RevDAO.getInstance();
		Connection con = getConnection();
		rDAO.setConnection(con);
		int cnt = rDAO.insertReview(rev);
		int isSuccess = 0;
		if(cnt>0) {commit(con); isSuccess = 1;}
		else if(cnt==-1) {return -1;}
		else rollback(con);
		close(con);
		return isSuccess;
	}
}
