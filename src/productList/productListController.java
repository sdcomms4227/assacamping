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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



@WebServlet("/pro/*")
public class productListController extends HttpServlet{
	private static String PRO_IMG_REPO = "C:\\product\\product_img";
	productListDAO proDAO;
	productListVO proVO;
	productListService proService; 
	
	@Override
	public void init() throws ServletException {
		proDAO = new productListDAO();  
		proVO = new productListVO();
		proService = new productListService();
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
		
		try {
			List<productListVO> proList = new ArrayList<productListVO>();
			
			if(action.equals("/proList.do")) {
				
			proList = proService.proAllList();
			
			request.setAttribute("proList", proList);
			
			nextPage = "/prolist/proList.jsp";
			
			}else if(action.equals("/writeForm.do")) {
				nextPage="/prolist/writeForm.jsp";
			
				
			}else if(action.equals("/addForm.do")) {
				//게시판 구현자가 구현 
				
			}else if(action.equals("/getOnePro.do")) {
				int proNO = Integer.parseInt(request.getParameter("proNo"));
				productListVO onePro = new productListVO();
				onePro = proService.getOnePro(proNO); 
				
				request.setAttribute("onePro", onePro);
				
				nextPage = "/prolist/proInfo.jsp";
			
			}else if(action.equals("/selectNewProduct")) {
				
			}
			
			RequestDispatcher dispatch = 
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//doHandle()끝
	
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
