package board;

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


@WebServlet("/board/*")
public class BoardController extends HttpServlet {

	String realPath = "";

	BoardService boardService;
	BoardVO boardVO;
	
	@Override
	public void init() throws ServletException {
		boardService = new BoardService();
		boardVO = new BoardVO();
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
		
		BoardVO boardVO = new BoardVO();

		realPath = request.getServletContext().getRealPath("/files/event");
		
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		
		String action = request.getPathInfo();  
		
		System.out.println("action : " + action);
		
		List<BoardVO> boardList = null;
		
		if(action == null || action.equals("/listArticles.do")) {// DB에 전체 글을 조회 
			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");			
			
			int section = Integer.parseInt(((_section == null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum == null) ? "1" : _pageNum));

			Map pagingMap = new HashMap();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			
			Map boardMap = boardService.listBoard(pagingMap);
			
			boardMap.put("section", section);
			boardMap.put("pageNum", pageNum);
			
			request.setAttribute("boardMap", boardMap);
			
			session.setAttribute("userId", "admin"); //임시
	
			nextPage =  "/board01/listArticles.jsp";	
			
		}else if(action.equals("/articleForm.do")) {//새글을 DB에 추가하기위한 폼페이지 요청
		
			session.setAttribute("userId", "admin"); //임시
			
		 nextPage = "/board01/articleForm.jsp";


		}else if(action.equals("/addArticle.do")) {//글쓰기 요청 주소
			
			 Map<String, String> boardMap = upload(request, response);
			
		
			String title = boardMap.get("boardTitle");
			String content =boardMap.get("boardContent");
			String imageFileName = boardMap.get("boardImageFileName");


			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);		
			boardVO.setUserId("admin");
			//새글 추가 후 추가시킨 새글에 대한 글번호 얻기 
			int boardNo =boardService.addArticle(boardVO);
			
			//파일을 첨부한 경우
			if(imageFileName != null && imageFileName.length() != 0) {
				
				//temp폴더에 임시로 업로드된 파일 객체를 생성 합니다.
				File srcFile = new File(realPath + "\\" + "temp" + "\\" + imageFileName);
				
				File destDir = new File(realPath + "\\" + boardNo);
				destDir.mkdirs();//글 번호로 폴더를 생성
				
				FileUtils.moveFileToDirectory(srcFile, destDir, true);	
			}
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("window.alert('새글을 추가 했습니다.');");
			out.print(" location.href='" + request.getContextPath() +"/board/listArticles.do';");
			out.print("</script>");
				
			return;
		}else if(action.equals("/viewArticle.do")) {
			BoardDAO boardDAO = new BoardDAO();
			
			String boardNo = request.getParameter("boardNo");
			
			boardVO = boardService.viewArticle(Integer.parseInt(boardNo));		
			
			boardDAO.updateReadCount(Integer.parseInt(boardNo));  
			
			request.setAttribute("board", boardVO);
			
			nextPage ="/board01/viewArticle.jsp"; 
					
		}else if (action.equals("/modArticle.do")) {
			
			Map<String, String> boardMap = upload(request, response);
			
			int boardNo = Integer.parseInt(boardMap.get("boardNo"));
			boardVO.setBoardNo(boardNo);
			String title = boardMap.get("boardTitle");
			String content = boardMap.get("boardContent");
			String imageFileName = boardMap.get("imageFileName");
			
			boardVO.setUserId("admin");
			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);
			
			//전송된 글정보를 이용해 글을 수정
			boardService.modArticle(boardVO);  
			
