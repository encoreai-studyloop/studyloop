package dbbean;


import java.util.List;
import java.util.Map;

import databean.ArticleReportDataBean;
import databean.AttendDataBean;
import databean.AttendanceCheckDataBean;
import databean.ScheduleDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserDataBean;
import databean.UserReportDataBean;

public interface ProcessDao {
	public List<ScheduleDataBean> selectSchedulebyId(int study_id);
	public int updateCalendar(Map<String,Object> map);
	public int deleteCalendar(List<String> list);
	public List<String> getHstudyInfo(int id);;
	public List<String> getPstudyInfo(int id);
	
	public UserDataBean getUser(int id);
	public List<StudyDataBean> getStudyforAt(int id);
	public List<StudyDataBean> getAttendee(int id);
	
	public List<UserDataBean> getHattendCheckTable(Map<String, Integer> map);
	public int checkAttendData (AttendDataBean attendDto);
	public int updateHattendListTable(AttendDataBean attendDto);
	public int insertHattendListTable(AttendDataBean attendDto);
//	public List<AttendDataBean> getHattendListTable(Map<String,Integer> info);
//	public List<AttendDataBean>getPattendListTable(Map<String,Integer> info);
	public int updatePoint(Map<String,Object> map);
	
	public int updateRate (Map<String,Object> map);
	
	public int putUserRep (UserReportDataBean ureportDto);
	public int putArticleRep (ArticleReportDataBean areportDto);
	public int putStudyRep (StudyReportDataBean sreportDto);
	public String repCat (int rep_id);
	
	public List<AttendanceCheckDataBean> getAttendanceStatus(int study_id);
}
