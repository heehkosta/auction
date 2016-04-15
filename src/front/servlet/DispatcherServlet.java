package front.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.HandlerMapping;
import controller.ModelAndView;
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DispatcherServlet() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//command값을 받아옴.
		String command = request.getParameter("command");
		System.out.println(command);
		
		String textbox = request.getParameter("textbox");
		System.out.println(textbox);
		
		String itemID = request.getParameter("itemId");
		System.out.println("DPS"+itemID);
		
		
		
		Controller cont=HandlerMapping.getInstance().createController(command);
		ModelAndView mv = null;
		
		try{
			mv = cont.handle(request, response);
			System.out.println(mv.getPath());
		}catch(Exception e){
			e.printStackTrace();
		}
		if(mv != null){
			if(mv.isRedirect()){
				response.sendRedirect(mv.getPath());
			}else{
				request.getRequestDispatcher(mv.getPath()).forward(request, response);
			}
		}
	}

}
