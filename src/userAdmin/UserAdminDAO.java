package userAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import user.UserVO;

public class UserAdminDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void freeResource() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<UserVO> getUserList(Map<String, Object> searchMap) {

		List<UserVO> userList = new ArrayList<UserVO>();

		int numberPerPage = 10;
		int pageNo = (int) searchMap.get("pageNo");
		int offset = (pageNo - 1) * 10;
		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "	select * from user where userName like ? order by userDate desc limit ?, ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				UserVO userVO = new UserVO();
				
				userVO.setUserAddress1(rs.getString("userAddress1"));
				userVO.setUserAddress2(rs.getString("userAddress2"));
				userVO.setUserDate(rs.getTimestamp("userDate"));
				userVO.setUserEmail(rs.getString("userEmail"));
				userVO.setUserId(rs.getString("userId"));
				userVO.setUserName(rs.getString("userName"));
				userVO.setUserPhone(rs.getString("userPhone"));
				userVO.setUserPw(rs.getString("userPw"));
				userVO.setUserUse(rs.getInt("userUse"));
				userVO.setUserZipcode(rs.getString("userZipcode"));				
				
				userList.add(userVO);
			}

		} catch (Exception e) {
			System.out.println("getUserList(Map)메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return userList;
	}

	public int getUserListCount(Map<String, Object> searchMap) {

		String searchKeyword = (String) searchMap.get("searchKeyword");
		String sql = "";

		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(userId) from user" + " where userName like ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getUserListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public UserVO getUser(String userId) {

		UserVO userVO = new UserVO();

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from user where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				userVO.setUserAddress1(rs.getString("userAddress1"));
				userVO.setUserAddress2(rs.getString("userAddress2"));
				userVO.setUserDate(rs.getTimestamp("userDate"));
				userVO.setUserEmail(rs.getString("userEmail"));
				userVO.setUserId(rs.getString("userId"));
				userVO.setUserName(rs.getString("userName"));
				userVO.setUserPhone(rs.getString("userPhone"));
				userVO.setUserPw(rs.getString("userPw"));
				userVO.setUserUse(rs.getInt("userUse"));
				userVO.setUserZipcode(rs.getString("userZipcode"));	
			}

		} catch (Exception e) {
			System.out.println("getUser()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return userVO;
	}

//	public int getUserMaxNo() {
//
//		int maxNo = 0;
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "select max(userId) from user";
//			pstmt = conn.prepareStatement(sql);
//
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				maxNo = rs.getInt(1) + 1;
//			} else {
//				maxNo = 1;
//			}
//
//		} catch (Exception e) {
//			System.out.println("getUserMaxNo()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return maxNo;
//	}
//
//	public int insertUser(UserVO userVO, int maxNo) {
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "insert into user(userId, userName, userContent, userFileName, userId, userRe_ref, userRe_lev, userRe_seq, userDate, userCount, userCategoryNo)"
//					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, maxNo);
//			pstmt.setString(2, userVO.getUserTitle());
//			pstmt.setString(3, userVO.getUserContent());
//			pstmt.setString(4, userVO.getUserFileName());
//			pstmt.setString(5, userVO.getUserId());
//			pstmt.setInt(6, maxNo);
//			pstmt.setInt(7, 0);
//			pstmt.setInt(8, 0);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, userVO.getUserCategoryNo());
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("insertUser()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return 0;
//	}
//
//	public int updateUser(UserVO userVO, String deleteFile) {
//
//		String userFileName = userVO.getUserFileName();
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//
//			if (userFileName != null) {
//				String sql = "update user set userName=?, userContent=?, userFileName=?, userCategoryNo=? where userId=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, userVO.getUserTitle());
//				pstmt.setString(2, userVO.getUserContent());
//				pstmt.setString(3, userFileName);
//				pstmt.setInt(4, userVO.getUserCategoryNo());
//				pstmt.setInt(5, userVO.getUserNo());
//			} else if (deleteFile != null) {
//				String sql = "update user set userName=?, userContent=?, userFileName=?, userCategoryNo=? where userId=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, userVO.getUserTitle());
//				pstmt.setString(2, userVO.getUserContent());
//				pstmt.setString(3, null);
//				pstmt.setInt(4, userVO.getUserCategoryNo());
//				pstmt.setInt(5, userVO.getUserNo());
//			} else {
//				String sql = "update user set userName=?, userContent=?, userCategoryNo=? where userId=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, userVO.getUserTitle());
//				pstmt.setString(2, userVO.getUserContent());
//				pstmt.setInt(3, userVO.getUserCategoryNo());
//				pstmt.setInt(4, userVO.getUserNo());
//			}
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("updateUser()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return 0;
//	}
//
//	public int deleteUser(String userId) {
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "delete from user where userId=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, userId);
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("deleteUser()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return 0;
//	}
//
//	public int updateUserSequence(UserVO userVO) {
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "update user set userRe_seq=userRe_seq+1 where userRe_ref=? and userRe_seq>?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, userVO.getUserRe_ref());
//			pstmt.setInt(2, userVO.getUserRe_seq());
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("updateUserSequence()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return 0;
//	}
//
//	public int insertReplyUser(UserVO userVO, int maxNo) {
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "insert into user(userId, userName, userContent, userFileName, userId, userRe_ref, userRe_lev, userRe_seq, userDate, userCount, userCategoryNo)"
//					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, maxNo);
//			pstmt.setString(2, userVO.getUserTitle());
//			pstmt.setString(3, userVO.getUserContent());
//			pstmt.setString(4, userVO.getUserFileName());
//			pstmt.setString(5, userVO.getUserId());
//			pstmt.setInt(6, userVO.getUserRe_ref());
//			pstmt.setInt(7, userVO.getUserRe_lev() + 1);
//			pstmt.setInt(8, userVO.getUserRe_seq() + 1);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, userVO.getUserCategoryNo());
//
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			System.out.println("insertReplyUser()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return 0;
//	}
}