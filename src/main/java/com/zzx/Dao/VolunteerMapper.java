package com.zzx.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzx.Model.Volunteer;

public interface VolunteerMapper {

	public void insert_volunteer(Volunteer volunteer);

	public String get_num();

	public int check_volunteer(@Param("tel") String tel);

	public List<Volunteer> show_all_volunteer();
	
	public List<Volunteer> get_volunteer_List();

	public String get_volunteer_num();
	
	public String get_volunteer_num_by_date(String date);

	public List<Volunteer> get_volunteer_time_in(@Param("tel")String tel, @Param("name")String name, @Param("joinDate")String joinDate, @Param("unit")String unit);

	public void update_total_time(@Param("num")String num,@Param("volunteerTime") double volunteerTime);

	public void update_volunteer(@Param("num")String num, @Param("name")String name,@Param("gender")String gender,@Param("birthday")String birthday,
			@Param("unit") String unit,@Param("address")String address,@Param("tel")String tel,@Param("type")String type,@Param("occupation")String occupation,@Param("education")String education,@Param("relate")String relate);

	public List<Volunteer> get_volunteer_with_hours_by_Date(@Param("recordDate")String recordDate);

	public List<Volunteer> get_volunteer_with_hours_by_Date_DESC(@Param("recordDate")String recordDate);
	public List<Volunteer> get_social_volunteer_with_hours_by_Date_DESC(@Param("recordDate")String recordDate);
	public List<Volunteer> get_inner_volunteer_with_hours_by_Date_DESC(@Param("recordDate")String recordDate);
	public void update_volunteer_without_gender(@Param("num")String num, @Param("name")String name, @Param("ID")String iD, @Param("unit")String unit, @Param("tel")String tel,
			@Param("eMail")String eMail, @Param("address")String address);

	public void update_time(@Param("num")String num, @Param("recordTime")String recordTime);

	public String get_new_volunteer_by_year(@Param("joinDate")String joinDate);
	public String get_new_social_volunteer_by_year(@Param("joinDate")String joinDate);
	public String get_new_inner_volunteer_by_year(@Param("joinDate")String joinDate);

	public List<Volunteer> get_volunteer_by_school_with_hours_by_Date_DESC(@Param("recordDate")String recordDate, @Param("unit")String unit);

	public String get_new_volunteer_by_year_and_school(@Param("joinDate")String joinDate, @Param("unit")String unit);

	public void update_joinDate(@Param("num")String num, @Param("joinDate")String joinDate);

}
