package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartDAO;

public class DeleteCartController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String[] itemID = request.getParameterValues("itemId");
		CartDAO.getInstance().deleteItemCart(request, itemID);
		return new ModelAndView("DispatcherServlet.do?command=cartlist",true);
	}

}
