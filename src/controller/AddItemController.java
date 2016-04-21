package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemDAO;
import model.ItemVO;
import model.StringQuery;

public class AddItemController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String name = request.getParameter("Name");
		String sellerID = request.getParameter("SellerID");
		String ends = request.getParameter("Ends");
		String description = request.getParameter("Description");
		String country = request.getParameter("Country");
		String location = request.getParameter("Location");
		
		ItemVO vo = new ItemVO(0, name, 0, 0, null, ends, sellerID, description, location, country,null);
		ItemDAO.getInstance().addItem(vo);
		
		return new ModelAndView("index.html");
	}

}
