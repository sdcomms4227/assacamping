package productAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductAdminDAO {
	
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

	public List<Map<String,Object>> getProductList(Map<String, Object> searchMap) {

		List<Map<String,Object>> productList = new ArrayList<Map<String,Object>>();
		
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1)*10;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();
			
			if(searchCategoryNo==0) {
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " order by pr.productNo desc"
						+ "	limit ?, 10";
				
				pstmt = conn.prepareStatement(sql);
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
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, searchCategoryNo);
				pstmt.setInt(3, offset);
			}
			
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


	public int getProductCount(Map<String, Object> searchMap) {

		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sql = "";
		
		try {
			conn = dbUtil.DBConnection.getConnection();

			if(searchCategoryNo==0) {
				sql = "select count(productNo) from product"
						+ " where productName like ?";
						
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
			}else {
				sql = "select count(productNo) from product"
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
			System.out.println("getProductCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
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

	public int getProductLastNo() {
		
		int lastNo = 0;

		try {
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "select max(productNo) from product";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				lastNo = rs.getInt(1);
			}else {
				lastNo = 0;
			}
			
		} catch(Exception e) {
			System.out.println("getProductMaxNo()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}

		return lastNo;
	}
	
	public int insertProduct(ProductAdminVO productAdminVO) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into product(productName, productInformation, productImageName1, productImageName2, productImageName3, productPrice, productQuantity, productCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productAdminVO.getProductName());
			pstmt.setString(2, productAdminVO.getProductInformation());
			pstmt.setString(3, productAdminVO.getProductImageName1());
			pstmt.setString(4, productAdminVO.getProductImageName2());
			pstmt.setString(5, productAdminVO.getProductImageName3());
			pstmt.setInt(6, productAdminVO.getProductPrice());
			pstmt.setInt(7, productAdminVO.getProductQuantity());
			pstmt.setInt(8, productAdminVO.getProductCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertProduct()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}	
		
		return 0;
	}

	public int updateProduct(ProductAdminVO productAdminVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		
		String productImageName1 = originalImageNameMap.get("originalImageName1");
		String productImageName2 = originalImageNameMap.get("originalImageName2");
		String productImageName3 = originalImageNameMap.get("originalImageName3");
		
		if (deleteFileMap.get("deleteFile2") != null) {
			productImageName2 = null;
		}
		if (deleteFileMap.get("deleteFile3") != null) {
			productImageName3 = null;
		}
		
		if (productAdminVO.getProductImageName1() != null) {
			productImageName1 = productAdminVO.getProductImageName1();
		}
		if (productAdminVO.getProductImageName2() != null) {
			productImageName2 = productAdminVO.getProductImageName2();
		}
		if (productAdminVO.getProductImageName3() != null) {
			productImageName3 = productAdminVO.getProductImageName3();
		}
		
		try {
			conn = dbUtil.DBConnection.getConnection();					
			String sql = "update product set productName=?, productInformation=?, productImageName1=?, productImageName2=?, productImageName3=?, productPrice=?, productQuantity=?, productCategoryNo=? where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productAdminVO.getProductName());
			pstmt.setString(2, productAdminVO.getProductInformation());
			pstmt.setString(3, productImageName1);
			pstmt.setString(4, productImageName2);
			pstmt.setString(5, productImageName3);
			pstmt.setInt(6, productAdminVO.getProductPrice());
			pstmt.setInt(7, productAdminVO.getProductQuantity());
			pstmt.setInt(8, productAdminVO.getProductCategoryNo());
			pstmt.setInt(9, productAdminVO.getProductNo());
	
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("updateProduct()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	
		return 0;
	}

	public int deleteProduct(int productNo) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from product where productNo=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
	
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("deleteProduct()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
	
		return 0;
	}	
}