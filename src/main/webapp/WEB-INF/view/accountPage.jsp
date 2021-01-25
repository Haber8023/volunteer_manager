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
		var msg = "${message}";
		if (msg == "1") {
			alert('未检索到信息，请检查年月是否正确！');
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
				<li class="active"><a href="accountPage"> <i
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
							<form class="form-horizontal" id="inputForm" name="inputForm "
								action="accountFinder" onsubmit="return validateForm()"
								method="post">	
											<center>
											<h2>报表年月：</h2>
											<input type="text"
												placeholder="格式：YYYY-MM，如：2019-01" value="${accountDate}"
												class="form-control"
												style="border-radius: 3px; height: 45px ;width: 300px" id="accountDate" name="accountDate">
																			<h3>&ensp;</h3>
									<div class="cxbottom">
											<button type="submit" >生成报表</button>
																        <a id="dlink" style="display:none;"></a>
    <input id="button" type="button" value="导出为Excel表格">

									</div>
									</center>
							</form>
						</div>
					</blockquote>
					<div id="content" style="width: 100%; height: 600px;">

						<table class="table table-hover table-bordered" id="tables"
							data-toggle="table" data-toggle="table" data-pagination="true"
							data-side-pagination="client" border="1">
														   <caption>${accountDate}志愿者财务申报表</caption>
							
							<thead>
								<tr>
								<th>服务日期</th>
									<th>志愿者编号</th>
									<th>志愿者姓名</th>
									<th>志愿者类型</th>
									<th>所在单位</th>
									<th>服务部门</th>
									<th>服务内容</th>
									<th>服务时长（/h）</th>
								</tr>
								
							</thead>
							<tbody>
								<c:forEach items="${list}" var="record_list">
									<tr style="height: auto;">
				                        <td>${record_list.recordDate}</td>
										<td>${record_list.num }</td>
										<td>${record_list.name }</td>
										<td>${record_list.type }</td>
										<td>${record_list.unit }</td>						
										<td>${record_list.place}</td>
										<td>${record_list.recordDetail}</td>
										<td>${record_list.volunteerTime}</td>
									</tr>
									
								</c:forEach>

							</tbody>
<tr>
<th rowspan="3"  colspan="6">备注：服务时长4小时代表半天，服务时长8小时代表全天。服务半天应发放15元，服务全天应发放30元。</th>
								
								<th>总计时长</th>
								<td>${totalHours}小时</td>
									</tr>
																		<tr>
								<th>社会志愿者时长</th>
								<td>${totalSocialHours}小时</td>
									</tr>
									<tr>
								<th>申请金额</th>
								<td>${totalAccount}元</td>
									</tr>
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
    var disName = "<%=session.getAttribute("accountDate")%>";
    var disLength = disName.length;
    var year = disName.substring(0,4);
    var month = disName.substring(disLength-2,disLength);
    var id = "tables",
        worksheetName = 'sheet',
        workName = year +"年"+month+ "月财务报表.xls";

    document.getElementById('button').onclick = function() {
        var download = tableToExcel();
        download(id, worksheetName, workName)
    };
    </script>
    <script>
		function validateForm() {
			var Date = document.forms["inputForm"]["accountDate"].value;
			
			
			if (Date == null || Date == "") {
				alert("查询信息为空！请输入年月");
				return false;
			} 
			
			var DateReg = /^((?:20)\d\d)-(0[1-9]|1[012])$/;
			if (Date != null && Date != ""){
				if(!DateReg.test(Date)) {
					alert("请输入正确的年月格式：YYYY-MM");
					return false;
				}
		}
		}
	</script>
</body>
</html>