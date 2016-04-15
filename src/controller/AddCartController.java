package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartDAO;
import model.ItemDAO;
import model.ItemVO;

public class AddCartController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String itemID = request.getParameter("itemId");
		System.out.println(itemID);
		ItemVO vo = ItemDAO.getInstance().selectByID(itemID);
		CartDAO.getInstance().addCart(request, vo);
		String path = "DispatcherServlet.do?command=cartlist";
		return new ModelAndView(path,true);
	}

}
