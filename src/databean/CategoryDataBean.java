package databean;

import java.util.ArrayList;
import java.util.Map;
 
public class CategoryDataBean {
	private Map<String, ArrayList<String>> job;
	private Map<String, ArrayList<String>> language;
	private Map<String, ArrayList<String>> certificate;
	private Map<String, ArrayList<String>> major;
	private Map<String, ArrayList<String>> etc;
	
	private ArrayList<Map<String,ArrayList<String>>> category;
	
	public Map<String, ArrayList<String>> getJob() {
		return job;
	}
	public Map<String, ArrayList<String>> getLanguage() {
		return language;
	}
	public Map<String, ArrayList<String>> getCertificate() {
		return certificate;
	}
	public Map<String, ArrayList<String>> getMajor() {
		return major;
	}
	public Map<String, ArrayList<String>> getEtc() {
		return etc;
	}
	public void setJob(Map<String, ArrayList<String>> job) {
		this.job = job;
	}
	public void setLanguage(Map<String, ArrayList<String>> language) {
		this.language = language;
	}
	public void setCertificate(Map<String, ArrayList<String>> certificate) {
		this.certificate = certificate;
	}
	public void setMajor(Map<String, ArrayList<String>> major) {
		this.major = major;
	}
	public void setEtc(Map<String, ArrayList<String>> etc) {
		this.etc = etc;
	}
	
	public ArrayList<Map<String,ArrayList<String>>> getCategory(){
		return category;
		
	}
	public void setCategory() {
		category = new ArrayList<Map<String,ArrayList<String>>>();
		category.add(job);
		category.add(language);
		category.add(certificate);
		category.add(major);
		category.add(etc);
	}
	
}
