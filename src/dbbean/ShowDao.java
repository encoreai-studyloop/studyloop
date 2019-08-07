package dbbean;

import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.ApplyDataBean;
import databean.AttendeeDataBean;
import databean.CertificateDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocationDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyTimeDataBean;
import databean.UserDataBean;

public interface ShowDao {
	public StudyDataBean getStudyInfo( int id );
	public StudyTimeDataBean getStudyTime( int id );
	public LocationDataBean getLocation( int id );
	public int getCntAttendee( int study_id );
	public List<Integer> getIdListAttendee( int study_id );
	public SchoolDataBean getSchoolData( int user_id );
	public UserDataBean getMyData( int user_id );
	public int insertAttendee( AttendeeDataBean attendeeDto );
	public int insertSchool( SchoolDataBean schoolDto );
	public int insertCareer( ExpDataBean expDto );
	public int insertLanguage( LanguageDataBean languageDto );
	public int insertCertificate( CertificateDataBean certificateDto );
	public ApplyDataBean loadPrevData( int user_id );
	public int deleteSchool( int user_id );
	public int deleteCareer( int user_id );
	public int deleteLanguage( int user_id );
	public int deleteCertificate( int user_id );
	public AttendeeDataBean getMineApplied( Map<String, Integer> id_map );
	public int getStudyIdbyUserId(Integer study_id);
	public int addCurPersonnel( int study_id );
	public int subCurPersonnel( int study_id );
}