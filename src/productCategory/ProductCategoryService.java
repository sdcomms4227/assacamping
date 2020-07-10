package productCategory;

import java.util.List;

public class ProductCategoryService {
	
	ProductCategoryDAO productCategoryDAO;
	
	public ProductCategoryService() {
		productCategoryDAO = new ProductCategoryDAO();
	}
	
	public List<ProductCategoryVO> listProductCategory() {
		return productCategoryDAO.selectAllproductCategory();
	}

	public int addProductCategory(ProductCategoryVO productCategoryVO) {
		return productCategoryDAO.insertNewProductCategory(productCategoryVO);
	}

	public int updateProductCategory(ProductCategoryVO productCategoryVO) {
		return productCategoryDAO.updateProductCategory(productCategoryVO);
	}

	public int deleteProductCategory(int productCategoryNo) {
		return productCategoryDAO.deleteProductCategory(productCategoryNo);	
	}
   public ProductCategoryVO ProductCategoryName(int productCategoryNo) {
	   
	   return productCategoryDAO.ProductCategoryName(productCategoryNo);
   }
}
