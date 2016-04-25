package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.KeywordDAO;

public class KeywordController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ArrayList<String> klist = KeywordDAO.getInstance().descKeyword();
		request.setAttribute("klist", klist);
		
		return new ModelAndView();
	}

}
