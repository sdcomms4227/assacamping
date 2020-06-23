package user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//클라이언트가 웨브라우저를 열어 주소창에 요청하는 주소
//1. DB가 저장되어 있는 모든 회원정보를 조회 해줘~
// http://localhost:8090/assacamping/user/listUsers.do로 요청

//2. 회원가입 디자인 페이지로 이동
//<a href = "/assacamping/user/userForm.do">
//http://localhost:8090/assacamping/user/userForm.do

//userForm.jsp에서 가입할 회원정보를 입력 한 후 DB에 INSERT 요청
//http://localhost:8090/assacamping/user/addUser.do

@WebServlet("/user/*")
public class UserController extends HttpServlet{
  
	UserDAO userDAO;
	
	//init()메소드에서 UserDAO 객체를 초기화 함
	public void init() throws ServletException{
		userDAO = new UserDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
			doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
			doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//requst객체의 getPathInfo()메소드를 호출하여 클라이언트가 요청한 주소URL정보를 얻는다.
		String action = request.getPathInfo();
		System.out.println(action); //     /listUsers.co
												//    /userForm.do <--회원가입 작성페이지 이동 요청주소
												 //    /addUser.do <-- DB에 입력한 회원정보 추가 요청 주소 
												 //	    /listUsers.do  <--- 모든 회원정보 조회 요청주소
												 //    /modUserForm.do <---회원정보 수정을 위해 먼저 ID에 해당하는 회원을 조회후 보여줘~라는 요청주소
												//    /modUser.do <-- 회원정보 수정 요청주소
												//   /delUser.do <---회원정보 삭제 요청 주소 
	
		String nextPage = null; // <--뷰 경로를 저장할 변수 
		
		//action 변수의 값에 따라 if문을 분기해서 요청한 작업을 수행 하는데..
		
		//만약 action 변수의 값이 null이거나 /listUsers.do 인경우에 
		//모든 회원정보 조회 요청이 드어 왔을 때를 말함.
		if(action == null || action.equals("/listUsers.do")) {
			List<UserVO> usersList = userDAO.listUsers();
			
			//View(listUsers.jsp)페이지로 응답할 데이터(검색한 회원정보들 ArrayList)를 전달하여 
			//출력(응답)해야하는데.. 그러기 위해서 임시로 저장할 공간은 request객체 메모리 영역이므로 
			//request객체에 ArrayList를 저장함.
			request.setAttribute("usersList", usersList);
			
			//검색한 회원 정보들(ArrayList)의 데이터들을 보여줄 VIEW주소 설정
			nextPage = "/user/listUsers.jsp";
			//DB에 입력한 회원정보를 추가 요청
		}else if(action.equals("/addUsers.do")) {
			
			//요청한 값 얻기 ( 입력한 회원 정보들 얻기)
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			String userName = request.getParameter("userName");
			String userPhone = request.getParameter("userPhone");
			String userEmail = request.getParameter("userEmail");
			String userZipcode = request.getParameter("userZipcode");
			String userAddress1 = request.getParameter("userAddress1");
			String userAddress2 = request.getParameter("userAddress2");
			
			UserVO userVO = new UserVO(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, null, 0);
			
			
			//요청한 회원정보를 DB의 테이블에 insert하기 위한 메소드 호출
			userDAO.addUser(userVO);
			
			//회원추가에 성공..성공 헤세지를 request에 저장
			request.setAttribute("msg", "addUser");
			
			//DB에 회원 등록 후 다시 모든 회원정보를 검색요청(UserController)을 위한 요청 주소를 저장
			nextPage = "/user/listUsers.do";
			
			//회원가입 입력화면 디자인 페이지
		}else if(action.equals("/userForm.do")) {
			
			//회원가입창 화면 VIEW페이지 주소 설정
			nextPage = "/user/userForm.jsp";
		}else if(action.equals("/modUserForm.do")){
			
			String userId = request.getParameter("userId");//수정할 회원id얻기
			
			//회원정보 수정창을 요청하면서 전송된 ID를 이용해 수정 전 회원정보를 검핵해 옵니다.
			UserVO userInfo = userDAO.findUser(userId);
			
			//request에 바인딩하여 회원정보 수정창에 수정하기 전의 회원정보를 전달 합니다.
			request.setAttribute("userInfo", userInfo);
			
			//회원정보 수정창 페이지로 포워딩 하기 위한 URL 지정
			nextPage = "/user/modUserForm.jsp";
			
			//회원정보수정창(modUserForm.jsp)에서 회원수정 정보를 입력 후 수정하기 버튼을 클릭 했을 때..
			//http://localhost:8090/assacamping/modUser.do 주소로 
			//DB테이블의 데이터 수정 요청이 들어오면..
			}else if(action.equals("/modUser.do")) {
				//회원정보 수정창에서 수정 시 입력한 정보를 가져온 후 
				//수정할 회원정보를 UserVO객체의 각 변수에 저장
				UserVO userVO = new UserVO(request.getParameter("userId"),
															request.getParameter("userPw"),
															request.getParameter("userName"),
															request.getParameter("userPhone"),
															request.getParameter("userEmail"),
															request.getParameter("userZipcode"),
															request.getParameter("userAddress1"),
															request.getParameter("userAddress2"), null, 0);
				
				//DB의 회원 테이블의 데이터 수정 명령
				userDAO.modUser(userVO); //update구문 만들기 위해 전달
				
				//회원정보 수정 후 회원목록창(listMembers.jsp)으로 수정작업 완료 메세지를 전달하기 위해
				//request내장객체 영역에 완료 메세지를 저장(바인딩)함
				request.setAttribute("msg", "modified");
				
				//수정후 DB로부터 모든 회원정보를 검색하여 다시 회원목록창(listUsers.jsp)으로 이동하기 위해
				//DB로부터 모든 회원정보를 검색하는 요청주소를 nextPage변수에 저장
				nextPage = "user/listUsers.do";
			//삭제할 회원 ID를 SQL문으로 전달해 t_member테이블의 회원정보 삭제 요청이 들어 왔을 때...
			}else if(action.equals("/deluser.do")) {
				//삭제할 회원 ID얻기
				String userId = request.getParameter("userId");    
				
				//삭제할 회원 ID를 전달하여 DB에 저장된 회원정보 삭제
				userDAO.delUser(userId);    
				
				//삭제 후 listUser.jsp로 삭제작업 완료 메세지를 전달 하기 위해 
				//응답할 메세지를 request에 저장
				request.setAttribute("msg", "deleted");
				//삭제 후 모든 회원을 다시 검색하기 위한 주소를 저장
				nextPage = "/user/listUsers.do";
			}
		//디스패치 방식으로 포워딩(재요청해서이동) (view로)
		RequestDispatcher  dispatch = 
				request.getRequestDispatcher(nextPage);
		//실제 포워딩
		dispatch.forward(request, response);
		
		
	}//doHandle 메소드 
	
	
}//UserController클래스

























