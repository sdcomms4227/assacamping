package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.CartService;

@SuppressWarnings("serial")
@WebServlet("/userServlet/*")
public class UserController extends HttpServlet {

	UserDAO userDAO;

	public void init() throws ServletException {
		userDAO = new UserDAO();
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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		HttpSession session = request.getSession();

		String action = request.getPathInfo();
		System.out.println("action: " + action);

		String nextPage = null;
		if (action == null) {
			
			nextPage = "/";
			
		} else if (action.equals("/agreeForm.do")) {
			
			nextPage = "/user/agreeForm.jsp";
			
		} else if (action.equals("/userForm.do")) {
			
			nextPage = "/user/userForm.jsp";
			
		} else if (action.equals("/addUser.do")) {

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
			nextPage = "/user/login.jsp";
			
		} else if (action.equals("/modUserForm.do")) {

			String userId = request.getParameter("userId");
			UserVO userInfo = userDAO.findUser(userId);
			request.setAttribute("userInfo", userInfo);
			nextPage = "/user/modUserForm.jsp";

		} else if (action.equals("/modUser.do")) {

			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			String userName = request.getParameter("userName");
			String userPhone = request.getParameter("userPhone");
			String userEmail = request.getParameter("userEmail");
			String userZipcode = request.getParameter("userZipcode");
			String userAddress1 = request.getParameter("userAddress1");
			String userAddress2 = request.getParameter("userAddress2");

			UserVO userVO = new UserVO(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, null, 1);
			userDAO.modUser(userVO);
			request.setAttribute("msg", "modified");
			nextPage = "/";

		} else if (action.equals("/delUser.do")) {

			String userId = request.getParameter("userId");
			userDAO.delUser(userId);
			request.setAttribute("msg", "deleted");
			nextPage = "/userServlet/listUsers.do";

		} else if (action.equals("/login.do")) {

			nextPage = "/user/login.jsp";

		} else if (action.equals("/loginAction.do")) {

			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			int check = userDAO.login(userId, userPw);
			String userName = userDAO.getUserName(userId);

			String msg = "";
			int cartCount = 0;

			if (check == 0) {
				request.setAttribute("msg", "id");
				nextPage = "/user/login.jsp";
			} else if (check == 1) {
				request.setAttribute("msg", "pw");
				nextPage = "/user/login.jsp";
			} else {
				session.setAttribute("userId", userId);
				session.setAttribute("userName", userName);

				CartService cartService = new CartService();
				cartCount = cartService.cartTotalCount(userId);
				session.setAttribute("cartCount", cartCount);

//					WishService wishListService = new WishService();
//					wishCount = wishListService.wishTotalCount(userId);
				session.setAttribute("wishCount", 0);
				nextPage = "/";
			}

		} else if (action.equals("/logout.do")) {
			
			session.invalidate();
			request.setAttribute("msg", "logout");
			nextPage = "/";
			
		} else if (action.equals("/idCheck.do")) {
			
			String userId = request.getParameter("userId");
			request.setAttribute("userId", userId);

			int check = userDAO.idCheck(userId);
			if (userId.length() < 4 || userId.length() > 12) {
				request.setAttribute("msg", "char");
			} else if (check == 1) {
				request.setAttribute("msg", "used");
			} else {
				request.setAttribute("msg", "allow");
			}
			nextPage = "/user/idCheck.jsp";
			
		} else if (action.equals("/findId.do")) {
			
			nextPage = "/user/findId.jsp";
			
		} else if (action.equals("/findIdAction.do")) {
			
			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String userId = userDAO.findId(userName, userEmail);
			
			if (userId == null || userId.equals("")) {
				request.setAttribute("msg", "userId");
				nextPage = "/user/findId.jsp";
			} else {
				request.setAttribute("userId", userId);
				nextPage = "/user/findId.jsp";
			}
			
		} else if (action.equals("/withdrawal.do")) {
			
			String userId = request.getParameter("userId");
			UserVO userInfo = userDAO.findUser(userId);
			request.setAttribute("userInfo", userInfo);
			nextPage = "/user/withdrawalForm.jsp";
			
		} else if (action.equals("/withdrawalAction.do")) {
			
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			int check = userDAO.withdrawlUser(userId, userPw);
			if (check == 1) {
				request.setAttribute("msg", "complete");
				session.invalidate();
				nextPage = "/";
			} else {
				userId = request.getParameter("userId");
				UserVO userInfo = userDAO.findUser(userId);
				request.setAttribute("userInfo", userInfo);
				request.setAttribute("msg", "fail");
				nextPage = "/user/withdrawalForm.jsp";
			}
			
		} else if (action.equals("/userPwCheck.do")) {
			
			String userId = request.getParameter("userId");
			UserVO userInfo = userDAO.findUser(userId);
			request.setAttribute("userInfo", userInfo);
			nextPage = "/user/userPwCheckForm.jsp";
			
		} else if (action.equals("/userPwCheckAction.do")) {
			
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			int check = userDAO.checkAction(userId, userPw);
			
			if (check == 1) {
				UserVO userInfo = userDAO.findUser(userId);
				request.setAttribute("userInfo", userInfo);
				nextPage = "/user/modUserForm.jsp";
			} else {
				userId = request.getParameter("userId");
				UserVO userInfo = userDAO.findUser(userId);
				request.setAttribute("userInfo", userInfo);
				request.setAttribute("msg", "fail");
				nextPage = "/user/userPwCheckForm.jsp";
			}
			
		} else if (action.equals("/changePw.do")) {
			
			String userId = request.getParameter("userId");
			UserVO userInfo = userDAO.findUser(userId);
			request.setAttribute("userInfo", userInfo);
			nextPage = "/user/changePw.jsp";
			
		} else if (action.equals("/changePwAction.do")) {
			
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			String userPw1 = request.getParameter("userPw1");
			int check = userDAO.changePw(userId, userPw, userPw1);
			
			if (check == 1) {
				request.setAttribute("msg", "modified");
				nextPage = "/";
			} else {
				userId = request.getParameter("userId");
				UserVO userInfo = userDAO.findUser(userId);
				request.setAttribute("userInfo", userInfo);
				request.setAttribute("msg", "fail");
				nextPage = "/user/changePw.jsp";
			}
			
		}
		
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}// doHandle 메소드
}// UserController클래스