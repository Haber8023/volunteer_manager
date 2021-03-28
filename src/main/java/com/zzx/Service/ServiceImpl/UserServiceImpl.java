package com.zzx.Service.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzx.Model.Volunteer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzx.Dao.AdminMapper;
import com.zzx.Dao.RecordMapper;
import com.zzx.Dao.VolunteerMapper;
import com.zzx.Model.Admin;
import com.zzx.Model.Record;
import com.zzx.Service.UserService;
import com.zzx.Utils.Tools;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	VolunteerMapper volunteerMapper;
	@Autowired
	RecordMapper recordMapper;
	@Autowired
	AdminMapper adminMapper;
	
	public boolean check_volunteer(String tel) {
		if(volunteerMapper.check_volunteer(tel)>0) {
			return true;
		}
		return false;
	};
	
	// 修改密码
	public boolean change_password(String password, String password_new, String admin_name) {
		String password_record = adminMapper.get_admin_psw(admin_name);
		if (password.equals(password_record)) {
			try {
				adminMapper.update_admin_psw(admin_name, password_new);
			} catch (Exception e) {
				return false;
			}
			return true;
		}
		return false;
	}
	
	// 管理员用户登陆
	public boolean login(Admin admin, HttpSession session) {
		String admin_name = admin.getAdmin_name();
		String admin_psw = admin.getAdmin_psw();
		String psw = adminMapper.get_admin_psw(admin_name);
		if(psw==null)
	       return false;
		if (admin_psw.equals(psw)) {
			session.setAttribute("admin_name", admin_name);
			return true;
		}
		return false;
	}
	
	public String get_num() {
		int num=-1;
		if(volunteerMapper.get_num()!=null) {
			num = Integer.valueOf(volunteerMapper.get_num()).intValue();
		}
		return ""+(num+1);
	};
	
	public boolean insert_volunteer(Volunteer volunteer,int isNew) {

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
			String tel = volunteer.getTel();
			String name = volunteer.getName();
			String joinDate = volunteer.getJoinDate();
			String unit = volunteer.getUnit();
			return volunteerMapper.get_volunteer_time_in(tel, name, joinDate, unit);
		};
		
		public boolean insert_record(String num, String place, String recordDetail, double volunteerTime) {
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
				String recordDate, double volunteerTime) {
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
			String tel = record.getTel();
			String name = record.getName();
			String recordDate = record.getRecordDate();
			String unit = record.getUnit();
			return recordMapper.get_record_page(tel, name, recordDate, unit);
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


		public boolean update_volunteer(String num, String name,String gender,String birthday,
				 String unit,String address,String tel,String type,String joinDate,String occupation,String education,String relate,String school, String studentNum) {

			try {
				volunteerMapper.update_volunteer(num, name,gender,birthday,
						 unit,address,tel,type,occupation,education,relate,school,studentNum);
				volunteerMapper.update_joinDate(num, joinDate);
			} catch (Exception e) {
				System.out.println("err");
				return false;
			}
			return true;
			};
		
		public List<Record> get_record_by_Date(String recordDate){
			return recordMapper.get_record_by_Date(recordDate);
		};

		public double get_total_hours(List<Record> list) {
			double totalHours = 0.0;
			for(Record r:list) {
				totalHours += Double.parseDouble(r.getVolunteerTime());
			}
			return totalHours;
		};
		
		public double get_total_wage_hours(List<Volunteer> list) {
			double totalHours = 0;
			for(Volunteer v:list) {
				totalHours += Double.parseDouble(v.getTotalHours());
			}
			return totalHours;
		};
		
		public double get_total_wage_hours_by_year_and_school(List<Volunteer> list) {
			double totalHours = 0.0;
			for(Volunteer v:list) {
				totalHours += Double.parseDouble(v.getTotalHours());
			}
			return totalHours;
		};
		
		public List<Volunteer> get_volunteer_with_hours_by_Date(String recordDate){
			return volunteerMapper.get_volunteer_with_hours_by_Date(recordDate);
		};
		
		public List<Volunteer> get_CQU_volunteer_with_hours_by_Date_DESC(String recordDate, String school){
			return volunteerMapper.get_CQU_volunteer_with_hours_by_Date_DESC(recordDate, school);
		};


		public List<Volunteer> get_volunteer_with_hours_by_Date_DESC(String recordDate){
			return volunteerMapper.get_volunteer_with_hours_by_Date_DESC(recordDate);
		};
		public List<Volunteer> get_social_volunteer_with_hours_by_Date_DESC(String recordDate){
			return volunteerMapper.get_social_volunteer_with_hours_by_Date_DESC(recordDate);
		};
		public List<Volunteer> get_inner_volunteer_with_hours_by_Date_DESC(String recordDate){
			return volunteerMapper.get_inner_volunteer_with_hours_by_Date_DESC(recordDate);
		};
		
		public List<Volunteer> get_volunteer_by_school_with_hours_by_Date_DESC(String recordDate,String unit){
			return volunteerMapper.get_volunteer_by_school_with_hours_by_Date_DESC(recordDate,unit);
		};


		public String get_new_volunteer_by_year(String joinDate) {
			return volunteerMapper.get_new_volunteer_by_year(joinDate);
		};
		public String get_new_social_volunteer_by_year(String joinDate) {
			return volunteerMapper.get_new_social_volunteer_by_year(joinDate);
		};
		public String get_new_inner_volunteer_by_year(String joinDate) {
			return volunteerMapper.get_new_inner_volunteer_by_year(joinDate);
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
