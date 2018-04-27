package app.bean;

public class Citizen{
	
	int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getThreatLevel() {
		return threatLevel;
	}
	public void setThreatLevel(int threatLevel) {
		this.threatLevel = threatLevel;
	}
	String country;
	String gender;
	int threatLevel;
	
	
}
