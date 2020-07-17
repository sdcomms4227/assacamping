package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO {
	
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
		
		int numberPerPage = 12;
		int pageNo = (int)searchMap.get("pageNo");
		int offset = (pageNo - 1) * numberPerPage;
		String searchKeyword = (String)searchMap.get("searchKeyword");
		int searchCategoryNo = (int)searchMap.get("searchCategoryNo");
		String sortType = (String)searchMap.get("sortType");
		String orderByString = "";
		String sql = "";
		
		if(sortType==null || sortType.equals("")) {
			sortType = "new";
		}

		if (sortType.equals("new")) {
			orderByString = "pr.productDate desc, pr.productNo desc";
		} else if (sortType.equals("best")) {
			orderByString = "pr.productRating desc, pr.productNo desc";
		} else if (sortType.equals("minprice")) {
			orderByString = "pr.productPrice asc, pr.productNo desc";
		} else if (sortType.equals("maxprice")) {
			orderByString = "pr.productPrice desc, pr.productNo desc";
		} else {
			orderByString = "pr.productDate desc, pr.productNo desc";
		}
		
		try {
			
			conn = dbUtil.DBConnection.getConnection();

			if(searchCategoryNo==0) {
				sql = "	select *"
						+ " from product pr"
						+ " join productCategory ct"
						+ " on pr.productCategoryNo = ct.productCategoryNo"
						+ " where pr.productName like ?"
						+ " order by " + orderByString
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
						+ " order by " + orderByString
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
				productVO.setProductDate(rs.getTimestamp("productDate"));
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductImageName2(rs.getString("productImageName2"));
				productVO.setProductImageName3(rs.getString("productImageName3"));
				productVO.setProductContent(rs.getString("productContent"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductNo(rs.getInt("productNo"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
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
		String searchCategoryString = "";
		String sql = "";
		
		if (searchCategoryNo != 0) {
			searchCategoryString = "like " + Integer.toString(searchCategoryNo);
		} else {
			searchCategoryString = "> 0";
		}
		
		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "select count(productNo) from product"
					+ " where productName like ?"
					+ " and productCategoryNo " + searchCategoryString;
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%' + searchKeyword + '%');
			
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
				productVO.setProductNo(rs.getInt("productNo"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductContent(rs.getString("productContent"));
				productVO.setProductImageName1(rs.getString("productImageName1"));
				productVO.setProductImageName2(rs.getString("productImageName2"));
				productVO.setProductImageName3(rs.getString("productImageName3"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				productVO.setProductDate(rs.getTimestamp("productDate"));
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));				
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

	public int updateProductRating(int productNo, int avgRating) {
					
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "update product set productRating=? where productNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, avgRating);
			pstmt.setInt(2, productNo);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("updateProductRating()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
			
		return 0;
	}

	public int getProductQuantity(int productNo) {

		String sql = "";
				
		try {
			conn = dbUtil.DBConnection.getConnection();
			sql = "select productQuantity from product where productNo=?";					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getProductQuantity()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}

	public int incrementProductQuantity(int productNo, int quantityCount) {

		String sql = "";
				
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			sql = "update product set productQuantity = productQuantity + ? where productNo=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantityCount);
			pstmt.setInt(2, productNo);
			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			System.out.println("incrementProductQuantity()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;
	}

	public int decrementProductQuantity(int productNo, int quantityCount) {

		String sql = "";
				
		try {
			conn = dbUtil.DBConnection.getConnection();

			sql = "update product set productQuantity = productQuantity - ? where productNo=?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantityCount);
			pstmt.setInt(2, productNo);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("decrementProductQuantity()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		
		return 0;		
	}
}