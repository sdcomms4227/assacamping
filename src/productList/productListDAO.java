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

	public List<Map<String,Object>> getProductList(Map<String, Object> searchMap ) {

		List<Map<String,Object>> productList = new ArrayList<Map<String,Object>>();
		
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			
			con = dbUtil.DBConnection.getConnection();
			
			if(searchCategoryNo==0) {
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " order by pr.productNo desc"
						+ "	limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, offset);
			}else {
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " and pr.productCategoryNo = ?"
						+ " order by pr.productNo desc"
						+ "	limit ?, 10";		
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
				pstmt.setInt(3, offset);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> productMap = new HashMap<String, Object>();
				productListVO proVO = new productListVO();
				
				
				
				
				proVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				proVO.setProductDate(rs.getTimestamp("productDate"));
				proVO.setProductImageName1(rs.getString("productImageName1"));
				proVO.setProductImageName2(rs.getString("productImageName2"));
				proVO.setProductImageName3(rs.getString("productImageName3"));
				proVO.setProductInformation(rs.getString("productInformation"));
				proVO.setProductName(rs.getString("productName"));
				proVO.setProductNo(rs.getInt("productNo"));
				proVO.setProductPrice(rs.getInt("productPrice"));
				proVO.setProductQuantity(rs.getInt("productQuantity"));
				
				String productCategoryName = rs.getString("productCategoryName");
				
				productMap.put("proVO", proVO);
				productMap.put("productCategoryName", productCategoryName);
								
				productList.add(productMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getProductList(Map)메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productList;		
	
	}//getProductList()
	
	
	public int getProductCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			con = dbUtil.DBConnection.getConnection();

			if(searchCategoryNo==0) {
				sql = "select count(productNo) from product"
						+ " where productName like ?";
						
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
			}else {
				sql = "select count(productNo) from product"
						+ " where productName like ?"
						+ " and productCategoryNo = ?";
						
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
			}			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getProductCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	

	public productListVO selectOnePro(int productNo) {
		
		productListVO onePro = new productListVO();
		
		try {

			con =db.getConnection();

			
			sql = "select * from product where productNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int _productNo = rs.getInt("productNo");
				int productPrice = rs.getInt("productPrice");
				String productName = rs.getString("productName");
				String productInformation = rs.getString("productInformation");
				String productImageName1 = rs.getString("productImageName1");
				String productImageName2 = rs.getString("productImageName2");
				String productImageName3 = rs.getString("productImageName3");
				int productCategoryNo = rs.getInt("productCategoryNo");
				
				
				
				onePro.setProductNo(_productNo); 
				onePro.setProductPrice(productPrice);
				onePro.setProductName(productName);
				onePro.setProductInformation(productInformation);
				onePro.setProductImageName1(productImageName1);
				onePro.setProductImageName2(productImageName2);
				onePro.setProductImageName3(productImageName3);
				onePro.setProductCategoryNo(productCategoryNo);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return onePro;
		
	}//selectOnePro()
}
