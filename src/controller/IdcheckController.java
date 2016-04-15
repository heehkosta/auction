package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountDAO;

public class IdcheckController implements Controller {

    @Override
    public ModelAndView handle(HttpServletRequest request,
				      HttpServletResponse response) throws Exception {

	//DB 비즈니스 로직중 isExist()를 이용하여 플래그 값을 받아서 request에 바인딩 한다.
		
	AccountDAO dao = AccountDAO.getInstance();
	
	String path = "idcheck.jsp"; 
	
	//일단 Dispatcher 서블릿에서 받은 패러미터 id를 이용하고
	// DB로직을 써서 그 결과값을 attribute에 넣는다.
	String id = request.getParameter("userID");
	if(dao.isExist(id)){
		request.setAttribute("flag", true);
	}
	else{
		request.setAttribute("flag", false);
	}
	ModelAndView mv = new ModelAndView(path);
	
	
	return mv;
	
    }

}
