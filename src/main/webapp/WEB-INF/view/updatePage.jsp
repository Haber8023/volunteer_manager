<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		var msg = "${admin_name}";
		if (msg == null || msg =='') {
			alert('登陆失效，请重新登录！');
			window.location.replace("logout");
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
					<li class="nav-item"><a href="logout" class="nav-link logout">
							<span class="d-none d-sm-inline">退出登录</span><i
							class="fa fa-sign-out"></i>
					</a></li>
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
				<li><a href="timeInPage"> <i class="icon-check"></i>时长录入
				</a></li>
				<li><a href="forgetTimeInPage"> <i
						class="icon-pencil-case"></i>时长补录
				</a></li>
			</ul>
			<span class="heading">Extras</span> 
			<ul class="list-unstyled">
			<!--
				<li><a href="accountPage"> <i
						class="icon-interface-windows"></i>财务报表
				</a></li>
				<li><a href="wagePage"> <i class="icon-grid"></i>工资结算
				</a></li>
				  -->
								<li><a href="monthPage"> <i class="icon-line-chart"></i>月份统计
				</a></li>
				<li><a href="yearPage"> <i class="icon-line-chart"></i>年度统计
				</a></li>
								<li><a href="schoolPage"> <i class="icon-page"></i>单位年统计
				</a></li>					<li><a href="schoolMonthPage"> <i class="icon-page"></i>单位月统计
				</a></li>
				<li><a href="CQUMonthPage"> <i class="icon-interface-windows"></i>重庆大学月统计
				</a></li>
				<li class="active"><a href="updatePage"> <i class="icon-grid"></i>修改密码
				</a></li>
			</ul></nav>
			<div class="content-inner">
				<div style="width: 100%; heigth: 100%">
					<div class="card">
						<div class="card-body">
							<form class="form-horizontal" name="inputForm"
								action="updateInfo" onsubmit="return validateForm()"
								method="post">
								<div class="line"></div>
								<div class="form-group row">
									<label class="col-sm-3 form-control-label">修改密码</label>
									<div class="col-sm-9">
										<input type="password" name="password" class="form-control">
										<small class="help-block-none">输入旧密码</small>
									</div>
									<label class="col-sm-3 form-control-label"></label>
									<div class="col-sm-9">
										<input type="password" name="password_new"
											class="form-control"> <small class="help-block-none">输入新密码</small>
									</div>
									<label class="col-sm-3 form-control-label"></label>
									<div class="col-sm-9">
										<input type="password" name="password_confirm"
											class="form-control"> <small class="help-block-none">重复输入新密码</small>
									</div>
								</div>
								<div class="line"></div>
								<div class="form-group row">
									<div class="col-sm-4 offset-sm-3">
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</div>
							</form>
						</div>
					</div>
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
		function validateForm() {
			var password = document.forms["inputForm"]["password"].value;
			var password_new = document.forms["inputForm"]["password_new"].value;
			var password_confirm = document.forms["inputForm"]["password_confirm"].value;
			if (password != null && password != "") {
				if (password_new == null || password_new == ""
						|| password_confirm == null || password_confirm == "") {
					alert("原密码、新密码、确认新密码都必须填写");
					return false;
				}
				if (password_new != password_confirm) {
					alert("两次输入的新密码不同");
					return false;
				}
			}
		}
	</script>

</body>
</html>