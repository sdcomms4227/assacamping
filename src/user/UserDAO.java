package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//자원해제
	public void resourceClose() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//resourceClose
		
	//회원목록
	public List<UserVO> listUsers() {
		
		List<UserVO> usersList = new ArrayList<UserVO>();
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user order by userDate desc";
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserVO userVO = new UserVO(rs.getString("userId"),
				 rs.getString("userPw"),
				 rs.getString("userName"),
				 rs.getString("userPhone"),
				 rs.getString("userEmail"),
				 rs.getString("userZipcode"),
				 rs.getString("userAddress1"),
				 rs.getString("userAddress2"),
				 rs.getTimestamp("userDate"),
				 rs.getInt("userUse")); 
				
  				usersList.add(userVO);
			}
			
		}catch (Exception e) {
			System.out.println("usersList메소드 내부에서 SQL실행 예외 발생 :" + e);
		}finally {
			resourceClose();
		}
		return usersList; 
		
	}//listUsers
	
	//회원가입
	public void addUser(UserVO userVO) {
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			String query = "insert into user(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, userDate, userUse)"
					+ " values(?,?,?,?,?,?,?,?,now(),1)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserPw());
			pstmt.setString(3, userVO.getUserName());
			pstmt.setString(4, userVO.getUserPhone());
			pstmt.setString(5, userVO.getUserEmail());
			pstmt.setString(6, userVO.getUserZipcode());
			pstmt.setString(7, userVO.getUserAddress1());
			pstmt.setString(8, userVO.getUserAddress2());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("addUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
	}//addUser메소드
	
	public UserVO findUser(String userId) {
		
		UserVO userInfo = null;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			rs.next();
			userInfo = new UserVO(rs.getString("userId"),
					 rs.getString("userPw"),
					 rs.getString("userName"),
					 rs.getString("userPhone"),
					 rs.getString("userEmail"),
					 rs.getString("userZipcode"),
					 rs.getString("userAddress1"),
					 rs.getString("userAddress2"),
					 rs.getTimestamp("userDate"),
					 rs.getInt("userUse")); 
			
		} catch (Exception e) {
			System.out.println("findUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
		
		return userInfo;
	}//findUser 메소드
	

	public void modUser(UserVO userVO) {
		
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "update user set userPw=?, userName=?, userPhone=?, userEmail=?, userZipcode=?, userAddress1=?, userAddress2=? where userId=?";
		
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userVO.getUserPw());
			pstmt.setString(2, userVO.getUserName());
			pstmt.setString(3, userVO.getUserPhone());
			pstmt.setString(4, userVO.getUserEmail());
			pstmt.setString(5, userVO.getUserZipcode());
			pstmt.setString(6, userVO.getUserAddress1());
			pstmt.setString(7, userVO.getUserAddress2());	
			pstmt.setString(8, userVO.getUserId());
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("modUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
	}//modUser메소드 끝
	
	//매개변수로 전달받은 삭제할 회원id를 통해 회원삭제
	public void delUser(String userId) {
		
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "delete from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delUser메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			//자원 해제
			resourceClose();
		}
	}//delUser메소드 

	public int login(String userId, String userPw) {
		
		int check = 0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(userPw.equals(rs.getString("userPw"))) {
					if(rs.getInt("userUse")==1) {
						check=2;
					}
				}else {
					check=1;
				}
			}else {
				check=0;
			}
			
		} catch (Exception e) {
			System.out.println("login메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return check;
	}//login 메소드
	
	public String getUserName(String userId) {
		String userName = "";

		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select userName from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userName = rs.getString("userName");
			}
			
		} catch (Exception e) {
			System.out.println("getUserName메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return userName;
	}

	public int idCheck(String userId) {
		int check = 0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check=1;
			}
		} catch (Exception e) {
			System.out.println("idCheck메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return check;
	}//idCheck 메소드
	
	public String findId(String userName, String userEmail) {
		String userId ="";
		try{
			conn=dbUtil.DBConnection.getConnection();
			String query = "select userId from user where userName=? and userEmail=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userId = rs.getString("userId");
			}
		} catch (Exception e) {
			System.out.println("findId메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return userId;
		
	}//findId 메소드

	public int withdrawlUser(String userId, String userPw) {
		int check = 0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(userPw.equals(rs.getString("userPw"))) {
					query = "update user set userUse = 0 where userId = ?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userId);
					pstmt.executeUpdate();
					check = 1;
				}else {
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("withdrawlUser메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return check;
	}//withdrawlUser메소드 

	public int checkAction(String userId, String userPw) {
		int check = 0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(userPw.equals(rs.getString("userPw"))) {
					check = 1;
				}else {
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("checkAction메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
	return check;
	}// checkAction

	public int changePw(String userId, String userPw, String userPw1 ) {
		int check = 0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			String query = "select * from user where userId=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(userPw.equals(rs.getString("userPw"))) {
					query = "update user set userPw= ? where userId=?";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, userPw1);
					pstmt.setString(2, userId);
					pstmt.executeUpdate();
					check = 1;
				}else {
					check = 0;
				}
			}
		} catch (Exception e) {
			System.out.println("changePw메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return check;
	}//changePw메소드

	public String findPw(String userId, String userEmail) {
		String userPw = "";
		try {
			conn = dbUtil.DBConnection.getConnection();  
			String query = "select userPw from user where userId=? and userEmail=?";
			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userPw = rs.getString("userPw");
			}
		} catch (Exception e) {
			System.out.println("findPw메소드 내부에서 SQL 실행 오류: " + e);
		}finally {
			resourceClose();
		}
		return userPw;
	}
}//UserDAO클래스 




























