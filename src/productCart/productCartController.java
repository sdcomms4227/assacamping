package productCart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
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
import org.apache.commons.io.FileUtils;



@WebServlet("/cart/*") 
public class productCartController extends HttpServlet {
	String realPath=null;
	productCartVO cartVO;
	productCartService cartService;
	/* private static String PRO_IMG_REPO = "C:\\product\\product_img"; */
	
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
					
					
					
					System.out.println(userId+"controller");
					

					List<productCartVO> list=cartService.allcartList(userId);

					 Map<String, Integer> map=cartService.TotalPrice(userId);
					 if(!list.isEmpty()) {
					request.setAttribute("list", list);
					 }
					request.setAttribute("map", map);
					session.setAttribute("userId", userId);
					nextPage="/order/productCart.jsp";
					
				}else if(action.equals("/allDelte.do")) {
					
					String userId=(String)session.getAttribute("userId"); 
					
					List<Integer> productNoList=cartService.allDeleteCart(userId);
					
					for(int product1 : productNoList) {
						
						File imgDir = new File(realPath + "\\" + product1);
						
						 if(imgDir.exists()) {
							 
							 FileUtils.deleteDirectory(imgDir);
						 }			
					}
					session.setAttribute("userId", userId);
					nextPage="/order/productCart.jsp";
					
				}else if(action.equals("/update.do")) {
					String userId=(String)session.getAttribute("userId"); 
					
					String productName=request.getParameter("productName"); 
					
					int cartQuantity=Integer.parseInt(request.getParameter("cartQuantity"));
					
					int productPrice=Integer.parseInt(request.getParameter("productPrice"));
					
					
				    int productTotalPrice=cartQuantity*productPrice;
				    System.out.println(userId +"update");
					System.out.println(productName+"update");
					System.out.println(cartQuantity+"update");
					System.out.println(productPrice+"update");
					System.out.println(productTotalPrice+"update");
					
					cartVO.setUserId(userId);
					cartVO.setProductName(productName);
				    cartVO.setCartQuantity(cartQuantity);
				    cartVO.setProductTotalPrice(productTotalPrice);
				    
				    
				    
				    cartService.update(cartVO);
				    session.setAttribute("userId", userId);
				    nextPage="/cart/cart.do";
				    
				}else if(action.equals("/allDelete.do")) {
					
					String userId=(String)session.getAttribute("userId"); 
					
					List<Integer> list=cartService.allDeleteCart(userId);
					
					for(int i=0;i<list.size();i++) {
						
						int productNo1=list.get(i);
						
						File imgDir = new File(realPath + "\\" + productNo1);
						
						 if(imgDir.exists()) {
							 
							 FileUtils.deleteDirectory(imgDir);
					}
						
				}
					session.setAttribute("userId", userId);					
					nextPage="/cart/cart.do";
				}else if(action.equals("/deleteCart.do")) {
					
					String userId=(String)session.getAttribute("userId"); 
					
					int productNo=Integer.parseInt(request.getParameter("productNo"));
					
					cartService.deleteCart(userId, productNo);
					
					
				File imgDir = new File(realPath + "\\" + productNo);
					
					 if(imgDir.exists()) {
						 
						 FileUtils.deleteDirectory(imgDir);
					 		
				}
				
				PrintWriter pw = response.getWriter();	
				pw.print("<script>" 
						+ " alert('상품삭제완료');" 
						+ " location.href='"
						+ request.getContextPath() +"/cart/cart.do';"
						+ "</script>");
				return;
		        	
					
				}else if(action.equals("/addCart.do")) {
					
					String userId=(String)session.getAttribute("userId");
					
					System.out.println(userId);
					
					
				
					Map<String, String> cartMap = uploadFile(request,response);
					
					
					String productImage = cartMap.get("productImage");
					System.out.println(productImage);
					String productNo = cartMap.get("productNo");
					System.out.println(productNo);
					String productPrice1 = cartMap.get("productPrice");
					System.out.println(productPrice1);
					String productDelivery=cartMap.get("productDelivery");
					
					
				
				 if (productDelivery.equals("1")) {
				 
				  productDelivery="2500";

				  }else{ 
					  productDelivery="0"; 
				  
				  }
				 
					System.out.println(productDelivery);
					
					String cartQuantity1=cartMap.get("cartQuantity");
					int cartQuantity=Integer.parseInt(cartQuantity1);
					
					System.out.println(cartQuantity);
					String productName=cartMap.get("productName");
					String productCategory=cartMap.get("productCategory");
					
					System.out.println("카테고리"+productCategory);
					int productPrice=Integer.parseInt(productPrice1);
				
					int productTotalPrice=cartQuantity*productPrice;
					
					cartVO=new productCartVO(
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
					
				/*
				 * if (productImage != null && productImage.length() != 0) { File srcFile = new
				 * File(realPath + "\\" + "temp" + "\\" + productImage); File destDir = new
				 * File(realPath + "\\" + productNo); destDir.mkdirs();
				 * FileUtils.moveFileToDirectory(srcFile, destDir, true); srcFile.delete();
				 * System.out.println("완료"); }
				 */
			
				   PrintWriter pw = response.getWriter(); pw.print("<script>" +
				  "  alert('장바구니담기완료');" + " location.href='" + request.getContextPath() +
				 "/cart/cart.do';" + "</script>");
				 
					
					
					
					return;
					//nextPage="/cart/cart.do";
					
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
		
	  	private void moveFile(int productNo, String fileName){
			try {
				File srcFile = new File(realPath + "\\temp\\" + fileName);
				File destDir = new File(realPath + "\\" + productNo);
				Boolean createDestDir = destDir.mkdir();
				
				String filePath = realPath + "\\" + productNo + "\\" + fileName;
				File file = new File(filePath);
				
				if(file.exists()) {
					deleteFile(productNo, fileName);
				}	
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			} catch (Exception e) {
				System.out.println("moveFile()메소드 내부에서 오류 : " + e.toString());
			}
		}
		
		private void deleteFile(int productNo, String fileName){
			try {
				String filePath = realPath + "\\" + productNo + "\\" + fileName;
				File file = new File(filePath);
				
				if(file.exists()) {
					file.delete();
				}
			} catch (Exception e) {
				System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
			}
		}
		
		private void deleteDirectory(int productNo){
			try {
				String realDirPath = realPath + "\\" + productNo;
				File realDir = new File(realDirPath);
				
				if(realDir.exists()) {
					FileUtils.deleteDirectory(realDir);
				}
			} catch (Exception e) {
				System.out.println("deleteDirectory()메소드 내부에서 오류 : " + e.toString());
			}
		}
	/*
	 * private Map<String, String> upload(HttpServletRequest request,
	 * HttpServletResponse response) throws ServletException, IOException{
	 * 
	 * Map<String, String> cartMap = new HashMap<String, String>(); String encoding
	 * = "utf-8"; File currentDirPath = new File(PRO_IMG_REPO); DiskFileItemFactory
	 * factory = new DiskFileItemFactory(); factory.setRepository(currentDirPath);
	 * factory.setSizeThreshold(1024*1024*1); ServletFileUpload upload = new
	 * ServletFileUpload(factory); try { List items = upload.parseRequest(request);
	 * for(int i = 0; i<items.size(); i++) { FileItem fileItem = (FileItem)
	 * items.get(i); if(fileItem.isFormField()) {
	 * System.out.println(fileItem.getFieldName() + "=" +
	 * fileItem.getString(encoding)); cartMap.put(fileItem.getFieldName(),
	 * fileItem.getString(encoding)); }else { System.out.println("파일이름: " +
	 * fileItem.getFieldName()); System.out.println("파일크기: " + fileItem.getSize() +
	 * "bytes");
	 * 
	 * if(fileItem.getSize()>0) { int idx = fileItem.getName().lastIndexOf("\\");
	 * if(idx == -1) { idx = fileItem.getName().lastIndexOf("/"); }
	 * 
	 * String fileName = fileItem.getName().substring(idx + 1);
	 * System.out.println("파일이름: " + fileName); cartMap.put(fileItem.getFieldName(),
	 * fileName); File uploadFile = new File(currentDirPath + "\\temp\\" +
	 * fileName); fileItem.write(uploadFile);
	 * 
	 * }
	 * 
	 * } } } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return cartMap;
	 * 
	 * }
	 */
}
