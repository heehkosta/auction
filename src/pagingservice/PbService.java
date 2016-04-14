package pagingservice;

import java.sql.SQLException;
import java.util.ArrayList;

import jdk.nashorn.internal.ir.RuntimeNode.Request;
import model.ItemDAO;
import model.ItemVO;

public class PbService {
	private ItemDAO dao;
	private static PbService service = new PbService();
	private PbService(){
		dao = ItemDAO.getInstance();
	}
	public static PbService getInstance(){
		return service;
	}
	
	public ListVO getPostingNumber(String name, String pageNo) throws SQLException{
		int num = 1;
		if(pageNo != null){
			num = Integer.parseInt(pageNo);
		}
		int total = ItemDAO.getInstance().getTotalPostingCount(name);
		//ArrayList<ItemVO> vo =ItemDAO.getInstance().
		//PagingBean pb = new PagingBean(total, nowPage);
		
		
		return null;
	}
}
