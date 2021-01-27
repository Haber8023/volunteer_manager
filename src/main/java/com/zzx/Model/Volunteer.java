package com.zzx.Model;

public class Volunteer {
	private String num;
	private String name;
	private String occupation;
	private String gender;
	private String unit;
	private String address;
	private String tel;
	private String education;
	private String relate;
	private String joinDate;
	private String totalTime;
	private String totalHours;
	private String totalWage;
	private String birthday;
	private String type;
	private String count;
	
	@Override
	public String toString() {
		return "Volunteer [num=" + num + ", name=" + name + ", occupation=" + occupation + ", gender=" + gender
				+ ", unit=" + unit + ", address=" + address + ", tel=" + tel + ", education=" + education + ", relate="
				+ relate + ", joinDate=" + joinDate + ", totalTime=" + totalTime + ", totalHours=" + totalHours
				+ ", totalWage=" + totalWage + ", birthday=" + birthday + ", type=" + type + "]";
	}
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	public String getRelate() {
		return relate;
	}
	public void setRelate(String relate) {
		this.relate = relate;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}


	public String getTotalHours() {
		return totalHours;
	}
	public void setTotalHours(String totalHours) {
		this.totalHours = totalHours;
	}
	public String getTotalWage() {
		return totalWage;
	}
	public void setTotalWage(String totalWage) {
		this.totalWage = totalWage;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