			if (imageFileName != null && imageFileName.length() != 0) {
				String originalFileName = boardMap.get("originalFileName");
				
				File srcFile = new File(realPath + "\\" + "temp" + "\\" + imageFileName);
				
				//수정한 글의 글번호를 이용해 글번호 폴더 생성
				File destDir = new File(realPath + "\\" + boardNo);
				destDir.mkdirs();
				
				//수정된 이미지파일을 글번호 폴더로 이동
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				//전송된 originalFileName을 이용해 기존의 파일 삭제
				File oldFile = new File(realPath + "\\" + boardNo + "\\" + originalFileName);
				oldFile.delete();
			}
			PrintWriter pw = response.getWriter();
			pw.print("<script>" 
					+ "  alert('글을 수정했습니다.');" 
					+ " location.href='" + request.getContextPath()
					+ "/board/viewArticle.do?boardNo=" + boardNo + "';" 
					+ "</script>");
			return;
			
		}else if(action.equals("/removeArticle.do")) {//삭제 요청이 들어 왔을때
			//삭제할 글번호 얻기 (요청한 값 얻기)
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			List<Integer> boardNoList = 
					boardService.removeArticle(boardNo);
			
			//삭제된 글들의 이미지 저장 폴더삭제
			for(int _boardNo : boardNoList) {
			
				File imgDir = new File(realPath + "\\" + _boardNo);
				
				 if(imgDir.exists()) {
					 
					 FileUtils.deleteDirectory(imgDir);
				 }			
			}
			
			PrintWriter pw = response.getWriter();	
			pw.print("<script>" 
					+ " alert('글을 삭제 했습니다.');" 
					+ " location.href='"
					+ request.getContextPath() +"/board/listArticles.do';"
					+ "</script>");
			return;
		
		}else if(action.equals("/replyForm.do")) {
			
			System.out.println("리플라이폼" + request.getParameter("boardRe_ref"));
			
			int boardRe_ref = Integer.parseInt(request.getParameter("boardRe_ref"));
			session = request.getSession();
			session.setAttribute("userId", "admin"); //임시
			session.setAttribute("boardRe_ref", boardRe_ref);
			
			nextPage = "/board01/replyForm.jsp";	
			
		}else if(action.equals("/addReply.do")) {
			
			session = request.getSession();
			int boardRe_ref = (Integer)session.getAttribute("boardRe_ref");
					
			Map<String, String> boardMap= upload(request, response);

			String title = boardMap.get("boardTitle");
			String content = boardMap.get("boardContent");
			String imageFileName = boardMap.get("boardImageFileName");
			
			boardVO.setBoardRe_ref(boardRe_ref);
			
			boardVO.setUserId("admin"); //임시
			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);
			
			int boardNo = boardService.addReply(boardVO);
			
			if(imageFileName != null && imageFileName.length() != 0) {
				
				File srcFile = 
				new File(realPath + "\\" + "temp" + "\\" + imageFileName);
				
				File destDir = 
				new File(realPath + "\\" + boardNo);

				destDir.mkdirs();

				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
			}

			PrintWriter pw = response.getWriter();
			pw.print("<script>" + "  alert('답글을 추가했습니다.');" 
					+ " location.href='" + request.getContextPath()
					+ "/board/listArticles.do';" + "</script>");
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
		
		Map<String, String> boardMap = new HashMap<String, String>();
		
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

					boardMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					
				}else {//DiskFileItem객체(아이템 하나의 정보)가 파일 아이템일 경우
					
					boardMap.put(fileItem.getFieldName(), fileItem.getName());
					
					if(fileItem.getSize() > 0) {						

						int idx = fileItem.getName().lastIndexOf("\\");
						
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/"); //-1얻기
						}

						String fileName = fileItem.getName().substring(idx + 1);
						boardMap.put(fileItem.getFieldName(), fileName);  
						String tempDirPath = realPath + "\\temp";
						File tempDir = new File(tempDirPath);
						
						if(!tempDir.exists()) {
							tempDir.mkdir();
						}						
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
 
						fileItem.write(uploadFile);
						
					}//end if
				}//end if
			}//end for
		}catch (Exception e) {
			System.out.println("upload메소드 내부에서 업로드 오류 : " + e);
		}
		return boardMap;
	}	
	
	
}
