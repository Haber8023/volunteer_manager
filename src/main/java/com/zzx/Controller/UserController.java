package com.zzx.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zzx.Model.Volunteer;
import com.zzx.Model.Admin;
import com.zzx.Model.Record;
import com.zzx.Service.UserService;
import com.zzx.Utils.Tools;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
public class UserController {

	@Autowired
	private UserService userService; 
	
	// 管理员用户登录
	@RequestMapping(value = "/login")
	public String login(String admin_name, String admin_psw, HttpSession session) {
		Admin admin = new Admin();
		admin.setAdmin_name(admin_name);
		admin.setAdmin_psw(admin_psw);
		if (userService.login(admin, session)) {
			Tools tool = new Tools();
			
			session.setAttribute("nowDate", tool.get_current_date());
			session.setAttribute("message", "0");
			session.setAttribute("totalMembers", userService.get_volunteer_num());
			session.setAttribute("joinMembers", userService.get_volunteer_num_by_date(tool.get_current_date()));
			session.setAttribute("todayMembers", userService.get_record_num_by_date(tool.get_current_date()));
			String todayHours = userService.get_record_hour_by_date(tool.get_current_date());
			if(todayHours == null) {
				todayHours = "0";
			}
			session.setAttribute("todayHours", todayHours);
			return "mainPage";
		}
		return "loginFail";
	}

	// 管理员用户退出登录
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	// 跳转至首页
		@RequestMapping(value = "/mainPage")
		public String mainPage(HttpSession session) {
			Tools tool = new Tools();
			
			session.setAttribute("nowDate", tool.get_current_date());
			session.setAttribute("message", "0");
			session.setAttribute("totalMembers", userService.get_volunteer_num());
			session.setAttribute("joinMembers", userService.get_volunteer_num_by_date(tool.get_current_date()));
			session.setAttribute("todayMembers", userService.get_record_num_by_date(tool.get_current_date()));
			String todayHours = userService.get_record_hour_by_date(tool.get_current_date());
			if(todayHours == null) {
				todayHours = "0";
			}
			session.setAttribute("todayHours", todayHours);
			return "mainPage";
		}
		
		// 管理员用户修改密码页面
		@RequestMapping(value = "/updatePage")
		public String updatePage() {
			return "updatePage";
		}

		// 修改密码
		@RequestMapping(value = "/updateInfo")
		public String updateInfo(String password, String password_new, HttpSession session) {
			String admin_name = (String) session.getAttribute("admin_name");
			if (userService.change_password(password, password_new, admin_name)) {
				return "updateSuccess";
			}
			return "updateFail";
		}

	
	    // 跳转至新增志愿者用户页面
		@RequestMapping(value = "/insertVolunteerPage")
		public String insertVolunteerPage(HttpSession session) {
			session.setAttribute("newNum",userService.get_num());
			session.setAttribute("message", "0");
			return "insertVolunteerPage";
		}

		// 新增志愿者
		@RequestMapping(value = "/insertVolunteer")
		public String insertVolunteer(String isNew, String birth_year, String birth_month, String birth_day, Volunteer volunteer, HttpSession session) {
			int newBoolean = 1;
			volunteer.setType("社会志愿者");
			if(isNew.indexOf('老')== 0) {
				newBoolean = 0;
			}
			if(isNew.indexOf('内')== 0) {
				volunteer.setType("内部志愿者");
			}
			String birthday = birth_year +"-"+birth_month+"-"+birth_day;
			volunteer.setBirthday(birthday);
			volunteer.setNum(userService.get_num());
			System.out.println(volunteer.toString());
if (userService.check_volunteer(volunteer.getTel())) {
				session.setAttribute("message", "3");
				return "insertVolunteerPage";
			}			
			else if (userService.insert_volunteer(volunteer,newBoolean)) {
				session.setAttribute("message", "1");
				return "insertVolunteerPage";
			}
			session.setAttribute("message", "2");
			return "insertVolunteerPage";
		}
		
