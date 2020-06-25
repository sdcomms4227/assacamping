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
	
	public void insertOrder(OrderVO vo) {
		
		try {
			con=db.getConnection();
			
			sql="insert into productOrder(productPrice)";
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			freeResource();
		}
	}
}
