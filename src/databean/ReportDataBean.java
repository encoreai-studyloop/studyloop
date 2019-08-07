package databean;

import java.sql.Timestamp;

public class ReportDataBean {
	private int id;
	private String content;
	private Timestamp time;

	private int articleReport_id;
	private int userReport_id;
	private String reportCategory;
	private int studyReport_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getArticleReport_id() {
		return articleReport_id;
	}
	public void setArticleReport_id(int articleReport_id) {
		this.articleReport_id = articleReport_id;
	}
	public int getUserReport_id() {
		return userReport_id;
	}
	public void setUserReport_id(int userReport_id) {
		this.userReport_id = userReport_id;
	}
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	public int getStudyReport_id() {
		return studyReport_id;
	}
	public void setStudyReport_id(int studyReport_id) {
		this.studyReport_id = studyReport_id;
	}
	
	
}