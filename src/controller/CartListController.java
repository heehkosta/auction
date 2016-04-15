package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;
import model.ItemVO;

public class CartListController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = "";
		ArrayList<ItemVO> cartlist = new ArrayList<ItemVO>();
		cartlist = CartDAO.getInstance().getCartList(request);
		System.out.println("CARTLISTCONTROLLER :"+cartlist);
		if(cartlist==null){
			System.out.println("장바구니가 비었습니다.");
			path = "search_ok.jsp";
		}else{
			path = "cartlist.jsp";
		}
		
		return new ModelAndView(path);
	}

}
