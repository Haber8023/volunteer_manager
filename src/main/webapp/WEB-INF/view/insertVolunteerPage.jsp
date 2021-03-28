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
								<li><a href="updatePage"> <i class="icon-grid"></i>修改密码
				</a></li>
			</ul></nav>
			<div class="content-inner">
				<div style="width: 100%; heigth: 100%">
					<div class="card">
						<div class="card-body">
						<div class="cxbottom">
										<center>
											<h1 >&ensp;</h1>
										</center>
									</div>
							<form class="form-horizontal" id="inputForm"
								action="insertVolunteer" onsubmit="return anotherValidateForm()"
								method="post">
								
<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;志愿者类型：    <select name="isNew">
        <option>新志愿者，编号：${newNum}</option>
        <option>老志愿者，编号：${newNum}</option>
        <option>内部志愿者，编号：${newNum}</option>
    </select></p>							
<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;姓&ensp;&ensp;&ensp;&ensp;名：&thinsp;<input id="name" type="text" name="name"></p>
<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;性&ensp;&ensp;&ensp;&ensp;别：    <select id="gender_input" name="gender">
        <option>男</option>
        <option>女</option>
    </select></p>
<p>
    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;出生日期：&ensp;&ensp;
<select name="birth_year"><option>2021</option><option>2020</option><option>2019</option><option>2018</option><option>2017</option><option>2016</option><option>2015</option><option>2014</option><option>2013</option><option>2012</option><option>2011</option>
<option>2010</option><option>2009</option><option>2008</option><option>2007</option><option>2006</option><option>2005</option><option>2004</option><option>2003</option><option>2002</option><option>2001</option>
<option>2000</option><option>1999</option><option>1998</option><option>1997</option><option>1996</option><option>1995</option><option>1994</option><option>1993</option><option>1992</option><option>1991</option>
<option>1990</option><option>1989</option><option>1988</option><option>1987</option><option>1986</option><option>1985</option><option>1984</option><option>1983</option><option>1982</option><option>1981</option>
<option>1980</option><option>1979</option><option>1978</option><option>1977</option><option>1976</option><option>1975</option><option>1974</option><option>1973</option><option>1972</option><option>1971</option>
<option>1970</option><option>1969</option><option>1968</option><option>1967</option><option>1966</option><option>1965</option><option>1964</option><option>1963</option><option>1962</option><option>1961</option>
<option>1960</option><option>1959</option><option>1958</option><option>1957</option><option>1956</option><option>1955</option><option>1954</option><option>1953</option><option>1952</option><option>1951</option>
<option>1950</option><option>1949</option><option>1948</option><option>1947</option><option>1946</option><option>1945</option><option>1944</option><option>1943</option><option>1942</option><option>1941</option>

</select>年
<select name="birth_month"><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option>
<option>11</option><option>12</option></select>月
<select name="birth_day">
<option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option>
<option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option>
<option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option>
<option>31</option>
</select>日
</p>
<p>&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;联系方式：&thinsp;
    <input id="tel" type="text" name="tel">
</p>
<p>
   &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;所在单位：&thinsp;
    <input id="unit" type="text" name="unit"></p>
    <p>
   &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;所在学院：&thinsp;
    <select name="school" id="school">
    						<option> </option>
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
							</optgroup>
						</select>
    （学生须填）</p>
    <p>
   &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;学&ensp;&ensp;&ensp;&ensp;号：&thinsp;
    <input id="studentNum" type="text" name="studentNum">（学生须填）</p>
<p>
    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;志愿者地址:&thinsp;&thinsp;&thinsp;<select  id="address_input" name="address">
        <option>重庆主城内</option>
        <option>重庆其它区县</option>
        <option>重庆市以外</option>
        <option>境外</option>
    </select>
</p>
<p>
    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;志愿者学历:&thinsp;&thinsp;&thinsp;<select  id="education_input" name="education">
        <option>博士</option>
        <option>硕士</option>
        <option>本科</option>
        <option>专科</option>
        <option>其它</option>
    </select>
</p>
<p>
    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;志愿者职业:&thinsp;&thinsp;&thinsp;<select  id="occupation_input" name="occupation">
        <option>学生</option>
        <option>工作中</option>
        <option>退休</option>
        <option>其它</option>
    </select>
</p>
<p>
    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;从事医学相关事业:&thinsp;&thinsp;&thinsp;<select  id="relate_input" name="relate">
        <option>否</option>
        <option>是</option>
    </select>
</p>


								<div class="line"></div>
								<h2>&ensp;</h2>
									<div style="position:relative;left:160px">
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
	function anotherValidateForm() {
		
			var name = document.forms["inputForm"]["name"].value;
			var tel = document.forms["inputForm"]["tel"].value;
			var unit = document.forms["inputForm"]["unit"].value;

			
			if (name == null || name == "") {
				alert("志愿者姓名不能为空");
				return false;
			} else if (unit == null || unit == "") {
				alert("所在单位不能为空");
				return false;
			} else if (tel == null || tel == "") {
				alert("手机号码不能为空");
				return false;
			}
			
			if(!(/^1[3456789]\d{9}$/.test(tel))){ 
		        alert("手机号码格式有误，请重新填写");  
		        return false; 
		    } 
		}
	</script>
</body>
</html>