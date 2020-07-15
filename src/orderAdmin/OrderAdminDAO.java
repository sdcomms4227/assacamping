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

	public List<Map<String, Object>> getOrderList(Map<String, Object> searchMap) {

		List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();

		int numberPerPage = 10;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		int cnt = 0;
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			sql = "	select po1.orderNo, po1.productName, po1.productPayment, po1.userName, po1.orderDate, po1.orderState, po2.cnt"
					+ " from productOrder po1"
					+ " join ("
					+ "		select count(productName) cnt, orderNo"
					+ "		from productOrder"
					+ "		group by orderNo"
					+ " ) po2"
					+ "	on po1.orderNo = po2.orderNo"
					+ " where userName like ?"
					+ " group by orderNo"
					+ " order by orderNo desc"
					+ "	limit ?, ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			pstmt.setInt(2, offset);
			pstmt.setInt(3, numberPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> orderMap = new HashMap<String, Object>();
				OrderVO orderVO = new OrderVO();
				
				orderVO.setOrderNo(rs.getInt("orderNo"));
				orderVO.setProductName(rs.getString("productName"));
				orderVO.setProductPayment(rs.getInt("productPayment"));
				orderVO.setUserName(rs.getString("userName"));
				orderVO.setOrderDate(rs.getTimestamp("orderDate"));
				orderVO.setOrderState(rs.getString("orderState"));
				
				orderMap.put("orderVO", orderVO);
				
				cnt = rs.getInt("cnt");
				
				orderMap.put("cnt", cnt);
				
				orderList.add(orderMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getOrderList()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return orderList;		
	}


	public int getOrderCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(distinct orderNo) from productOrder"
					+ " where userName like ?";					
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');	
			
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
	
	public List<OrderVO> getOrder(int orderNo) {
		
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from productOrder where orderNo = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderVO orderVO = new OrderVO();
				
				orderVO.setCartQuantity(rs.getInt("cartQuantity"));
				orderVO.setOrderDate(rs.getTimestamp("orderDate"));
				orderVO.setOrderNo(rs.getInt("orderNo"));
				orderVO.setOrderState(rs.getString("orderState"));
				orderVO.setProductCategory(rs.getString("productCategory"));
				orderVO.setProductDelivery(rs.getInt("productDelivery"));
				orderVO.setProductName(rs.getString("productName"));
				orderVO.setProductNo(rs.getInt("productNo"));
				orderVO.setProductPayment(rs.getInt("productPayment"));
				orderVO.setProductPrice(rs.getInt("productPrice"));
				orderVO.setUserAddress1(rs.getString("userAddress1"));
				orderVO.setUserAddress2(rs.getString("userAddress2"));
				orderVO.setUserComment(rs.getString("userComment"));
				orderVO.setUserEmail(rs.getString("userEmail"));
				orderVO.setUserId(rs.getString("userId"));
				orderVO.setUserName(rs.getString("userName"));
				orderVO.setUserPhone(rs.getString("userPhone"));
				orderVO.setUserZipcode(rs.getString("userZipcode"));
				
				orderList.add(orderVO);
			}
			
		} catch(Exception e) {
			System.out.println("getOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return orderList;
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
	
	public int changeOrderState(OrderVO orderVO) {
				
		try {
			conn = dbUtil.DBConnection.getConnection();					
			String sql = "update product set orderState=? where orderNo=?";			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, orderVO.getOrderState());
			pstmt.setInt(2, orderVO.getOrderNo());
	
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("updateOrder()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	
		return 0;
	}
}