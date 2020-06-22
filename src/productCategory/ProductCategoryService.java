package productCategory;

import java.sql.SQLException;
import java.util.List;

public class ProductCategoryService {
	
	ProductCategoryDAO productCategoryDAO;
	
	public ProductCategoryService() throws ClassNotFoundException, SQLException {
		productCategoryDAO = new ProductCategoryDAO();
	}
	
	public List<ProductCategoryVO> listProductCategories() {
		List<ProductCategoryVO> productCategoryList = productCategoryDAO.getAllproductCategories();
		return productCategoryList;
	}

}
