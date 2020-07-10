package productList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import productCategory.ProductCategoryService;
import productCategory.ProductCategoryVO;

//@WebServlet("/pro/*")
public class productListController extends HttpServlet{
	private static String PRO_IMG_REPO = "C:\\product\\product_img";
	productListDAO proDAO;
	productListVO proVO;
	productListService proService; 
	ProductCategoryService productCategoryService;
	ProductCategoryVO productCategoryVO;
	
	@Override
	public void init() throws ServletException {
		proDAO = new productListDAO();  
		proVO = new productListVO();
		proService = new productListService();
		productCategoryService = new ProductCategoryService();
		productCategoryVO = new ProductCategoryVO();
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
		
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action:"+action);
		
		try {
			
			
			if(action.equals("/proList.do")) {
				
				setPagination(request);
				
				Map<String, Object> searchMap = new HashMap<String, Object>();
				searchMap.put("pageNo", request.getAttribute("pageNo"));
				searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
				searchMap.put("searchCategoryNo", request.getAttribute("searchCategoryNo"));

				Map<String, Object> productListMap = proService.listProduct(searchMap);
				System.out.println(productListMap);
				request.setAttribute("productListMap", productListMap);
				
				List<ProductCategoryVO> productCategoryList = productCategoryService.listProductCategory();			
				request.setAttribute("productCategoryList", productCategoryList);

				if(request.getAttribute("alertMsg")!=null) {
					request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
				}
			

			nextPage = "/product/productList.jsp";
			
		
			}else if(action.equals("/getOnePro.do")) {

				int productNo = Integer.parseInt(request.getParameter("productNo"));
				productListVO onePro = new productListVO();
				onePro = proService.getOnePro(productNo); 
				
				ProductCategoryService pcategoryservice=new ProductCategoryService();
				ProductCategoryVO productvo =pcategoryservice.ProductCategoryName(onePro.getProductCategoryNo());
				
				request.setAttribute("onePro", onePro);
				request.setAttribute("productvo", productvo);
				nextPage = "/product/productInfo.jsp";

			
			}
			
			
			if(!nextPage.equals("")) {
			RequestDispatcher dispatch = 
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//doHandle()끝
	
	
	private void setPagination(HttpServletRequest request) {
		try {
			int pageNo = 1;
			if(request.getParameter("pageNo")!=null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			if(request.getAttribute("pageNo")==null) {
				request.setAttribute("pageNo", pageNo);
			}
			
			String searchKeyword = "";
			if(request.getParameter("searchKeyword")!=null) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			if(request.getAttribute("searchKeyword")==null) {
				request.setAttribute("searchKeyword", searchKeyword);
			}
			
			int searchCategoryNo = 0;
			if(request.getParameter("searchCategoryNo")!=null) {
				searchCategoryNo = Integer.parseInt(request.getParameter("searchCategoryNo"));
			}
			if(request.getAttribute("searchCategoryNo")==null) {
				request.setAttribute("searchCategoryNo", searchCategoryNo);
			}			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		Map<String, String> articleMap = new HashMap<String, String>();
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
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
				}else {
					System.out.println("파라미터명: " + fileItem.getFieldName());
					System.out.println("파일크기: " + fileItem.getSize() + "bytes");
				
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						
						String fileName = fileItem.getName().substring(idx + 1);
						System.out.println("파일명: " + fileName);
						articleMap.put(fileItem.getFieldName(), fileName);
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						fileItem.write(uploadFile);
								
					}
				
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return articleMap;
		
	}
}
