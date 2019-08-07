package databean;

import java.sql.Timestamp;

public class AlarmDataBean {
	private int id;
    private Timestamp regdate;
	private int user_id;
    private int study_id;
    private int regprocess_id;
    private String user_nick;
    private String study_title;
    private String study_nick;
    private String regprocess_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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
	public int getRegprocess_id() {
		return regprocess_id;
	}
	public void setRegprocess_id(int regprocess_id) {
		this.regprocess_id = regprocess_id;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getStudy_title() {
		return study_title;
	}
	public void setStudy_title(String study_title) {
		this.study_title = study_title;
	}
	public String getStudy_nick() {
		return study_nick;
	}
	public void setStudy_nick(String study_nick) {
		this.study_nick = study_nick;
	}
	public String getRegprocess_name() {
		return regprocess_name;
	}
	public void setRegprocess_name(String regprocess_name) {
		this.regprocess_name = regprocess_name;
	}
    
}
