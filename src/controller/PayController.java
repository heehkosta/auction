package controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PayController implements Controller{

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/*String code = request.getParameter("code");
		String address = request.getParameter("address");*/
		
				
				
		String path =  "pay_ok.jsp?code=" + code + "&address=" + address;


		return new ModelAndView(path);  //forward 방식을 의미함
	}

}
