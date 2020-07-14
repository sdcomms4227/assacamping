package order;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cart.CartVO;

public class OrderDAO implements Serializable{

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	
	
	public void freeResource() {
		if(rs != null) {try {rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException e){e.printStackTrace();}}	
		if(conn != null) {try {conn.close();}catch(SQLException e){e.printStackTrace();}}
	
	}//freeResource()

	
	public int orderCount(String userId) {//장바구니 총 상품개수
		  int total=0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select count(*) from cart where userId=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
		
		} catch (Exception e) {
			System.out.println("orderCount에서 오류"+e.getMessage());
		}
		
		return total;
	}//orderCount()
	
	
	public void addOrder(List<CartVO> orderList,OrderVO vo)  {//주문하기
        
	try {
		
			conn=dbUtil.DBConnection.getConnection();
			
	  for(int i=0 ;i<orderList.size();i++) { 
		  
		  CartVO vo1=orderList.get(i);
				
		       sql=" insert into productOrder(productPayment,userZipcode,"
		       		+ "userAddress1,userAddress2,"
		       		+ "productName,userName,"
		       		+ "userPhone,userComment,"
		       		+ "orderDate,orderState,"
		       		+ "productNo,cartQuantity,"
		       		+ "userId,userEmail,"
		       		+ "productDelivery,productPrice,"
		       		+ "productCategory,orderNo)"
		       		+" values(?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?)";
				
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, vo.getProductPayment());
				pstmt.setString(2, vo.getUserZipcode());
				pstmt.setString(3, vo.getUserAddress1());
				pstmt.setString(4, vo.getUserAddress2());
				pstmt.setString(5, vo1.getProductName());
				pstmt.setString(6, vo.getUserName());
				pstmt.setString(7, vo.getUserPhone());
				pstmt.setString(8, vo.getUserComment());
				pstmt.setString(9, vo.getOrderState());
				pstmt.setInt(10, vo1.getProductNo());
				pstmt.setInt(11, vo1.getCartQuantity());
				pstmt.setString(12, vo.getUserId());
				pstmt.setString(13, vo.getUserEmail());
				pstmt.setInt(14, vo.getProductDelivery());
				pstmt.setInt(15, vo1.getProductPrice());
				pstmt.setString(16, vo1.getProductCategory());
				pstmt.setInt(17, vo.getOrderNo());
				
				pstmt.executeUpdate();
				
			  System.out.println("insert완료");
			}
			
		} catch (Exception e) {
			System.out.println("addOrder에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
	}//addOrder()
	
	public int orderNoCount() {//주문번호 조회
		int orderNo=0;
		try {
			conn=dbUtil.DBConnection.getConnection();
			
            sql =" select max(orderNo) from productOrder";
			
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				orderNo = rs.getInt(1) + 1;
			}else{
				orderNo = 1;
			}		
			
			
		} catch (Exception e) {
			System.out.println("orderNoCount에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return  orderNo;
	}//orderNoCount
	
	public List<OrderVO> orderList(String userId , int orderNo) {//주문내역
		  List list=new ArrayList();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select * from productOrder where userId=? and orderNo=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, orderNo);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				OrderVO vo=new OrderVO(rs.getInt("productNo"), rs.getInt("cartQuantity"), rs.getInt("productDelivery"),
						               rs.getInt("productPayment"), rs.getString("userZipcode"), rs.getString("userAddress1"),
						               rs.getString("userAddress2"), rs.getString("productName"), userId, 
						               rs.getString("productCategory"), rs.getString("orderState"), rs.getString("userEmail"), 
						               rs.getString("userName"), rs.getString("userPhone"), rs.getString("userComment"));
						
						
						
				 
				list.add(vo);
			}
			
		} catch (Exception e) {
         System.out.println("orderList에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
	}//orderList()
	
	
	public void orderDelete (String userId , int orderNo) {//결제 취소
		try {
			
			conn=dbUtil.DBConnection.getConnection();
			
			sql="update productOrder set orderstate=? where userId=?  and orderNo=? ";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "결제취소");
			pstmt.setString(2, userId);
			pstmt.setInt(3, orderNo);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("orderDelete에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
	}//orderDelete()
	
	
	public OrderVO selectOrderState(String userId, int orderNo) {//배송상태 조회
		 OrderVO vo=new OrderVO();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select orderState from productOrder where userId=? and orderNo=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setInt(2, orderNo);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setOrderState(rs.getString("orderState"));
				vo.setOrderNo(rs.getInt("orderNo"));
				vo.setOrderDate(rs.getTimestamp("orderDate"));
				vo.setUserName(rs.getString("userName"));
			}
		} catch (Exception e) {
			System.out.println("selectOrderState"+e.getMessage());
		}finally {
			freeResource();
		}
		return vo;
	}//selectOrderState()
	
	
	public void updateOrderState(String userId , int orderNo,String orderState) {//배송상태업데이트
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="update productOrder set orderState=? where userId=? and orderNo=?";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, orderState);
			pstmt.setString(2, userId);
			pstmt.setInt(3, orderNo);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateOrderState"+e.getMessage());
		}
	}//updateOrderState()
	
	public List<OrderVO> selectAllOrderList(){//관리자 모드에서 주문목록 보여주는거
		List<OrderVO> list= new ArrayList();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select * from productOrder";
			
			pstmt= conn.prepareStatement(sql);
			
		   rs=pstmt.executeQuery();
		
		   while(rs.next()) {
			       OrderVO vo = new OrderVO(rs.getInt("productNo"), rs.getInt("cartQuantity"), rs.getInt("productDelivery"), 
			    		                    rs.getInt("productPayment"),rs.getInt("orderNo"), rs.getString("userZipcode"), 
			    		                    rs.getString("userAddress1"),  rs.getString("userAddress2"), rs.getString("productName"), 
			    		                    rs.getString("userId"), rs.getString("productCategory"), rs.getString("orderState"), 
			    		                    rs.getString("userEmail"),  rs.getString("userName"), rs.getString("userPhone"), 
			    		                    rs.getString("userComment"), rs.getTimestamp("orderDate"));
			         	list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("selectAllOrderList에서오류"+e.getMessage());
		}finally {
			freeResource();
		}
		return list;
	}//selectAllOrderList
	
	public List<OrderVO> payList(String userId){//결제내역
		List<OrderVO> list=new ArrayList<OrderVO>();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select * from productOrder where userId=? order by orderNo desc ";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			       OrderVO vo = new OrderVO();
			           vo.setOrderDate(rs.getTimestamp("orderDate"));
			           vo.setProductName(rs.getString("productName"));
			           vo.setOrderNo(rs.getInt("orderNo"));
			           vo.setProductPayment(rs.getInt("productPayment"));
			           vo.setProductDelivery(rs.getInt("productDelivery"));
			           vo.setOrderState(rs.getString("orderState"));
			           vo.setCartQuantity(rs.getInt("cartQuantity"));
			           vo.setUserName(rs.getString("userName"));
			           vo.setOrderDate(rs.getTimestamp("orderDate"));
			           vo.setProductNo(rs.getInt("productNo"));
			           list.add(vo);
			}
			 
			 
		} catch (Exception e) {
			System.out.println("payList에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
	}//payList
	
	public List<OrderVO> orderNo(String userId){
		List<OrderVO> list=new ArrayList<OrderVO>();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select distinct orderNo,orderDate,orderState from productOrder where userId=? order by orderNo desc";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			       OrderVO vo = new OrderVO();
			           
			           vo.setOrderNo(rs.getInt("orderNo"));
			           vo.setOrderDate(rs.getTimestamp("orderDate"));
			           vo.setOrderState(rs.getString("orderState"));
			           list.add(vo);
			}
			
			 
			 
		} catch (Exception e) {
			System.out.println("orderNo1에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
		
	}//orderNo()

	
	public List<OrderVO> oderInfo(String userId , int orderNo){
		List<OrderVO> list=new ArrayList<OrderVO>();
		try {
			conn=dbUtil.DBConnection.getConnection();
			
			sql="select * from productOrder where userId=? and orderNo=?";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, orderNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			       OrderVO vo = new OrderVO(rs.getInt("productNo"), rs.getInt("cartQuantity"), rs.getInt("productDelivery"), 
			    		                    rs.getInt("productPayment"),rs.getInt("orderNo"), rs.getString("userZipcode"), 
			    		                    rs.getString("userAddress1"),  rs.getString("userAddress2"), rs.getString("productName"), 
			    		                    rs.getString("userId"), rs.getString("productCategory"), rs.getString("orderState"), 
			    		                    rs.getString("userEmail"),  rs.getString("userName"), rs.getString("userPhone"), 
			    		                    rs.getString("userComment"), rs.getTimestamp("orderDate"));
			         	list.add(vo);
			 
			}
			
		} catch (Exception e) {
			System.out.println("oderInfo에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
		
	}//orderInfo
	
}
