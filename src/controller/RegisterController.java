package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountDAO;
import model.AccountVO;

public class RegisterController implements Controller {

    @Override
    public ModelAndView handle(HttpServletRequest request,
				      HttpServletResponse response) throws Exception {
		
	String userID = request.getParameter("userID");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String creditCardNumber = request.getParameter("creditCardNumber");
	String expiration = request.getParameter("expiration");
	String csv = request.getParameter("csv");
	String cardType = request.getParameter("cardType");

	
	AccountDAO dao = AccountDAO.getInstance();
	
	// 이미 중복체크를 통과했으므로 registerMember의 결과에 연연할 필요 없다.
	AccountVO vo = new AccountVO(userID, name, password, creditCardNumber, 
								  expiration, csv, cardType);
	dao.registerMember(vo);
	ModelAndView mv = new ModelAndView("register_result.jsp");
	return mv;

    }

}
