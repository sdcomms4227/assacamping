package campingAdmin;

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

import camping.CampingVO;
import campingCategory.CampingCategoryService;
import campingCategory.CampingCategoryVO;

@SuppressWarnings("serial")
@WebServlet("/campingAdminServlet/*")
public class CampingAdminController extends HttpServlet {
	
	CampingAdminService campingAdminService;
	CampingVO campingVO;	
	CampingCategoryService campingCategoryService;
	CampingCategoryVO campingCategoryVO;
	String realPath;

	@Override
	public void init() throws ServletException {
		campingAdminService = new CampingAdminService();
		campingVO = new CampingVO();
		campingCategoryService = new CampingCategoryService();
		campingCategoryVO = new CampingCategoryVO();
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
		String realPath = request.getServletContext().getRealPath("/files/camping");
		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		
		if(action == null || action.equals("/listCamping.do")) {			

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));
			searchMap.put("searchCategoryNo", request.getAttribute("searchCategoryNo"));

			Map<String, Object> campingListMap = campingAdminService.listCamping(searchMap);			
			request.setAttribute("campingListMap", campingListMap);
			
			List<CampingCategoryVO> campingCategoryList = campingCategoryService.listCampingCategory();			
			request.setAttribute("campingCategoryList", campingCategoryList);

			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/campingAdmin/listCamping.jsp";
			
		}else if(action.equals("/readCamping.do")) {

			setPagination(request);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			
			Map<String, Object> campingMap = campingAdminService.readCamping(campingNo);

			campingVO = (CampingVO)campingMap.get("campingVO");
			String campingFileName = campingVO.getCampingFileName();

			if(campingFileName!=null && !campingFileName.equals("")) {
				String campingFileType = getFileType(campingNo, campingFileName);
				campingMap.put("campingFileType", campingFileType);
			}
			
			request.setAttribute("campingMap", campingMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/campingAdmin/readCamping.jsp";
			
		}else if(action.contentEquals("/addCamping.do")) {
			
			List<CampingCategoryVO> campingCategoryList = campingCategoryService.listCampingCategory();			
			request.setAttribute("campingCategoryList", campingCategoryList);
			
			nextPage = "/campingAdmin/addCamping.jsp";
			
		}else if(action.equals("/insertCamping.do")) {
			
			Map<String, String> multipartMap = uploadFile(request);
									
			String campingTitle = multipartMap.get("campingTitle");
			String campingContent = multipartMap.get("campingContent");
			String campingFileName = multipartMap.get("campingFileName");
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			int campingCategoryNo = Integer.parseInt(multipartMap.get("campingCategoryNo"));
			
			campingVO.setCampingTitle(campingTitle);
			campingVO.setCampingContent(campingContent);
			campingVO.setCampingFileName(campingFileName);
			campingVO.setUserId(userId);
			campingVO.setUserName(userName);
			campingVO.setCampingCategoryNo(campingCategoryNo);
			
			int readNo = campingAdminService.insertCamping(campingVO);			

			if(campingFileName!=null) {
				moveFile(readNo, campingFileName);
			}
						
			nextPage = "/campingAdminServlet/readCamping.do?campingNo=" + readNo;
			
		}else if(action.equals("/modifyCamping.do")) {

			setPagination(request);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));

			Map<String, Object> campingMap = campingAdminService.readCamping(campingNo);
			
			campingVO = (CampingVO)campingMap.get("campingVO");
			String campingFileName = campingVO.getCampingFileName();

			if(campingFileName!=null && !campingFileName.equals("")) {
				String campingFileType = getFileType(campingNo, campingFileName);
				campingMap.put("campingFileType", campingFileType);
			}

			request.setAttribute("campingMap", campingMap);
			
			List<CampingCategoryVO> campingCategoryList = campingCategoryService.listCampingCategory();			
			request.setAttribute("campingCategoryList", campingCategoryList);
			
			nextPage = "/campingAdmin/modifyCamping.jsp";
			
		}else if(action.equals("/updateCamping.do")) {

			setPagination(request);
			
			Map<String, String> multipartMap = uploadFile(request);
			
			int campingNo = Integer.parseInt(multipartMap.get("campingNo"));
			String campingTitle = multipartMap.get("campingTitle");
			String campingContent = multipartMap.get("campingContent");
			String campingFileName = multipartMap.get("campingFileName");
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			int campingCategoryNo = Integer.parseInt(multipartMap.get("campingCategoryNo"));
			String deleteFile = multipartMap.get("deleteFile");
			String oldFileName = multipartMap.get("oldFileName");
						
			campingVO.setCampingNo(campingNo);
			campingVO.setCampingTitle(campingTitle);
			campingVO.setCampingContent(campingContent);
			campingVO.setCampingFileName(campingFileName);
			campingVO.setUserId(userId);
			campingVO.setUserName(userName);
			campingVO.setCampingCategoryNo(campingCategoryNo);
			
			int result = campingAdminService.updateCamping(campingVO, deleteFile);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "정상적으로 수정되었습니다.";
				
				if(deleteFile!=null || campingFileName!=null) {
					deleteFile(campingNo, oldFileName);
				}
				if(campingFileName!=null) {
					moveFile(campingNo, campingFileName);
				}
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/campingAdminServlet/readCamping.do?campingNo=" + campingNo;
			
		}else if(action.equals("/deleteCamping.do")) {

			setPagination(request);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			
			int result = campingAdminService.deleteCamping(campingNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";
				
				deleteDirectory(campingNo);
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/campingAdminServlet/listCamping.do";
			
		}else if(action.equals("/replyCamping.do")) {
			
			setPagination(request);
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));

			Map<String, Object> campingMap = campingAdminService.readCamping(campingNo);
			
			request.setAttribute("campingMap", campingMap);
			
			nextPage = "/campingAdmin/replyCamping.jsp";
			
		}else if(action.equals("/insertReplyCamping.do")) {

			setPagination(request);
			
			Map<String, String> multipartMap = uploadFile(request);
			
			int campingNo = Integer.parseInt(multipartMap.get("campingNo"));
			String campingTitle = multipartMap.get("campingTitle");
			String campingContent = multipartMap.get("campingContent");
			String campingFileName = multipartMap.get("campingFileName");
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			int campingRe_ref = Integer.parseInt(multipartMap.get("campingRe_ref"));
			int campingRe_lev = Integer.parseInt(multipartMap.get("campingRe_lev"));
			int campingRe_seq = Integer.parseInt(multipartMap.get("campingRe_seq"));
			int campingCategoryNo = Integer.parseInt(multipartMap.get("campingCategoryNo"));
			
			campingVO.setCampingNo(campingNo);
			campingVO.setCampingTitle(campingTitle);
			campingVO.setCampingContent(campingContent);
			campingVO.setCampingFileName(campingFileName);
			campingVO.setUserId(userId);
			campingVO.setUserName(userName);
			campingVO.setCampingRe_ref(campingRe_ref);
			campingVO.setCampingRe_lev(campingRe_lev);
			campingVO.setCampingRe_seq(campingRe_seq);
			campingVO.setCampingCategoryNo(campingCategoryNo);
			
			int readNo = campingAdminService.insertReplyCamping(campingVO);

			if(campingFileName!=null) {
				moveFile(readNo, campingFileName);
			}
			
			nextPage = "/campingAdminServlet/readCamping.do?campingNo=" + readNo;
			
		}else if(action.equals("/download.do")) {
			
			int campingNo = Integer.parseInt(request.getParameter("campingNo"));
			String fileName = request.getParameter("fileName");			

			downloadFile(response, campingNo, fileName);
		
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
		Map<String, String> campingMap = null;
					
		try {
			campingMap = new HashMap<String, String>();
			
			File repository = new File(realPath);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024*1024*1);
			factory.setRepository(repository);
			ServletFileUpload upload = new ServletFileUpload(factory);
		
			List<FileItem> items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				DiskFileItem fileItem = (DiskFileItem)items.get(i);
				
				if(fileItem.isFormField()) {
					campingMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
					
				}else {
					
					if(fileItem.getSize() > 0) {
						campingMap.put(fileItem.getFieldName(), fileItem.getName());
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
						campingMap.put(fileItem.getFieldName(), null);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("uploadFile()메소드 내부에서 오류 : " + e.toString());
		}
		
		return campingMap;
	}
	
	private void moveFile(int campingNo, String fileName){
		try {
			File srcFile = new File(realPath + "\\temp\\" + fileName);
			File destDir = new File(realPath + "\\" + campingNo);
			Boolean createDestDir = destDir.mkdir();
			
			String filePath = realPath + "\\" + campingNo + "\\" + fileName;
			File file = new File(filePath);
			
			if(!file.exists()) {
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			}	
		} catch (Exception e) {
			System.out.println("moveFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	private void deleteFile(int campingNo, String fileName){
		try {
			String filePath = realPath + "\\" + campingNo + "\\" + fileName;
			File file = new File(filePath);
			
			if(file.exists()) {
				file.delete();
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	private void downloadFile(HttpServletResponse response, int campingNo, String fileName){
		try {			
			String filePath = realPath + "\\" + campingNo + "\\" + fileName;
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
	
	private String getFileType(int campingNo, String fileName){
		String campingFileType = "";

		try {
			String filePath = realPath + "\\" + campingNo + "\\" + fileName;
			File file = new File(filePath);
			
			String mimeType = Files.probeContentType(file.toPath());
			campingFileType = mimeType.split("/")[0];
			
		} catch (Exception e) {
			System.out.println("getFileType()메소드 내부에서 오류 : " + e.toString());
		}
		
		return campingFileType;
	}
	
	private void deleteDirectory(int campingNo){
		try {
			String realDirPath = realPath + "\\" + campingNo;
			File realDir = new File(realDirPath);
			
			if(realDir.exists()) {
				FileUtils.deleteDirectory(realDir);
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
}






















































