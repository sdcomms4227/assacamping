package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//자원해제 메소드
	public void resourceClose() {
		//자원해제
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//resourceClose
	
	public UserDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/assa");
		}catch (Exception e) {
			System.out.println("커넥션풀 얻기 실패: " + e.getMessage());		}
	}//UserDAO
	
	
	public List<UserVO> listUsers() {// SQL 문을 이용해 회원정보를 조회한 후 결과를  ArrayList로 반환합니다.
		
		List<UserVO> usersList = new ArrayList<UserVO>();
		try {
			conn = dataFactory.getConnection();
			//SQL문 작성
			String query = "select * from user order by userDate desc";
			System.out.println(query);
			//PreparedStament객체를 생성하면서 SQL문을 인자로 전달합니다.
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
				
				//ArrayList에 위의 UserVO객체 추가
				usersList.add(userVO);
			}
			
		}catch (Exception e) {
			System.out.println("usersList메소드 내부에서 SQL실행 예외 방행 :" + e);
		}finally {
			resourceClose();
		}
		return usersList; //사장님에게(UserController.java)컨트롤러에게 반환
		
	}//listUsers
	
	//새로운 회원 정보를 DB에 추가 시키는 메소드 
	public void addUser(UserVO userVO) {
		try {
			conn = dataFactory.getConnection();
			
			String query = "insert into user(userId, userPw, userName, userPhone, userEmail, userZipcode, userAddress1, userAddress2, userDate, userUse)"
					+ " values(?,?,?,?,?,?,?,?,now(),?)";
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getUserPw());
			pstmt.setString(3, userVO.getUserName());
			pstmt.setString(4, userVO.getUserPhone());
			pstmt.setString(5, userVO.getUserEmail());
			pstmt.setString(6, userVO.getUserZipcode());
			pstmt.setString(7, userVO.getUserAddress1());
			pstmt.setString(8, userVO.getUserAddress2());
			pstmt.setInt(9, userVO.getUserUse());
			//insert실행
			pstmt.executeQuery();
			
		}catch(Exception e){
			System.out.println("addUser메소드 내부에서 SQL실행 오류 : " + e);
		}finally {
			resourceClose();
		}
	}//addUser메소드
	
	public UserVO findUser(String userId) {
		//조회한 회원 한사람의 정보를 저장할 용도의 UserVO객체를 담을 변수 선언
		UserVO userInfo = null;
		try {
			conn = dataFactory.getConnection();
			//매개변수로 전달 받은 id에 해당하는 회원레코드 검색
			String query = "select * from user where userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs.next();
			//검색한 회원 한줄의 정보를 얻어 UserVO객체의 각 변수에 저장
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
			e.printStackTrace();
		}finally {
			resourceClose();
		}
		return userInfo; //매개변수로 전달받은 회원 ID로 조회한 회원정보를 반환
	}//findUser 메소드
	
	//매개변수로 전달받은 UserVO객체(수정할 정보)를 이용하여 DB에 저장된 회원 레코드 수정
	public void modUser(UserVO userVO) {
		
		try {
			conn = dataFactory.getConnection();
			String query = "update user set userPw=?, userName=?, userPhone=?, userEmail=?, userZipcode=?, userAddress1=?, userAddress2=? where userId=?";
			//?기호에 대응되는 값을 제외한 update전체 문장을 로딩한 객체 얻기
			pstmt = conn.prepareStatement(query);
			//?기호에 대응되는 수정할 값을 설정
			pstmt.setString(1, userVO.getUserPw());
			pstmt.setString(2, userVO.getUserName());
			pstmt.setString(3, userVO.getUserPhone());
			pstmt.setString(4, userVO.getUserEmail());
			pstmt.setString(5, userVO.getUserZipcode());
			pstmt.setString(6, userVO.getUserAddress1());
			pstmt.setString(7, userVO.getUserAddress2());
			//UPDATE전체 구문 DB에 전송하여 실행
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			resourceClose();
		}
	}//modUser메소드 끝
	
	//매개변수로 전달받은 삭제할 회원id를 통해 회원삭제
	public void delUser(String userId) {
		
		try {
			conn = dataFactory.getConnection();
			
			String query = "delete from user where id=?";
			
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
	
	
}//UserDAO클래스 





























