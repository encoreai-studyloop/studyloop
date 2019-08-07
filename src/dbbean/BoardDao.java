package dbbean;

import java.util.List;
import java.util.Map;

import databean.BoardDataBean;
import databean.CommentDataBean;

public interface BoardDao {
	public List<BoardDataBean> loadBoardlist(int study_id);
	public int insertBoard(BoardDataBean boardDto);
	public BoardDataBean getArticle(Map<String,Integer> map);
	public List<CommentDataBean> selectBoardCommentByCode(int board_id);
	public int addComment(CommentDataBean commentDto);
	public int deleteArticle(Map<String,Integer> map);
	public List<BoardDataBean> getAllboardarticles();
	public int delComment( int comment_id );
}
