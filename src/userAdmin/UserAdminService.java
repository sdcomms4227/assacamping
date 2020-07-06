package userAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import user.UserVO;

public class UserAdminService {

	UserAdminDAO userAdminDAO;

	public UserAdminService() {
		userAdminDAO = new UserAdminDAO();
	}

	public Map<String, Object> listUser(Map<String, Object> searchMap) {

		Map<String, Object> userListMap = new HashMap<String, Object>();

		List<UserVO> userList = userAdminDAO.getUserList(searchMap);
		userListMap.put("userList", userList);

		int totalCount = userAdminDAO.getUserListCount(searchMap);
		userListMap.put("totalCount", totalCount);

		return userListMap;
	}

//	public Map<String, Object> readUser(int userNo) {
//
//		Map<String, Object> userMap = new HashMap<String, Object>();
//
//		userAdminDAO.incrementUserCount(userNo);
//
//		UserVO userVO = userAdminDAO.getUser(userNo);
//		userMap.put("userVO", userVO);
//
//		return userMap;
//	}
//
//	public int insertUser(UserVO userVO) {
//
//		int maxNo = userAdminDAO.getUserMaxNo();
//		userAdminDAO.insertUser(userVO, maxNo);
//
//		return maxNo;
//	}
//
//	public int updateUser(UserVO userVO, String deleteFile) {
//		return userAdminDAO.updateUser(userVO, deleteFile);
//	}
//
//	public int deleteUser(int userNo) {
//		return userAdminDAO.deleteUser(userNo);
//	}
//
//	public int insertReplyUser(UserVO userVO) {
//
//		userAdminDAO.updateUserSequence(userVO);
//
//		int maxNo = userAdminDAO.getUserMaxNo();
//		userAdminDAO.insertReplyUser(userVO, maxNo);
//
//		return maxNo;
//	}
}