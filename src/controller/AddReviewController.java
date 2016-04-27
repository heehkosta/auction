package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FeedBackDAO;
import model.FeedBackVO;

public class AddReviewController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String tName = request.getParameter("tname");
		int itemID = Integer.parseInt(request.getParameter("itemid"));
		float rating =Integer.parseInt(request.getParameter("rating"));
		String review = request.getParameter("review");
		
		FeedBackVO vo = new FeedBackVO(tName, itemID, rating, review);
		
		FeedBackDAO.getInstance().posting(vo);
		
		return new ModelAndView("DispatcherServlet.do?command=describe&&id="+itemID,true);
	}

}
