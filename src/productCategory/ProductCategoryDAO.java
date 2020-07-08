package productCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductCategoryDAO {

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
	
	
	// 모든 카테고리 받아오기
	public List<ProductCategoryVO> selectAllproductCategory() {
		List<ProductCategoryVO> productCategoryList = new ArrayList<ProductCategoryVO>();
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String query = "SELECT * FROM productCategory";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int productCategoryNo = rs.getInt(1);
				String productCategoryName = rs.getString(2);
				
				// 생성자로 할지 or setter메소드를 쓸지
				ProductCategoryVO productCategory = new ProductCategoryVO();
				productCategory.setProductCategoryNo(productCategoryNo);
				productCategory.setProductCategoryName(productCategoryName);
				
				productCategoryList.add(productCategory);
			}
		} catch (Exception e) {
			System.out.println("getAllproductCategories()메소드 내부에서 오류 : " + e.toString());
		} finally {
			freeResource();
		}
		return productCategoryList;
	}

	// 카테고리 추가
	public int insertNewproductCategory(ProductCategoryVO productCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String productCategoryName = productCategoryVO.getProductCategoryName();
			String sql = "insert into boardCategory(boardCategoryName) values(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCategoryName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertNewBoardCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}

	public int insertNewProductCategory(ProductCategoryVO productCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String productCategoryName = productCategoryVO.getProductCategoryName();
			String sql = "insert into productCategory(productCategoryName) values(?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCategoryName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertNewProductCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}


	public int updateProductCategory(ProductCategoryVO productCategoryVO) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			int productCategoryNo = productCategoryVO.getProductCategoryNo();
			String productCategoryName = productCategoryVO.getProductCategoryName();
			String sql = "update productCategory set productCategoryName = ? where productCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productCategoryName);
			pstmt.setInt(2, productCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateProductCategory()메소드 내부에서 오류 : " + e.toString());
		}		
		
		return 0;
	}


	public int deleteProductCategory(int productCategoryNo) {
		try {
			conn = dbUtil.DBConnection.getConnection();
			String sql = "delete from productCategory where productCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCategoryNo);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteProductCategory()메소드 내부에서 오류 : " + e.toString());
		}			
		
		return 0;	
	}
	
	public ProductCategoryVO ProductCategoryName(int productCategoryNo) {
		ProductCategoryVO vo=new ProductCategoryVO();
		try {
			conn = dbUtil.DBConnection.getConnection();
			
			String sql = "select productCategoryName from productCategory where productCategoryNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productCategoryNo);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				
				vo.setProductCategoryName(rs.getString("productCategoryName"));
				
			}
		} catch (Exception e) {
			System.out.println("ProductCategoryName()메소드 내부에서 오류 : " + e.toString());
		}			
		
		return vo;
	}
}
