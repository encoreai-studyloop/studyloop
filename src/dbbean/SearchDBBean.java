package dbbean;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.AlarmDataBean;
import databean.ArticleReportDataBean;
import databean.AttendeeDataBean;
import databean.CategoryDataBean;
import databean.CategoryTempBean;
import databean.CertificateDataBean;
import databean.ExpDataBean;
import databean.LanguageDataBean;
import databean.LocTmpDataBean;
import databean.SchoolDataBean;
import databean.StudyDataBean;
import databean.StudyReportDataBean;
import databean.UserReportDataBean;

public class SearchDBBean implements SearchDao{
	@Override
	public CategoryDataBean loadCategory() {
		List<CategoryTempBean> tmpDto;
		System.out.println("여기 들어옴");
		System.out.println("0");
		tmpDto = SqlMapClient.getSession().selectList("Studyloop.loadCategory");
		System.out.println("112");
		CategoryDataBean categoryDto = new CategoryDataBean();
		
		Map<String,ArrayList<String>> j_tmp = new HashMap<String,ArrayList<String>>();
		Map<String,ArrayList<String>> m_tmp = new HashMap<String,ArrayList<String>>();
		Map<String,ArrayList<String>> l_tmp = new HashMap<String,ArrayList<String>>();
		Map<String,ArrayList<String>> c_tmp = new HashMap<String,ArrayList<String>>();
		Map<String,ArrayList<String>> e_tmp = new HashMap<String,ArrayList<String>>();
		System.out.println("1");
		for(CategoryTempBean c : tmpDto) {
			if(c.getBig().equals("취업")) {
				if(j_tmp.containsKey(c.getMiddle())) {
					j_tmp.get(c.getMiddle()).add(c.getSmall());
				}
				else {
					ArrayList<String> a = new ArrayList<String>();
					a.add(c.getSmall());
					j_tmp.put(c.getMiddle(), a);
				}
			}
			else if(c.getBig().equals("전공")) {
				if(m_tmp.containsKey(c.getMiddle())) {
					m_tmp.get(c.getMiddle()).add(c.getSmall());
				}
				else {
					ArrayList<String> a = new ArrayList<String>();
					a.add(c.getSmall());
					m_tmp.put(c.getMiddle(), a);
				}
			}
			else if(c.getBig().equals("자격증")){
				if(c_tmp.containsKey(c.getMiddle())) {
					c_tmp.get(c.getMiddle()).add(c.getSmall());
				}
				else {
					ArrayList<String> a = new ArrayList<String>();
					a.add(c.getSmall());
					c_tmp.put(c.getMiddle(), a);
				}
			}
			else if(c.getBig().equals("어학")) {
				if(l_tmp.containsKey(c.getMiddle())) {
					l_tmp.get(c.getMiddle()).add(c.getSmall());
				}
				else {
					ArrayList<String> a = new ArrayList<String>();
					a.add(c.getSmall());
					l_tmp.put(c.getMiddle(), a);
				}
			}
			else if(c.getBig().equals("기타")) {
				if(e_tmp.containsKey(c.getMiddle())) {
					e_tmp.get(c.getMiddle()).add(c.getSmall());
				}
				else {
					ArrayList<String> a = new ArrayList<String>();
					a.add(c.getSmall());
					e_tmp.put(c.getMiddle(), a);
				}
			}
		}
		System.out.println("2");
		categoryDto.setJob(j_tmp);
		categoryDto.setCertificate(c_tmp);
		categoryDto.setLanguage(l_tmp);
		categoryDto.setMajor(m_tmp);
		categoryDto.setEtc(e_tmp);
		categoryDto.setCategory();
		
		return categoryDto;
	}
	
	@Override
	public List<StudyDataBean> getStudyThumbNail() {
	      
		List<StudyDataBean> studyDtoList = SqlMapClient.getSession().selectList("Studyloop.getStudyThumbNail");
		for(int i =0; i<studyDtoList.size();i++) {
			int lid = studyDtoList.get(i).getLoc_id();
			int cid = studyDtoList.get(i).getCat_id();
			int user_id = studyDtoList.get(i).getUser_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			String prime = SqlMapClient.getSession().selectOne("Studyloop.getSpecPrime", user_id);
			studyDtoList.get(i).setLocation(location);
			studyDtoList.get(i).setCategory(category);
			studyDtoList.get(i).setPrime(prime);
		}
		return studyDtoList;
	}
	   
	@Override
	public List<StudyDataBean> searchByKeyWord(String keyword) {
		List<StudyDataBean> studyDtoList = SqlMapClient.getSession().selectList("Studyloop.searchByKeyWord", keyword);
		for(int i =0; i<studyDtoList.size();i++) {
			int lid = studyDtoList.get(i).getLoc_id();
			int cid = studyDtoList.get(i).getCat_id();
			int user_id = studyDtoList.get(i).getUser_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			String prime = SqlMapClient.getSession().selectOne("Studyloop.getSpecPrime", user_id);
			studyDtoList.get(i).setLocation(location);
			studyDtoList.get(i).setCategory(category);
			studyDtoList.get(i).setPrime(prime);
		}
		return studyDtoList;
	}
	
	@Override
	public List<StudyDataBean> searchByLocation(String keyword) {
		List<StudyDataBean> studyDtoList = SqlMapClient.getSession().selectList("Studyloop.searchByLocation", keyword);
		for(int i =0; i<studyDtoList.size();i++) {
			int lid = studyDtoList.get(i).getLoc_id();
			int cid = studyDtoList.get(i).getCat_id();
			int user_id = studyDtoList.get(i).getUser_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			String prime = SqlMapClient.getSession().selectOne("Studyloop.getSpecPrime", user_id);
			studyDtoList.get(i).setLocation(location);
			studyDtoList.get(i).setCategory(category);
			studyDtoList.get(i).setPrime(prime);
		}
		return studyDtoList;
	}
	
