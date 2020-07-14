package cart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/cartServlet/*") 
public class CartController extends HttpServlet {
	String realPath=null;
	CartVO cartVO;
	CartService cartService;
	/* private static String PRO_IMG_REPO = "C:\\product\\product_img"; */
	
	@Override
	public void init() throws ServletException {
		cartVO=new CartVO();
		cartService=new CartService();
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
	  		realPath = request.getServletContext().getRealPath("/files/product");
	  	    String nextPage="";
	  	    request.setCharacterEncoding("UTF-8");
	  		response.setContentType("text/html;charset=utf-8");
	  		HttpSession session = request.getSession();
	  		String action = request.getPathInfo();
	  		System.out.println("action:" + action);
	  		
	  		
	  		try {
				if(action == null || action.equals("/cart.do")) {
				
					String userId=(String)session.getAttribute("userId"); 
					
					List<CartVO> list=cartService.allcartList(userId);

					 Map<String, Integer> map=cartService.TotalPrice(userId);
					 if(!list.isEmpty()) {
					request.setAttribute("list", list);
					 }
					request.setAttribute("map", map);
					session.setAttribute("userId", userId);
					nextPage="/order/cart.jsp";
					
			}else if(action.equals("/update.do")) {
					String userId=(String)session.getAttribute("userId"); 
					
					String productName=request.getParameter("productName"); 
					
					int cartQuantity=Integer.parseInt(request.getParameter("cartQuantity"));
					
					int productPrice=Integer.parseInt(request.getParameter("productPrice"));
					
					
				    int productTotalPrice=cartQuantity*productPrice;
					
					cartVO.setUserId(userId);
					cartVO.setProductName(productName);
				    cartVO.setCartQuantity(cartQuantity);
				    cartVO.setProductTotalPrice(productTotalPrice);
				    
				    
				    
				    cartService.update(cartVO);
				    session.setAttribute("userId", userId);
				    nextPage="/cartServlet/cart.do";
				    
				}else if(action.equals("/allDelete.do")) {
					
					String userId=(String)session.getAttribute("userId"); 
					
					List<Integer> list=cartService.allDeleteCart(userId, request);
										
					session.setAttribute("userId", userId);	
					
					nextPage="/cartServlet/cart.do";
					
				}else if(action.equals("/deleteCart.do")) {
					
					String userId=(String)session.getAttribute("userId"); 
					
					int productNo=Integer.parseInt(request.getParameter("productNo"));
					
					cartService.deleteCart(userId, productNo);
					
					int cartCount = 0;
					cartCount = cartService.cartTotalCount(userId);
					session.setAttribute("cartCount", cartCount);
					
					PrintWriter pw = response.getWriter();	
					pw.print("<script>" 
							+ " alert('상품삭제완료');" 
							+ " location.href='"
							+ request.getContextPath() +"/cartServlet/cart.do';"
							+ "</script>");
					return;
		        	
					
				}else if(action.equals("/addCart.do")) {
					
					String userId=(String)session.getAttribute("userId");
									
					Map<String, String> cartMap = uploadFile(request,response);					
					
					String productImage = cartMap.get("productImage");
					String productNo = cartMap.get("productNo");
					String productPrice1 = cartMap.get("productPrice");
					String productDelivery=cartMap.get("productDelivery");
				
					if (productDelivery.equals("1")) {
						productDelivery="2500";
					}else{ 
						productDelivery="0"; 
					}
				 
					String cartQuantity1=cartMap.get("cartQuantity");
					int cartQuantity=Integer.parseInt(cartQuantity1);
					
					String productName=cartMap.get("productName");
					String productCategory=cartMap.get("productCategory");
					
					int productPrice=Integer.parseInt(productPrice1);
				
					int productTotalPrice=cartQuantity*productPrice;
				
					cartVO=new CartVO(
							Integer.parseInt(productNo), 
							productPrice, 
							cartQuantity, 
							Integer.parseInt(productDelivery), 
							productTotalPrice, 
							productName,
							productImage, 
							productCategory,
							userId);
					
					
					cartService.addcart(cartVO);
					
					int cartCount = 0;
					cartCount = cartService.cartTotalCount(userId);
					session.setAttribute("cartCount", cartCount);
					
					PrintWriter pw = response.getWriter();
					pw.print("<script>");
					pw.print("	alert('장바구니담기완료');");
					pw.print("	location.href='" + request.getContextPath() + "/cartServlet/cart.do';");
					pw.print("</script>");
				 
					return;
					
				}
			} catch (Exception e) {
				
			}
	  		 if(!nextPage.equals("")) {
	  		RequestDispatcher dispath =
					request.getRequestDispatcher(nextPage);
	  		dispath.forward(request, response);
	  		}
	  	}
	  	
	  	private Map<String, String> uploadFile(HttpServletRequest request,HttpServletResponse response){
			Map<String, String> productMap = null;
						
			try {
				productMap = new HashMap<String, String>();
				
				File repository = new File(realPath);
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(1024*1024*1);
				factory.setRepository(repository);
				ServletFileUpload upload = new ServletFileUpload(factory);
			
				List<FileItem> items = upload.parseRequest(request);
				
				for(int i=0; i<items.size(); i++) {
					DiskFileItem fileItem = (DiskFileItem)items.get(i);
					
					if(fileItem.isFormField()) {
						productMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
					}else {
						
						if(fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							
							if(idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							
							int fieldLength = fileItem.getFieldName().length();						
							String fieldNum = fileItem.getFieldName().substring(fieldLength-1,fieldLength);					
							
							String fileName = fieldNum + "_" + fileItem.getName().substring(idx + 1);
							String tempDirPath = realPath + "\\temp";
							File tempDir = new File(tempDirPath);
							
							if(!tempDir.exists()) {
								tempDir.mkdir();
							}
							
							String filePath = tempDirPath + "\\" + fileName;
							File file = new File(filePath);
							
							productMap.put(fileItem.getFieldName(), fileName);
							
							if(!file.exists()) {
								fileItem.write(file);
							}
							
						}else {
							productMap.put(fileItem.getFieldName(), null);
						}
					}
				}
			} catch (Exception e) {
				System.out.println("uploadFile()메소드 내부에서 오류 : " + e.toString());
			}
			
			return productMap;
		}
	  	
}