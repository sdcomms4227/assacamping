package productCategory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductCategoryDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductCategoryDAO() throws ClassNotFoundException, SQLException {
		// ex) BBS to jspbeginner 
		String dbURL="jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";                             
        String dbID="root";
        String dbPassword="1234";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
	}
	
	// 모든 카테고리 받아오기
	public List<ProductCategoryVO> getAllproductCategories() {
		List<ProductCategoryVO> productCategoryList = new ArrayList<ProductCategoryVO>();
		try {
			String query = "SELECT * FROM productCategory";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int productCategoryNo = rs.getInt(1);
				String productCategoryName = rs.getString(2);
				
				ProductCategoryVO productCategory = new ProductCategoryVO();
				productCategory.setProductCategoryNo(productCategoryNo);
				productCategory.setProductCategoryName(productCategoryName);
				
				productCategoryList.add(productCategory);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productCategoryList;
	}

	// 카테고리 추가

	
	// 카테고리 삭제
	public void deleteCategory(int productCategoryNo) {
		try {
						
			// 오라클의 계층형 sql문을 이용해 삭제 글과 관련된 자식글까지 모두 삭제
			String query = "delete from productCategory where productCategoryNo=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, productCategoryNo);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
