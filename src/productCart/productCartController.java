package productCart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import procart.procartDAO;
import procart.procartService;
import procart.procartVO;



public class productCartController extends HttpServlet {
	productCartDAO proDAO;
	productCartVO proVO;
	productCartService proService;
	private static String PRO_IMG_REPO = "C:\\product\\product_img";
	
	@Override
	public void init() throws ServletException {
		 proDAO =new productCartDAO();
		 proService=new productCartService();
	}
	 @Override
	  	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	  			throws ServletException, IOException {
	  		
	  		doHandle(request,response);
	  	}
	  	
	  	@Override
	  	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	  			throws ServletException, IOException {
	  		
	  		doHandle(request,response);
	  	}
	  	
	  	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
	  			throws ServletException, IOException {

	  	    String nextPage="";
	  	    request.setCharacterEncoding("UTF-8");
	  		response.setContentType("text/html;charset=utf-8");
	  		
	  		String action = request.getPathInfo();
	  		
	  		try {
				if(action == null || action.equals("productCartList.do")) {
					
					String userId=request.getParameter("userId"); 
					List<productCartVO> list=proService.AllcartList(userId);
					
					request.setAttribute("list", list);
				}
			} catch (Exception e) {
				
			}
	  	}
}
