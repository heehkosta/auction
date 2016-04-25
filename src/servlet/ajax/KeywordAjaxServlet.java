package servlet.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.KeywordDAO;

import org.json.JSONObject;

/**
 * Servlet implementation class KeywordAjaxServlet
 */
public class KeywordAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public KeywordAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> klist;
		try {
			klist = KeywordDAO.getInstance().descKeyword();
			
			JSONObject json = new JSONObject();
			json.put("klist", klist);
			
			
			PrintWriter out = response.getWriter();
			
			System.out.println(json);
			out.print(json);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
