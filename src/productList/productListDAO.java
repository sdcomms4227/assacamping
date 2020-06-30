package productList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dbUtil.DBConnection;




public class productListDAO {
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

	public List<productListVO> selectAllList() {
		
		
		List<productListVO> proList = new ArrayList<productListVO>();
		
		try {
			con =db.getConnection();
		
			sql = "select * from productlist";
			pstmt = con.prepareStatement(sql);
		
			rs = pstmt.executeQuery();
			while(rs.next()) {
				productListVO proVO = new productListVO(rs.getInt("productNo"),
														rs.getInt("productPrice"), 
														rs.getInt("cartQuantity"), 
														rs.getInt("productRestQuantity"), 
														rs.getInt("productDelivery"), 
														rs.getString("productName"), 
														rs.getString("productInformation"), 
														rs.getString("productImage"), 
														rs.getString("productCategory"));
						
						
		
				
				proList.add(proVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return proList;
	
	}//selectAllList()

	public productListVO selectOnePro(int productNo) {
		
		productListVO onePro = new productListVO();
		
		try {

			con =db.getConnection();

			
			sql = "select * from productlist where productNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int _productNo = rs.getInt("productNo");
				int productPrice = rs.getInt("productPrice");
				int cartQuantity = rs.getInt("cartQuantity");
				int productDelivery = rs.getInt("productDelivery");
				String productName = rs.getString("productName");
				String productInformation = rs.getString("productInformation");
				String productImage = rs.getString("productImage");
				String productCategory = rs.getString("productCategory");
				
				onePro.setProductNO(_productNo); 
				onePro.setProductPrice(productPrice);
				onePro.setCartQuantity(cartQuantity);
				onePro.setProductDelivery(productDelivery);
				onePro.setProductName(productName);
				onePro.setProductInformation(productInformation);
				onePro.setProductImage(productImage);
				onePro.setProductCategory(productCategory);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return onePro;
		
	}//selectOnePro()
}
