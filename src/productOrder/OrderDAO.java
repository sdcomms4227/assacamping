package productOrder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import dbUtil.DBConnection;

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

	public List<OrderVO> orderList(String userId){
		   List<OrderVO> list=new ArrayList();
		try {
			con=db.getConnection();
			
			sql="select * from order where userId=?";
			
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			  OrderVO vo= new OrderVO(
					  rs.getInt("productNO"),
					  rs.getInt("cartQuantity"),
					  rs.getInt("productDelivery"), 
					  rs.getInt("productPrice"), 
					  rs.getInt("userZipcode"), 
					  rs.getString("userAddress1"),
					  rs.getString("userAddress2"),
					  rs.getString("productName"), 
					  rs.getString("userEmail"),
					  rs.getString("userName"),
					  rs.getString("userPhone"),
					  rs.getString("userComment"));	
			  
			  list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("orderList에서 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
		return list;
	}//orderList
	
	public int orderCount(String userId) {
		  int total=0;
		try {
			con=db.getConnection();
			
			sql="select count(*) from cart where userId=?";
			
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
}
