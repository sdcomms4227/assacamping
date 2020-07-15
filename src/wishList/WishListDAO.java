package wishList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dbUtil.DBConnection;
import product.ProductVO;

public class WishListDAO {
	
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
	
	// 위시리스트 목록
	public List<Map<String, Object>> getWishList(String userId) {
		String sql = "";
		List<Map<String, Object>> wList = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();

			sql = "select * from wishList wl"
				+ " join product pr"
				+ " on wl.productNo = pr.productNo"
				+ " where userId = ?";
			   
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> wListMap = new HashMap<>();
				WishListVO wishListVO = new WishListVO();
				ProductVO productVO = new ProductVO();
				
				wishListVO.setWishNo(rs.getInt("wishNo"));
				wishListVO.setProductNo(rs.getInt("productNo"));
				wishListVO.setUserId(rs.getString("userId"));
				wishListVO.setWishDate(rs.getTimestamp("wishDate"));
				wListMap.put("wishListVO", wishListVO);
				
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				wListMap.put("productVO", productVO);
				
				wList.add(wListMap);
			}
		} catch (Exception e) {
			System.out.println("getWishList() 메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			freeResource();
		}
		return wList;
	}	
	
	// 위시리스트 추가
	public int addWishList(String userId, int productNo, int wishNo) {
		String sql = "";
		try {
			conn = DBConnection.getConnection();
			
			sql="insert into wishList(wishNo, userId, productNo, wishDate)"
				+ " values(?,?,?,now())";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);
			pstmt.setString(2, userId);
			pstmt.setInt(3, productNo);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("addWishList() 에서오류 : "+e.toString());
		}finally {
			freeResource();
		}
		return 0;
	}

	// 위시리스트 삭제
	public int deleteWish(int wishNo) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from wishList where wishNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteWish() 메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

	// 위시리스트 추가된 상품인지 확인
	public int checkWish(String userId, int productNo) {
		String sql = "";
		try {
			conn = DBConnection.getConnection();
			sql = "select * from wishList where userId=? and productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, productNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			System.out.println("wishCheck() 메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

	// 사용자의 위시리스트 총 갯수
	public int wishTotalCount(String userId) {
		String sql = "";
		int totalcount=0;
		
		try {
               conn=dbUtil.DBConnection.getConnection();
			
			   sql="select count(*) from wishList where userId=?";
			    
			   pstmt=conn.prepareStatement(sql);
			   
			   pstmt.setString(1, userId);
			   rs=pstmt.executeQuery();
			   if(rs.next()) {
				   
				   totalcount= rs.getInt(1);
				   
			   }
			
		} catch (Exception e) {
			
			System.out.println("cartTotalCount에서 오류"+e.getMessage());
			
		}finally {
			freeResource();
		}
		
		
		
		return totalcount;
	}

	// 위시리스트 추가시 가져올 wishNo 값
	public int getMaxWishNo() {
		String sql = "";
		int num = 0;
		try {
			conn = DBConnection.getConnection();
			
			sql = "select max(wishNo) from wishList";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			} else {
				num = 1;
			}
			
		} catch (Exception e) {
			System.out.println("getMaxWishNo() 에서오류 : "+e.toString());
		}finally {
			freeResource();
		}
		return num;
		
	}

	public int deleteAllWish(String userId) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from wishList where userId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteAllWish() 메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		return 0;
	}

}