	@Override
	public List<LocTmpDataBean> getLocationList(String keyword) {
		
		return SqlMapClient.getSession().selectList("Studyloop.getLocationList", keyword);
	} 
	
	@Override
    public String searchByLoc(int loc_id){
        return SqlMapClient.getSession().selectOne("Studyloop.searchByLoc", loc_id );
    }
	
	@Override
	public int insertSchooldata(SchoolDataBean schoolDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertSchooldata", schoolDto );
		
	}
	@Override
	public int insertCareerdata(ExpDataBean expDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertCareerdata", expDto );
	}
	@Override
	public int insertCertificatedata(CertificateDataBean certificateDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertCertificatedata", certificateDto );
	}
	@Override
	public int insertLanguagedata(LanguageDataBean languageDto) {
		return SqlMapClient.getSession().insert("Studyloop.insertLanguagedata", languageDto );
	}
	@Override
	public List<CertificateDataBean> getCertificateinfo(int id) {

		return SqlMapClient.getSession().selectList("Studyloop.getCertificateinfo", id );
	}
	@Override
	public List<ExpDataBean> getExpinfo(int id) {

		return SqlMapClient.getSession().selectList("Studyloop.getExpinfo", id );
	}
	@Override
	public List<LanguageDataBean> getLanguageinfo(int id) {
		return SqlMapClient.getSession().selectList("Studyloop.getLanguageinfo", id );
	}
	@Override
	public SchoolDataBean getSchoolinfo(int id) {
		
		return SqlMapClient.getSession().selectOne("Studyloop.getSchoolinfo", id );
	}
	@Override
	public int cleanExistinginfo(int id) {
		int res = 0;
		res += SqlMapClient.getSession().delete("Studyloop.deleteSchoolinfo", id );
		res += SqlMapClient.getSession().delete("Studyloop.deleteCertificateinfo", id );
		res += SqlMapClient.getSession().delete("Studyloop.deleteLanguageinfo", id );
		res += SqlMapClient.getSession().delete("Studyloop.deleteExpinfo", id );
		return res;
	}
	@Override
	public String getStudyTimeDays(int studytime_id) {
		
		return SqlMapClient.getSession().selectOne("Studyloop.getStudyTimeDays", studytime_id);
	}
	
	@Override
	public List<StudyDataBean> getStudyThumbNailofhot() {
		return SqlMapClient.getSession().selectList("Studyloop.getStudyThumbNailofhot");
	}
	
	@Override
	public List<StudyDataBean> getStudyThumbNailofnew() {
		return SqlMapClient.getSession().selectList("Studyloop.getStudyThumbNailofnew");
	}
	
	@Override
	public List<StudyDataBean> getStudyThumbNailofpremium() {
		return SqlMapClient.getSession().selectList("Studyloop.getStudyThumbNailofpremium");
	}
	@Override
	public List<StudyDataBean> getStudies() {
//		Map<List<StudyDataBean>,String> map;
		List<StudyDataBean> studyDtoList = SqlMapClient.getSession().selectList( "Studyloop.getStudies" );
		for(StudyDataBean studyDto : studyDtoList) {
			int user_id = studyDto.getUser_id();
			String user_name = SqlMapClient.getSession().selectOne( "Studyloop.getUserNamebyId", user_id);
			studyDto.setUser_name(user_name);
		}
//		for(int i=0; i< studyDtoList.size(); i++) {
//			StudyDataBean studyDto = studyDtoList.get(i);
//			String user_name = SqlMapClient.getSession().selectOne( "Studyloop.getUserNamebyId" );
//			studyDto.setUser_name(user_name);
//		}
		
		return studyDtoList;
	}
	
	@Override
	public int deleteStudy(int id){
		return SqlMapClient.getSession().delete("Studyloop.deleteStudy",id );
	}
	
	@Override
	public int deleteRegister(Map<String, Integer> map) {
		
		return SqlMapClient.getSession().delete("Studyloop.deleteRegister",map );
	}
	
	@Override
	public AlarmDataBean getAttendeeinfo(int id) {
		return SqlMapClient.getSession().selectOne("Studyloop.getAttendeeinfoforalarm", id);
	}
	@Override
    public int updateUserPrime( int user_id ) {
        return SqlMapClient.getSession().update( "Studyloop.updateUserPrime", user_id );
    }
	
	@Override
	public List<StudyReportDataBean> getReportedStudies(){
		List<StudyReportDataBean> studyRDtoList = SqlMapClient.getSession().selectList( "Studyloop.getReportedStudies" );
			
		return studyRDtoList;
	}
	
	@Override
	public List<ArticleReportDataBean> getReportedArticles(){
		List<ArticleReportDataBean> ADtoList = SqlMapClient.getSession().selectList("Studyloop.getReportedArticles");
	
		return ADtoList;
	}
	
	@Override
	public List<UserReportDataBean> getReportedUsers(){
		List<UserReportDataBean> UDtoList = SqlMapClient.getSession().selectList("Studyloop.getReportedUsers");
		
		return UDtoList;
	}
	
	@Override
	public int closeStudy(int sid) {
		
		return SqlMapClient.getSession().update("Studyloop.closeStudy", sid);
		
	}
	
	@Override
	public List<StudyDataBean> getStudyThumbNailofnear(Map<String, String> cord) {		
		return SqlMapClient.getSession().selectList("Studyloop.getStudyThumbNailofnear", cord);
	}
}