	    // 跳转至管理志愿者用户页面
		@RequestMapping("/manageVolunteerPage")
	    public ModelAndView manageVolunteerPage(HttpSession session,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			Volunteer volunteer = new Volunteer();
			volunteer.setNum((String)session.getAttribute("manageVolunteerNum"));
			String tmpString =(String)session.getAttribute("manageVolunteerName");
			volunteer.setName(tmpString);
			volunteer.setJoinDate((String)session.getAttribute("manageVolunteerJoinDate"));
			volunteer.setUnit((String)session.getAttribute("manageVolunteerUnit"));
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("message","0");
			return new ModelAndView("/manageVolunteerPage");
		} 
		
		//manageVolunteerPage模糊查询volunteer
		@RequestMapping("/manageVolunteerFinder")
	    public ModelAndView manageVolunteerFinder( HttpSession session,Volunteer volunteer,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("manageVolunteerNum", volunteer.getNum());
			session.setAttribute("manageVolunteerName", volunteer.getName());
			session.setAttribute("manageVolunteerJoinDate", volunteer.getJoinDate());
			session.setAttribute("manageVolunteerUnit", volunteer.getUnit());
			session.setAttribute("manageVolunteerSchool", volunteer.getSchool());
			session.setAttribute("manageVolunteerStudentNum", volunteer.getStudentNum());
			session.setAttribute("message","0");
			return new ModelAndView("/manageVolunteerPage");
		}
		
		//recordPage模糊查询
				@RequestMapping("/recordFinder")
			    public ModelAndView recordFinder( HttpSession session,Record record,
						@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
						Map<String,Object> map){
					PageHelper.startPage(currentPage,8);
					List<Record> list=userService.get_record_page(record);
					PageInfo<Record> pageInfo=new PageInfo<Record>(list,8);
					map.put("pageInfo", pageInfo);
					session.setAttribute("recordTel", record.getTel());
					session.setAttribute("recordName", record.getName());
					session.setAttribute("recordDate", record.getRecordDate());
					session.setAttribute("recordUnit", record.getUnit());
					session.setAttribute("message", "0");
					return new ModelAndView("/recordPage");
				}
		
		// 跳转至查看服务记录页面
		@RequestMapping("/recordPage")
	    public ModelAndView recordPage(HttpSession session,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			Record record =new Record();
			record.setTel((String)session.getAttribute("recordTel"));
			record.setRecordDate((String)session.getAttribute("recordDate"));
			record.setName((String)session.getAttribute("recordName"));
			record.setUnit((String)session.getAttribute("recordUnit"));
			List<Record> list=userService.get_record_page(record);
			PageInfo<Record> pageInfo=new PageInfo<Record>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("message", "0");
			return new ModelAndView("/recordPage");
		} 
		
		//删除记录
		@RequestMapping(value = "/deleteRecord")
		 public ModelAndView deleteRecord( HttpSession session,String record_id_check,String num_check, String record_time_check,
					@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
					Map<String,Object> map){
				PageHelper.startPage(currentPage,8);
				Record record = new Record();
				record.setTel((String)session.getAttribute("recordTel"));
				record.setName((String)session.getAttribute("recordName"));
				record.setRecordDate((String)session.getAttribute("recordDate"));
				record.setUnit((String)session.getAttribute("recordUnit"));
			if (userService.delete_record(record_id_check)) {
				System.out.println(record_time_check);	
				userService.update_time(num_check,record_time_check);
				PageHelper.startPage(currentPage,8);
				List<Record> list=userService.get_record_page(record);
				PageInfo<Record> pageInfo=new PageInfo<Record>(list,8);
				map.put("pageInfo", pageInfo);
				session.setAttribute("message", "1");
				return new ModelAndView("/recordPage");
			}
			session.setAttribute("message", "2");
			return new ModelAndView("/recordPage");
		}
		
