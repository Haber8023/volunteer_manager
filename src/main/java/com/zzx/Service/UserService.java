package com.zzx.Service;

import java.util.List;

import javax.servlet.http.HttpSession;
import com.zzx.Model.Volunteer;
import com.zzx.Model.Record;


public interface UserService {

		public boolean insert_volunteer(Volunteer volunteer,int isNew);

		public String get_num();

		public boolean check_volunteer(String ID);

		public List<Volunteer> show_all_volunteer();

		public String get_volunteer_num();
		
		public String get_volunteer_num_by_date(String date);
		
		public String get_record_num_by_date(String date);

		public String get_record_hour_by_date(String date);
		
		public List<Volunteer> get_volunteer_time_in(Volunteer volunteer);

		public boolean insert_record(String num, String place, String recordDetail, Integer volunteerTime);

		public List<Record> show_all_record();

		public List<Record> get_record_page(Record record);

		public boolean delete_record(String record_ID);

		public boolean update_volunteer(String num, String name, String ID, String unit,
				String tel, String eMail, String address, String joinDate);

		public List<Record> get_record_by_Date(String recordDate);

		public int get_total_hours(List<Record> list);

		public int get_total_wage_hours(List<Volunteer> list);

		public List<Volunteer> get_volunteer_with_hours_by_Date(String recordDate);

		public List<Volunteer> get_volunteer_with_hours_by_Date_DESC(String recordDate);

		public void update_time(String num, String record_time);

		public boolean insert_foget_record(String num, String place, String record,
				String recordDate, int volunteerTime);

		public String get_new_volunteer_by_year(String joinDate);

		public List<Volunteer> get_volunteer_by_school_with_hours_by_Date_DESC(String recordDate, String unit);

		public int get_total_wage_hours_by_year_and_school(List<Volunteer> list);

		public String get_new_volunteer_by_year_and_school(String joinDate,String unit);

		public String count_record(String num);

		public String count_record(String num, String recordDate);

}
