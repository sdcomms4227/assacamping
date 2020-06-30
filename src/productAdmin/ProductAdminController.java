package productAdmin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
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

import productCategory.ProductCategoryVO;
import productCategory.ProductCategoryService;

@SuppressWarnings("serial")
@WebServlet("/proadm/*")
public class ProductAdminController extends HttpServlet{
	
	ProductAdminService productService;
	ProductAdminVO productVO;	
	ProductCategoryService productCategoryService;
	ProductCategoryVO productCategoryVO;
	String realPath = "";
		
	@Override
	public void init() throws ServletException {
		productService = new ProductAdminService();
		productVO = new ProductAdminVO();
		productCategoryService = new ProductCategoryService();
		productCategoryVO = new ProductCategoryVO();
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

		if(action == null || action.equals("/listProduct.do")) {

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("searchCategoryNo", request.getAttribute("searchCategoryNo"));

			Map<String, Object> productListMap = productService.listProduct(searchMap);			
			request.setAttribute("productListMap", productListMap);
			
			List<ProductCategoryVO> productCategoryList = productCategoryService.listProductCategory();			
			request.setAttribute("productCategoryList", productCategoryList);
			
			nextPage = "/productAdmin/listProduct.jsp";
			
		}else if(action.equals("/readProduct.do")) {

//			nextPage = "/productAdmin/readProduct.jsp";
			
		}else if(action.contentEquals("/writeProduct.do")) {

//			nextPage = "/productAdmin/writeProduct.jsp";
			
		}else if(action.equals("/insertProduct.do")) {

//			nextPage = "/camp/readProduct.do?productNo=" + readNo;
			
		}else if(action.equals("/modifyProduct.do")) {

//			nextPage = "/productAdmin/modifyProduct.jsp";
			
		}else if(action.equals("/updateProduct.do")) {

//			nextPage = "/camp/readProduct.do?productNo=" + productNo;
			
		}else if(action.equals("/deleteProduct.do")) {

//			nextPage = "/camp/listProduct.do";
			
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
						productMap.put(fileItem.getFieldName(), fileItem.getName());
						int idx = fileItem.getName().lastIndexOf("\\");
						
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						
						String fileName = fileItem.getName().substring(idx + 1);
						String tempDirPath = realPath + "\\temp";
						File tempDir = new File(tempDirPath);
						
						if(!tempDir.exists()) {
							tempDir.mkdir();
						}
						
						String filePath = tempDirPath + "\\" + fileName;
						File file = new File(filePath);
						
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
			
			if(!file.exists()) {
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			}	
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
	
	private void downloadFile(HttpServletResponse response, int productNo, String fileName){
		try {			
			String filePath = realPath + "\\" + productNo + "\\" + fileName;
			File file = new File(filePath);
		
			OutputStream out = response.getOutputStream();			
			
			response.setHeader("Cache-Control", "no-chche");
			response.addHeader("Cache-Control", "no-store");			
			response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8") + "\";");
			
			FileInputStream in = new FileInputStream(file);	
			
			byte[] buffer = new byte[1024*8];
			
			while(true) {
				int count = in.read(buffer);
				
				if(count == -1) {
					break;
				}
				out.write(buffer, 0, count);;
			}
			
			in.close();
			out.close();
		} catch (Exception e) {
			System.out.println("downloadFile()메소드 내부에서 오류 : " + e.toString());
		}		
	}
	
	private String getFileType(int productNo, String fileName){
		String productFileType = "";

		try {
			String filePath = realPath + "\\" + productNo + "\\" + fileName;
			File file = new File(filePath);
			
			String mimeType = Files.probeContentType(file.toPath());
			productFileType = mimeType.split("/")[0];
			
		} catch (Exception e) {
			System.out.println("getFileType()메소드 내부에서 오류 : " + e.toString());
		}
		
		return productFileType;
	}
	
	private void deleteDirectory(int productNo){
		try {
			String realDirPath = realPath + "\\" + productNo;
			File realDir = new File(realDirPath);
			
			if(realDir.exists()) {
				FileUtils.deleteDirectory(realDir);
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
}
