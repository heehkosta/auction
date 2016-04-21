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
		AccountVO vo = dao.login(userID, password);

		
		String path = "login_fail.jsp";


		if(vo != null){
		    path = "login_ok.jsp";
		    request.getSession().setAttribute("vo", vo);
		}

		// �씤�옄媛� �븳媛쒖＜硫�, �룷�썙�뵫 �븯寃좊떎�뒗 寃껋씠�떎.
		ModelAndView mv = new ModelAndView(path);	
		
		
		
		return mv;
	}

	
	
	
	
}
