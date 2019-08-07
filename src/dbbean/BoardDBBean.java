package dbbean;

import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.BoardDataBean;
import databean.CommentDataBean;

public class BoardDBBean implements BoardDao {
	@Override
	public List<BoardDataBean> loadBoardlist(int study_id) {
		return SqlMapClient.getSession().selectList("Studyloop.loadBoardlist", study_id);
	}
	
	@Override
	public int insertBoard(BoardDataBean boardDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.insertBoard", boardDto);
	}
	
	@Override
	public BoardDataBean getArticle(Map<String,Integer> map) {
		return SqlMapClient.getSession().selectOne("Studyloop.getArticle", map);
	}
	@Override
	public int deleteArticle(Map<String, Integer> map) {
		
		return SqlMapClient.getSession().delete("Studyloop.deleteArticle", map);
	}
	
	@Override
	public List<CommentDataBean> selectBoardCommentByCode(int board_id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.selectBoardCommentByCode", board_id);
	}
	
	
	@Override
	public int addComment(CommentDataBean commentDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.addComment", commentDto);
	}
	
	
	@Override
	public List<BoardDataBean> getAllboardarticles() {
		
		return SqlMapClient.getSession().selectList("Studyloop.getAllboardarticles");
	}

	@Override
	public int delComment( int comment_id ) {
		return SqlMapClient.getSession().delete( "Studyloop.deleteComment", comment_id );
	}
}
