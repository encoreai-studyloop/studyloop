package dbbean;

import java.util.List;

import commons.SqlMapClient;
import databean.AttendeeDataBean;
import databean.CategoryDataBean;
import databean.CategoryTempBean;
import databean.LocationDataBean;
import databean.StudyDataBean;
import databean.StudyRegCategoryDataBean;
import databean.StudyTimeDataBean;

public class HostDBBean implements HostDao{
	@Override
	public AttendeeDataBean getAttendee(String id) {
		return null;
	}
	
	public int insertAttendee(AttendeeDataBean attendeeDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertAttendee",attendeeDto);
	}
	
	public String approveMember(AttendeeDataBean attendeeDto) {
		return null;
	}
	
	public StudyDataBean getStudy(int id) {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudy",id);
	}
	
	public int insertStudyTimeInfo(StudyTimeDataBean studytimeDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertStudyTimeInfo",studytimeDto);
	}
	
	public int insertStudyInfo(StudyDataBean studyDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertStudyInfo",studyDto);
	}
	
	public int modifyStudyInfo(StudyDataBean studyDto) {
		return SqlMapClient.getSession().update("Studyloop.modifyStudyInfo",studyDto);
	}
	
	public int deleteStudyInfo(int id) {
		return SqlMapClient.getSession().delete("Studyloop.deleteStudyInfo", id);
	}
	
	@Override
	public int getStudycatId() {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudycatId");
	}
	
	@Override
	public int getStudytimeId() {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudytimeId");
		
	}
	@Override
	public int modifyStudyTimeInfo(StudyTimeDataBean studytimeDto) {
		return SqlMapClient.getSession().update("Studyloop.modifyStudyTimeInfo", studytimeDto);
	}
	
	@Override
	public StudyTimeDataBean getStudyTime(int id) {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudyTime",id);
	}
	
	@Override
	public List<LocationDataBean> getStudyLocation() {
		return SqlMapClient.getSession().selectList("Studyloop.getStudyLocation");
	}

	@Override
	public List<StudyRegCategoryDataBean> getStudyCategory() {
		return SqlMapClient.getSession().selectList("Studyloop.getStudyCategory");
	}
	
	@Override
	public String getLocationById(int id) {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudylocById",id);
	}
	
	@Override
	public String getCategoryById(int id) {
		return SqlMapClient.getSession().selectOne("Studyloop.getStudycatById",id);
	}

}