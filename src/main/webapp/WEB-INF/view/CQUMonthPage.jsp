<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
table tr th, td {
	text-align: center;
}

table tr th {
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
		var msg = "${admin_name}";
		if (msg == null || msg =='') {
			alert('登陆失效，请重新登录！');
			window.location.replace("logout");
		} 
	</script>
	<script type="text/javascript">
		var msg = "${message}";
		if (msg == "1") {
			alert('未检索到信息，请检查日期格式是否正确！');
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
				<li><a href="recordPage"> <i
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
				<li class="active"><a href="CQUMonthPage"> <i class="icon-interface-windows"></i>重庆大学月统计
				</a></li>
								<li><a href="updatePage"> <i class="icon-grid"></i>修改密码
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
							<form class="form-horizontal" id="inputForm" name="inputForm "
								action="CQUMonthFinder" onsubmit="return validateForm()"
								method="post">	
											<center>
											
											输入年月：<input type="text"
												placeholder="如：2019-01" value="${monthDate}"
												id="monthDate" name="monthDate">
																			&ensp;&ensp;&ensp;所在学院:<select name="school_input"><option> </option>
    						<optgroup label="人文学部">
							<option>外国语学院</option>
							<option>艺术学院</option>
							<option>体育学院</option>
							<option>美视电影学院</option>
							<option>国际学院</option>
							<option>弘深学院</option>
							<option>博雅学院</option>
							<option>人文社会科学高等研究院</option>
							</optgroup>
							<optgroup label="社会科学部">
							<option>公共管理学院</option>
							<option>经济与工商管理学院</option>
							<option>新闻学院</option>
							<option>法学院</option>
							<option>马克思主义学院</option>
							</optgroup>
							<optgroup label="理学部">
							<option>数学与统计学院</option>
							<option>物理学院</option>
							<option>化学化工学院</option>
							<option>生命科学学院</option>
							<option>现代物理中心</option>
							<option>分析测试中心</option>
							</optgroup>
							<optgroup label="工程学部">
							<option>机械与运载工程学院</option>
							<option>电气工程学院</option>
							<option>能源与动力工程学院</option>
							<option>资源与安全学院</option>
							<option>材料科学与工程学院</option>
							<option>航空航天学院</option>
							<option>重庆大学-辛辛那提大学联合学院</option>
							<option>机械传动国家重点实验室</option>
							<option>重庆自主品牌汽车协同创新中心</option>
							</optgroup>
							<optgroup label="建筑学部">
							<option>建筑城规学院</option>
							<option>土木工程学院</option>
							<option>环境与生态学院</option>
							<option>管理科学与房地产学院</option>
							</optgroup>
							<optgroup label="信息学部">
							<option>光电工程学院</option>
							<option>微电子与通信工程学院</option>
							<option>计算机学院</option>
							<option>自动化学院</option>
							<option>大数据与软件学院</option>
							<option>ICT中心</option>
							</optgroup>
							<optgroup label="医学部">
							<option>医学院</option>
							<option>药学院(创新药物研究中心)</option>
							<option>生物工程学院</option>
							<option>附属肿瘤医院</option>
							<option>附属三峡医院</option>
							<option>附属中心医院</option>
							</optgroup>
							<optgroup label="其他">
							<option>通信与测控中心</option>
							</optgroup></select><h3>&ensp;</h3>
																		
									<div class="cxbottom">
											<button type="submit" >查询统计</button>
																        <a id="dlink" style="display:none;"></a>
    <input id="button" type="button" value="导出为Excel表格">

									</div>
									</center>
							</form>
						</div>
					</blockquote>
					<div id="content" style="width: 100%; height: 533px;">

						<table class="table table-hover table-bordered" id="tables"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client" style="border: 1px solid black">
							<thead>
								<tr>
									<th>序号</th>
									<th>活动名称</th>
									<th>活动时间</th>
									<th>活动地点</th>
									<th>活动等级</th>
									<th>活动负责人</th>
									<th>活动负责人单位</th>
									<th>活动负责人电话</th>
									<th>志愿者姓名</th>
									<th>志愿者学院</th>
									<th>参与人学号</th>
									<th>志愿服务时间段</th>
									<th>志愿服务时长</th>
									<th>服务内容</th>
									
								</tr>		
							</thead>
							<tbody>
								<c:forEach items="${list}" var="record_list">
									<tr style="height: auto;">
										<td style="mso-number-format:'\@'">${record_list.num}</td>
										<td style="mso-number-format:'\@'">【志愿服务】重庆大学附属肿瘤医院志愿服务活动</td>
										<td style="mso-number-format:'\@'">${monthDate}</td>
										<td style="mso-number-format:'\@'">重庆大学附属肿瘤医院</td>
										<td style="mso-number-format:'\@'">校级</td>
										<td style="mso-number-format:'\@'">王燕燕</td>
										<td style="mso-number-format:'\@'">重庆大学附属肿瘤医院志愿服务队</td>						
										<td style="mso-number-format:'\@'">13896102083</td>
										<td style="mso-number-format:'\@'">${record_list.name}</td>
										<td style="mso-number-format:'\@'">${record_list.school}</td>
										<td style="mso-number-format:'\@'">${record_list.studentNum}</td>
										<td style="mso-number-format:'\@'">8:00-12:00 13:30-17:30</td>
										<td style="mso-number-format:'\@'">${record_list.totalHours}</td>
										<td style="mso-number-format:'\@'">患者服务</td>
									</tr>
									
								</c:forEach>

							</tbody>		
						</table>

					</div>
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
    <script type="text/javascript">
    var tableToExcel = (function() {
        var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
            base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
            format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) };
        return function(table, name, filename) {
            if (!table.nodeType) table = document.getElementById(table);
            console.log(table.innerHTML)
            var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }//此时的innerHTML数据可以自己自定义 比如json转化 只要值要数据符合即可
            document.getElementById("dlink").href = uri + base64(format(template, ctx));
            document.getElementById("dlink").download = filename;
            document.getElementById("dlink").click();
        }
    });
    var disName = "<%=session.getAttribute("monthDate")%>";
    var disLength = disName.length;
    var year = disName.substring(0,4);
    var id = "tables",
        worksheetName = 'sheet',
        workName = disName + "重庆大学志愿者服务时长统计.xls";
    document.getElementById('button').onclick = function() {
        var download = tableToExcel();
        download(id, worksheetName, workName)
    };
    </script>
    <script>
		function validateForm() {
			var Date = document.forms["inputForm"]["monthDate"].value;
			
			
			if (Date == null || Date == "") {
				alert("查询信息为空！请输入日期");
				return false;
			} 
			
			var DateReg = /^((?:20)\d\d-\d\d)$/;
			if (Date != null && Date != ""){
				if(!DateReg.test(Date)) {
					alert("请输入正确的日期格式：YYYY-MM");
					return false;
				}
		}
		}
	</script>
</body>
</html>