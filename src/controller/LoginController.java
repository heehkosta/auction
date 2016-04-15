package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountDAO;
import model.AccountVO;

public class LoginController implements Controller{

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String userID = request.getParameter("userID");
		String password = request.getParameter("password");
		
		AccountDAO dao = AccountDAO.getInstance();
		AccountVO mvo = dao.login(userID, password);

		
		String path = "login_fail.jsp";


		if(mvo != null){
		    path = "login_ok.jsp";
		    request.getSession().setAttribute("mvo", mvo);
		}

		// 인자값 한개주면, 포워딩 하겠다는 것이다.
		ModelAndView mv = new ModelAndView(path);	
		
		
		
		return mv;
	}

	
	
	
	
}
