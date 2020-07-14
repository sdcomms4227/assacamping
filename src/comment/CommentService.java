package comment;

import java.util.List;


public class CommentService {
	CommentDAO commentDAO;
	
	public CommentService() {
		commentDAO = new CommentDAO();
	}
	
	public List<CommentVO> getCommentList(int eventNo){
		return commentDAO.getCommentList(eventNo);
	}

	public int insertComment(CommentVO commentVO) {
		return commentDAO.insertComment(commentVO);
		
	}

	public int updateComment(int commentNo, String userId, String updateContent) {
		return commentDAO.updateComment(commentNo, userId, updateContent);
	}
	
	public int deleteComment(int commentNo, String userId) {
		return commentDAO.deleteComment(commentNo, userId);		
	}

	public CommentVO getLastComment() {
		return commentDAO.getLastComment();
	}

	public int replyComment(CommentVO commentVO, CommentVO parentVO) {
		return commentDAO.replyComment(commentVO, parentVO);
	}

	public CommentVO getComment(int parentNo) {
		return commentDAO.getComment(parentNo);
	}

	public int replyUpdate(CommentVO parentVO) {
		return commentDAO.replyUpdate(parentVO);
	}
	
}
