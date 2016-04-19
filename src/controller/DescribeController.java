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
		String id = request.getParameter("id");
		
		System.out.println("Describe: 20" + id);
		
		ItemVO item = ItemDAO.getInstance().selectByID(id);
	
			System.out.println("DescribeController:24" + item);
			request.setAttribute("item", item);
			path =  "item_describe.jsp";
		
		return new ModelAndView(path);  //forward 방식을 의미함
	}
}
