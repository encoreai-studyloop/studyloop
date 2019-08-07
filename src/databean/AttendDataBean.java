package databean;

import java.sql.Timestamp;
import java.util.Date;

public class AttendDataBean {
	public int id;
	public Date attend_date;

	public String attendance;
	private int user_id;
	private int study_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(Date attend_date) {
		this.attend_date = attend_date;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStudy_id() {
		return study_id;
	}
	public void setStudy_id(int study_id) {
		this.study_id = study_id;
	}
	
	

}