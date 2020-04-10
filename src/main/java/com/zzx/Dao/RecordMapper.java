package com.zzx.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zzx.Model.Record;

public interface RecordMapper {

	public String get_record_num_by_date(@Param("date")String date);

	public void insert_record(@Param("num")String num, @Param("place")String place,@Param("recordDetail")String recordDetail, @Param("volunteerTime")int volunteerTime);

	public List<Record> show_all_record();

	public List<Record> get_record_page(@Param("num")String num, @Param("name")String name, @Param("recordDate")String recordDate, @Param("unit")String unit);

	public void delete_record(@Param("recordID")String recordID);

	public List<Record> get_record_by_Date(@Param("recordDate")String recordDate);

	public void insert_forget_record(@Param("num")String num, @Param("place")String place, @Param("recordDetail")String recordDetail, @Param("recordDate")String recordDate,
			@Param("volunteerTime")int volunteerTime);

	public String count_record(@Param("num")String num);

	public String count_record_with_date(@Param("num")String num,@Param("recordDate") String recordDate);

}
 