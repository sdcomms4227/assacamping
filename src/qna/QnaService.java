package qna;

import java.util.List;

public class QnaService {

	QnaDAO qnaDAO;
	
	public QnaService() {
		qnaDAO = new QnaDAO();
	}
	
	public List<QnaVO> getQnaList(int productNo) {
		return qnaDAO.getQnaList(productNo);
	}

	public int insertQna(QnaVO qnaVO) {
		// TODO Auto-generated method stub
		return qnaDAO.insertQna(qnaVO);
	}

	public int deleteQna(int qnaNo, String userId) {
		return qnaDAO.deleteQna(qnaNo, userId);
	}

}
