package com.zzx.Service.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzx.Model.Volunteer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzx.Dao.RecordMapper;
import com.zzx.Dao.VolunteerMapper;
import com.zzx.Model.Record;
import com.zzx.Service.UserService;
import com.zzx.Utils.Tools;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	VolunteerMapper volunteerMapper;
	@Autowired
	RecordMapper recordMapper;
	
	public boolean check_volunteer(String ID) {
		if(volunteerMapper.check_volunteer(ID)>0) {
			return true;
		}
		return false;
	};
	
	public String get_num() {
		int num=-1;
		if(volunteerMapper.get_num()!=null) {
			num = Integer.valueOf(volunteerMapper.get_num()).intValue();
		}
		return ""+(num+1);
	};
	
	public boolean insert_volunteer(Volunteer volunteer,int isNew) {
		if("0".equals(volunteer.getID())) {
			volunteer.setGender("女");
			volunteer.setID("无");
		}
		else if("1".equals(volunteer.getID())) {
			volunteer.setGender("男");
			volunteer.setID("无");
		}else {
		volunteer.setGender(volunteer.getSex());}
		try {
			System.out.println(volunteer.toString());
			volunteerMapper.insert_volunteer(volunteer);
			if(isNew != 1) {
				volunteerMapper.update_joinDate(volunteer.getNum(),"2019-12-31");
			}
		} catch (Exception e) {
			System.out.println("insert err");
			return false;
		}
		return true;
	};
	
	public List<Volunteer> show_all_volunteer(){
		return volunteerMapper.show_all_volunteer();
	};
		
		public String get_volunteer_num() {
			return volunteerMapper.get_volunteer_num();
		};
		
		public String get_volunteer_num_by_date(String date) {
			return volunteerMapper.get_volunteer_num_by_date(date);
		};
		
		public String get_record_num_by_date(String date) {
			return recordMapper.get_record_num_by_date(date);
		};
		
		public String get_record_hour_by_date(String date) {
			return recordMapper.get_record_hour_by_date(date);
		};

		public List<Volunteer> get_volunteer_time_in(Volunteer volunteer){
			String num = volunteer.getNum();
			String name = volunteer.getName();
			String joinDate = volunteer.getJoinDate();
			String unit = volunteer.getUnit();
			return volunteerMapper.get_volunteer_time_in(num, name, joinDate, unit);
		};
		
		public boolean insert_record(String num, String place, String recordDetail, Integer volunteerTime) {
			try {
				recordMapper.insert_record(num,place,recordDetail, volunteerTime);
				volunteerMapper.update_total_time(num,volunteerTime);
			} catch (Exception e) {
				System.out.println("insert err");
				return false;
			}
			return true;
		};
		
		public boolean insert_foget_record(String num, String place, String recordDetail,
				String recordDate, int volunteerTime) {
			try {
				System.out.println(recordDate);
				recordMapper.insert_forget_record(num,place,recordDetail,recordDate,volunteerTime);
				volunteerMapper.update_total_time(num,volunteerTime);
			} catch (Exception e) {
				System.out.println("insert err");
				return false;
			}
			return true;
		};
		
		public List<Record> show_all_record(){
			return recordMapper.show_all_record();
		};
		
		public List<Record> get_record_page(Record record){
			String num = record.getNum();
			String name = record.getName();
			String recordDate = record.getRecordDate();
			String unit = record.getUnit();
			return recordMapper.get_record_page(num, name, recordDate, unit);
		};
		
		public boolean delete_record(String recordID) {
			try {
				recordMapper.delete_record(recordID);
			} catch (Exception e) {
				System.out.println("delete err");
				return false;
			}
			return true;
		};
		
		public void update_time(String num, String record_time) {
		try {
			System.out.println(num);	
			System.out.println(record_time);	
			volunteerMapper.update_time(num,record_time);
		} catch (Exception e) {
			System.out.println("err");	
		}
	};


		public boolean update_volunteer(String num, String name, String ID, String unit,
				String tel, String eMail, String address, String joinDate) {
			if("无".equals(ID)) {
				try {
					volunteerMapper.update_volunteer_without_gender(num, name,
							 ID,unit,tel,eMail,address);
					volunteerMapper.update_joinDate(num, joinDate);
				} catch (Exception e) {
					System.out.println("err");
					return false;
				}
				return true;
			}else {
			String gender =new String();
			if("1".equals(ID)) {
				ID = "无";
				gender = "男";
			}else if("0".equals(ID)){
				gender = "女";
				ID = "无";
			}
			else if (Integer.parseInt(ID.substring(16).substring(0, 1)) % 2 == 0) {// 判断性别
				gender = "女";
			} else {
				gender = "男";
			}
			try {
				volunteerMapper.update_volunteer(num, name,gender,
						 ID,unit,tel,eMail,address);
				volunteerMapper.update_joinDate(num, joinDate);
			} catch (Exception e) {
				System.out.println("err");
				return false;
			}
			return true;
			}
		};
		
		public List<Record> get_record_by_Date(String recordDate){
			return recordMapper.get_record_by_Date(recordDate);
		};

		public int get_total_hours(List<Record> list) {
			int totalHours = 0;
			for(Record r:list) {
				Integer delta = new Integer(r.getVolunteerTime());
				totalHours += delta.intValue();
			}
			return totalHours;
		};
		
		public int get_total_wage_hours(List<Volunteer> list) {
			int totalHours = 0;
			for(Volunteer v:list) {
				Integer delta = new Integer(v.getTotalHours());
				totalHours += delta.intValue();
			}
			return totalHours;
		};
		
		public int get_total_wage_hours_by_year_and_school(List<Volunteer> list) {
			int totalHours = 0;
			for(Volunteer v:list) {
				Integer delta = new Integer(v.getTotalHours());
				totalHours += delta.intValue();
			}
			return totalHours;
		};
		
		public List<Volunteer> get_volunteer_with_hours_by_Date(String recordDate){
			return volunteerMapper.get_volunteer_with_hours_by_Date(recordDate);
		};


		public List<Volunteer> get_volunteer_with_hours_by_Date_DESC(String recordDate){
			return volunteerMapper.get_volunteer_with_hours_by_Date_DESC(recordDate);
		};
		
		public List<Volunteer> get_volunteer_by_school_with_hours_by_Date_DESC(String recordDate,String unit){
			return volunteerMapper.get_volunteer_by_school_with_hours_by_Date_DESC(recordDate,unit);
		};


		public String get_new_volunteer_by_year(String joinDate) {
			return volunteerMapper.get_new_volunteer_by_year(joinDate);
		};

		public String get_new_volunteer_by_year_and_school(String joinDate,String unit) {
			return volunteerMapper.get_new_volunteer_by_year_and_school(joinDate,unit);
		};
		
		public String count_record(String num) {
			return recordMapper.count_record(num);
		};
		
		public String count_record(String num, String recordDate) {
			return recordMapper.count_record_with_date(num,recordDate);
		};



}
