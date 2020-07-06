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
@WebServlet("/usradm/*")
public class UserAdminController extends HttpServlet {

	UserAdminService userAdminService;
	UserVO userVO;
	String realPath = "";

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
			
//		}else if(action.equals("/readUser.do")) {
//
//			setPagination(request);
//			
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
//			
//			Map<String, Object> userMap = userAdminService.readUser(userNo);
//
//			userVO = (UserVO)userMap.get("userVO");
//			String userFileName = userVO.getUserFileName();
//
//			if(userFileName!=null && !userFileName.equals("")) {
//				String userFileType = getFileType(userNo, userFileName);
//				userMap.put("userFileType", userFileType);
//			}
//			
//			request.setAttribute("userMap", userMap);
//			
//			if(request.getAttribute("alertMsg")!=null) {
//				request.setAttribute("alertMsg", request.getAttribute("alertMsg"));
//			}
//			
//			nextPage = "/userAdmin/readUser.jsp";
//			
//		}else if(action.contentEquals("/addUser.do")) {
//						
//			nextPage = "/userAdmin/addUser.jsp";
//			
//		}else if(action.equals("/insertUser.do")) {
//			
//			Map<String, String> multipartMap = uploadFile(request);
//									
//			String userTitle = multipartMap.get("userTitle");
//			String userContent = multipartMap.get("userContent");
//			String userFileName = multipartMap.get("userFileName");
//			String userId = multipartMap.get("userId");
//			
//			userVO.setUserTitle(userTitle);
//			userVO.setUserContent(userContent);
//			userVO.setUserFileName(userFileName);
//			userVO.setUserId(userId);
//			
//			int readNo = userAdminService.insertUser(userVO);			
//
//			if(userFileName!=null) {
//				moveFile(readNo, userFileName);
//			}
//						
//			nextPage = "/campadm/readUser.do?userNo=" + readNo;
//			
//		}else if(action.equals("/modifyUser.do")) {
//
//			setPagination(request);
//			
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
//
//			Map<String, Object> userMap = userAdminService.readUser(userNo);
//			
//			userVO = (UserVO)userMap.get("userVO");
//			String userFileName = userVO.getUserFileName();
//
//			if(userFileName!=null && !userFileName.equals("")) {
//				String userFileType = getFileType(userNo, userFileName);
//				userMap.put("userFileType", userFileType);
//			}
//
//			request.setAttribute("userMap", userMap);
//			
//			nextPage = "/userAdmin/modifyUser.jsp";
//			
//		}else if(action.equals("/updateUser.do")) {
//
//			setPagination(request);
//			
//			Map<String, String> multipartMap = uploadFile(request);
//			
//			int userNo = Integer.parseInt(multipartMap.get("userNo"));
//			String userTitle = multipartMap.get("userTitle");
//			String userContent = multipartMap.get("userContent");
//			String userFileName = multipartMap.get("userFileName");
//			String userId = multipartMap.get("userId");
//			String deleteFile = multipartMap.get("deleteFile");
//			String oldFileName = multipartMap.get("oldFileName");
//						
//			userVO.setUserNo(userNo);
//			userVO.setUserTitle(userTitle);
//			userVO.setUserContent(userContent);
//			userVO.setUserFileName(userFileName);
//			userVO.setUserId(userId);
//			
//			int result = userAdminService.updateUser(userVO, deleteFile);
//			String alertMsg = "";
//			
//			if(result > 0) {
//				alertMsg = "정상적으로 수정되었습니다.";
//				
//				if(deleteFile!=null || userFileName!=null) {
//					deleteFile(userNo, oldFileName);
//				}
//				if(userFileName!=null) {
//					moveFile(userNo, userFileName);
//				}
//			}else {
//				alertMsg = "오류가 발생했습니다.";
//			}
//			
//			request.setAttribute("alertMsg", alertMsg);
//			
//			nextPage = "/campadm/readUser.do?userNo=" + userNo;
//			
//		}else if(action.equals("/deleteUser.do")) {
//
//			setPagination(request);
//			
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
//			
//			int result = userAdminService.deleteUser(userNo);
//			String alertMsg = "";
//
//			if(result > 0) {
//				alertMsg = "정상적으로 삭제되었습니다.";
//				
//				deleteDirectory(userNo);
//			}else {
//				alertMsg = "오류가 발생했습니다.";
//			}
//			
//			request.setAttribute("alertMsg", alertMsg);
//			
//			nextPage = "/campadm/listUser.do";
//			
//		}else if(action.equals("/replyUser.do")) {
//			
//			setPagination(request);
//			
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
//
//			Map<String, Object> userMap = userAdminService.readUser(userNo);
//			
//			request.setAttribute("userMap", userMap);
//			
//			nextPage = "/userAdmin/replyUser.jsp";
//			
//		}else if(action.equals("/insertReplyUser.do")) {
//
//			setPagination(request);
//			
//			Map<String, String> multipartMap = uploadFile(request);
//			
//			int userNo = Integer.parseInt(multipartMap.get("userNo"));
//			String userTitle = multipartMap.get("userTitle");
//			String userContent = multipartMap.get("userContent");
//			String userFileName = multipartMap.get("userFileName");
//			String userId = multipartMap.get("userId");
//			int userRe_ref = Integer.parseInt(multipartMap.get("userRe_ref"));
//			int userRe_lev = Integer.parseInt(multipartMap.get("userRe_lev"));
//			int userRe_seq = Integer.parseInt(multipartMap.get("userRe_seq"));
//			
//			userVO.setUserNo(userNo);
//			userVO.setUserTitle(userTitle);
//			userVO.setUserContent(userContent);
//			userVO.setUserFileName(userFileName);
//			userVO.setUserId(userId);
//			userVO.setUserRe_ref(userRe_ref);
//			userVO.setUserRe_lev(userRe_lev);
//			userVO.setUserRe_seq(userRe_seq);
//			
//			int readNo = userAdminService.insertReplyUser(userVO);
//
//			if(userFileName!=null) {
//				moveFile(readNo, userFileName);
//			}
//			
//			nextPage = "/campadm/readUser.do?userNo=" + readNo;
//			
//		}else if(action.equals("/download.do")) {
//			
//			int userNo = Integer.parseInt(request.getParameter("userNo"));
//			String fileName = request.getParameter("fileName");			
//
//			downloadFile(response, userNo, fileName);
//		
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

