package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemDAO;
import model.ItemVO;


public class DescribeController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = "describe_fail.jsp";
		String name = request.getParameter("id");
		
		ArrayList<ItemVO> list = ItemDAO.getInstance().selectByName(name);
		for(ItemVO i : list) {
			System.out.println(i.getName());
		}
		
		if(list != null){
			request.setAttribute("list", list);
			path =  "search_ok.jsp";
		}
		return new ModelAndView(path);  //forward 방식을 의미함
	}
}
