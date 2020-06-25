package reply;

import java.util.List;


public class ReplyService {
	ReplyDAO replyDAO;
	
	public ReplyService() {
		replyDAO = new ReplyDAO();
	}
	
	public List<ReplyVO> getReplyList(int boardCategoryNo, int boardNo){
		return replyDAO.getReplyList(boardCategoryNo, boardNo);
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
	
	public int deleteReply(int replyNo, String userId) {
		return replyDAO.deleteReply(replyNo, userId);		
	}

	public ReplyVO getLastReply() {
		return replyDAO.getLastReply();
	}
	
}
