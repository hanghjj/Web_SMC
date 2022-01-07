package service;

import static com.smc.db.JdbcUtil.*;
import org.springframework.stereotype.Service;
import java.sql.Connection;
import java.util.ArrayList;

import vo.Review;
import dao.RevDAO;

@Service
public class ReviewListService {
	public RevDAO  rDAO = new RevDAO();
	
	public ArrayList<Review> getRlist() {
		rDAO = RevDAO.getInstance();
		Connection con = getConnection();
		rDAO.setConnection(con);
		ArrayList<Review> temp =  rDAO.getReviewList();
		close(con);
		return temp;
	}
	public ArrayList<Review> getRlist(String id) {
		rDAO = RevDAO.getInstance();
		Connection con = getConnection();
		rDAO.setConnection(con);
		ArrayList<Review> temp =  rDAO.getUserReview(id);
		close(con);
		return temp;
	}
	
	public ArrayList<Review> getspecificRlist(ArrayList<Review> rlist, String name){
		ArrayList<Review> temp = new ArrayList<Review>();
		for(int i=0; i<rlist.size(); i++) {
			if(rlist.get(i).getName().equals(name)) {
				temp.add(rlist.get(i));
			}
		}
		return temp;
	}
}
