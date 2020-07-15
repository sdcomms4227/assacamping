package wishList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WishListService {

	WishListDAO wishListDAO;

	public WishListService() {
		wishListDAO = new WishListDAO();
	}

	public Map<String, Object> getWishList(String userId) {
		Map<String, Object> wListMap = new HashMap<>();
		List<Map<String, Object>> wList = wishListDAO.getWishList(userId);
		wListMap.put("wList", wList);

		int totalCount = wList.size();
		wListMap.put("totalCount", totalCount);

		return wListMap;
	}

	public int addWishList(String userId, int productNo) {
		int check = 0;
		int result = 0;
		
		check = wishListDAO.checkWish(userId, productNo);
		
		if(check == 1) {
			result = 2;
			return result;
		} else {
			int wishNo = wishListDAO.getMaxWishNo();
			result = wishListDAO.addWishList(userId, productNo, wishNo);
		}
		
		return result; 
	}

	public int deleteWish(int wishNo) {
		return wishListDAO.deleteWish(wishNo);
	}

	public int wishTotalCount(String userId) {
		return wishListDAO.wishTotalCount(userId);
	}

	public int deleteAllWish(String userId) {
		return wishListDAO.deleteAllWish(userId);
	}

}
