package orderAdmin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import order.OrderVO;

@SuppressWarnings("serial")
@WebServlet("/orderAdminServlet/*")
public class OrderAdminController extends HttpServlet{
	
	OrderAdminService orderAdminService;
	OrderVO orderVO;
	String realPath;
		
	@Override
	public void init() throws ServletException {
		orderAdminService = new OrderAdminService();
		orderVO = new OrderVO();
	}	

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		realPath = request.getServletContext().getRealPath("/files/product");
				
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action: " + action);

		if(action == null || action.equals("/listOrder.do")) {

			setPagination(request);
			
//			Map<String, Object> searchMap = new HashMap<String, Object>();
//			searchMap.put("pageNo", request.getAttribute("pageNo"));
//			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
//			searchMap.put("searchCategoryNo", request.getAttribute("searchCategoryNo"));
//
//			Map<String, Object> productListMap = orderAdminService.listOrder(searchMap);			
//			request.setAttribute("productListMap", productListMap);
//			
//			List<OrderCategoryVO> productCategoryList = productCategoryService.listOrderCategory();			
//			request.setAttribute("productCategoryList", productCategoryList);
//
//			if(request.getAttribute("alertMsg")!=null) {
//				request.setAttribute("alertMsg", request.getAttribute("alertMsg")); 
//			}
			
			nextPage = "/orderAdmin/listOrder.jsp";
			
//		}else if(action.equals("/readOrder.do")) {
//
//			setPagination(request);
//			
//			int productNo = Integer.parseInt(request.getParameter("productNo"));			
//			Map<String, Object> productMap = orderAdminService.readOrder(productNo);			
//			request.setAttribute("productMap", productMap);
//			
//			if(request.getAttribute("alertMsg")!=null) {
//				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
//			}
//			
//			nextPage = "/orderAdmin/readOrder.jsp";
//			
//		}else if(action.contentEquals("/addOrder.do")) {
//
//			List<OrderCategoryVO> productCategoryList = productCategoryService.listOrderCategory();			
//			request.setAttribute("productCategoryList", productCategoryList);
//			
//			nextPage = "/orderAdmin/addOrder.jsp";
//			
//		}else if(action.equals("/insertOrder.do")) {
//
//			Map<String, String> multipartMap = uploadFile(request);
//									
//			String productName = multipartMap.get("productName");
//			String productContent = multipartMap.get("productContent");
//			String productImageName1 = multipartMap.get("productImageName1");
//			String productImageName2 = multipartMap.get("productImageName2");
//			String productImageName3 = multipartMap.get("productImageName3");
//			int productPrice = Integer.parseInt(multipartMap.get("productPrice"));
//			int productQuantity = Integer.parseInt(multipartMap.get("productQuantity"));
//			int productCategoryNo = Integer.parseInt(multipartMap.get("productCategoryNo"));
//			
//			orderVO.setOrderName(productName);
//			orderVO.setOrderContent(productContent);
//			orderVO.setOrderImageName1(productImageName1);
//			orderVO.setOrderImageName2(productImageName2);
//			orderVO.setOrderImageName3(productImageName3);
//			orderVO.setOrderPrice(productPrice);
//			orderVO.setOrderQuantity(productQuantity);
//			orderVO.setOrderCategoryNo(productCategoryNo);
//			
//			int readNo = orderAdminService.insertOrder(orderVO);
//			
//			String alertMsg = "";
//			
//			if(readNo > 0) {
//				alertMsg = "정상적으로 등록되었습니다.";
//				
//				if(productImageName1!=null) {
//					moveFile(readNo, productImageName1);
//				}
//				if(productImageName2!=null) {
//					moveFile(readNo, productImageName2);
//				}
//				if(productImageName3!=null) {
//					moveFile(readNo, productImageName3);
//				}
//			}else {
//				alertMsg = "오류가 발생했습니다.";
//			}
//			
//			request.setAttribute("alertMsg", alertMsg);
//			
//			nextPage = "/orderAdminServlet/readOrder.do?productNo=" + readNo;
//			
//		}else if(action.equals("/modifyOrder.do")) {
//
//			setPagination(request);
//			
//			int productNo = Integer.parseInt(request.getParameter("productNo"));
//			Map<String, Object> productMap = orderAdminService.readOrder(productNo);
//			request.setAttribute("productMap", productMap);
//
//			List<OrderCategoryVO> productCategoryList = productCategoryService.listOrderCategory();			
//			request.setAttribute("productCategoryList", productCategoryList);
//			
//			nextPage = "/orderAdmin/modifyOrder.jsp";
//			
//		}else if(action.equals("/updateOrder.do")) {
//
//			setPagination(request);
//			
//			Map<String, String> multipartMap = uploadFile(request);
//						
//			int productNo = Integer.parseInt(multipartMap.get("productNo"));
//			String productName = multipartMap.get("productName");
//			String productContent = multipartMap.get("productContent");
//			String productImageName1 = multipartMap.get("productImageName1");
//			String productImageName2 = multipartMap.get("productImageName2");
//			String productImageName3 = multipartMap.get("productImageName3");
//			int productPrice = Integer.parseInt(multipartMap.get("productPrice"));
//			int productQuantity = Integer.parseInt(multipartMap.get("productQuantity"));
//			int productCategoryNo = Integer.parseInt(multipartMap.get("productCategoryNo"));
//			
//			orderVO.setOrderNo(productNo);
//			orderVO.setOrderName(productName);
//			orderVO.setOrderContent(productContent);
//			orderVO.setOrderImageName1(productImageName1);
//			orderVO.setOrderImageName2(productImageName2);
//			orderVO.setOrderImageName3(productImageName3);
//			orderVO.setOrderPrice(productPrice);
//			orderVO.setOrderQuantity(productQuantity);
//			orderVO.setOrderCategoryNo(productCategoryNo);
//			
//			Map<String, String> originalImageNameMap = new HashMap<String, String>();
//			String originalImageName1 = multipartMap.get("originalImageName1");
//			String originalImageName2 = multipartMap.get("originalImageName2");
//			String originalImageName3 = multipartMap.get("originalImageName3");			
//			originalImageNameMap.put("originalImageName1", originalImageName1);
//			originalImageNameMap.put("originalImageName2", originalImageName2);
//			originalImageNameMap.put("originalImageName3", originalImageName3);
//			
//			Map<String, String> deleteFileMap = new HashMap<String, String>();
//			String deleteFile2 = multipartMap.get("deleteFile2");
//			String deleteFile3 = multipartMap.get("deleteFile3");
//			deleteFileMap.put("deleteFile2", deleteFile2);
//			deleteFileMap.put("deleteFile3", deleteFile3);
//			
//			int result = orderAdminService.updateOrder(orderVO, originalImageNameMap, deleteFileMap);
//			String alertMsg = "";
//			
//			if(result > 0) {
//				alertMsg = "정상적으로 수정되었습니다.";
//				
//
//				if(productImageName1!=null) {
//					deleteFile(productNo, originalImageName1);
//					moveFile(productNo, productImageName1);
//				}
//
//				if(deleteFile2!=null || productImageName2!=null) {
//					deleteFile(productNo, originalImageName2);
//				}
//				if(productImageName2!=null) {
//					moveFile(productNo, productImageName2);
//				}
//
//				if(deleteFile3!=null || productImageName3!=null) {
//					deleteFile(productNo, originalImageName3);
//				}
//				if(productImageName3!=null) {
//					moveFile(productNo, productImageName3);
//				}
//			}else {
//				alertMsg = "오류가 발생했습니다.";
//			}
//			
//			request.setAttribute("alertMsg", alertMsg);
//			
//			nextPage = "/orderAdminServlet/readOrder.do?productNo=" + productNo;
//			
//		}else if(action.equals("/deleteOrder.do")) {
//
//			setPagination(request);
//			
//			int productNo = Integer.parseInt(request.getParameter("productNo"));
//			
//			int result = orderAdminService.deleteOrder(productNo);
//			String alertMsg = "";
//
//			if(result > 0) {
//				alertMsg = "정상적으로 삭제되었습니다.";
//				
//				deleteDirectory(productNo);
//			}else {
//				alertMsg = "오류가 발생했습니다.";
//			}
//			
//			request.setAttribute("alertMsg", alertMsg);
//			
//			nextPage = "/orderAdminServlet/listOrder.do";
//			
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
	}

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
	
	private Map<String, String> uploadFile(HttpServletRequest request){
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
}
