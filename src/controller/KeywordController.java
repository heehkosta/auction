package controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.KeywordDAO;

import org.json.JSONObject;

public class KeywordController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ArrayList<String> klist = KeywordDAO.getInstance().descKeyword();
		//request.setAttribute("klist", klist);
		
		
		JSONObject json = new JSONObject();
		json.put("klist", klist);
		
		
		PrintWriter out = response.getWriter();
		
//		System.out.println(json);
		out.print(json);
		
		//return null;
		
		return new ModelAndView();
		//return null;
	}

}
