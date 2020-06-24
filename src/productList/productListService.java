package productList;

import java.util.ArrayList;
import java.util.List;


public class productListService {
productListDAO proDAO;
	
	public productListService() {
		proDAO = new productListDAO();
	}
	
	public List<productListVO> proAllList(){
		
		List<productListVO> proList = new ArrayList<productListVO>();
		
		proList = proDAO.selectAllList();
		
		return proList;
		
	}
	
	public productListVO getOnePro(int productNo){
		
		productListVO onePro = new productListVO();
		onePro = proDAO.selectOnePro(productNo); 
		return onePro;
	}
}
