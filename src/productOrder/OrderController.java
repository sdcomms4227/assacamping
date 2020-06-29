package productOrder;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Member;

import productCart.productCartService;
import productCart.productCartVO;





@WebServlet("/cartorder/*")
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
		Map<String, Integer> totalPrice=null;
		List<productCartVO>	orderList=null;
		productCartService procartservice=null;
		String action = request.getPathInfo();
		try {
			
			
			if(action == null ||action.equals("/order.do")) {//결제주문정보 
				 procartservice=new productCartService();
				
				 orderList = new ArrayList();
				
				 totalPrice=new HashMap<String, Integer>();
				
				String userId=request.getParameter("userId");
				
				orderList=procartservice.allcartList(userId);
				System.out.println(orderList);
				   totalPrice =procartservice.TotalPrice(userId);
				   System.out.println(totalPrice);
				int ordercount=orderservice.orderCount(userId);
				
				request.setAttribute("orderList", orderList);
				
				request.setAttribute("ordercount", ordercount);//주문한 상품 총 개수
				
			    request.setAttribute("totalPrice", totalPrice);
			    
				/*
				 * MemberVO vo= dao.usercheck(userId); //회원정보DAO에서 정보 얻어오기
				 * 
				 * request.setAttribute("uservo", vo);
				 */
				
			   	nextPage="/order/checkout.jsp";
				
			}else if(action.equals("/pay.do")) {
				
				String userId=request.getParameter("userId");
			    int productPayment=Integer.parseInt(request.getParameter("totalPrice"));
			    String userZipcode=request.getParameter("userZipcode");
			    String address1=request.getParameter("address1");
			    String address2=request.getParameter("address2");
			    String productName=request.getParameter("productName");
			    String userName=request.getParameter("userName");
			    String userPhone=request.getParameter("userPhone");
			    String userComment=request.getParameter("userComment");
			    String productDelivery=request.getParameter("productDelivery");
			    
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
