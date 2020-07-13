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

	public UserVO readUser(String userId) {
		return userAdminDAO.getUser(userId);
	}

	public int insertUser(UserVO userVO) {
		return userAdminDAO.insertUser(userVO);
	}

	public int updateUser(UserVO userVO) {
		return userAdminDAO.updateUser(userVO);
	}

	public int deleteUser(String userId) {
		return userAdminDAO.deleteUser(userId);
	}

}