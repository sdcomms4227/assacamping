package userAdmin;

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

import user.UserVO;

@SuppressWarnings("serial")
@WebServlet("/userAdminServlet/*")
public class UserAdminController extends HttpServlet {

	UserAdminService userAdminService;
	UserVO userVO;
	String realPath;

	@Override
	public void init() throws ServletException {
		userAdminService = new UserAdminService();
		userVO = new UserVO();
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
		realPath = request.getServletContext().getRealPath("/files/user");
		
		request.setCharacterEncoding("UTF-8");		
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action: " + action);
		
		if(action == null || action.equals("/listUser.do")) {			

			setPagination(request);
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("pageNo", request.getAttribute("pageNo"));
			searchMap.put("searchKeyword", request.getAttribute("searchKeyword"));

			Map<String, Object> userListMap = userAdminService.listUser(searchMap);			
			request.setAttribute("userListMap", userListMap);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/userAdmin/listUser.jsp";
			
		}else if(action.equals("/readUser.do")) {

			setPagination(request);
			
			String userId = request.getParameter("userId");
			
			UserVO userVO = userAdminService.readUser(userId);
			
			request.setAttribute("userVO", userVO);
			
			if(request.getAttribute("alertMsg")!=null) {
				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
			}
			
			nextPage = "/userAdmin/readUser.jsp";
			
		}else if(action.contentEquals("/addUser.do")) {
						
			nextPage = "/userAdmin/addUser.jsp";
			
		}else if(action.equals("/insertUser.do")) {
			
			Map<String, String> multipartMap = uploadFile(request);
			
			String userId = multipartMap.get("userId");
			String userPw = multipartMap.get("userPw");
			String userName = multipartMap.get("userName");
			String userPhone = multipartMap.get("userPhone");
			String userEmail = multipartMap.get("userEmail");
			String userZipcode = multipartMap.get("userZipcode");
			String userAddress1 = multipartMap.get("userAddress1");
			String userAddress2 = multipartMap.get("userAddress2");
			
			userVO.setUserId(userId);
			userVO.setUserPw(userPw);
			userVO.setUserName(userName);
			userVO.setUserPhone(userPhone);
			userVO.setUserEmail(userEmail);
			userVO.setUserZipcode(userZipcode);
			userVO.setUserAddress1(userAddress1);
			userVO.setUserAddress2(userAddress2);
			
			int result = userAdminService.insertUser(userVO);			
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "정상적으로 가입되었습니다.";
				nextPage = "/userAdminServlet/readUser.do?userId=" + userId;
			}else {
				alertMsg = "오류가 발생했습니다.";
				nextPage = "/userAdmin/addUser.jsp";
			}								
			
			request.setAttribute("alertMsg", alertMsg);
			
		}else if(action.equals("/modifyUser.do")) {

			setPagination(request);
			
			String userId = request.getParameter("userId");

			UserVO userVO = userAdminService.readUser(userId);
			
			request.setAttribute("userVO", userVO);
			
			nextPage = "/userAdmin/modifyUser.jsp";
			
		}else if(action.equals("/updateUser.do")) {

			setPagination(request);

			Map<String, String> multipartMap = uploadFile(request);
			
			String userId = multipartMap.get("userId");
			String userName = multipartMap.get("userName");
			String userPhone = multipartMap.get("userPhone");
			String userEmail = multipartMap.get("userEmail");
			String userZipcode = multipartMap.get("userZipcode");
			String userAddress1 = multipartMap.get("userAddress1");
			String userAddress2 = multipartMap.get("userAddress2");
			
			userVO.setUserId(userId);
			userVO.setUserName(userName);
			userVO.setUserPhone(userPhone);
			userVO.setUserEmail(userEmail);
			userVO.setUserZipcode(userZipcode);
			userVO.setUserAddress1(userAddress1);
			userVO.setUserAddress2(userAddress2);
			
			int result = userAdminService.updateUser(userVO);
			String alertMsg = "";
			
			if(result > 0) {
				alertMsg = "정상적으로 수정되었습니다.";		
				nextPage = "/userAdminServlet/readUser.do?userId=" + userId;
			}else {
				alertMsg = "오류가 발생했습니다.";
				nextPage = "/userAdminServlet/readUser.do?userId=" + userId;
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
		}else if(action.equals("/deleteUser.do")) {

			setPagination(request);
			
			String userId = request.getParameter("userId");
			
			int result = userAdminService.deleteUser(userId);
			String alertMsg = "";

			if(result > 0) {
				alertMsg = "정상적으로 삭제되었습니다.";				
			}else {
				alertMsg = "오류가 발생했습니다.";
			}
			
			request.setAttribute("alertMsg", alertMsg);
			
			nextPage = "/userAdminServlet/listUser.do";
			
		}
				
		if(!nextPage.equals("")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}
		
	}

