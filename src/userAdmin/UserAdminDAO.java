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
			System.out.println("getUserList()메소드 내부에서 오류 : " + e.toString());
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

	public int insertUser(UserVO userVO) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "insert into user(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, userDate, userUse)"
					+ "values(?,?,?,?,?,?,?,?,now(),1)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserPw());
			pstmt.setString(3, userVO.getUserName());
			pstmt.setString(4, userVO.getUserPhone());
			pstmt.setString(5, userVO.getUserEmail());
			pstmt.setString(6, userVO.getUserZipcode());
			pstmt.setString(7, userVO.getUserAddress1());
			pstmt.setString(8, userVO.getUserAddress2());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertUser()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public int updateUser(UserVO userVO) {

		try {
			conn = dbUtil.DBConnection.getConnection();

			String sql = "update user set userName=?, userPhone=?, userEmail=?, userZipcode=?, userAddress1=?, userAddress2=? where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userVO.getUserName());
			pstmt.setString(2, userVO.getUserPhone());
			pstmt.setString(3, userVO.getUserEmail());
			pstmt.setString(4, userVO.getUserZipcode());
			pstmt.setString(5, userVO.getUserAddress1());
			pstmt.setString(6, userVO.getUserAddress2());
			pstmt.setString(7, userVO.getUserId());

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateUser()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

	public int deleteUser(String userId) {

		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from user where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteUser()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return 0;
	}

}