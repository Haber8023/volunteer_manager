<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table tr th, td {
	border: 1px solid red;
	text-align: center;
}

table tr th {
	border: 1px solid red;
	text-align: center;
}
</style>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>志愿者时长管理系统</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="robots" content="all,follow">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/fontastic.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/google.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/custom.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/lib/img/favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/vendor/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "1") {
			alert('志愿者信息修改成功');
		}
		if (msg == "2") {
			alert('志愿者信息修改失败');
		}
	</script>
	<div class="page">
		<header class="header"> <nav class="navbar">
		<div class="container-fluid">
			<div
				class="navbar-holder d-flex align-items-center justify-content-between">
				<div class="navbar-header">
					<a href="mainPage" class="navbar-brand d-none d-sm-inline-block">
						<div class="brand-text d-none d-lg-inline-block">志愿者时长管理系统</div>
						<div class="brand-text d-none d-sm-inline-block d-lg-none">
							<strong>VM</strong>
						</div>
					</a> <a id="toggle-btn" href="#" class="menu-btn active"> <span></span><span></span><span></span>
					</a>
				</div>
				<ul
					class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
				</ul>
			</div>
		</div>
		</nav> </header>
		<div class="page-content d-flex align-items-stretch">
			<nav class="side-navbar">
			<div class="sidebar-header d-flex align-items-center">
				<div class="title">
					<p>欢迎访问本系统！</p>
				</div>
			</div>
			<span class="heading">Main</span>
			<ul class="list-unstyled">
				<li><a href="mainPage"> <i class="icon-home"></i>首页
				</a></li>
				<li class="active"><a href="#volunteerManager"
					aria-expanded="false" data-toggle="collapse"> <i
						class="icon-user"></i>志愿者管理
				</a>
					<ul id="volunteerManager" class="collapse list-unstyled ">
						<li><a href="insertVolunteerPage">新增志愿者信息</a></li>
						<li class="active"><a href="manageVolunteerPage">管理志愿者信息</a></li>
					</ul></li>
				<li><a href="recordPage"> <i class="icon-padnote"></i>查看服务记录
				</a></li>
				<li><a href="timeInPage"> <i class="icon-check"></i>时长录入
				</a></li>
				<li><a href="forgetTimeInPage"> <i
						class="icon-pencil-case"></i>时长补录
				</a></li>
			</ul>
			<span class="heading">Extras</span>
			<ul class="list-unstyled">
				<li><a href="accountPage"> <i
						class="icon-interface-windows"></i>财务报表
				</a></li>
				<li><a href="wagePage"> <i class="icon-grid"></i>工资结算
				</a></li>
								<li><a href="monthPage"> <i class="icon-line-chart"></i>月份统计
				</a></li>
				<li><a href="yearPage"> <i class="icon-line-chart"></i>年度统计
				</a></li>
								<li><a href="schoolPage"> <i class="icon-page"></i>单位年统计
				</a></li>					<li><a href="schoolMonthPage"> <i class="icon-page"></i>单位月统计
				</a></li>
			</ul>
			</nav>
			<div class="content-inner">

				<div style="margin: 0px; background-color: white; margin: 0 10px;">
					<blockquote class="layui-elem-quote">
						<div class="cxbottom">
							<center>
								<h1>&ensp;</h1>
							</center>
						</div>
							<div class="panel-body" style="padding-bottom: 0px;">
							<form class="form-horizontal" name="inputForm "
								action="manageVolunteerFinder" onsubmit="return validateForm()"
								method="post">

								<div class="tableWrap">
									<table width="100%" class="table table-hover table-bordered"
										id="Table" data-toggle="table" data-toggle="table"
										data-pagination="true" data-side-pagination="client">
										<tr>
											<th width="12%">加入志愿者日期：</th>
											<td width="21%">
												<div class="" id="data_5">
													<div class="input-daterange input-group" id="datepicker">
														<input type="text" placeholder="格式：yyyy-MM-dd中的任意一部分"
															value="${manageVolunteerJoinDate}" class="form-control"
															style="border-radius: 3px; height: 30px" id="joinDate"
															name="joinDate"></input>
													</div>
												</div>
											</td>
											<th width="12%">志愿者编号：</th>
											<td width="21%"><input type="text"
												placeholder="准确查找，完整数字编号" value="${manageVolunteerNum}"
												class="form-control"
												style="border-radius: 3px; height: 30px" id="num" name="num">
											</td>
										</tr>
										<tr>
											<th>志愿者姓名：</th>
											<td><input type="text" placeholder="模糊查找，志愿者姓名中的一部分即可"
												value="${manageVolunteerName}" class="form-control"
												style="border-radius: 3px; height: 30px" id="name"
												name="name"></td>
											<th>所在单位：</th>
											<td><input type="text" placeholder="模糊查找，所在单位名字中的一部分即可"
												value="${manageVolunteerUnit}" class="form-control"
												style="border-radius: 3px; height: 30px" id="unit"
												name="unit"></td>
										</tr>
									</table>
									<div class="cxbottom">
										<center>
											<button type="submit">查 询</button>
										</center>
									</div>
									
							</Form>
						</div>
					</blockquote>
					<div id="content" style="width: 100%; height: 533px;">
						<table class="table table-hover table-bordered" id="Table"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client">
							<thead>
								<tr>
									<th>编号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>出生日期</th>
									<th>所在单位</th>
									<th>居住地址</th>
								    <th>手机号码</th>
								    <th>志愿者类型</th>			
									<th>加入日期</th>
									<th>职业</th>
									<th>学历</th>
									<th>医学相关</th>
									<th>总时长</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="volunteer_list">
									<tr style="height: auto;">
										<td>${volunteer_list.num }</td>
										<td>${volunteer_list.name}</td>
										<td>${volunteer_list.gender}</td>
										<td>${volunteer_list.birthday}</td>
										<td>${volunteer_list.unit}</td>
										<td>${volunteer_list.address}</td>
										<td>${volunteer_list.tel}</td>
										<td>${volunteer_list.type}</td>
										<td>${volunteer_list.joinDate}</td>
										<td>${volunteer_list.occupation}</td>
										<td>${volunteer_list.education}</td>
										<td>${volunteer_list.relate}</td>
										<td>${volunteer_list.totalTime}</td>
										<td>	<button class="btn btn-warning btn-sm"
												onclick="updateVolunteerModal(this)" data-toggle="modal">修改信息</button>
										</td>
									</tr>
								</c:forEach>

							</tbody>

						</table>

					</div>
					<h1>&ensp;</h1><h1>&ensp;</h1>
					<center>
						<li>共<i class="blue">${pageInfo.total}</i>条记录，当前显示第<i
							class="blue">${pageInfo.pageNum}</i>页， 总<i class="blue">${pageInfo.pages }</i>页
							<a
							href="${pageContext.request.contextPath}/manageVolunteerPage?currentPage=1"><button
									class="layui-btn layui-btn-normal  layui-btn-sm">首页</button></a> <c:if
								test="${pageInfo.hasPreviousPage }">
								<a
									href="${pageContext.request.contextPath}/manageVolunteerPage?currentPage=${pageInfo.pageNum-1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">上一页</button></a>
							</c:if> <c:if test="${pageInfo.hasNextPage }">
								<a
									href="${pageContext.request.contextPath}/manageVolunteerPage?currentPage=${pageInfo.pageNum+1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">下一页</button></a>
							</c:if> <a
							href="${pageContext.request.contextPath}/manageVolunteerPage?currentPage=${pageInfo.pages}"><button>
									末页</button></a>
						</li>
					</center>
					<div class="cxbottom">
						<center>
							<h1>&ensp;</h1>
							<h1>&ensp;</h1>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="updateVolunteerModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">修改志愿者信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="updateVolunteerForm" id="updateVolunteerForm" action="updateVolunteer"
					onsubmit="return anotherValidateForm()" method="post" class="form-validate">
										<div class="modal-body">
						志愿者编号：&ensp;&ensp; <input id="num_check" style="border: none;" type="text"
							name="num_check" readonly>
					</div>
					<div class="modal-body">
						志愿者姓名： <input id="name_check"  type="text"
							name="name_check" >
					</div>
					<div class="modal-body">
						志愿者性别： 
						<input id="gender_check"  type="text"
							name="gender_check" >
					</div>
					<div class="modal-body">
						出生日期：&ensp;&ensp; <input id="birthday_check"  type="text"
							name="birthday_check" >
					</div>
					<div class="modal-body">
						所在单位：&ensp;&ensp; <input id="unit_check" type="text"
							name="unit_check" >
					</div>
					<div class="modal-body">
						居住地址：&ensp;&ensp; <input id="address_check" type="text"
							name="address_check" >
					</div>
					<div class="modal-body">
						手机号码：&ensp;&ensp; <input id="tel_check"  type="text"
							name="tel_check" >
					</div>
					<div class="modal-body">
						志愿者类型： <input id="type_check" type="text"
							name="type_check">
					</div>
					<div class="modal-body">
						加入日期：&ensp;&ensp; <input id="joinDate_check" type="text"
							name="joinDate_check">
					</div>
										<div class="modal-body">
						志愿者职业： <input id="occupation_check" type="text"
							name="occupation_check">
					</div>
										<div class="modal-body">
						志愿者学历： <input id="education_check" type="text"
							name="education_check">
					</div>
										<div class="modal-body">
						医学相关：&ensp;&ensp; <input id="relate_check" type="text"
							name="relate_check">
					</div>
										<div class="modal-footer">
						<button type="submit" class="btn btn-success" >修改</button>

					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/popper.js/umd/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/chart.js/Chart.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/lib/vendor/jquery-validation/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/lib/js/front.js"></script>
	<script>
		function updateVolunteerModal(obj) {
			$("#updateVolunteerModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var num_check = $td.eq(0).text();
			var name_check = $td.eq(1).text();
			var gender_check = $td.eq(2).text();
			var birthday_check = $td.eq(3).text();
			var unit_check = $td.eq(4).text();
			var address_check = $td.eq(5).text();
			var tel_check = $td.eq(6).text();
			var type_check = $td.eq(7).text();
			var joinDate_check = $td.eq(8).text();
			var occupation_check = $td.eq(9).text();
			var education_check = $td.eq(10).text();
			var relate_check = $td.eq(11).text();
			$("#occupation_check").val(occupation_check);
			$("#education_check").val(education_check);
			$("#relate_check").val(relate_check);
			$("#num_check").val(num_check);
			$("#name_check").val(name_check);
			$("#gender_check").val(gender_check);
			$("#birthday_check").val(birthday_check);
			$("#unit_check").val(unit_check);
			$("#address_check").val(address_check);
			$("#tel_check").val(tel_check);
			$("#type_check").val(type_check);
			$("#joinDate_check").val(joinDate_check);
		}
	</script>
	<script>
		function validateForm() {
			var name = document.forms["inputForm"]["name"].value;
			var num = document.forms["inputForm"]["num"].value;
			var unit = document.forms["inputForm"]["unit"].value;
			var joinDate = document.forms["inputForm"]["joinDate"].value;

			if (num == null || num == "") {
				if (name == null || name == "") {
					if (unit == null || unit == "") {
						if (joinDate == null || joinDate == "") {
							return false;
						}
					}
				}
			}
		}
	</script>
	<script>
		function anotherValidateForm() {
			var name = document.forms["updateVolunteerForm"]["name_check"].value;
			var gender = document.forms["updateVolunteerForm"]["gender_check"].value;
			var tel = document.forms["updateVolunteerForm"]["tel_check"].value;
			var type = document.forms["updateVolunteerForm"]["type_check"].value;
			var relate = document.forms["updateVolunteerForm"]["relate_check"].value;
			var occupation = document.forms["updateVolunteerForm"]["occupation_check"].value;
			var education = document.forms["updateVolunteerForm"]["education_check"].value;
			var address = document.forms["updateVolunteerForm"]["address_check"].value;
			var birthday = document.forms["updateVolunteerForm"]["birthday_check"].value;
			var unit = document.forms["updateVolunteerForm"]["unit_check"].value;

			
			if (name == null || name == "") {
				alert("志愿者姓名不能为空");
				return false;
			} else if (gender == null || gender == "") {
				alert("志愿者性别不能为空");
				return false;
			} else if (tel == null || tel == "") {
				alert("手机号码不能为空");
				return false;
			} else if (type == null || type == "") {
				alert("志愿者类型不能为空");
				return false;
			} else if (relate == null || relate == "") {
					alert("医学相关不能为空");
					return false;
			} else if (occupation == null || occupation == "") {
				alert("志愿者职业不能为空");
				return false;
			} else if (education == null || education == "") {
				alert("志愿者学历不能为空");
				return false;
			} else if (address == null || address == "") {
				alert("志愿者地址不能为空");
				return false;
			} else if (birthday == null || birthday == "") {
				alert("志愿者生日不能为空");
				return false;
			} else if (unit == null || unit == "") {
				alert("志愿者单位不能为空");
				return false;
			}
			
			if("重庆主城内"==address){}else if("重庆市以外"==address){}else if("无"==address){}else if("重庆其它区县"==address){}else if("境外"==address){}else{
				 alert("居住地址选项:重庆主城内,重庆市以外,重庆其它区县,境外，请重新填写");  
			     return false; 
			}
			if("社会志愿者"==type){}else if("内部志愿者"==type){}else{
				alert("志愿者类型选项:社会志愿者,内部志愿者，请重新填写");  
			     return false; 
			}
			if("是"==relate){}else if("否"==relate){}else{
				 alert("志愿者类型选项:是,否，请重新填写");  
			     return false; 
			}
			if("学生"==occupation){}else if("工作中"==occupation){}else if("无"==occupation){}else if("退休"==occupation){}else if("其它"==occupation){}else{
				alert("志愿者职业选项:学生,工作中,退休,其它，请重新填写");  
			     return false; 
			}
			if("博士"==education){}else if("硕士"==education){}else if("无"==education){}else if("本科"==education){}else if("其它"==education){}else{
				 alert("志愿者学历选项:博士,硕士,本科,其它，请重新填写"); 
			     return false; 
			}
			if("无"==birthday){
				
			}
			else if(!(/^((?:19|20)\d\d)-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/.test(birthday))||){
		        alert("出生日期格式有误（YYYY-MM-DD），请重新填写");  
		        return false; 
			}
			
			if(!(/^1[3456789]\d{9}$/.test(tel))){ 
		        alert("手机号码有误，请重新填写");  
		        return false; 
		    } 
			

		}
	</script>
</body>
</html>