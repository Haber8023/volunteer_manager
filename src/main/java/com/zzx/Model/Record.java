package com.zzx.Model;

public class Record {
	private String recordID;
	private String num;
	private String recordDate;
	private String volunteerTime;
	private String place;
	private String name;
	private String unit;
	private String recordDetail;
	private String type;
	private String tel;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getRecordID() {
		return recordID;
	}
	public void setRecordId(String recordID) {
		this.recordID = recordID;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
	public String getVolunteerTime() {
		return volunteerTime;
	}
	public void setVolunteerTime(String volunteerTime) {
		this.volunteerTime = volunteerTime;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		return "Record [recordID=" + recordID + ", num=" + num + ", recordDate=" + recordDate + ", volunteerTime="
				+ volunteerTime + ", place=" + place + "]";
	}
	public String getRecordDetail() {
		return recordDetail;
	}
	public void setRecordDetail(String recordDetail) {
		this.recordDetail = recordDetail;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	
	
}
