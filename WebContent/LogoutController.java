package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	    request.getSession().invalidate();

	    String path = "logout.jsp";
	    ModelAndView mv = new ModelAndView(path);
	    return mv;
	}

}
