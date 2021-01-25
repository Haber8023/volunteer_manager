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
			alert('删除成功');
		}
		if (msg == "2") {
			alert('删除失败');
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
				<li><a href="#volunteerManager" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-user"></i>志愿者管理
				</a>
					<ul id="volunteerManager" class="collapse list-unstyled ">
						<li><a href="insertVolunteerPage">新增志愿者信息</a></li>
						<li><a href="manageVolunteerPage">管理志愿者信息</a></li>
					</ul></li>
				<li class="active"><a href="recordPage"> <i
						class="icon-padnote"></i>查看服务记录
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
								action="recordFinder" onsubmit="return validateForm()"
								method="post">

								<div class="tableWrap">
									<table width="100%" class="table table-hover table-bordered"
										id="Table" data-toggle="table" data-toggle="table"
										data-pagination="true" data-side-pagination="client">
										<tr>
											<th width="12%">服务时间：</th>
											<td width="21%">
												<div class="" id="data_5">
													<div class="input-daterange input-group" id="datepicker">
														<input type="text" placeholder="格式：yyyy-MM-dd中的任意一部分"
															value="${recordDate}" class="form-control"
															style="border-radius: 3px; height: 30px" id="recordDate"
															name="recordDate"></input>
													</div>
												</div>
											</td>
											<th width="12%">手机号码：</th>
											<td width="21%"><input type="text"
												placeholder="准确查找，完整手机号码" value="${recordTel}"
												class="form-control"
												style="border-radius: 3px; height: 30px" id="tel" name="tel">
											</td>
										</tr>
										<tr>
											<th>志愿者姓名：</th>
											<td><input type="text" placeholder="模糊查找，志愿者姓名中的一部分即可"
												value="${recordName}" class="form-control"
												style="border-radius: 3px; height: 30px" id="name"
												name="name"></td>
											<th>所在单位：</th>
											<td><input type="text" placeholder="模糊查找，所在单位名字中的一部分即可"
												value="${recordUnit}" class="form-control"
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
								<th>记录ID</th>
									<th>志愿者编号</th>
									<th>志愿者姓名</th>
									<th>手机号码</th>
									<th>所在单位</th>
									<th>服务日期</th>
									<th>服务部门</th>
									<th>服务内容</th>
									<th>服务时长</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="record_list">
									<tr style="height: auto;">
										<td>${record_list.recordID }</td>
										<td>${record_list.num }</td>
										<td>${record_list.name }</td>
										<td>${record_list.tel }</td>
										<td>${record_list.unit }</td>
										<td>${record_list.recordDate}</td>
										<td>${record_list.place}</td>
										<td>${record_list.recordDetail}</td>
										<td>${record_list.volunteerTime}</td>
										<td><button class="btn btn-danger btn-sm"
												onclick="deleteRecordModal(this)" data-toggle="modal">删除记录</button>
										</td>
									</tr>
								</c:forEach>

							</tbody>

						</table>

					</div>
					<center>
						<li>共<i class="blue">${pageInfo.total}</i>条记录，当前显示第<i
							class="blue">${pageInfo.pageNum}</i>页， 总<i class="blue">${pageInfo.pages }</i>页
							<a
							href="${pageContext.request.contextPath}/recordPage?currentPage=1"><button
									class="layui-btn layui-btn-normal  layui-btn-sm">首页</button></a> <c:if
								test="${pageInfo.hasPreviousPage }">
								<a
									href="${pageContext.request.contextPath}/recordPage?currentPage=${pageInfo.pageNum-1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">上一页</button></a>
							</c:if> <c:if test="${pageInfo.hasNextPage }">
								<a
									href="${pageContext.request.contextPath}/recordPage?currentPage=${pageInfo.pageNum+1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">下一页</button></a>
							</c:if> <a
							href="${pageContext.request.contextPath}/recordPage?currentPage=${pageInfo.pages}"><button>
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
	<div class="modal fade" id="deleteRecordModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">删除服务记录</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="checkVolunteerForm" id="checkVolunteerForm"
					action="deleteRecord" method="post" class="form-validate">
					<div class="modal-body">
						记录ID： <input id="record_id_check" style="border: none;"
							type="text" name="record_id_check" readonly>
					</div>
					<div class="modal-body">
						志愿者编号： <input id="num_check" style="border: none;" type="text"
							name="num_check" readonly>
					</div>
					<div class="modal-body">
						志愿者姓名： <input id="name_check" style="border: none;" type="text"
							name="name_check" readonly>
					</div>
					<div class="modal-body">
						手机号码： <input id="tel_check" style="border: none;" type="text"
							name="tel_check" readonly>
					</div>
					<div class="modal-body">
						所在单位： <input id="unit_check" style="border: none;" type="text"
							name="unit_check" readonly>
					</div>
					<div class="modal-body">
						服务时间： <input id="record_date_check" style="border: none;"
							type="text" name="record_date_check" readonly>
					</div>
					<div class="modal-body">
						服务部门： <input id="place_check" style="border: none;" type="text"
							name="place_check" readonly>
					</div>
										<div class="modal-body">
						服务内容： <input id="detail_check" style="border: none;" type="text"
							name="detail_check" readonly>
					</div>
					<div class="modal-body">
						服务时长： <input id="record_time_check" style="border: none;"
							type="text" name="record_time_check" readonly>
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success">确认删除</button>

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
		function deleteRecordModal(obj) {
			$("#deleteRecordModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var record_id_check = $td.eq(0).text();
			var num_check = $td.eq(1).text();
			var name_check = $td.eq(2).text();
			var tel_check = $td.eq(3).text();
			var unit_check = $td.eq(4).text();
			var record_date_check = $td.eq(5).text();
			var record_place_check = $td.eq(6).text();
			var detail_check = $td.eq(7).text();
			var record_time_check = $td.eq(8).text();
			$("#num_check").val(num_check);
			$("#name_check").val(name_check);
			$("#tel_check").val(tel_check);
			$("#unit_check").val(unit_check);
			$("#record_id_check").val(record_id_check);
			$("#record_date_check").val(record_date_check);
			$("#place_check").val(record_place_check);
			$("#detail_check").val(detail_check);
			$("#record_time_check").val(record_time_check);
		}
	</script>
	<script>
		function validateForm() {
			var name = document.forms["inputForm"]["name"].value;
			var tel = document.forms["inputForm"]["tel"].value;
			var unit = document.forms["inputForm"]["unit"].value;
			var joinDate = document.forms["inputForm"]["recordDate"].value;

			if (tel == null || tel == "") {
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
</body>
</html>