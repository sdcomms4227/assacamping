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
				// int ordercount=orderservice.orderCount(userId);
				
				request.setAttribute("orderList", orderList);
				
				// request.setAttribute("ordercount", ordercount);//주문한 상품 총 개수
				
			    request.setAttribute("totalPrice", totalPrice);
			    
				/*
				 * MemberVO vo= dao.usercheck(userId); //회원정보DAO에서 정보 얻어오기
				 * 
				 * request.setAttribute("uservo", vo);
				 */
				
			   	nextPage="/order/checkout.jsp";
				
			}else if(action.equals("/pay.do")) {//상품정보랑 회원배송지
			     String userId=request.getParameter("userId");
				  
			      int productPayment=Integer.parseInt(request.getParameter("totalPrice"));// 총결제금액
				  String userZipcode=request.getParameter("userZipcode"); 
				  String userAddress1=request.getParameter("address1"); 
				  String userAddress2=request.getParameter("address2"); 
				  String productName=request.getParameter("productName");
				  String userName=request.getParameter("userName");
				  String userPhone=request.getParameter("userPhone");
				  String userComment=request.getParameter("userComment");
				  int  productDelivery=Integer.parseInt(request.getParameter("productDelivery"));
				
			      
				
				 Map<String,Integer> orderMap=new HashMap<String, Integer>(); //상품이름과상품번호,수량
				
				 for(int i=0;i<request.getContentLength();i++) {
				
					 orderMap.put( request.getParameter("productName"),
						   Integer.parseInt(request.getParameter("cartQuantity")));
					 
				 }
				
 
				 OrderVO vo=new OrderVO();
				 vo.setUserAddress1(userAddress1);
				 vo.setUserAddress2(userAddress2);
				 vo.setProductName(productName);
				 vo.setUserName(userName);
				 vo.setUserPhone(userPhone);
				 vo.setUserComment(userComment);
				 vo.setProductDelivery(productDelivery);
				 
				 orderservice.addOrder(orderMap,vo);
				 
				 request.setAttribute("userId", userId);
				 
				 nextPage="/cartorder/paypro.do";
				 
			}else if(action.equals("/paypro.do")) {
				String userId=request.getParameter("userId");
				
				productCartService cartservice=new productCartService();
				 
				cartservice.allDeleteCart(userId);
				
				nextPage="order/orderInfo.jsp";
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
