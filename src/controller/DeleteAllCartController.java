package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;

public class DeleteAllCartController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CartDAO.getInstance().deleteAllCart(request);
		String path = "find_ok.jsp";
		return new ModelAndView(path);
	}
}
