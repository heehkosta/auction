package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FeedBackDAO;
import model.FeedBackVO;

public class FeedBackController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String TargetName = request.getParameter("TargerName");
		int ItemID = Integer.parseInt(request.getParameter("ItemID"));
		float Rating = Float.parseFloat(request.getParameter("Rating"));
		String Review = request.getParameter("Review");
		//Rating 폼에서 입력 안하면 에러 떨어짐.
		
		FeedBackVO pvo = new FeedBackVO(TargetName,ItemID,Rating, Review);
		FeedBackDAO.getInstance().posting(pvo);
		
		request.getSession().setAttribute("pvo", pvo);
		System.out.println("pvo");
		return new ModelAndView("index.jsp");
	}

}
