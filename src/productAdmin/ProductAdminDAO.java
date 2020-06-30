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
				productAdminVO.setProductImageName(rs.getString("productImageName"));
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


	public int getProductListCount(Map<String, Object> searchMap) {

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
			System.out.println("getProductListCount()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
	
	public ProductAdminVO getProductItem(int productNo) {
		
		ProductAdminVO productAdminVO = new ProductAdminVO();
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from product where productNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productAdminVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productAdminVO.setProductDate(rs.getTimestamp("productDate"));
				productAdminVO.setProductImageName(rs.getString("productImageName"));
				productAdminVO.setProductInformation(rs.getString("productInformation"));
				productAdminVO.setProductName(rs.getString("productName"));
				productAdminVO.setProductNo(rs.getInt("productNo"));
				productAdminVO.setProductPrice(rs.getInt("productPrice"));
				productAdminVO.setProductQuantity(rs.getInt("productQuantity"));
			}			
			
		} catch(Exception e) {
			System.out.println("getProductItem()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productAdminVO;
	}

	public String getCategoryName(int categoryNo) {
		
		String productCategoryName = null;
		
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "select * from productCategory where productCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				productCategoryName = rs.getString("productCategoryName");
			}			
			
		} catch(Exception e) {
			System.out.println("getCategoryName()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return productCategoryName;
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
			String sql = "insert into product(productName, productInformation, productPrice, productImageName, productCategoryNo, productQuantity)"
					+ "values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productAdminVO.getProductName());
			pstmt.setString(2, productAdminVO.getProductInformation());
			pstmt.setInt(3, productAdminVO.getProductPrice());
			pstmt.setString(4, productAdminVO.getProductImageName());
			pstmt.setInt(5, productAdminVO.getProductCategoryNo());
			pstmt.setInt(6, productAdminVO.getProductQuantity());
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("insertProduct()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}	
		
		return 0;
	}

	public int updateProduct(ProductAdminVO productAdminVO) {
		
		String productImageName = productAdminVO.getProductImageName();
				
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			if(productImageName!=null) {				
				String sql = "update product set productName=?, productInformation=?, productPrice=?, productImageName=?, productCategoryNo=?, productQuantity=? where productNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productAdminVO.getProductName());
				pstmt.setString(2, productAdminVO.getProductInformation());
				pstmt.setInt(3, productAdminVO.getProductPrice());
				pstmt.setString(4, productImageName);
				pstmt.setInt(5, productAdminVO.getProductCategoryNo());
				pstmt.setInt(6, productAdminVO.getProductQuantity());
				pstmt.setInt(7, productAdminVO.getProductNo());
			}else{
				String sql = "update product set productName=?, productInformation=?, productPrice=?, productCategoryNo=?, productQuantity=? where productNo=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productAdminVO.getProductName());
				pstmt.setString(2, productAdminVO.getProductInformation());
				pstmt.setInt(3, productAdminVO.getProductPrice());
				pstmt.setInt(4, productAdminVO.getProductCategoryNo());
				pstmt.setInt(5, productAdminVO.getProductQuantity());
				pstmt.setInt(6, productAdminVO.getProductNo());
			}
	
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