package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FeedBackDAO;
import model.FeedBackVO;
import model.ItemDAO;
import model.ItemVO;


public class DescribeController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String path = "describe_fail.jsp";
		String id = request.getParameter("id");
		int id2 = Integer.parseInt(request.getParameter("id"));
		System.out.println("Describe: 20" + id);
		float avg = 0.0f;

		ItemVO item = ItemDAO.getInstance().selectByID(id);
		ArrayList<FeedBackVO> flist = FeedBackDAO.getInstance().SearchFeedBack(id2);
		for(int i =0; i < flist.size();i++){
			avg += flist.get(i).getRating();
		}
		avg = avg/flist.size();
		System.out.println("DescribeController avg :"+avg);
		System.out.println("DescribeController item :" + item);
		System.out.println("DescribeController flist :" + flist);
		request.setAttribute("flist", flist);
		request.setAttribute("item", item);
		request.setAttribute("avg", avg);
		path =  "item_describe.jsp";

		return new ModelAndView(path);  //forward 방식을 의미함
	}
}
