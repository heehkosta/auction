package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pagingservice.ListVO;
import pagingservice.PbService;
import model.ItemDAO;
import model.ItemVO;


public class SearchController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		
		String path = "search_fail.jsp";
		String name = request.getParameter("textbox");
		String pageNo = request.getParameter("pageNo");
		
		System.out.println(name);
		System.out.println(pageNo);
		
		ListVO lvo = PbService.getInstance().getPostingNumber(name, pageNo);
		/*for(ItemVO i : list) {
			System.out.println(i.getName());
		}*/
		
		if(lvo != null){
			request.setAttribute("lvo", lvo);
			path =  "search_ok.jsp";
		}
		return new ModelAndView(path);  //forward 방식을 의미함
	}
}