	private void setPagination(HttpServletRequest request) {
		try {
			int pageNo = 1;
			if (request.getParameter("pageNo") != null) {
				pageNo = Integer.parseInt(request.getParameter("pageNo"));
			}
			if (request.getAttribute("pageNo") == null) {
				request.setAttribute("pageNo", pageNo);
			}

			String searchKeyword = "";
			if (request.getParameter("searchKeyword") != null) {
				searchKeyword = request.getParameter("searchKeyword");
			}
			if (request.getAttribute("searchKeyword") == null) {
				request.setAttribute("searchKeyword", searchKeyword);
			}
			
		} catch (Exception e) {
			System.out.println("setPagination()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private Map<String, String> uploadFile(HttpServletRequest request) {
		Map<String, String> userMap = null;

		try {
			userMap = new HashMap<String, String>();

			File repository = new File(realPath);
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 1024 * 1);
			factory.setRepository(repository);
			ServletFileUpload upload = new ServletFileUpload(factory);

			List<FileItem> items = upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				DiskFileItem fileItem = (DiskFileItem) items.get(i);

				if (fileItem.isFormField()) {
					userMap.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));

				} else {

					if (fileItem.getSize() > 0) {
						userMap.put(fileItem.getFieldName(), fileItem.getName());
						int idx = fileItem.getName().lastIndexOf("\\");

						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}

						String fileName = fileItem.getName().substring(idx + 1);
						String tempDirPath = realPath + "\\temp";
						File tempDir = new File(tempDirPath);

						if (!tempDir.exists()) {
							tempDir.mkdir();
						}

						String filePath = tempDirPath + "\\" + fileName;
						File file = new File(filePath);

						if (!file.exists()) {
							fileItem.write(file);
						}

					} else {
						userMap.put(fileItem.getFieldName(), null);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("uploadFile()메소드 내부에서 오류 : " + e.toString());
		}

		return userMap;
	}

	private void moveFile(int userId, String fileName) {
		try {
			File srcFile = new File(realPath + "\\temp\\" + fileName);
			File destDir = new File(realPath + "\\" + userId);
			Boolean createDestDir = destDir.mkdir();

			String filePath = realPath + "\\" + userId + "\\" + fileName;
			File file = new File(filePath);

			if (!file.exists()) {
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			}
		} catch (Exception e) {
			System.out.println("moveFile()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private void deleteFile(int userId, String fileName) {
		try {
			String filePath = realPath + "\\" + userId + "\\" + fileName;
			File file = new File(filePath);

			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private void downloadFile(HttpServletResponse response, int userId, String fileName) {
		try {
			String filePath = realPath + "\\" + userId + "\\" + fileName;
			File file = new File(filePath);

			OutputStream out = response.getOutputStream();

			response.setHeader("Cache-Control", "no-chche");
			response.addHeader("Cache-Control", "no-store");
			response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");

			FileInputStream in = new FileInputStream(file);

			byte[] buffer = new byte[1024 * 8];

			while (true) {
				int count = in.read(buffer);

				if (count == -1) {
					break;
				}
				out.write(buffer, 0, count);
				;
			}

			in.close();
			out.close();
		} catch (Exception e) {
			System.out.println("downloadFile()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private String getFileType(int userId, String fileName) {
		String userFileType = "";

		try {
			String filePath = realPath + "\\" + userId + "\\" + fileName;
			File file = new File(filePath);

			String mimeType = Files.probeContentType(file.toPath());
			userFileType = mimeType.split("/")[0];

		} catch (Exception e) {
			System.out.println("getFileType()메소드 내부에서 오류 : " + e.toString());
		}

		return userFileType;
	}

	private void deleteDirectory(int userId) {
		try {
			String realDirPath = realPath + "\\" + userId;
			File realDir = new File(realDirPath);

			if (realDir.exists()) {
				FileUtils.deleteDirectory(realDir);
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
}