		//财务报表模糊查询
		@RequestMapping("/accountFinder")
		public ModelAndView accountFinder(HttpSession session, String accountDate){
			List<Record> list=userService.get_record_by_Date(accountDate);
			session.setAttribute("list", list);
			session.setAttribute("accountDate",accountDate);
			if(list == null) {
				session.setAttribute("message", "1");
			}
			else {
			session.setAttribute("totalHours", userService.get_total_hours(list));
			List<Record> tempList = new ArrayList<Record>();
			for(Record r :list) {
				if(r.getType().equals("社会志愿者")){
					tempList.add(r);
				}
			}

			session.setAttribute("message", "0");
			session.setAttribute("totalSocialHours", userService.get_total_hours(tempList));
			session.setAttribute("totalAccount", userService.get_total_hours(tempList)/4*15);

			}
			return new ModelAndView("/accountPage");
		} 
		
		// 跳转至查看財務報表页面
		@RequestMapping("/accountPage")
	    public ModelAndView accountPage(HttpSession session){
			List<Record> list=null;
			session.setAttribute("list", list);
			session.setAttribute("accountDate","");
			session.setAttribute("totalHours", "0");
			session.setAttribute("totalAccount", "0");
			session.setAttribute("message", "0");
			return new ModelAndView("/accountPage");
		} 
		