	private void moveFile(int userNo, String fileName) {
		try {
			File srcFile = new File(realPath + "\\temp\\" + fileName);
			File destDir = new File(realPath + "\\" + userNo);
			Boolean createDestDir = destDir.mkdir();

			String filePath = realPath + "\\" + userNo + "\\" + fileName;
			File file = new File(filePath);

			if (!file.exists()) {
				FileUtils.moveFileToDirectory(srcFile, destDir, createDestDir);
			}
		} catch (Exception e) {
			System.out.println("moveFile()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private void deleteFile(int userNo, String fileName) {
		try {
			String filePath = realPath + "\\" + userNo + "\\" + fileName;
			File file = new File(filePath);

			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}

	private void downloadFile(HttpServletResponse response, int userNo, String fileName) {
		try {
			String filePath = realPath + "\\" + userNo + "\\" + fileName;
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

	private String getFileType(int userNo, String fileName) {
		String userFileType = "";

		try {
			String filePath = realPath + "\\" + userNo + "\\" + fileName;
			File file = new File(filePath);

			String mimeType = Files.probeContentType(file.toPath());
			userFileType = mimeType.split("/")[0];

		} catch (Exception e) {
			System.out.println("getFileType()메소드 내부에서 오류 : " + e.toString());
		}

		return userFileType;
	}

	private void deleteDirectory(int userNo) {
		try {
			String realDirPath = realPath + "\\" + userNo;
			File realDir = new File(realDirPath);

			if (realDir.exists()) {
				FileUtils.deleteDirectory(realDir);
			}
		} catch (Exception e) {
			System.out.println("deleteFile()메소드 내부에서 오류 : " + e.toString());
		}
	}
}
