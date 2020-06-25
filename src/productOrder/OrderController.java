package productOrder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Member;





//@WebServlet("/order/*")
public class OrderController extends HttpServlet{
	
	
	@Override
	public void init() throws ServletException {
		
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
		OrderService orderservice = new OrderService();
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		try {
			
			
			if(action == null ||action.equals("/order.do")) {//결제주문정보 
				
				List<OrderVO> orderList = new ArrayList();
				
				String userId=request.getParameter("userId");
				
				orderList=orderservice.orderList(userId);
				int ordercount=orderservice.orderCount(userId);
				request.setAttribute("ordercount", ordercount);//주문한 상품 총 개수
			   
				MemberVO vo= dao.usercheck(userId); //회원정보DAO에서 정보 얻어오기
				request.setAttribute("uservo", vo);
				
			   	nextPage="/order/checkout.jsp";
				
			}else if(action.equals("/pay.do")) {
				
				String userId=request.getParameter("userId");
			
				
			}
			 if(!nextPage.equals("")) {
			RequestDispatcher dispatch = 
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			 }
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			
		}
		
	}
}
