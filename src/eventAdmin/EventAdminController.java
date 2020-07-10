package eventAdmin;

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

import event.EventVO;

@SuppressWarnings("serial")
@WebServlet("/eveAdm/*")
public class EventAdminController extends HttpServlet {
	
	EventAdminService eveAdminService;
	EventVO eventVO;
	String realPath = "";

	@Override
	public void init() throws ServletException {
		eveAdminService = new EventAdminService();
		eventVO = new EventVO();
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
		realPath = request.getServletContext().getRealPath("/files/event");
		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		
		if(action == null || action.equals("/listEvent.do")) {			

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));

			Map<String, Object> eventListMap = eveAdminService.listEvent(searchMap);			
			request.setAttribute("eventListMap", eventListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/eveAdmin/listEvent.jsp";
			
		}else if(action.equals("/readEvent.do")) {

			setPagination(request);
			
			int eventNo = Integer.parseInt(request.getParameter("eventNo"));
			
			Map<String, Object> eventMap = eveAdminService.readEvent(eventNo);

			eventVO = (EventVO)eventMap.get("eventVO");
			String eventFileName = eventVO.getEventImageFileName();

			if(eventFileName!=null && !eventFileName.equals("")) {
				String eventFileType = getFileType(eventNo, eventFileName);
				eventMap.put("eventFileType", eventFileType);
			}
			
			request.setAttribute("eventMap", eventMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/eveAdmin/readEvent.jsp";
			
		}else if(action.contentEquals("/addEvent.do")) {
						
			nextPage = "/eveAdmin/addEvent.jsp";
			
		}else if(action.equals("/insertEvent.do")) {
			
			Map<String, String> multipartMap = uploadFile(request);
									
			String eventTitle = multipartMap.get("eventTitle");
			String eventContent = multipartMap.get("eventContent");
			String eventFileName = multipartMap.get("eventFileName");
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			
//			eventVO.setEventTitle(eventTitle);
//			eventVO.setEventContent(eventContent);
//			eventVO.eventImageFileName(eventFileName);
//			eventVO.setUserId(userId);
//			eventVO.setUserName(userName);
//			eventVO.setEventCategoryNo(eventCategoryNo);
			
			int readNo = eveAdminService.insertEvent(eventVO);			

			if(eventFileName!=null) {
				moveFile(readNo, eventFileName);
			}
						
			nextPage = "/eveAdm/readEvent.do?eventNo=" + readNo;
			
		}else if(action.equals("/modifyEvent.do")) {

			setPagination(request);
			
			int eventNo = Integer.parseInt(request.getParameter("eventNo"));

			Map<String, Object> eventMap = eveAdminService.readEvent(eventNo);
			
			eventVO = (EventVO)eventMap.get("eventVO");
			String eventFileName = eventVO.getEventImageFileName();

			if(eventFileName!=null && !eventFileName.equals("")) {
				String eventFileType = getFileType(eventNo, eventFileName);
				eventMap.put("eventFileType", eventFileType);
			}

			request.setAttribute("eventMap", eventMap);
						
			nextPage = "/eveAdmin/modifyEvent.jsp";
			
		}else if(action.equals("/updateEvent.do")) {

			setPagination(request);
			
			Map<String, String> multipartMap = uploadFile(request);
			
			int eventNo = Integer.parseInt(multipartMap.get("eventNo"));
			String eventTitle = multipartMap.get("eventTitle");
			String eventContent = multipartMap.get("eventContent");
			String eventFileName = multipartMap.get("eventFileName");
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			int eventCategoryNo = Integer.parseInt(multipartMap.get("eventCategoryNo"));
			String deleteFile = multipartMap.get("deleteFile");
			String oldFileName = multipartMap.get("oldFileName");
						
//			eventVO.setEventNo(eventNo);
//			eventVO.setEventTitle(eventTitle);
//			eventVO.setEventContent(eventContent);
//			eventVO.setEventImageFileName(eventFileName);
//			eventVO.setUserId(userId);
//			eventVO.setUserName(userName);
//			eventVO.setEventCategoryNo(eventCategoryNo);
			
			int result = eveAdminService.updateEvent(eventVO, deleteFile);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "정상적으로 수정되었습니다.";
				
				if(deleteFile!=null || eventFileName!=null) {
					deleteFile(eventNo, oldFileName);
				}
				if(eventFileName!=null) {
					moveFile(eventNo, eventFileName);
				}
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/eveAdm/readEvent.do?eventNo=" + eventNo;
			
		}else if(action.equals("/deleteEvent.do")) {

			setPagination(request);
			
			int eventNo = Integer.parseInt(request.getParameter("eventNo"));
			
			int result = eveAdminService.deleteEvent(eventNo);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";
				
				deleteDirectory(eventNo);
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/eveAdm/listEvent.do";
			
		}else if(action.equals("/replyEvent.do")) {
			
			setPagination(request);
			
			int eventNo = Integer.parseInt(request.getParameter("eventNo"));

			Map<String, Object> eventMap = eveAdminService.readEvent(eventNo);
			
			request.setAttribute("eventMap", eventMap);
			
			nextPage = "/eveAdmin/replyEvent.jsp";
			
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
			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	private Map<String, String> uploadFile(HttpServletRequest request){
		Map<String, String> eventMap = null;
					
		try {
			eventMap = new HashMap<String, String>();
			
			File repository = new File(realPath);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024*1024*1);
			factory.setRepository(repository);
			ServletFileUpload upload = new ServletFileUpload(factory);
		
			List<FileItem> items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				DiskFileItem fileItem = (DiskFileItem)items.get(i);
				
				if(fileItem.isFormField()) {
					eventMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
					
				}else {
					
					if(fileItem.getSize() > 0) {
						eventMap.put(fileItem.getFieldName(), fileItem.getName());
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
						eventMap.put(fileItem.getFieldName(), null);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("uploadFile()메소드 내부에서 오류 : " + e.toString());
		}
		
		return eventMap;
	}
	
	private void moveFile(int eventNo, String fileName){
		try {
			File srcFile = new File(realPath + "\\temp\\" + fileName);
			File destDir = new File(realPath + "\\" + eventNo);
			Boolean createDestDir = destDir.mkdir();
			
			String filePath = realPath + "\\" + eventNo + "\\" + fileName;
			File file = new File(filePath);
			
			if(!file.exists()) {
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			}	
		} catch (Exception e) {
			System.out.println("moveFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	private void deleteFile(int eventNo, String fileName){
		try {
			String filePath = realPath + "\\" + eventNo + "\\" + fileName;
			File file = new File(filePath);
			
			if(file.exists()) {
				file.delete();
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
	
	private String getFileType(int eventNo, String fileName){
		String eventFileType = "";

		try {
			String filePath = realPath + "\\" + eventNo + "\\" + fileName;
			File file = new File(filePath);
			
			String mimeType = Files.probeContentType(file.toPath());
			eventFileType = mimeType.split("/")[0];
			
		} catch (Exception e) {
			System.out.println("getFileType()메소드 내부에서 오류 : " + e.toString());
		}
		
		return eventFileType;
	}
	
	private void deleteDirectory(int eventNo){
		try {
			String realDirPath = realPath + "\\" + eventNo;
			File realDir = new File(realDirPath);
			
			if(realDir.exists()) {
				FileUtils.deleteDirectory(realDir);
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
}






















































