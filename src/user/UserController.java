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
@WebServlet("/user.do")
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
		
		//MemberDAO의 listUsers()메소드를 호출하여 요청에 대해 DB로부터 검색한 회원정보를 
		//ArrayList 로 반환 받습니다.
		List usersList = userDAO.listUsers();
		//이 때 request내장객체에 검색한 회원 정보를 userList 속성 이름으로 바인딩 합니다.
		request.setAttribute("usersList", usersList);
		//그 후 RequestDispatcher 클래스를 이용해 회원 목록창(listUsers.jsp 뷰페이지)으로 포워딩
		RequestDispatcher dispatch = request.getRequestDispatcher("/user/listUsers.jsp");
	
	}//doHandle 메소드 
	
	
}//UserController클래스

























