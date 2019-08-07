package dbbean;

import java.util.List;

import databean.AttendeeDataBean;
import databean.CategoryDataBean;
import databean.CategoryTempBean;
import databean.LocationDataBean;
import databean.StudyDataBean;
import databean.StudyRegCategoryDataBean;
import databean.StudyTimeDataBean;

public interface HostDao {
	public AttendeeDataBean getAttendee(String id);
	public StudyDataBean getStudy(int id);
	public int insertAttendee(AttendeeDataBean attendeeDto);
	public String approveMember(AttendeeDataBean attendeeDto);
	public int insertStudyTimeInfo(StudyTimeDataBean studytimeDto);
	public int insertStudyInfo(StudyDataBean studyDto);
	public int modifyStudyInfo(StudyDataBean studyDto);
	public int deleteStudyInfo(int id);
	public int getStudycatId();
	public int getStudytimeId();
	public StudyTimeDataBean getStudyTime(int id);
	public int modifyStudyTimeInfo(StudyTimeDataBean studytimeDto);
	public List<LocationDataBean> getStudyLocation();
	public List<StudyRegCategoryDataBean> getStudyCategory();
	public String getLocationById(int id);
	public String getCategoryById(int id);
}