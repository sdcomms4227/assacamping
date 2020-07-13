package productAdmin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import product.ProductVO;

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
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " order by pr.productNo desc"
						+ "	limit ?, ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, '%' + searchKeyword + '%');
				pstmt.setInt(2, offset);
				pstmt.setInt(3, numberPerPage);
			}else {
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " and pr.productCategoryNo = ?"
						+ " order by pr.productNo desc"
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
				ProductVO productVO = new ProductVO();
				
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productVO.setProductContent(rs.getString("productContent"));
				productVO.setProductDate(rs.getTimestamp("productDate"));
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductImageName2(rs.getString("productImageName2"));
				productVO.setProductImageName3(rs.getString("productImageName3"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductNo(rs.getInt("productNo"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				productVO.setProductRating(rs.getInt("productRating"));
				
				String productCategoryName = rs.getString("productCategoryName");
				
				productMap.put("productVO", productVO);
				productMap.put("productCategoryName", productCategoryName);
								
				productList.add(productMap);
			}			
			
		} catch(Exception e) {
			System.out.println("getProductList()메소드 내부에서 오류 : " + e.toString());
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
	
	public Map<String, Object> getProduct(int productNo) {
		
		Map<String, Object> productMap = new HashMap<String, Object>();
		ProductVO productVO = new ProductVO();
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
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productVO.setProductContent(rs.getString("productContent"));
				productVO.setProductDate(rs.getTimestamp("productDate"));
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductImageName2(rs.getString("productImageName2"));
				productVO.setProductImageName3(rs.getString("productImageName3"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductNo(rs.getInt("productNo"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				productVO.setProductRating(rs.getInt("productRating"));
							
				productCategoryName = rs.getString("productCategoryName");
			
				productMap.put("productVO", productVO);
				productMap.put("productCategoryName", productCategoryName);
			}
			
		} catch(Exception e) {
			System.out.println("getProduct()메소드 내부에서 오류 : " + e.toString());
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
	
	public int insertProduct(ProductVO productVO) {
				
		try {			
			conn = dbUtil.DBConnection.getConnection();			
			String sql = "insert into product(productName, productContent, productImageName1, productImageName2, productImageName3, productPrice, productQuantity, productCategoryNo)"
					+ "values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getProductName());
			pstmt.setString(2, productVO.getProductContent());
			pstmt.setString(3, productVO.getProductImageName1());
			pstmt.setString(4, productVO.getProductImageName2());
			pstmt.setString(5, productVO.getProductImageName3());
			pstmt.setInt(6, productVO.getProductPrice());
			pstmt.setInt(7, productVO.getProductQuantity());
			pstmt.setInt(8, productVO.getProductCategoryNo());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertProduct()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}	
		
		return 0;
	}

	public int updateProduct(ProductVO productVO, Map<String, String> originalImageNameMap, Map<String, String> deleteFileMap) {
		
		String productImageName1 = originalImageNameMap.get("originalImageName1");
		String productImageName2 = originalImageNameMap.get("originalImageName2");
		String productImageName3 = originalImageNameMap.get("originalImageName3");
		
		if (deleteFileMap.get("deleteFile2") != null) {
			productImageName2 = null;
		}
		if (deleteFileMap.get("deleteFile3") != null) {
			productImageName3 = null;
		}
		
		if (productVO.getProductImageName1() != null) {
			productImageName1 = productVO.getProductImageName1();
		}
		if (productVO.getProductImageName2() != null) {
			productImageName2 = productVO.getProductImageName2();
		}
		if (productVO.getProductImageName3() != null) {
			productImageName3 = productVO.getProductImageName3();
		}
		
		try {
			conn = dbUtil.DBConnection.getConnection();					
			String sql = "update product set productName=?, productContent=?, productImageName1=?, productImageName2=?, productImageName3=?, productPrice=?, productQuantity=?, productCategoryNo=? where productNo=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productVO.getProductName());
			pstmt.setString(2, productVO.getProductContent());
			pstmt.setString(3, productImageName1);
			pstmt.setString(4, productImageName2);
			pstmt.setString(5, productImageName3);
			pstmt.setInt(6, productVO.getProductPrice());
			pstmt.setInt(7, productVO.getProductQuantity());
			pstmt.setInt(8, productVO.getProductCategoryNo());
			pstmt.setInt(9, productVO.getProductNo());
	
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
	
	public void updateProductQuantity(int productNo , int cartQuantity) {
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "update product set productQuantity=productQuantity-?  where productNo=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cartQuantity);
			pstmt.setInt(2, productNo);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("updateProductQuantity()메소드 내부에서 오류 : " + e.toString());
		}finally {
			freeResource();
		}

	}//updateProductQuantity()
}