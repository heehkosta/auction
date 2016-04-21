package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountDAO;
import model.AccountVO;

public class UpdateController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		AccountDAO dao = AccountDAO.getInstance();
		
		String userID = request.getParameter("userID");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String creditCardNumber = request.getParameter("creditCardNumber");
		String expiration = request.getParameter("expiration");
		String csv = request.getParameter("csv");
		String cardType = request.getParameter("cardType");
		
		
		AccountVO vo = new AccountVO(userID, name, password, creditCardNumber, expiration, csv, cardType);
		
		System.out.println("UpdateController:28" + vo);
		
		dao.updateAccount(vo);
		
		request.getSession().setAttribute("vo", vo);
		
		ModelAndView mv = new ModelAndView("update_result.jsp");
		return mv;
	}

}
