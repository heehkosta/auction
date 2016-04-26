package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDAO;
import model.ItemVO;

public class CartListController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = "";
		ArrayList<ItemVO> cartlist = CartDAO.getInstance().getCartList(request);
		System.out.println("CARTLISTCONTROLLER :"+cartlist);
		
		int count = 0;
		for(int i =0; i<cartlist.size(); i++){
			count += 1;
		}
		System.out.println("장바구니에 담긴 물품수 : "+count);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("count", count);



		path = "cartlist.jsp";
		int sum =0;
		if(cartlist!=null){
			for(int i = 0; i < cartlist.size(); i++){
				sum += cartlist.get(i).getBuy_Price();
			}
			request.setAttribute("sum",sum);
		}


		return new ModelAndView(path);
	}

}
