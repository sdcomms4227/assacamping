package orderAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import order.OrderVO;

public class OrderAdminDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void freeResource() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Map<String,Object>> getOrderList(Map<String, Object> searchMap) {

		List<Map<String,Object>> productList = new ArrayList<Map<String,Object>>();

		int numberPerPage = 10;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			if(searchCategoryNo==0) {
				sql = "	select *"
						+ " from productOrder pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " order by pr.orderNo desc"
						+ "	limit ?, ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, offset);
				pstmt.setInt(3, numberPerPage);
			}else {
				sql = "	select *"
						+ " from productOrder pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " and pr.productCategoryNo = ?"
						+ " order by pr.orderNo desc"
						+ "	limit ?, ?";		
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
				pstmt.setInt(3, offset);
				pstmt.setInt(4, numberPerPage);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> productMap = new HashMap<String, Object>();
				OrderVO orderVO = new OrderVO();
				
//				orderVO.setOrderCategoryNo(rs.getInt("productCategoryNo"));
//				orderVO.setOrderContent(rs.getString("productContent"));
//				orderVO.setOrderDate(rs.getTimestamp("productDate"));
//				orderVO.setOrderImageName1(rs.getString("productImageName1"));
//				orderVO.setOrderImageName2(rs.getString("productImageName2"));
//				orderVO.setOrderImageName3(rs.getString("productImageName3"));
//				orderVO.setOrderName(rs.getString("productName"));
//				orderVO.setOrderNo(rs.getInt("orderNo"));
//				orderVO.setOrderPrice(rs.getInt("productPrice"));
//				orderVO.setOrderQuantity(rs.getInt("productQuantity"));
//				orderVO.setOrderRating(rs.getInt("productRating"));
				
				String productCategoryName = rs.getString("productCategoryName");
				
				productMap.put("orderVO", orderVO);
				productMap.put("productCategoryName", productCategoryName);
								
				productList.add(productMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getOrderList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productList;		
	}


	public int getOrderCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();

			if(searchCategoryNo==0) {
				sql = "select count(orderNo) from productOrder"
						+ " where productName like ?";
						
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
			}else {
				sql = "select count(orderNo) from productOrder"
						+ " where productName like ?"
						+ " and productCategoryNo = ?";
						
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
			}			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getOrderCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	
	public Map<String, Object> getOrder(int orderNo) {
		
		Map<String, Object> productMap = new HashMap<String, Object>();
		OrderVO orderVO = new OrderVO();
		String productCategoryName = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from productOrder pr"
					+ " join productCategory ct"
					+ " on pr.productCategoryNo = ct.productCategoryNo"
					+ " where pr.orderNo = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
//				orderVO.setOrderCategoryNo(rs.getInt("productCategoryNo"));
//				orderVO.setOrderContent(rs.getString("productContent"));
//				orderVO.setOrderDate(rs.getTimestamp("productDate"));
//				orderVO.setOrderImageName1(rs.getString("productImageName1"));
//				orderVO.setOrderImageName2(rs.getString("productImageName2"));
//				orderVO.setOrderImageName3(rs.getString("productImageName3"));
//				orderVO.setOrderName(rs.getString("productName"));
//				orderVO.setOrderNo(rs.getInt("orderNo"));
//				orderVO.setOrderPrice(rs.getInt("productPrice"));
//				orderVO.setOrderQuantity(rs.getInt("productQuantity"));
//				orderVO.setOrderRating(rs.getInt("productRating"));
							
//				productCategoryName = rs.getString("productCategoryName");
			
				productMap.put("orderVO", orderVO);
				productMap.put("productCategoryName", productCategoryName);
			}
			
		} catch(Exception e) {
			System.out.println("getOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productMap;
	}

	public int getOrderLastNo() {
		
		int lastNo = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "select max(orderNo) from productOrder";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastNo = rs.getInt(1);
			}else {
				lastNo = 0;
			}
			
		} catch(Exception e) {
			System.out.println("getOrderLastNo()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return lastNo;
	}
	
	public int insertOrder(OrderVO orderVO) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into product(productName, productContent, productImageName1, productImageName2, productImageName3, productPrice, productQuantity, productCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?)";
			
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, orderVO.getOrderName());
//			pstmt.setString(2, orderVO.getOrderContent());
//			pstmt.setString(3, orderVO.getOrderImageName1());
//			pstmt.setString(4, orderVO.getOrderImageName2());
//			pstmt.setString(5, orderVO.getOrderImageName3());
//			pstmt.setInt(6, orderVO.getOrderPrice());
//			pstmt.setInt(7, orderVO.getOrderQuantity());
//			pstmt.setInt(8, orderVO.getOrderCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}	
		
		return 0;
	}

	public int updateOrder(OrderVO orderVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		
		String productImageName1 = originalImageNameMap.get("originalImageName1");
		String productImageName2 = originalImageNameMap.get("originalImageName2");
		String productImageName3 = originalImageNameMap.get("originalImageName3");
		
		if (deleteFileMap.get("deleteFile2") != null) {
			productImageName2 = null;
		}
		if (deleteFileMap.get("deleteFile3") != null) {
			productImageName3 = null;
		}
		
//		if (orderVO.getOrderImageName1() != null) {
//			productImageName1 = orderVO.getOrderImageName1();
//		}
//		if (orderVO.getOrderImageName2() != null) {
//			productImageName2 = orderVO.getOrderImageName2();
//		}
//		if (orderVO.getOrderImageName3() != null) {
//			productImageName3 = orderVO.getOrderImageName3();
//		}
		
		try {
			conn = dbUtil.DBConnection.getConnection();					
			String sql = "update product set productName=?, productContent=?, productImageName1=?, productImageName2=?, productImageName3=?, productPrice=?, productQuantity=?, productCategoryNo=? where orderNo=?";			
			pstmt = conn.prepareStatement(sql);
			
//			pstmt.setString(1, orderVO.getOrderName());
//			pstmt.setString(2, orderVO.getOrderContent());
//			pstmt.setString(3, productImageName1);
//			pstmt.setString(4, productImageName2);
//			pstmt.setString(5, productImageName3);
//			pstmt.setInt(6, orderVO.getOrderPrice());
//			pstmt.setInt(7, orderVO.getOrderQuantity());
//			pstmt.setInt(8, orderVO.getOrderCategoryNo());
//			pstmt.setInt(9, orderVO.getOrderNo());
	
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("updateOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	
		return 0;
	}

	public int deleteOrder(int orderNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from productOrder where orderNo=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
	
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("deleteOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	
		return 0;
	}	
	
	public void updateOrderQuantity(int orderNo , int cartQuantity) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "update product set productQuantity=productQuantity-?  where orderNo=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cartQuantity);
			pstmt.setInt(2, orderNo);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("updateOrderQuantity()메소드 내부에서 오류 : " + e.toString());
		}finally {
			freeResource();
		}

	}//updateOrderQuantity()
}