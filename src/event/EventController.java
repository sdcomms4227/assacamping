package event;

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

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;


@SuppressWarnings("serial")
@WebServlet("/eventServlet/*")
public class EventController extends HttpServlet {

	String realPath;

	EventService eventService;
	EventVO eventVO;
	
	@Override
	public void init() throws ServletException {
		eventService = new EventService();
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
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		EventVO eventVO = new EventVO();

		realPath = request.getServletContext().getRealPath("/files/event");
		
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
				
		String action = request.getPathInfo();  
		
		System.out.println("action : " + action);
				
		if(action == null || action.equals("/listEvent.do")) {// DB에 전체 글을 조회 			
			String _search = request.getParameter("search");			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");			
			
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));
			String search = (_search == null) ? "" : _search;
			
			Map<String, Object> pagingMap = new HashMap<String, Object>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			pagingMap.put("search", search);
					
			Map<String, Object> eventMap = eventService.listEvent(pagingMap);
			
			eventMap.put("section", section);
			eventMap.put("pageNum", pageNum);
			eventMap.put("search", search);
			
			request.setAttribute("eventMap", eventMap);
			nextPage =  "/event/listEvent.jsp";	
			
		}else if(action.equals("/eventForm.do")) {//새글을 DB에 추가하기위한 폼페이지 요청
		
			session.setAttribute("userId", "admin"); //임시		
			nextPage = "/event/eventForm.jsp";

		}else if(action.equals("/addEvent.do")) {//글쓰기 요청 
			
			 Map<String, String> eventMap = upload(request, response);
		
			String title = eventMap.get("eventTitle");
			String content =eventMap.get("eventContent");
			String imageFileName = eventMap.get("eventImageFileName");

			eventVO.setEventTitle(title);
			eventVO.setEventContent(content);
			eventVO.setEventImageFileName(imageFileName);
		
			int eventNo =eventService.addEvent(eventVO);
			
			if(imageFileName != null && imageFileName.length() != 0) {
				
				File srcFile = new File(realPath + "\\" + "temp" + "\\" + imageFileName);				
				File destDir = new File(realPath + "\\" + eventNo);
				destDir.mkdirs();			
				FileUtils.moveFileToDirectory(srcFile, destDir, true);	
			  }
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("window.alert('새글을 추가 했습니다.');");
			out.print(" location.href='" + request.getContextPath() +"/eventServlet/listEvent.do';");
			out.print("</script>");				
			return;
			

		}else if(action.equals("/readEvent.do")) {

			EventDAO eventDAO = new EventDAO();			
			String eventNo = request.getParameter("eventNo");			
			eventVO = eventService.viewEvent(Integer.parseInt(eventNo));					
			eventDAO.updateReadCount(Integer.parseInt(eventNo));  			
			request.setAttribute("event", eventVO);	
			
			// comment 위해 추가
			session.setAttribute("eventNo", eventNo);
			
			nextPage ="/event/readEvent.jsp"; 
										
		}else if (action.equals("/modEvent.do")) { //글 수정요청시 수정폼으로
			
			String eventNo = request.getParameter("eventNo");
			eventVO = eventService.viewEvent(Integer.parseInt(eventNo));			
			request.setAttribute("event", eventVO);				
			nextPage = "/event/modEvent.jsp";
		
		}else if (action.equals("/updateEvent.do")) { //글 수정
			
			Map<String, String> eventMap = upload(request, response);
			
			int eventNo = Integer.parseInt(eventMap.get("eventNo"));
			eventVO.setEventNo(eventNo);
			String title = eventMap.get("eventTitle");
			String content = eventMap.get("eventContent");
			String imageFileName = eventMap.get("imageFileName");
			
			eventVO.setEventTitle(title);
			eventVO.setEventContent(content);
			eventVO.setEventImageFileName(imageFileName);			
			eventService.modEvent(eventVO);  
			
			if (imageFileName != null && imageFileName.length() != 0) {
				String originalFileName = eventMap.get("originalFileName");
				
				File srcFile = new File(realPath + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(realPath + "\\" + eventNo);
				destDir.mkdirs();			
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				File oldFile = new File(realPath + "\\" + eventNo + "\\" + originalFileName);
				oldFile.delete();
			}
			PrintWriter pw = response.getWriter();
			pw.print("<script>" 
					+ "  alert('글을 수정했습니다.');" 
					+ " location.href='" + request.getContextPath()
					+ "/eventServlet/readEvent.do?eventNo=" + eventNo + "';" 
					+ "</script>");
			return;
			

		}else if(action.equals("/delEvent.do")) {//삭제 요청이 들어 왔을때

			int eventNo = Integer.parseInt(request.getParameter("eventNo"));
			List<Integer> eventNoList = 
					eventService.removeEvent(eventNo);
			
			for(int _eventNo : eventNoList) {
				File imgDir = new File(realPath + "\\" + _eventNo);
				
				 if(imgDir.exists()) {					 
					 FileUtils.deleteDirectory(imgDir);
				 }			
			}
			
			PrintWriter pw = response.getWriter();	
			pw.print("<script>" 
					+ " alert('글을 삭제 했습니다.');" 
					+ " location.href='"
					+ request.getContextPath() +"/eventServlet/listEvent.do';"
					+ "</script>");
			return;
		}

		if(!nextPage.equals("")) {
			
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		}
		
	}//doHandle메소드 끝
	
	//파일 업로드 처리를 위한 메소드
	private Map<String, String> upload(HttpServletRequest request, 
								        HttpServletResponse response) 
								  throws ServletException,IOException{
		
		Map<String, String> eventMap = new HashMap<String, String>();
		
		String encoding="utf-8";		
		File currentDirPath = new File(realPath);		
		DiskFileItemFactory factory = new DiskFileItemFactory();		
		factory.setSizeThreshold(1024*1024*1);		
		factory.setRepository(currentDirPath);		
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			List items = upload.parseRequest(request);
			
			for(int i=0;  i<items.size(); i++) {
				
				DiskFileItem fileItem  = (DiskFileItem)items.get(i);

				if(fileItem.isFormField()) {
					eventMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					
				}else {
					
					eventMap.put(fileItem.getFieldName(), fileItem.getName());
					
					if(fileItem.getSize() > 0) {						

						int idx = fileItem.getName().lastIndexOf("\\");
	
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/"); //-1얻기
						}

						String fileName = fileItem.getName().substring(idx + 1);
						eventMap.put(fileItem.getFieldName(), fileName);  
						String tempDirPath = realPath + "\\temp";
						File tempDir = new File(tempDirPath);
						
						if(!tempDir.exists()) {
							tempDir.mkdir();
						}						
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						fileItem.write(uploadFile);						
					}
				}
			}
		}catch (Exception e) {
			System.out.println("upload메소드 내부에서 업로드 오류 : " + e);
		}
		return eventMap;
	}	
	
	
}
