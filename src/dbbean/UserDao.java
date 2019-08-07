package dbbean;

import java.util.List;
import java.util.Map;

import databean.AttendeeDataBean;
import databean.RegProcessDataBean;
import databean.StudyDataBean;
import databean.StudyRegFormDataBean;
import databean.UserDataBean;

public interface UserDao {
	public int checkIdPs(String email, String passwd);
	public UserDataBean getUserinfo(String email);
	public int insertUser(UserDataBean userDto);
	public int checkUserExists(String email);
	public List<AttendeeDataBean> getAttendeeinfo(int user_id);
	public RegProcessDataBean getRegProcessById(int id);
	public StudyDataBean getStudyById(int id);
	public UserDataBean getUserById(int id);
	public int deleteUserById(int id);
	public List<StudyDataBean> getParticipateStudy(int user_id);
	public List<StudyDataBean> getOpenStudy(int user_id);
	public List<StudyDataBean> getRegisterStudy(int user_id);
	public List<StudyRegFormDataBean> getMyStudyRegUser(int user_id);
	public int updateUserStatus(Map<String,Integer> info);
	public List<UserDataBean> getUsers();
	public int getUserStatus( Map<String, Integer> id_map );
}
