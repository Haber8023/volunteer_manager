package com.zzx.Controller;

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
import com.zzx.Model.Record;
import com.zzx.Service.UserService;
import com.zzx.Utils.Tools;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {

	@Autowired
	private UserService userService; 
	
	// 跳转至首页
		@RequestMapping(value = "/mainPage")
		public String mainPage(HttpSession session) {
			Tools tool = new Tools();
			session.setAttribute("nowDate", tool.get_current_date());
			session.setAttribute("message", "0");
			session.setAttribute("totalMembers", userService.get_volunteer_num());
			session.setAttribute("joinMembers", userService.get_volunteer_num_by_date(tool.get_current_date()));
			session.setAttribute("todayMembers", userService.get_record_num_by_date(tool.get_current_date()));
			session.setAttribute("todayHours", userService.get_record_hour_by_date(tool.get_current_date()));
			return "mainPage";
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
		public String insertVolunteer(String type, Volunteer volunteer, HttpSession session) {
			int isNew =type.indexOf('新')+1;
			volunteer.setNum(userService.get_num());
if("0".equals(volunteer.getID())||"1".equals(volunteer.getID())) {
	if (userService.insert_volunteer(volunteer,isNew)) {
		session.setAttribute("message", "1");
		return "insertVolunteerPage";
	}
}
else if (userService.check_volunteer(volunteer.getID())) {
				session.setAttribute("message", "3");
				return "insertVolunteerPage";
			}			
			else if (userService.insert_volunteer(volunteer,isNew)) {
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
			volunteer.setName((String)session.getAttribute("manageVolunteerName"));
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
					session.setAttribute("recordNum", record.getNum());
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
			record.setNum((String)session.getAttribute("recordNum"));
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
				record.setNum((String)session.getAttribute("recordNum"));
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
			session.setAttribute("message", "0");
			session.setAttribute("totalHours", userService.get_total_hours(list));
			session.setAttribute("totalAccount", userService.get_total_hours(list)/4*15);
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
			volunteer.setNum((String)session.getAttribute("timeInNum"));
			volunteer.setName((String)session.getAttribute("timeInName"));
			volunteer.setJoinDate((String)session.getAttribute("timeInJoinDate"));
			volunteer.setUnit((String)session.getAttribute("timeInUnit"));
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);

			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("message", "0");
			return new ModelAndView("/timeInPage");
		} 
		
		//timeInPage模糊查询volunteer
		@RequestMapping("/timeInFinder")
	    public ModelAndView timeInFinder( HttpSession session,Volunteer volunteer,
				@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
				Map<String,Object> map){
			PageHelper.startPage(currentPage,8);
			List<Volunteer> list=userService.get_volunteer_time_in(volunteer);
			PageInfo<Volunteer> pageInfo=new PageInfo<Volunteer>(list,8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("timeInNum", volunteer.getNum());
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
					volunteer.setNum((String)session.getAttribute("timeInNumForget"));
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
					session.setAttribute("timeInNumForget", volunteer.getNum());
					session.setAttribute("timeInNameForget", volunteer.getName());
					session.setAttribute("timeInJoinDateForget", volunteer.getJoinDate());
					session.setAttribute("timeInUnitForget", volunteer.getUnit());
					session.setAttribute("message", "0");
					System.out.println(volunteer.toString());
					return new ModelAndView("/forgetTimeInPage");
				}
		
		//更新志愿者信息
		@RequestMapping(value = "/updateVolunteer")
		 public ModelAndView updateVolunteer( HttpSession session,String num_check, String name_check,String joinDate_check,
				 String ID_check,String unit_check,String tel_check,String eMail_check,String address_check,
					@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
					Map<String,Object> map){			
			if (userService.update_volunteer(num_check, name_check,
					 ID_check,unit_check,tel_check,eMail_check,address_check,joinDate_check)) {
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
				 public ModelAndView halfDayIn( HttpSession session,String num_ensure, String place_ensure, String other_place_ensure, int hours_ensure, String record_detail_ensure,
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
					int volunteerTime = hours_ensure;
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
							int hours_ensure, String date_ensure, @RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
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
					int volunteerTime = hours_ensure;
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
					session.setAttribute("list", list);
					session.setAttribute("wageDate",wageDate);
					if(list == null) {
						session.setAttribute("message", "1");
					}
					else {
					session.setAttribute("message", "0");
					session.setAttribute("totalHours", userService.get_total_wage_hours(list));
					session.setAttribute("totalAccount", userService.get_total_wage_hours(list)/4*15);
					}
					return new ModelAndView("/wagePage");
				} 
		
			    // 跳转至year页面
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
				
				//年度统计模糊查询
						@RequestMapping("/yearFinder")
						public ModelAndView yearFinder(HttpSession session, String yearDate){
							List<Volunteer> list=userService.get_volunteer_with_hours_by_Date_DESC(yearDate);
							session.setAttribute("list", list);
							session.setAttribute("yearDate",yearDate);
							if(list == null) {
								session.setAttribute("message", "1");
							}
							else {
							
							session.setAttribute("message", "0");
							session.setAttribute("totalYearHours",userService.get_total_wage_hours(list));
							session.setAttribute("totalVolunteerNum",list.size());
							session.setAttribute("yearNewVolunteerNum",userService.get_new_volunteer_by_year(yearDate));
							}
							return new ModelAndView("/yearPage");
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
							session.setAttribute("message", "0");
							session.setAttribute("totalYearHours",userService.get_total_wage_hours_by_year_and_school(list));
							session.setAttribute("totalVolunteerNum",list.size());
							session.setAttribute("yearNewVolunteerNum",userService.get_new_volunteer_by_year_and_school(yearDate,unit));
							}
							return new ModelAndView("/schoolPage");
						} 

}
