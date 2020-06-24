package reply;

import java.util.List;


public class ReplyService {
	ReplyDAO replyDAO;
	
	public ReplyService() {
		replyDAO = new ReplyDAO();
	}
	
	public List<ReplyVO> getReplyList(){
		return replyDAO.getReplyList();
	}

	public int insertReply(ReplyVO replyVO) {
		return replyDAO.insertReply(replyVO);
		
	}

	/*
	 * update는 보류
	public int updateBoardCategory(BoardCategoryVO boardCategoryVO) {
		return boardCategoryDAO.updateBoardCategory(boardCategoryVO);
	}
	 */
	
	public int deleteReply(int replyNo) {
		return replyDAO.deleteReply(replyNo);		
	}

	public ReplyVO getLastReply() {
		return replyDAO.getLastReply();
	}
	
}
