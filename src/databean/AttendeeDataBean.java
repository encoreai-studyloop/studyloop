package databean;

import java.sql.Timestamp;

public class AttendeeDataBean {
    private int id;
    private String purpose;
    private String goal;
    private String intro;
    private String request;
    private Timestamp regdate;
	private int user_id;
    private int study_id;
    private int regprocess_id;
    
    public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getPurpose() {
        return purpose;
    }
    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
    public String getGoal() {
        return goal;
    }
    public void setGoal(String goal) {
        this.goal = goal;
    }
    public String getIntro() {
        return intro;
    }
    public void setIntro(String intro) {
        this.intro = intro;
    }
    public String getRequest() {
        return request;
    }
    public void setRequest(String request) {
        this.request = request;
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
    
    
}