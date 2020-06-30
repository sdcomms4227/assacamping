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
				ProductAdminVO productVO = new ProductAdminVO();
				
				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
				productVO.setProductDate(rs.getTimestamp("productDate"));
				productVO.setProductImageName(rs.getString("productImageName"));
				productVO.setProductInformation(rs.getString("productInformation"));
				productVO.setProductName(rs.getString("productName"));
				productVO.setProductNo(rs.getInt("productNo"));
				productVO.setProductPrice(rs.getInt("productPrice"));
				productVO.setProductQuantity(rs.getInt("productQuantity"));
				
				String productCategoryName = rs.getString("productCategoryName");
				
				productMap.put("productVO", productVO);
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
	
//	public ProductVO getProductItem(int productNo) {
//		
//		ProductVO productVO = new ProductVO();
//		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "select * from product where productNo = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, productNo);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				productVO.setProductCategoryNo(rs.getInt("productCategoryNo"));
//				productVO.setProductContent(rs.getString("productContent"));
//				productVO.setProductFileName(rs.getString("productFileName"));
//				productVO.setProductNo(rs.getInt("productNo"));
//				productVO.setProductRe_lev(rs.getInt("productRe_lev"));
//				productVO.setProductRe_ref(rs.getInt("productRe_ref"));
//				productVO.setProductRe_seq(rs.getInt("productRe_seq"));
//				productVO.setProductReadCount(rs.getInt("productReadCount"));
//				productVO.setProductTitle(rs.getString("productName"));
//				productVO.setProductWriteDate(rs.getTimestamp("productWriteDate"));
//				productVO.setUserId(rs.getString("userId"));
//			}			
//			
//		} catch(Exception e) {
//			System.out.println("getProductItem()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//		
//		return productVO;
//	}
//
//	public String getCategoryName(int categoryNo) {
//		
//		String productCategoryName = null;
//		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "select * from productCategory where productCategoryNo = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, categoryNo);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				productCategoryName = rs.getString("productCategoryName");
//			}			
//			
//		} catch(Exception e) {
//			System.out.println("getCategoryName()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//		
//		return productCategoryName;
//	}
//
//	public void incrementProductReadCount(int productNo) {
//		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "update product set productReadCount=productReadCount+1 where productNo = ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, productNo);
//			pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("incrementProductReadCount()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//	}
//
//	public int getProductMaxNo() {
//		
//		int maxNo = 0;
//
//		try {
//			conn = dbUtil.DBConnection.getConnection();			
//			String sql = "select max(productNo) from product";
//			pstmt = conn.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				maxNo = rs.getInt(1) + 1;
//			}else {
//				maxNo = 1;
//			}
//			
//		} catch(Exception e) {
//			System.out.println("getProductMaxNo()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//
//		return maxNo;
//	}
//	
//	public void insertProduct(ProductVO productVO, int maxNo) {
//				
//		try {			
//			conn = dbUtil.DBConnection.getConnection();			
//			String sql = "insert into product(productNo, productName, productContent, productFileName, userId, productRe_ref, productRe_lev, productRe_seq, productWriteDate, productReadCount, productCategoryNo)"
//					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, maxNo);
//			pstmt.setString(2, productVO.getProductTitle());
//			pstmt.setString(3, productVO.getProductContent());
//			pstmt.setString(4, productVO.getProductFileName());
//			pstmt.setString(5, productVO.getUserId());
//			pstmt.setInt(6, maxNo);
//			pstmt.setInt(7, 0);
//			pstmt.setInt(8, 0);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, productVO.getProductCategoryNo());
//			pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("insertProduct()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}		
//	}
//
//	public int updateProduct(ProductVO productVO, String deleteFile) {
//		
//		String productFileName = productVO.getProductFileName();
//				
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			
//			if(productFileName!=null) {				
//				String sql = "update product set productName=?, productContent=?, productFileName=?, productCategoryNo=? where productNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, productVO.getProductTitle());
//				pstmt.setString(2, productVO.getProductContent());
//				pstmt.setString(3, productFileName);
//				pstmt.setInt(4, productVO.getProductCategoryNo());
//				pstmt.setInt(5, productVO.getProductNo());				
//			}else if(deleteFile!=null){				
//				String sql = "update product set productName=?, productContent=?, productFileName=?, productCategoryNo=? where productNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, productVO.getProductTitle());
//				pstmt.setString(2, productVO.getProductContent());
//				pstmt.setString(3, null);
//				pstmt.setInt(4, productVO.getProductCategoryNo());
//				pstmt.setInt(5, productVO.getProductNo());
//			}else{
//				String sql = "update product set productName=?, productContent=?, productCategoryNo=? where productNo=?";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1, productVO.getProductTitle());
//				pstmt.setString(2, productVO.getProductContent());
//				pstmt.setInt(3, productVO.getProductCategoryNo());
//				pstmt.setInt(4, productVO.getProductNo());
//			}
//	
//			return pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("updateProduct()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//	
//		return 0;
//	}
//
//	public int deleteProduct(int productNo) {
//		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "delete from product where productNo=?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, productNo);
//	
//			return pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("deleteProduct()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}
//	
//	return 0;
//	}
//
//	public void updateProductSequence(ProductVO productVO) {
//		
//		try {
//			conn = dbUtil.DBConnection.getConnection();
//			String sql = "update product set productRe_seq=productRe_seq+1 where productRe_ref=? and productRe_seq>?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, productVO.getProductRe_ref());
//			pstmt.setInt(2, productVO.getProductRe_seq());
//			pstmt.executeUpdate();
//		} catch(Exception e) {
//			System.out.println("updateProductSequence()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}		
//	}
//
//	public void insertReplyProduct(ProductVO productVO, int maxNo) {
//		
//		try {			
//			conn = dbUtil.DBConnection.getConnection();			
//			String sql = "insert into product(productNo, productName, productContent, productFileName, userId, productRe_ref, productRe_lev, productRe_seq, productWriteDate, productReadCount, productCategoryNo)"
//					+ "values(?,?,?,?,?,?,?,?,now(),?,?)";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, maxNo);
//			pstmt.setString(2, productVO.getProductTitle());
//			pstmt.setString(3, productVO.getProductContent());
//			pstmt.setString(4, productVO.getProductFileName());
//			pstmt.setString(5, productVO.getUserId());
//			pstmt.setInt(6, productVO.getProductRe_ref());
//			pstmt.setInt(7, productVO.getProductRe_lev() + 1);
//			pstmt.setInt(8, productVO.getProductRe_seq() + 1);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, productVO.getProductCategoryNo());
//			pstmt.executeUpdate();			
//		} catch(Exception e) {
//			System.out.println("insertReplyProduct()메소드 내부에서 오류 : " + e.toString());
//		} finally {
//			freeResource();
//		}		
//	}
	
}