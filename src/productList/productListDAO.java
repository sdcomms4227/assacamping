package productList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dbUtil.DBConnection;
import productAdmin.ProductAdminVO;




public class productListDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;
	private DBConnection db;
	
	public void freeResource() {
		if(rs != null) {try {rs.close();}catch(SQLException e){e.printStackTrace();}}
		if(pstmt != null) {try {pstmt.close();}catch(SQLException e){e.printStackTrace();}}	
		if(conn != null) {try {conn.close();}catch(SQLException e){e.printStackTrace();}}
	
	}//freeResource()

	public List<Map<String,Object>> getProductList() {

		List<Map<String,Object>> productList = new ArrayList<Map<String,Object>>();
		
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo";
					
				
				pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> productMap = new HashMap<String, Object>();
				ProductAdminVO productAdminVO = new ProductAdminVO();
				
				productAdminVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productAdminVO.setProductDate(rs.getTimestamp("productDate"));
				productAdminVO.setProductImageName1(rs.getString("productImageName1"));
				productAdminVO.setProductImageName2(rs.getString("productImageName2"));
				productAdminVO.setProductImageName3(rs.getString("productImageName3"));
				productAdminVO.setProductInformation(rs.getString("productInformation"));
				productAdminVO.setProductName(rs.getString("productName"));
				productAdminVO.setProductNo(rs.getInt("productNo"));
				productAdminVO.setProductPrice(rs.getInt("productPrice"));
				productAdminVO.setProductQuantity(rs.getInt("productQuantity"));
				
				String productCategoryName = rs.getString("productCategoryName");
				
				productMap.put("productAdminVO", productAdminVO);
				productMap.put("productCategoryName", productCategoryName);
								
				productList.add(productMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getProductList(Map)메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productList;		
	}

public Map<String, Object> getProductItem(int productNo) {
		
		Map<String, Object> productMap = new HashMap<String, Object>();
		ProductAdminVO productAdminVO = new ProductAdminVO();
		String productCategoryName = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select *"
					+ " from product pr"
					+ " join productCategory ct"
					+ " on pr.productCategoryNo = ct.productCategoryNo"
					+ " where pr.productNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productAdminVO.setProductNo(rs.getInt("productNo"));
				productAdminVO.setProductName(rs.getString("productName"));
				productAdminVO.setProductInformation(rs.getString("productInformation"));
				productAdminVO.setProductImageName1(rs.getString("productImageName1"));
				productAdminVO.setProductImageName2(rs.getString("productImageName2"));
				productAdminVO.setProductImageName3(rs.getString("productImageName3"));
				productAdminVO.setProductPrice(rs.getInt("productPrice"));
				productAdminVO.setProductQuantity(rs.getInt("productQuantity"));
				productAdminVO.setProductDate(rs.getTimestamp("productDate"));
				productAdminVO.setProductCategoryNo(rs.getInt("productCategoryNo"));				
				productCategoryName = rs.getString("productCategoryName");
			
				productMap.put("productAdminVO", productAdminVO);
				productMap.put("productCategoryName", productCategoryName);
			}
			
		} catch(Exception e) {
			System.out.println("getProductItem()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productMap;
	}
}
