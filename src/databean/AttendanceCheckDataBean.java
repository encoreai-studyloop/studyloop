package databean;

import java.util.Date;

public class AttendanceCheckDataBean {
	private String nick;
	private String name;
	private int attendance;
	private Date attend_date;
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAttendance() {
		return attendance;
	}
	public void setAttendance(int attendance) {
		this.attendance = attendance;
	}
	public Date getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(Date attend_date) {
		this.attend_date = attend_date;
	}
}
