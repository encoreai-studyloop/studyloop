package dbbean;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import databean.AlarmDataBean;
import databean.ArticleReportDataBean;
import databean.AttendeeDataBean;
import databean.CategoryDataBean;
import databean.CertificateDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocTmpDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserReportDataBean;


public interface SearchDao {
	public CategoryDataBean loadCategory();
	public List<StudyDataBean> getStudyThumbNail();
	public List<StudyDataBean> searchByKeyWord(String keyword);
	public List<StudyDataBean> searchByLocation(String keyword);
	public List<LocTmpDataBean> getLocationList(String keyword);
	public String searchByLoc(int loc_id);
	public int insertSchooldata(SchoolDataBean schoolDto);
	public int insertCareerdata(ExpDataBean expDto);
	public int insertLanguagedata(LanguageDataBean languageDto);
	public int insertCertificatedata(CertificateDataBean certificateDto);
	public SchoolDataBean getSchoolinfo(int id);
	public List<LanguageDataBean> getLanguageinfo(int id);
	public List<CertificateDataBean> getCertificateinfo(int id);
	public List<ExpDataBean> getExpinfo(int id);
	public int cleanExistinginfo(int id);
	public String getStudyTimeDays(int studytime_id);
	public List<StudyDataBean> getStudyThumbNailofnew();
	public List<StudyDataBean> getStudyThumbNailofhot();
	public List<StudyDataBean> getStudyThumbNailofpremium();
	public List<StudyDataBean> getStudies();
	public int deleteStudy(int id);
	public int deleteRegister(Map<String, Integer> map);
	public AlarmDataBean getAttendeeinfo(int id);
	public int updateUserPrime( int user_id );
	public List<StudyReportDataBean> getReportedStudies();
	public List<ArticleReportDataBean> getReportedArticles();
	public List<UserReportDataBean> getReportedUsers();
	public int closeStudy(int sid);
	public List<StudyDataBean> getStudyThumbNailofnear(Map<String, String> cord);
		
}
