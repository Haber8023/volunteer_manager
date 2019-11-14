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
	href="<%=request.getContextPath()%>/lib/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/fontastic.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/style.default.css"
	id="theme-stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/lib/css/custom.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/lib/img/favicon.ico">

</head>
<body>
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "1") {
			alert('时长录入成功');
		}
		if (msg == "2") {
			alert('时长录入失败');
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
				<li><a href="recordPage"> <i class="icon-padnote"></i>查看服务记录
				</a></li>
				<li class="active"><a href="timeInPage"> <i
						class="icon-check"></i>时长录入
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
				<li><a href="yearPage"> <i class="icon-line-chart"></i>年度统计
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
								action="timeInFinder" onsubmit="return validateForm()"
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
															value="${timeInJoinDate}" class="form-control"
															style="border-radius: 3px; height: 30px" id="joinDate"
															name="joinDate"></input>
													</div>
												</div>
											</td>
											<th width="12%">志愿者编号：</th>
											<td width="21%"><input type="text"
												placeholder="准确查找，完整数字编号" value="${timeInNum}"
												class="form-control"
												style="border-radius: 3px; height: 30px" id="num" name="num">
											</td>
										</tr>
										<tr>
											<th>志愿者姓名：</th>
											<td><input type="text" placeholder="模糊查找，志愿者姓名中的一部分即可"
												value="${timeInName}" class="form-control"
												style="border-radius: 3px; height: 30px" id="name"
												name="name"></td>
											<th>所在单位：</th>
											<td><input type="text" placeholder="模糊查找，所在单位名字中的一部分即可"
												value="${timeInUnit}" class="form-control"
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
									<th>所在单位</th>
									<th>加入时间</th>
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
										<td>${volunteer_list.unit}</td>
										<td>${volunteer_list.joinDate}</td>
										<td>${volunteer_list.totalTime}</td>
										<td><button class="btn btn-info btn-sm"
												onclick="halfDayInModal(this)" data-toggle="modal">录入半天</button>

											<button class="btn btn-success btn-sm"
												onclick="allDayInModal(this)" data-toggle="modal">录入全天</button>
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
							href="${pageContext.request.contextPath}/timeInPage?currentPage=1"><button
									class="layui-btn layui-btn-normal  layui-btn-sm">首页</button></a> <c:if
								test="${pageInfo.hasPreviousPage }">
								<a
									href="${pageContext.request.contextPath}/timeInPage?currentPage=${pageInfo.pageNum-1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">上一页</button></a>
							</c:if> <c:if test="${pageInfo.hasNextPage }">
								<a
									href="${pageContext.request.contextPath}/timeInPage?currentPage=${pageInfo.pageNum+1}"><button
										class="layui-btn layui-btn-normal  layui-btn-sm">下一页</button></a>
							</c:if> <a
							href="${pageContext.request.contextPath}/timeInPage?currentPage=${pageInfo.pages}"><button>
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
	<div class="modal fade" id="halfDayInModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">录入半天时长</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="halfDayInForm" id="halfDayInForm" action="halfDayIn"
					method="post" class="form-validate" onsubmit="return halfForm()">
					<div class="modal-body">
						志愿者编号： <input id="num_ensure" style="border: none;" type="text"
							name="num_ensure" readonly>
					</div>
					<div class="modal-body">
						志愿者姓名： <input id="name_ensure" style="border: none;" type="text"
							name="name_ensure" readonly>
					</div>
					<div class="modal-body">
						服务部门： <select name="place_ensure" id="place_ensure">
							<option>B超</option>
							<option>CT室</option>
							<option>患者服务中心</option>
							<option>康复会</option>
							<option>门诊广场</option>
							<option>门诊一楼</option>
							<option>门诊二楼</option>
							<option>内分泌</option>
							<option>内镜办公室</option>
							<option>内科负一楼</option>
							<option>内科一楼</option>
							<option>内科大楼</option>
							<option>特病</option>
							<option>体检中心</option>
							<option>药房</option>
							<option>中药房</option>
							<option>其它</option>
						</select>
					</div>
										<div class="modal-body">
						其它部门： <input id="other_place_ensure"  type="text"
							name="other_place_ensure"  placeholder="上面选择其它时生效" autocomplete="off">
					</div>
										<div class="modal-body">
						服务内容： <input id="record_detail_ensure"  type="text"
							name="record_detail_ensure" >
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">提交</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="allDayInModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">录入全天时长</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form name="allDayInForm" id="allDayInForm" action="allDayIn"
					method="post" class="form-validate" onsubmit="return allForm()">
					<div class="modal-body">
						志愿者编号： <input id="num_ensure_all" style="border: none;" type="text"
							name="num_ensure_all" readonly>
					</div>
					<div class="modal-body">
						志愿者姓名： <input id="name_ensure_all" style="border: none;" type="text"
							name="name_ensure_all" readonly>
					</div>
					<div class="modal-body">
						服务部门： <select name="place_all" id="place_all">
							<option>B超</option>
							<option>CT室</option>
							<option>患者服务中心</option>
							<option>康复会</option>
							<option>门诊广场</option>
							<option>门诊一楼</option>
							<option>门诊二楼</option>
							<option>内分泌</option>
							<option>内镜办公室</option>
							<option>内科负一楼</option>
							<option>内科一楼</option>
							<option>内科大楼</option>
							<option>特病</option>
							<option>体检中心</option>
							<option>药房</option>
							<option>中药房</option>
							<option>其它</option>
						</select>
					</div>
										<div class="modal-body">
						其它部门： <input id="other_place_all"  type="text"
							name="other_place_all"  placeholder="上面选择其它时生效" autocomplete="off">
					</div>
										<div class="modal-body">
						服务内容： <input id="record_detail_all"  type="text"
							name="record_detail_all" >
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">提交</button>
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
		function halfDayInModal(obj) {
			$("#halfDayInModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var num_ensure = $td.eq(0).text();
			var name_ensure = $td.eq(1).text();
			$("#num_ensure").val(num_ensure);
			$("#name_ensure").val(name_ensure);
		}
	</script>
	<script>
		function allDayInModal(obj) {
			$("#allDayInModal").modal('show');
			var $td = $(obj).parents('tr').children('td');
			var num_ensure_all = $td.eq(0).text();
			var name_ensure_all = $td.eq(1).text();
			$("#num_ensure_all").val(num_ensure_all);
			$("#name_ensure_all").val(name_ensure_all);
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
</body>
</html>