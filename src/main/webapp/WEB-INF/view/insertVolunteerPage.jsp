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
			alert('添加志愿者成功');
			window.location.replace("insertVolunteerPage")
		} else if (msg == "2") {
			alert('添加志愿者失败');
			window.location.replace("insertVolunteerPage")
		} else if (msg == "3") {
			alert('该志愿者已存在，请勿重复添加！');
			window.location.replace("insertVolunteerPage")
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
				<li ><a href="mainPage"> <i class="icon-home"></i>首页
				</a></li>
				<li class="active"><a href="#volunteerManager" aria-expanded="false"
					data-toggle="collapse"> <i class="icon-user"></i>志愿者管理
				</a>
					<ul id="volunteerManager" class="collapse list-unstyled ">
						<li class="active"><a href="insertVolunteerPage">新增志愿者信息</a></li>
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
				<li><a href="accountPage"> <i
						class="icon-interface-windows"></i>财务报表
				</a></li>
				<li><a href="wagePage"> <i class="icon-grid"></i>工资结算
				</a></li>
				<li><a href="yearPage"> <i class="icon-line-chart"></i>年度统计
				</a></li>
			</ul></nav>
			<div class="content-inner">
				<div style="width: 100%; heigth: 100%">
					<div class="card">
						<div class="card-body">
						<div class="cxbottom">
										<center>
											<h1 >&ensp;</h1>
											<h1 >&ensp;</h1>
										</center>
									</div>
							<form class="form-horizontal" name="inputForm "
								action="insertVolunteer" onsubmit="return validateForm()"
								method="post">
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:25px;color:black" class="col-sm-3 form-control-label">志愿者编号:&ensp;&ensp;<b>${newNum}</b></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">*姓名:<br><input id="name_input" type="text" name="name" placeholder="必填，请输入真实姓名" autocomplete="off" ></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">*身份证号:<br><input id="ID_input" type="text" name="ID" placeholder="必填，请输入18位身份证号" autocomplete="off"></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">&ensp;所在单位:<br><input id="unit_input" type="text" name="unit"></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">&ensp;居住地址:<br><input id="address_input" type="text" name="address"></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">*手机号码:<br><input id="tel_input" type="text" name="tel" placeholder="必填，请输入11位手机号" autocomplete="off"></label>
								</div>
								<div class="form-group row" style="position:relative;left:330px">
									<label style="font-size:20px;color:black" class="col-sm-3 form-control-label">&ensp;电子邮箱:<br><input id="eMail_input" type="text" name="eMail"></label>
								</div>
								<div class="line"></div>
								
									<div style="position:relative;left:400px">
										<button type="submit" class="btn btn-primary">提交</button>
									</div>	
							</form>
							<div class="cxbottom">
										<center>
											<h1 >&ensp;</h1>
											<h1 >&ensp;</h1>
										</center>
									</div>
																<div class="cxbottom">
										<center>
											<h1 >&ensp;</h1>
											<h1 >&ensp;</h1>
										</center>
									</div>
						</div>
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
			var name = document.forms["inputForm"]["name_input"].value;
			var ID = document.forms["inputForm"]["ID_input"].value;
			var tel = document.forms["inputForm"]["tel_input"].value;
			var eMail = document.forms["inputForm"]["eMail_input"].value;

			var eMailReg = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
			var idcardReg = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;

			if(ID!=0||ID!=1){
			if(!idcardReg.test(ID)) {
				alert("请输入正确的中国大陆地区18位身份证号码");
				return false;
			}
			}
			if(!(/^1[3456789]\d{9}$/.test(tel))){ 
		        alert("手机号码有误，请重新填写");  
		        return false; 
		    } 
			
			if (eMail != null && eMail != ""){
				if(!eMailReg.test(eMail)) {
					alert("请填写正确的电子邮箱地址");
					return false;
				}
		}
			
			if (name == null || name == "") {
				alert("志愿者姓名不能为空");
				return false;
			} else if (ID == null || ID == "") {
				alert("身份证号码不能为空");
				return false;
			} else if (tel == null || tel == "") {
				alert("手机号码不能为空");
				return false;
			}
		}
	</script>
</body>
</html>