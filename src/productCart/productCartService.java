package productCart;

import java.util.List;

public class productCartService {
	productCartDAO dao;
	public List<productCartVO> AllcartList(String userId){
		
		return dao.AllCartList(userId);
	}

}