	    // 跳转至时长录入页面
		@RequestMapping("/timeInPage")
	    public ModelAndView timeInPage(HttpSession session,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			Volunteer volunteer = new Volunteer();
			volunteer.setTel((String)session.getAttribute("timeInTel"));
			volunteer.setName((String)session.getAttribute("timeInName"));
			volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
			volunteer.setUnit((String)session.getAttribute("timeInUnit"));
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);

			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("message", "0");
			return new ModelAndView("/timeInPage");
		} 
		
		// timeInPage模糊查询volunteer
		@RequestMapping("/timeInFinder")
	    public ModelAndView timeInFinder( HttpSession session,Volunteer volunteer,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("timeInTel", volunteer.getTel());
			session.setAttribute("timeInName", volunteer.getName());
			session.setAttribute("timeInJoinDate", volunteer.getJoinDate());
			session.setAttribute("timeInUnit", volunteer.getUnit());
			session.setAttribute("message", "0");
			System.out.println(volunteer.toString());
			return new ModelAndView("/timeInPage");
		}
		
		// 跳转至时长补录页面
				@RequestMapping("/forgetTimeInPage")
			    public ModelAndView forgetTimeInPage(HttpSession session,
						@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
						Map<String,Object> map){
					PageHelper.startPage(currentPage,8);
					
					Volunteer volunteer = new Volunteer();
					volunteer.setTel((String)session.getAttribute("timeInTelForget"));
					volunteer.setName((String)session.getAttribute("timeInNameForget"));
					volunteer.setJoinDate((String)session.getAttribute("timeInJoinDateForget"));
					volunteer.setUnit((String)session.getAttribute("timeInUnitForget"));
					List<Volunteer> list=userService.get_volunteer_time_in(volunteer);

					PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
					map.put("pageInfo", pageInfo);
					session.setAttribute("message", "0");
					return new ModelAndView("/forgetTimeInPage");
				} 
				
				//forgetTimeInPage模糊查询volunteer
				@RequestMapping("/forgetTimeInFinder")
			    public ModelAndView forgetTimeInFinder( HttpSession session,Volunteer volunteer,
						@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
						Map<String,Object> map){
					PageHelper.startPage(currentPage,8);
					List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
					PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
					map.put("pageInfo", pageInfo);
					session.setAttribute("timeInTelForget", volunteer.getTel());
					session.setAttribute("timeInNameForget", volunteer.getName());
					session.setAttribute("timeInJoinDateForget", volunteer.getJoinDate());
					session.setAttribute("timeInUnitForget", volunteer.getUnit());
					session.setAttribute("message", "0");
					System.out.println(volunteer.toString());
					return new ModelAndView("/forgetTimeInPage");
				}
		
		// 更新志愿者信息
		@RequestMapping(value = "/updateVolunteer")
		 public ModelAndView updateVolunteer( HttpSession session,String num_check, String name_check,String gender_check,String birthday_check,
				 String unit_check,String address_check,String tel_check,String type_check,String joinDate_check,String occupation_check,String education_check,String relate_check,
					String school_check, String studentNum_check, @RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
					Map<String,Object> map){			
			if (userService.update_volunteer(num_check, name_check,gender_check,birthday_check,
					 unit_check,address_check,tel_check,type_check,joinDate_check,occupation_check,education_check,relate_check, school_check, studentNum_check)) {
				session.setAttribute("message", "1");
				PageHelper.startPage(currentPage,8);
				Volunteer volunteer = new Volunteer();
				volunteer.setNum((String)session.getAttribute("manageVolunteerNum"));
				volunteer.setName((String)session.getAttribute("manageVolunteerName"));
				volunteer.setJoinDate((String)session.getAttribute("manageVolunteerJoinDate"));
				volunteer.setUnit((String)session.getAttribute("manageVolunteerUnit"));
				List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
				PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
				map.put("pageInfo", pageInfo);
				return new ModelAndView("/manageVolunteerPage");
			}
			session.setAttribute("message", "2");
			return new ModelAndView("/manageVolunteerPage");
		}
		
		//录入半天时长
				@RequestMapping(value = "/halfDayIn")
				 public ModelAndView halfDayIn( HttpSession session,String num_ensure, String place_ensure, String other_place_ensure, double hours_ensure, String record_detail_ensure,
							@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
							Map<String,Object> map){
					if("其它".equals(place_ensure)) {
						if("".equals(other_place_ensure)||other_place_ensure==null){
							
						}
						else {
							place_ensure = other_place_ensure;
						}
					}
						PageHelper.startPage(currentPage,8);
						Volunteer volunteer = new Volunteer();
						volunteer.setNum((String)session.getAttribute("timeInNum"));
						volunteer.setName((String)session.getAttribute("timeInName"));
						volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
						volunteer.setUnit((String)session.getAttribute("timeInUnit"));
						List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
						PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
						map.put("pageInfo", pageInfo);
					double volunteerTime = hours_ensure;
					if (userService.insert_record(num_ensure,place_ensure,record_detail_ensure,volunteerTime)) {
						session.setAttribute("message", "1");
						return new ModelAndView("/timeInPage");
					}
					session.setAttribute("message", "2");
					return new ModelAndView("/timeInPage");
				}
				
				//录入全天时长
				@RequestMapping(value = "/allDayIn")
				 public ModelAndView allDayIn( HttpSession session,String num_ensure_all, String place_all, String other_place_all, String record_detail_all,
						 @RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
							Map<String,Object> map){
					if(!userService.count_record(num_ensure_all).equals("0")) {
						session.setAttribute("message", "3");
						return new ModelAndView("/timeInPage");
					}
					if("其它".equals(place_all)) {
						if("".equals(other_place_all)||other_place_all==null){
							
						}
						else {
							place_all = other_place_all;
						}
					}
						PageHelper.startPage(currentPage,8);
						Volunteer volunteer = new Volunteer();
						volunteer.setNum((String)session.getAttribute("timeInNum"));
						volunteer.setName((String)session.getAttribute("timeInName"));
						volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
						volunteer.setUnit((String)session.getAttribute("timeInUnit"));
						List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
						PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
						map.put("pageInfo", pageInfo);
					int volunteerTime = 8;
					if (userService.insert_record(num_ensure_all,place_all,record_detail_all,volunteerTime)) {
						session.setAttribute("message", "1");
						return new ModelAndView("/timeInPage");
					}
					session.setAttribute("message", "2");
					return new ModelAndView("/timeInPage");
				}
		
				//补录半天时长
				@RequestMapping(value = "/forgetHalfDayIn")
				 public ModelAndView forgetHalfDayIn( HttpSession session,String num_ensure, String place_ensure, String other_place_ensure, String record_detail_ensure,
							double hours_ensure, String date_ensure, @RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
							Map<String,Object> map){
					if(!userService.count_record(num_ensure,date_ensure).equals("0")) {
						session.setAttribute("message", "3");
						return new ModelAndView("/forgetTimeInPage");
					}
					if("其它".equals(place_ensure)) {
						if("".equals(other_place_ensure)||other_place_ensure==null){
							
						}
						else {
							place_ensure = other_place_ensure;
						}
					}
						PageHelper.startPage(currentPage,8);
						Volunteer volunteer = new Volunteer();
						volunteer.setNum((String)session.getAttribute("timeInNum"));
						volunteer.setName((String)session.getAttribute("timeInName"));
						volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
						volunteer.setUnit((String)session.getAttribute("timeInUnit"));
						List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
						PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
						map.put("pageInfo", pageInfo);
					double volunteerTime = hours_ensure;
					if (userService.insert_foget_record(num_ensure,place_ensure,record_detail_ensure,date_ensure,volunteerTime)) {
						session.setAttribute("message", "1");
						return new ModelAndView("/forgetTimeInPage");
					}
					session.setAttribute("message", "2");
					return new ModelAndView("/forgetTimeInPage");
				}
				
				//补录全天时长
				@RequestMapping(value = "/forgetAllDayIn")
				 public ModelAndView forgetAllDayIn( HttpSession session,String num_ensure_all, String place_all, String other_place_all, String record_detail_all,
						 String date_all, @RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
							Map<String,Object> map){
					if(!userService.count_record(num_ensure_all,date_all).equals("0")) {
						session.setAttribute("message", "3");
						return new ModelAndView("/forgetTimeInPage");
					}
					if("其它".equals(place_all)) {
						if("".equals(other_place_all)||other_place_all==null){
							
						}
						else {
							place_all = other_place_all;
						}
					}
						PageHelper.startPage(currentPage,8);
						Volunteer volunteer = new Volunteer();
						volunteer.setNum((String)session.getAttribute("timeInNum"));
						volunteer.setName((String)session.getAttribute("timeInName"));
						volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
						volunteer.setUnit((String)session.getAttribute("timeInUnit"));
						List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
						PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
						map.put("pageInfo", pageInfo);
					int volunteerTime = 8;
					if (userService.insert_foget_record(num_ensure_all,place_all,record_detail_all,date_all,volunteerTime)) {
						session.setAttribute("message", "1");
						return new ModelAndView("/forgetTimeInPage");
					}
					session.setAttribute("message", "2");
					return new ModelAndView("/forgetTimeInPage");
				}
		
	    // 跳转至工资结算页面
		@RequestMapping(value = "/wagePage")
	    public ModelAndView wagePage(HttpSession session){
			List<Record> list=null;
			session.setAttribute("list", list);
			session.setAttribute("wageDate","");
			session.setAttribute("totalHours", "0");
			session.setAttribute("totalAccount", "0");
			session.setAttribute("message", "0");
			return new ModelAndView("/wagePage");
		} 
		
		//工资结算模糊查询
				@RequestMapping("/wageFinder")
				public ModelAndView wageFinder(HttpSession session, String wageDate){
					List<Volunteer> list=userService.get_volunteer_with_hours_by_Date(wageDate);

					Iterator<Volunteer> it = list.iterator();
					while(it.hasNext()){
						Volunteer listElement = (Volunteer)it.next(); 
				        if (listElement.getType().equals("内部志愿者")) {
				            it.remove(); 
				        }
				    }
					
					session.setAttribute("list", list);
					session.setAttribute("wageDate",wageDate);
					
					if(list == null || list.size()<=0) {
						session.setAttribute("message", "1");
					}
					else {
					session.setAttribute("message", "0");
					session.setAttribute("totalHours", userService.get_total_wage_hours(list));
					session.setAttribute("totalAccount", userService.get_total_wage_hours(list)/4*15);
					}
					return new ModelAndView("/wagePage");
				} 
		
			    // 跳转至yearPage页面
				@RequestMapping(value = "/yearPage")
			    public ModelAndView yearPage(HttpSession session){
					List<Record> list=null;
					session.setAttribute("list", list);
					session.setAttribute("yearDate","");
					session.setAttribute("totalYearHours","");
					session.setAttribute("totalVolunteerNum","");
					session.setAttribute("yearNewVolunteerNum","");
					session.setAttribute("message", "0");
					return new ModelAndView("/yearPage");
				}
				
			    // 跳转至monthPage页面
				@RequestMapping(value = "/monthPage")
			    public ModelAndView monthPage(HttpSession session){
					List<Record> list=null;
					session.setAttribute("list", list);
					session.setAttribute("monthDate","");
					session.setAttribute("totalMonthHours","");
					session.setAttribute("totalMonthVolunteerNum","");
					session.setAttribute("monthNewVolunteerNum","");
					session.setAttribute("message", "0");
					return new ModelAndView("/monthPage");
				} 
				
			    // 跳转至CQUMonthPage页面
				@RequestMapping(value = "/CQUMonthPage")
			    public ModelAndView CQUMonthPage(HttpSession session){
					List<Record> list=null;
					session.setAttribute("list", list);
					session.setAttribute("monthDate","");
					session.setAttribute("totalMonthHours","");
					session.setAttribute("totalMonthVolunteerNum","");
					session.setAttribute("monthNewVolunteerNum","");
					session.setAttribute("message", "0");
					return new ModelAndView("/CQUMonthPage");
				}
				
				@RequestMapping(value = "/schoolPage")
			    public ModelAndView schoolPage(HttpSession session){
					List<Record> list=null;
					session.setAttribute("list", list);
					session.setAttribute("yearDate","");
					session.setAttribute("unit","");
					session.setAttribute("totalYearHours","");
					session.setAttribute("totalVolunteerNum","");
					session.setAttribute("yearNewVolunteerNum","");
					session.setAttribute("message", "0");
					return new ModelAndView("/schoolPage");
				} 
				
				@RequestMapping(value = "/schoolMonthPage")
			    public ModelAndView schoolMonthPage(HttpSession session){
					List<Record> list=null;
					session.setAttribute("list", list);
					session.setAttribute("monthDate","");
					session.setAttribute("unit","");
					session.setAttribute("totalMonthHours","");
					session.setAttribute("totalVolunteerNum","");
					session.setAttribute("monthNewVolunteerNum","");
					session.setAttribute("message", "0");
					return new ModelAndView("/schoolMonthPage");
				} 
				
				//年度统计模糊查询
						@RequestMapping("/yearFinder")
						public ModelAndView yearFinder(HttpSession session, String yearDate, String type_input){
							List<Volunteer> list =new ArrayList<Volunteer>();
							String newNum = "";
							if(type_input.equals("所有志愿者")) {
							list=userService.get_volunteer_with_hours_by_Date_DESC(yearDate);
							newNum = userService.get_new_volunteer_by_year(yearDate);
							}
							else if(type_input.equals("社会志愿者")) {
								list=userService.get_social_volunteer_with_hours_by_Date_DESC(yearDate);
								newNum = userService.get_new_social_volunteer_by_year(yearDate);
								}
								else if(type_input.equals("内部志愿者")) {
								list=userService.get_inner_volunteer_with_hours_by_Date_DESC(yearDate);
								newNum = userService.get_new_inner_volunteer_by_year(yearDate);
								}
							session.setAttribute("list", list);
							session.setAttribute("yearDate",yearDate);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
								int count = 0;
								for(int i=0; i < list.size(); i++) {
									count += Integer.parseInt(list.get(i).getCount());
								}
								session.setAttribute("message", "0");
								session.setAttribute("totalYearHours",userService.get_total_wage_hours(list));
								session.setAttribute("totalVolunteerNum",count);
								session.setAttribute("yearNewVolunteerNum",newNum);
							}
							return new ModelAndView("/yearPage");
						} 
						
						//月份统计模糊查询
						@RequestMapping("/monthFinder")
						public ModelAndView monthFinder(HttpSession session, String monthDate, String type_input){
							List<Volunteer> list =new ArrayList<Volunteer>();
							String newNum = "";
							if(type_input.equals("所有志愿者")) {
							list=userService.get_volunteer_with_hours_by_Date_DESC(monthDate);
							newNum = userService.get_new_volunteer_by_year(monthDate);
							}
							else if(type_input.equals("社会志愿者")) {
								list=userService.get_social_volunteer_with_hours_by_Date_DESC(monthDate);
								newNum = userService.get_new_social_volunteer_by_year(monthDate);
								}
								else if(type_input.equals("内部志愿者")) {
								list=userService.get_inner_volunteer_with_hours_by_Date_DESC(monthDate);
								newNum = userService.get_new_inner_volunteer_by_year(monthDate);
								}
							session.setAttribute("list", list);
							session.setAttribute("monthDate",monthDate);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
								int count = 0;
								for(int i=0; i < list.size(); i++) {
									count += Integer.parseInt(list.get(i).getCount());
								}
								session.setAttribute("message", "0");
								session.setAttribute("totalMonthHours",userService.get_total_wage_hours(list));
								session.setAttribute("totalMonthVolunteerNum",count);
								session.setAttribute("monthNewVolunteerNum",newNum);
							}
							return new ModelAndView("/monthPage");
						} 
						
						//重庆大学月份统计模糊查询
						@RequestMapping("/CQUMonthFinder")
						public ModelAndView CQUMonthFinder(HttpSession session, String monthDate, String school_input){
							List<Volunteer> list =new ArrayList<Volunteer>();

							list = userService.get_CQU_volunteer_with_hours_by_Date_DESC(monthDate, school_input);
							
							session.setAttribute("list", list);
							session.setAttribute("monthDate",monthDate);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
								int count = 1;
								for (Volunteer volunteer : list) {
									volunteer.setNum(String.valueOf(count++));
								}
								session.setAttribute("message", "0");
							}
							return new ModelAndView("/CQUMonthPage");
						} 
						
						@RequestMapping("/schoolFinder")
						public ModelAndView schoolFinder(HttpSession session, String yearDate, String unit){
							List<Volunteer> list=userService.get_volunteer_by_school_with_hours_by_Date_DESC(yearDate,unit);
							session.setAttribute("list", list);
							session.setAttribute("yearDate",yearDate);
							session.setAttribute("unit",unit);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
								int count = 0;
								for(int i=0; i < list.size(); i++) {
									count += Integer.parseInt(list.get(i).getCount());
								}
								session.setAttribute("message", "0");
								session.setAttribute("totalYearHours",userService.get_total_wage_hours_by_year_and_school(list));
								session.setAttribute("totalVolunteerNum",count);
								session.setAttribute("yearNewVolunteerNum",userService.get_new_volunteer_by_year_and_school(yearDate,unit));
							}
							return new ModelAndView("/schoolPage");
						}
						
						@RequestMapping("/schoolMonthFinder")
						public ModelAndView schoolMonthFinder(HttpSession session, String monthDate, String unit){
							List<Volunteer> list=userService.get_volunteer_by_school_with_hours_by_Date_DESC(monthDate,unit);
							session.setAttribute("list", list);
							session.setAttribute("monthDate",monthDate);
							session.setAttribute("unit",unit);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
								int count = 0;
								for(int i=0; i < list.size(); i++) {
									count += Integer.parseInt(list.get(i).getCount());
								}
								session.setAttribute("message", "0");
								session.setAttribute("totalMonthHours",userService.get_total_wage_hours_by_year_and_school(list));
								session.setAttribute("totalVolunteerNum",count);
								session.setAttribute("monthNewVolunteerNum",userService.get_new_volunteer_by_year_and_school(monthDate,unit));
							}
							return new ModelAndView("/schoolMonthPage");
						} 

}
