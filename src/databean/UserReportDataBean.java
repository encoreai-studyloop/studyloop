package databean;

import java.sql.Timestamp;

public class UserReportDataBean {
	int id;
	String suspect_nick;
	String content;
	Timestamp time;
	String reporter_nick;
	int repcat_id;
	String repcat_name;
	
	public String getRepcat_name() {
		return repcat_name;
	}
	public void setRepcat_name(String repcat_name) {
		this.repcat_name = repcat_name;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSuspect_nick() {
		return suspect_nick;
	}
	public void setSuspect_nick(String suspect_nick) {
		this.suspect_nick = suspect_nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getReporter_nick() {
		return reporter_nick;
	}
	public void setReporter_nick(String reporter_nick) {
		this.reporter_nick = reporter_nick;
	}
	public int getRepcat_id() {
		return repcat_id;
	}
	public void setRepcat_id(int repcat_id) {
		this.repcat_id = repcat_id;
	}
	
	

}