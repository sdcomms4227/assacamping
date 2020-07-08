package user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userCon/*")
public class UserController extends HttpServlet{
  
	UserDAO userDAO;
	
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
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAO();
		String action = request.getPathInfo();
		String nextPage = null;
		System.out.println(action);
		if(action == null || action.equals("/listUsers.do")) {
			String userId=request.getParameter("userId");
			List<UserVO> usersList = userDAO.listUsers();
			request.setAttribute("usersList", usersList);
			session.setAttribute("userId", userId);
			
			nextPage = "/index.jsp";

		}else if(action.equals("/addUser.do")) {
			
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			String userName = request.getParameter("userName");
			String userPhone = request.getParameter("userPhone");
			String userEmail = request.getParameter("userEmail");
			String userZipcode = request.getParameter("userZipcode");
			String userAddress1 = request.getParameter("userAddress1");
			String userAddress2 = request.getParameter("userAddress2");
			
			UserVO userVO = new UserVO(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, null, 1);
			userDAO.addUser(userVO);
			request.setAttribute("msg", "addUser");
			nextPage = "/userCon/listUsers.do";
			
		}else if(action.equals("/userForm.do")) {
			
			nextPage = "/user/userForm.jsp";
		
		}else if(action.equals("/modUserForm.do")){
			
			String userId = request.getParameter("userId");
			UserVO userInfo = userDAO.findUser(userId);
			request.setAttribute("userInfo", userInfo);
			nextPage = "/user/modUserForm.jsp";
			
			}else if(action.equals("/modUser.do")) {
				
				UserVO userVO = new UserVO(request.getParameter("userId"),
											request.getParameter("userPw"),
											request.getParameter("userName"),
											request.getParameter("userPhone"),
											request.getParameter("userEmail"),
											request.getParameter("userZipcode"),
											request.getParameter("userAddress1"),
											request.getParameter("userAddress2"), null, 1);

				userDAO.modUser(userVO); 
				request.setAttribute("msg", "modified");
				nextPage = "/userCon/listUsers.do";
			
			}else if(action.equals("/delUser.do")) {
			
				String userId = request.getParameter("userId");    
				userDAO.delUser(userId);    
				request.setAttribute("msg", "deleted");
				nextPage = "/userCon/listUsers.do";
			
			}else if(action.equals("/login.do")) {
				
				nextPage = "/user/login.jsp";
			
			}else if(action.equals("/loginAction.do")) {
				
				String userId = request.getParameter("userId");
				String userPw = request.getParameter("userPw");
				
				System.out.println(userId+userPw);
				int check = userDAO.login(userId,userPw);
				
				//20200708 추가
				String userName = userDAO.getUserName(userId);
				
				String msg ="";
				if(check==0) {
					//msg="존재하지 않는 ID입니다.";
					request.setAttribute("msg", "id");
					nextPage = "/user/login.jsp";
				}else if(check==1) {
					msg="비밀번호가 틀렸습니다.";
					nextPage = "/user/login.jsp";
				}else {
					session.setAttribute("userId", userId);
					session.setAttribute("userName", userName);
					
					nextPage = "/userCon/listUsers.do";
					
				}
				request.setAttribute("msg",	msg);
				
			}else if(action.equals("/logout.do")) {
				session.invalidate();
				request.setAttribute("msg", "logout");
				nextPage = "/userCon/listUsers.do";
			}

		RequestDispatcher  dispatch = 
		request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
		
	}//doHandle 메소드 
	
	
}//UserController클래스

























