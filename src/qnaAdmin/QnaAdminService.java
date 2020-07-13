package qnaAdmin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import qna.QnaVO;

public class QnaAdminService {

	QnaAdminDAO qnaAdminADO;

	public QnaAdminService() {
		qnaAdminADO = new QnaAdminDAO();
	}

	public Map<String, Object> listQna(Map<String, Object> searchMap) {

		Map<String, Object> qnaListMap = new HashMap<String, Object>();

		List<Map<String, Object>> qnaList = qnaAdminADO.getQnaList(searchMap);
		qnaListMap.put("qnaList", qnaList);

		int totalCount = qnaAdminADO.getQnaListCount(searchMap);
		qnaListMap.put("totalCount", totalCount);

		return qnaListMap;
	}

	public Map<String, Object> readQna(int qnaNo) {
		return qnaAdminADO.getQna(qnaNo);
	}

	public int updateQna(QnaVO qnaVO) {
		return qnaAdminADO.updateQna(qnaVO);
	}

	public int deleteQna(int qnaNo) {
		return qnaAdminADO.deleteQna(qnaNo);
	}

}