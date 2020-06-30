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
	
	//글에 첨부한 이미지 저장 위치
	private static String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";

	BoardService boardService;
	BoardVO boardVO;
	
	@Override
	public void init() throws ServletException {
		boardService = new BoardService();
		
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
		
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String action = request.getPathInfo();  
		
		System.out.println("action : " + action);
		
		List<BoardVO> boardList = null;
		
		if(action == null || action.equals("/listArticles.do")) {// DB에 전체 글을 조회 하라는 요청이 들어오면
					
			boardList = boardService.listBoard();
			
			//검색한 글정보(응답할 데이터)를  VIEW페이지(listArticles.jsp)로 보내서 출력하기 위해
			//임시로 request저장소에 저장 하여 유지 시킨다
			request.setAttribute("boardList", boardList);
	
			nextPage =  "/board01/listArticles.jsp";	
			
		}else if(action.equals("/articleForm.do")) {//새글을 DB에 추가하기위한 폼페이지 요청
		
			session.setAttribute("userId", "hong"); //임시
			
		 nextPage = "/board01/articleForm.jsp";


		}else if(action.equals("/addArticle.do")) {//글쓰기 요청 주소
			
			 Map<String, String> articleMap = upload(request, response);
			
			//HashMap에 저장된 글관련정보(업로드할 파일명, 입력한 글제목, 입력한 글내용)를 다시 꺼내옵니다.
			String title = articleMap.get("boardTitle");
			String content = articleMap.get("boardContent");
			String imageFileName = articleMap.get("boardImageFileName");

			
			//System.out.println(title);
			//System.out.println(content);
			//System.out.println(imageFileName);
			
			//DB에 새글정보를 추가 하기 위해서 사용자가 입력한 글정보 + 업로드할 파일명을? BoardVO객체의 각변수에 저장
			//boardVO.setBoardRe_ref(0);//추가할 새글의 그룹번호를 0으로 저장
			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);		
			boardVO.setUserId("hong");
			//새글 추가 후 추가시킨 새글에 대한 글번호 얻기 
			int boardNo =boardService.addArticle(boardVO);
			
			//파일을 첨부한 경우에만 수행합니다
			if(imageFileName != null && imageFileName.length() != 0) {
				
				//temp폴더에 임시로 업로드된 파일 객체를 생성 합니다.
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				
				// C:\\board\\article_image의 경로 하위에 글 번호로 폴더를 생성 합니다.
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + boardNo);
				destDir.mkdirs();//글 번호로 폴더를 생성
				
				//temp폴더의 파일을 글번호를 이름으로 하는 폴더로 이동 시킵니다.
				FileUtils.moveFileToDirectory(srcFile, destDir, true);	
			}
			
			//새글 등록 메세지를 나타낸 후 자바스크립트 location객체의 href속성을 이용해 글 목록화면을 요청함
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
			
			Map<String, String> articleMap = upload(request, response);
			
			int boardNo = Integer.parseInt(articleMap.get("boardNo"));
			boardVO.setBoardNo(boardNo);
			String title = articleMap.get("boardTitle");
			String content = articleMap.get("boardContent");
			String imageFileName = articleMap.get("imageFileName");
			
			//boardVO.setBoardRe_ref(0);
			boardVO.setUserId("hong");
			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);
			
			//전송된 글정보를 이용해 글을 수정 합니다.
			boardService.modArticle(boardVO);  
			
			if (imageFileName != null && imageFileName.length() != 0) {
				String originalFileName = articleMap.get("originalFileName");
				
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				
				//수정한 글의 글번호를 이용해 글번호 폴더 생성
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + boardNo);
				destDir.mkdirs();
				
				//수정된 이미지파일을 글번호 폴더로 이동~
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				//전송된 originalFileName을 이용해 기존의 파일을 삭제 합니다.
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + boardNo + "\\" + originalFileName);
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
			//boardNo값에 대한 글을 삭제한 후 
			//삭제된~ 부모 글과 자식 글의boardNo 목록을 검색해서 가져옵니다.
			List<Integer> boardNoList = 
					boardService.removeArticle(boardNo);
			
			//삭제된 글들의 이미지 저장 폴더를 삭제 합니다.
			for(int _boardNo : boardNoList) {
			
				File imgDir = new File(ARTICLE_IMAGE_REPO + "\\" + _boardNo);
				
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
			session.setAttribute("userId", "hong"); //임시
			session.setAttribute("boardRe_ref", boardRe_ref);
			
			nextPage = "/board01/replyForm.jsp";	
			
		}else if(action.equals("/addReply.do")) {
			
			session = request.getSession();
			int boardRe_ref = (Integer)session.getAttribute("boardRe_ref");
					
			//replyForm.jsp답글쓰기 화면에서 입력한 정보들을 Map에 담아 반환받기
			Map<String, String> articleMap = upload(request, response);
			//Map에 저장되어 있는 입력한 정보들을 꺼내오기
			String title = articleMap.get("boardTitle");
			String content = articleMap.get("boardContent");
			String imageFileName = articleMap.get("boardImageFileName");
			
			boardVO.setBoardRe_ref(boardRe_ref);
			
			boardVO.setUserId("hong"); //임시
			boardVO.setBoardTitle(title);
			boardVO.setBoardContent(content);
			boardVO.setBoardImageFileName(imageFileName);
			
			//BoardService객체의 addReply()메소드 호출시 boardVO객체를 인수로 전달하여
			//입력한 답글 정보를 DB에 추가 하는 명령을 함
			//답글 내용을 추가한 후 ~ 답글 글번호를 반환 받는다.
			int boardNo = boardService.addReply(boardVO);
			
			//답글에 첨부한 이미지를 temp폴더에서 답글번호 폴더로 이동합니다
			if(imageFileName != null && imageFileName.length() != 0) {
				
				File srcFile = 
				new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				
				File destDir = 
				new File(ARTICLE_IMAGE_REPO + "\\" + boardNo);
				
				//답글번호 폴더 생성
				destDir.mkdirs();
				
				//temp폴더의 업로드한 이미지를 답글번호 폴더경로로 이동시킨다
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
			}
			//웹브라우저로 응답(출력,내보내기)시 동영상같은 사이즈가 큰파일을 내보낼 출력스트림통로
//			OutputStream out = response.getOutputStream();
			
			//텍스트만~~~~~~내보낼 출력 스트림 통로  -> "답글을 추가 했습니다" 메세지창을 웹브라우저 전송
			PrintWriter pw = response.getWriter();
			pw.print("<script>" + "  alert('답글을 추가했습니다.');" 
					+ " location.href='" + request.getContextPath()
					+ "/board/listArticles.do';" + "</script>");
			return;			
		}
			
		
		if(!nextPage.equals("")) {
		//디스패치 방식으로 포워딩 (재요청)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		}
		
	}//doHandle메소드 끝
	
	//파일 업로드 처리를 위한 메소드
	private Map<String, String> upload(HttpServletRequest request, 
								        HttpServletResponse response) 
								  throws ServletException,IOException{
		
		//해쉬맵 생성
		Map<String, String> articleMap = new HashMap<String, String>();
		
		String encoding="utf-8";
		
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setSizeThreshold(1024*1024*1);
		
		//임시메모리에 파일업로드시~ 지정한 1메가 바이트 크기를 넘길경우
		//업로드될 파일 폴더경로를지정함
		factory.setRepository(currentDirPath);
		
		//파일을 업로드할 메모리를 생성자쪽으로 전달받아 저장한!! 파일업로드를 처리할 객체 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {

			//request객체에 저장되어 있는 업로드할 파일의 정보들을 파싱해서 DiskFileItem객체에 저장후
			//DiskFileItem객체를 ArrayList에 추가합니다.
			//그후 ArrayList를 반환 받습니다.
			List items = upload.parseRequest(request);
			
			//ArrayList크기만큼(DiskFileItem개체의 갯수만큼)반복
			for(int i=0;  i<items.size(); i++) {
				
				//ArrayList가변배열에서 .. DiskFileItem객체(아이템하나정보)를 얻는다.
				DiskFileItem fileItem  = (DiskFileItem)items.get(i);
				
				//DiskFileItem객체(아이템 하나의 정보)가  파일 아이템이 아닐 경우 
				if(fileItem.isFormField()) {
					//articleForm.jsp페이지에서 입력한 글제목, 글내용만 따로  HashMap에 key=value형식으로 저장합니다.
					//HashMap에 저장된 데이터의 예 ->  { title=입력한글제목, content=입력한글내용}
					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
					
//					System.out.println(fileItem.getFieldName());
//					System.out.println(fileItem.getString(encoding));
					
				}else {//DiskFileItem객체(아이템 하나의 정보)가 파일 아이템일 경우
					
//					System.out.println("파라미터명 : " + fileItem.getFieldName());
//					System.out.println("파일명 : " + fileItem.getName());
//					System.out.println("파일크기 : " + fileItem.getSize() + "bytes");
					
					//articleForm.jsp페이지에서 입력한 글제목,글내용,요청할 업로드파일등..모든정보?
					//HashMap에 {key=value}형식으로 저장힙니다.
					//{imageFileName=업로드할파일이름, title=입력한글제목, content=입력한글내용}형식으로 저장함.
					//HashMap에 저장된 데이터의 예 ->>>>> {imageFileName=3.png, title=글제목, content=글내용}
					articleMap.put(fileItem.getFieldName(), fileItem.getName());
					
					//전체 : 업로드할 파일이 존재 하는 경우  업로드할 파일의 파일이름으로 저장소에 업로드합니다.
					//파일크기가 0보다 크다면?(업르도할 파일이 존재한다면)
					if(fileItem.getSize() > 0) {
						
						//업로드할 파일명을 얻어 파일명의 뒤에서부터 \\문자열이 들어 있는지 
						//인덱스 위치를 알려주는데... \\문자열이 없으면 -1을 반환함
						int idx = fileItem.getName().lastIndexOf("\\");
						
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/"); //-1얻기
						}
						//업로드할 파일명 얻기
						String fileName = fileItem.getName().substring(idx + 1);
//						System.out.println("파일명:" + fileName);
						//익스플로러에서 업로드 파일의 경로 제거 후 map에 파일명 저장
						articleMap.put(fileItem.getFieldName(), fileName);  
						//업로드할 파일 경로 + 파일명  주소를 만들어서 저장할 File객체 생성
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						
						//실제 파일 업로드 
						fileItem.write(uploadFile);
						
					}//end if
				}//end if
			}//end for
		}catch (Exception e) {
			System.out.println("upload메소드 내부에서 업로드 오류 : " + e);
		}
		return articleMap; //해쉬맵을? doHandle메소드쪽으로 리턴		
	}	
	
	
}
