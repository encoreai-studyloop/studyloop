package dbbean;

import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.ArticleReportDataBean;
import databean.AttendDataBean;
import databean.AttendanceCheckDataBean;
import databean.ScheduleDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserDataBean;
import databean.UserReportDataBean;

public class ProcessDBBean implements ProcessDao{
	@Override
	public List<ScheduleDataBean> selectSchedulebyId(int study_id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.selectSchedulebyId", study_id);
	}
	
	@Override
	public int updateCalendar(Map<String, Object> map) {
		int res=0;
		if(map.containsKey("id")) {	
			res = SqlMapClient.getSession().update("Studyloop.updateCalendar", map);
		}
		else {
			res = SqlMapClient.getSession().insert("Studyloop.insertCalendar", map);
		}

		return res;
	}
	
	@Override
	public int deleteCalendar(List<String> list) {
		int res= 0;
		for(int i = 0; i<list.size();i++) {
			int id = Integer.parseInt(list.get(i));
			res= SqlMapClient.getSession().delete("Studyloop.deleteCalendar", id);
		}
		return res;
	}
	
	@Override
	public List<String> getHstudyInfo(int id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getHstudyInfo", id);
	}
	
	@Override
	public List<String> getPstudyInfo(int id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getPstudyInfo", id);
	}
	
	@Override
	public UserDataBean getUser(int id) {
		
		return SqlMapClient.getSession().selectOne("Studyloop.getUser", id);
	}
	
	@Override
	public List<StudyDataBean> getAttendee(int id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getAttendee", id);
	}
	
	@Override
	public List<StudyDataBean> getStudyforAt(int id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getStudyforAt", id);
	}
	
	@Override
	public List<UserDataBean> getHattendCheckTable(Map<String, Integer> map) {
		return SqlMapClient.getSession().selectList("Studyloop.getHattendCheckTable", map);
	}
	
	@Override
	public int checkAttendData(AttendDataBean attendDto) {
		
		return SqlMapClient.getSession().selectOne("Studyloop.checkAttendData", attendDto);
	}
	

	@Override
	public int updateHattendListTable(AttendDataBean attendDto) {
		
		return SqlMapClient.getSession().update("Studyloop.updateHattendListTable", attendDto);
	}
	

	@Override
	public int insertHattendListTable(AttendDataBean attendDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.insertHattendListTable", attendDto);
	}
	
	@Override
	public int updateRate(Map<String,Object> map) {
		
		return SqlMapClient.getSession().update("Studyloop.updateRate", map);
	}
	
	@Override
	public int updatePoint(Map<String,Object> map) {
		
		return SqlMapClient.getSession().update("Studyloop.updatePoint", map);
	}
	

//	@Override
//	public List<AttendDataBean> getHattendListTable(Map<String, Integer> info) {
//		
//		return SqlMapClient.getSession().selectList("Studyloop.getHattendListTable", info);
//	}
//	
//	@Override
//	public List<AttendDataBean> getPattendListTable(Map<String, Integer> info) {
//		
//		return SqlMapClient.getSession().selectList("Studyloop.getPattendListTable", info);
//	}
	@Override
	public int putArticleRep(ArticleReportDataBean areportDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.putArticleRep", areportDto);
	}
	@Override
	public int putStudyRep(StudyReportDataBean sreportDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.putStudyRep", sreportDto);
	}
	@Override
	public int putUserRep(UserReportDataBean ureportDto) {
		
		return SqlMapClient.getSession().insert("Studyloop.putUserRep", ureportDto);
	}
	
	@Override
	public List<AttendanceCheckDataBean> getAttendanceStatus(int study_id) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getAttendanceStatus", study_id);
	}
}
