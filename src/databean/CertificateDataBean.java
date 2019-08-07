package databean;

import java.util.Date;

public class CertificateDataBean {
	private int id;
	private String name;
	private String score;
	private Date obtain_date;
	private int user_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Date getObtain_date() {
		return obtain_date;
	}
	public void setObtain_date(Date obtain_date) {
		this.obtain_date = obtain_date;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}