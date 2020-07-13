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

		// totalCount 수정해야함
		int totalCount = wList.size();
		wListMap.put("totalCount", totalCount);

		return wListMap;
	}

	public int addWishList(String userId, int productNo) {
		return wishListDAO.addWishList(userId, productNo);
	}

	public int deleteWish(int wishNo) {
		return wishListDAO.deleteWish(wishNo);
	}

	public int wishCheck(String userId, int productNo) {
		return wishListDAO.wishCheck(userId, productNo);
	}

	public int wishTotalCount(String userId) {
		return wishListDAO.wishTotalCount(userId);
	}

}
