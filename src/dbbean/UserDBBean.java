package dbbean;

import java.util.List;
import java.util.Map;

import commons.SqlMapClient;
import databean.AttendeeDataBean;
import databean.RegProcessDataBean;
import databean.StudyDataBean;
import databean.StudyRegFormDataBean;
import databean.UserDataBean;

public class UserDBBean implements UserDao{
	@Override
	public int checkIdPs(String email, String passwd) {
		int res = 0; //아이디 없음
		int count = checkUserExists(email);
		if(count !=0) { // 아이디 있음
			UserDataBean userDto = getUserinfo(email);
			if(passwd.equals(userDto.getPasswd())){ //비밀번호 일치
				res = 1;
			}
			else {
				res = -1; // 비밀번호 불일치
			}
		}
		return res;
	}
	
	@Override
	public int checkUserExists(String email) {
		return SqlMapClient.getSession().selectOne("Studyloop.checkUserExists", email);
	}
	
	@Override
	public UserDataBean getUserinfo(String email){
		return SqlMapClient.getSession().selectOne("Studyloop.getUserinfo", email);
	}
	
	@Override
	public UserDataBean getUserById(int id){
		return SqlMapClient.getSession().selectOne("Studyloop.getUserById", id);
	}
	
	@Override
	public StudyDataBean getStudyById(int id){
		return SqlMapClient.getSession().selectOne("Studyloop.getStudyById", id);
	}
	
	@Override
	public RegProcessDataBean getRegProcessById(int id){
		return SqlMapClient.getSession().selectOne("Studyloop.getRegProcessById", id);
	}
	
	@Override
	public int insertUser(UserDataBean userDto){
		System.out.println("zipcode: "+ userDto.getZipcode());
		System.out.println("point : "+ userDto.getPoint());
		System.out.println("address : "+ userDto.getAddress());
		return SqlMapClient.getSession().insert("Studyloop.insertUser", userDto);
	}
	
	@Override
	public int deleteUserById(int id) {
		return SqlMapClient.getSession().delete("Studyloop.deleteUserById", id);
	}
	
	@Override
	public List<AttendeeDataBean> getAttendeeinfo(int user_id) {
		List<AttendeeDataBean> attendeeList = SqlMapClient.getSession().selectList("Studyloop.getAttendeeinfo", user_id);
	
		return attendeeList;
	}
	@Override
	public List<StudyDataBean> getParticipateStudy(int user_id){
		List<StudyDataBean> pstudyDtoList = SqlMapClient.getSession().selectList("Studyloop.getParticipateStudy", user_id);
		for(int i =0; i<pstudyDtoList.size();i++) {
			int lid = pstudyDtoList.get(i).getLoc_id();
			int cid = pstudyDtoList.get(i).getCat_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			pstudyDtoList.get(i).setLocation(location);
			pstudyDtoList.get(i).setCategory(category);
		}
		return pstudyDtoList;
	}
	@Override
	public List<StudyDataBean> getOpenStudy(int user_id) {
		List<StudyDataBean> ostudyDtoList = SqlMapClient.getSession().selectList("Studyloop.getOpenStudy", user_id);
		for(int i =0; i<ostudyDtoList.size();i++) {
			int lid = ostudyDtoList.get(i).getLoc_id();
			int cid = ostudyDtoList.get(i).getCat_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			ostudyDtoList.get(i).setLocation(location);
			ostudyDtoList.get(i).setCategory(category);
		}
		return ostudyDtoList;
	}
	@Override
	public List<StudyDataBean> getRegisterStudy(int user_id) {
		List<StudyDataBean> rstudyDtoList = SqlMapClient.getSession().selectList("Studyloop.getRegisterStudy", user_id);
		for(int i =0; i<rstudyDtoList.size();i++) {
			int lid = rstudyDtoList.get(i).getLoc_id();
			int cid = rstudyDtoList.get(i).getCat_id();
			String location = SqlMapClient.getSession().selectOne("Studyloop.getSpecLocation",lid);
			String category = SqlMapClient.getSession().selectOne("Studyloop.getSpecCategory",cid);
			rstudyDtoList.get(i).setLocation(location);
			rstudyDtoList.get(i).setCategory(category);
		}
		return rstudyDtoList;
	}
	@Override
	public List<StudyRegFormDataBean> getMyStudyRegUser(int user_id) {
		List<StudyRegFormDataBean> ruserDtoList = SqlMapClient.getSession().selectList("Studyloop.getMyStudyRegUser", user_id);
		return ruserDtoList;
	}
	@Override
	public int updateUserStatus(Map<String, Integer> info) {
		return SqlMapClient.getSession().update("Studyloop.updateUserStatus", info);
		
	}
	
	@Override
	public List<UserDataBean> getUsers() {
		
		return SqlMapClient.getSession().selectList("Studyloop.getUsers");
	}
	
	@Override
    public int getUserStatus( Map<String, Integer> id_map ) {
        return SqlMapClient.getSession().selectOne( "Studyloop.getUserStatus", id_map );
    }
	
	@Override
	public String getStatus(int status) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSession().selectOne( "Studyloop.getStatus", status );
	}
	
}
