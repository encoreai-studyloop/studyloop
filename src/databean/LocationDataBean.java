package databean;

public class LocationDataBean {
	private int id;
	private String state_city;
	private String detail_loc;
	private double latitude;
	private double longitude;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getState_city() {
		return state_city;
	}
	public void setState_city(String state_city) {
		this.state_city = state_city;
	}
	public String getDetail_loc() {
		return detail_loc;
	}
	public void setDetail_loc(String detail_loc) {
		this.detail_loc = detail_loc;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
}