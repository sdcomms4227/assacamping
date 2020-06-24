package productCart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;



@WebServlet("/cart/*") 
public class productCartController extends HttpServlet {
	
	productCartVO cartVO;
	productCartService cartService;
	private static String PRO_IMG_REPO = "C:\\product\\product_img";
	
	@Override
	public void init() throws ServletException {
		cartVO=new productCartVO();
		cartService=new productCartService();
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
	  		System.out.println("action:" + action);
	  		
	  		
	  		try {
				if(action == null || action.equals("/cart.do")) {
					
					String userId=request.getParameter("userId"); 
					
					List<productCartVO> list=cartService.allcartList(userId);
					
					
					request.setAttribute("list", list);
					
					nextPage="order/productCart.jsp";
					
				}else if(action.equals("/allDelte.do")) {
					
					String userId=request.getParameter("userId"); 
					
					List<Integer> productNoList=cartService.allDeleteCart(userId);
					
					for(int product1 : productNoList) {
						
						File imgDir = new File(PRO_IMG_REPO + "\\" + product1);
						
						 if(imgDir.exists()) {
							 
							 FileUtils.deleteDirectory(imgDir);
						 }			
					}
					
					nextPage="/order/productCart.jsp";
					
				}else if(action.equals("/update.do")) {
					String userId=request.getParameter("userId"); 
					int productNo=Integer.parseInt(request.getParameter("productNo"));
				    int cartQuantity=Integer.parseInt(request.getParameter("cartQuantity"));
				    
				    cartVO.setCartQuantity(cartQuantity);
				    cartVO.setProductNo(productNo);
				    cartVO.setUserId(userId);
				    
				    cartService.update(cartVO);
				    
				    nextPage="/order/productCart.jsp";
				    
				}else if(action.equals("/allDelete.do")) {
					
					String userId=request.getParameter("userId"); 
					
					cartService.allDeleteCart(userId);
					
					nextPage="/order/productCart.jsp";
							
					
				}else if(action.equals("/deleteCart.do")) {
					
					String userId=request.getParameter("userId"); 
					int productNo=Integer.parseInt(request.getParameter("productNo"));
					
					cartService.deleteCart(userId, productNo);
					
					
				File imgDir = new File(PRO_IMG_REPO + "\\" + productNo);
					
					 if(imgDir.exists()) {
						 
						 FileUtils.deleteDirectory(imgDir);
					 		
				}
				
				PrintWriter pw = response.getWriter();	
				pw.print("<script>" 
						+ " alert('��ٱ��� ����');" 
						+ " location.href='"
						+ request.getContextPath() +"/cart/cartlist.do';"
						+ "</script>");
				return;
		        	
					
				}else if(action.equals("/addCart.do")) {
					
					Map<String, String> cartMap = upload(request, response);
					
					String productImage = cartMap.get("productImage");
					String productNo = cartMap.get("productNo");
					String productPrice = cartMap.get("productPrice");
					String productDelivery=cartMap.get(" productDelivery");
					String cartQuantity=cartMap.get("cartQuantity");
					String productName=cartMap.get("productName");
					String productCategory=cartMap.get("productCategory");
					String userId=cartMap.get("userId");
					
					cartVO=new productCartVO(
							Integer.parseInt(productNo),
							Integer.parseInt(productPrice), 
							Integer.parseInt(cartQuantity),
							Integer.parseInt(productDelivery), 
							productName, 
							productImage,
							productCategory, 
							userId);
					
					cartService.addcart(cartVO);
					
					if (productImage != null && productImage.length() != 0) {
						File srcFile = new File(PRO_IMG_REPO + "\\" + "temp" + "\\" + productImage);
						File destDir = new File(PRO_IMG_REPO + "\\" + productNo);
						destDir.mkdirs();
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						srcFile.delete();
					}
					PrintWriter pw = response.getWriter();
					pw.print("<script>" + "  alert('��ٱ��� �߰��߽��ϴ�.');" + " location.href='" + request.getContextPath()
							+ "/order/productCart.jsp';" + "</script>");

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
	  	
	  	
	  	
	  	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
			
			Map<String, String> cartMap = new HashMap<String, String>();
			String encoding = "utf-8";
			File currentDirPath = new File(PRO_IMG_REPO);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(currentDirPath);
			factory.setSizeThreshold(1024 * 1024);
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				for(int i = 0; i<items.size(); i++) {
					FileItem fileItem = (FileItem) items.get(i);
					if(fileItem.isFormField()) {
						System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
						cartMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					}else {
						System.out.println("�Ķ��� ͸�: " + fileItem.getFieldName());
						System.out.println("����ũ��: " + fileItem.getSize() + "bytes");
					
						if(fileItem.getSize()>0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if(idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							
							String fileName = fileItem.getName().substring(idx + 1);
							System.out.println("���ϸ�: " + fileName);
							cartMap.put(fileItem.getFieldName(), fileName);
							File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
							fileItem.write(uploadFile);
									
						}
					
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return cartMap;
			
		}
}
