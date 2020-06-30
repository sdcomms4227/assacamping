package productOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import dbUtil.DBConnection;
import productCart.productCartVO;

public class OrderDAO {

	private DataSource dataFactory;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	private DBConnection db;
	
	
	public void freeResource() {
		if(rs != null) {try {rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException e){e.printStackTrace();}}	
		if(con != null) {try {con.close();}catch(SQLException e){e.printStackTrace();}}
	
	}//freeResource()

	
	public int orderCount(String userId) {//장바구니 총 상품개수
		  int total=0;
		try {
			con=db.getConnection();
			
			sql="select count(*) from productCart where userId=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
		
		} catch (Exception e) {
			System.out.println("orderCount에서 오류"+e.getMessage());
		}
		
		return total;
	}
	
	public void addOrder(List<productCartVO> orderList,OrderVO vo) {//주문
		 orderList=new ArrayList<productCartVO>();
	try {
			con=db.getConnection();
	        
			
	  for(int i=0 ;i<orderList.size();i++) { 	                                
		  
		       sql=" insert into productorder(productPayment,userZipcode,userAddress1,userAddress2,productName,userName,userPhone,userComment,orderDate,orderState,productNo)"
				 +" values(?,?,?,?,?,?,?,?,now(),?,?)";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.executeUpdate();
				
				
				pstmt.setInt(1, vo.getProductPayment());
				pstmt.setString(2, vo.getUserZipcode());
				pstmt.setString(3, vo.getUserAddress1());
				pstmt.setString(4, vo.getUserAddress2());
				pstmt.setString(5, vo.getProductName());
				pstmt.setString(6, vo.getUserName());
				pstmt.setString(7, vo.getUserPhone());
				pstmt.setString(8, vo.getUserComment());
				pstmt.setString(9, vo.getOrderState());
				pstmt.setInt(10, vo.getProductNo());
				
				pstmt.executeUpdate();
			
			}
			
		} catch (Exception e) {
			System.out.println("addOredr에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
	}
	
	public OrderVO orderList(String userId) {
		try {
			con=db.getConnection();
			
			sql="selsect * from productorder where userId=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderVO vo=new OrderVO( rs.getInt("productNo"),
						                rs.getInt("cartQuantity"), 
						                rs.getInt("productDelivery"),
						                rs.getInt("productPayment"),
										rs.getString("userZipcode"),
										rs.getString("userAddress1"), 
										rs.getString("userAddress2"), 
									    rs.getString("productName"),
										rs.getString("userEmail"), 
										rs.getString("userName"), 
										rs.getString("userPhone"), 
										rs.getString("userComment"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
}
