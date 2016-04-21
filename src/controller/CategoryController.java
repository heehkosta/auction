package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;
import model.ItemDAO;
import model.ItemVO;

public class CategoryController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ArrayList<ItemVO> list = new ArrayList<ItemVO>();
		list =  ItemDAO.getInstance().getCategoryList(request.getParameter("category"));
		request.setAttribute("category", list);
		System.out.println(list);
		return new ModelAndView("search_ok.jsp");
	}
}

/*@Override
public ModelAndView handle(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	String path = "";
	ArrayList<ItemVO> cartlist = new ArrayList<ItemVO>();
	cartlist = CartDAO.getInstance().getCartList("request");
	System.out.println("CARTLISTCONTROLLER :"+cartlist);
	int sum =0;
	for(int i = 0; i < cartlist.size(); i++){
		sum += cartlist.get(i).getBuy_Price();
	}
	request.setAttribute("sum",sum);
	if(cartlist==null){
		System.out.println("장바구니가 비었습니다.");
		path = "search_ok.jsp";
	}else{
		path = "cartlist.jsp";
	}
	
	return new ModelAndView(path);
}

}*/
