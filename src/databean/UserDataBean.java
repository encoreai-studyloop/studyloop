package databean;

import java.sql.Timestamp;
import java.util.Map;

public class UserDataBean {
	private int id;
	private String email;
	private String name;
	private String nick;
	private String pic;
	private String birth;
	private String gender;
	private String phone;
	private String passwd;
	private String zipcode;
	private String address;
	private String prime;
	private double rate;
	private Timestamp regdate;
	private int point;
	private String visit;
	private String interest;
	private String goal;
	private String open;
	private String part;
	
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	private Map<String, String[]> school;  //학교명 : [전공, 졸업유무]
	private Map<String, String[]> experience;  //경력사항 : [시작일, 종료일]
	private Map<String, String[]> language;  //어학성적명 : [점수, 취득일]
	private Map<String, String[]> certificate; //자격증명 : [점수, 취득일]
	
	
	public Map<String, String[]> getSchool() {
		return school;
	}
	public void setSchool(Map<String, String[]> school) {
		this.school = school;
	}
	public Map<String, String[]> getExperience() {
		return experience;
	}
	public void setExperience(Map<String, String[]> experience) {
		this.experience = experience;
	}
	public Map<String, String[]> getLanguage() {
		return language;
	}
	public void setLanguage(Map<String, String[]> language) {
		this.language = language;
	}
	public Map<String, String[]> getCertificate() {
		return certificate;
	}
	public void setCertificate(Map<String, String[]> certificate) {
		this.certificate = certificate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrime() {
		return prime;
	}
	public void setPrime(String prime) {
		this.prime = prime;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getVisit() {
		return visit;
	}
	public void setVisit(String visit) {
		this.visit = visit;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	
	
}
