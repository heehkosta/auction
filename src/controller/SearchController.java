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
		//String pageNo = "1";
		
		System.out.println("search keyword: "  + name);
		
		request.setAttribute("searchedName", name);
		//System.out.println(pageNo);
		
		//ListVO lvo = PbService.getInstance().getPostingNumber(name, pageNo);
		ArrayList<ItemVO> list = ItemDAO.getInstance().selectByName(name);
		
		// test
		for(ItemVO i : list) {
			System.out.println("SearchController:37" + i.getName());
		}
		
		
		//[!] category 라는 리스트로 검색결과를 가져왔음에 주의할것.
		if(list != null){
			request.setAttribute("list", list);
			path =  "search_ok.jsp";
		}
		return new ModelAndView(path);  //forward 諛⑹떇�쓣 �쓽誘명븿
	}
}
