<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>趣友欢乐游戏</title>
<link rel="Shortcut Icon" href=img/quyou.png>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
<link href="css/charisma-app.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link href="css/mobile/font-awesome.min.css?t=20170928"
	rel="stylesheet" type="text/css" />

</head>
<!-- topbar starts -->
<body>

	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-inner">
			<button type="button" class="navbar-toggle pull-left animated flip">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">   <span style="font-size: 20px;font-weight: bold">趣友欢乐游戏</span></a>
			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<button class="btn btn-default dropdown-toggle"
					data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i><span
						class="hidden-sm hidden-xs"> 退出</span> <span class="caret"></span>
				</button>
			</div>
				<div class="pull-right"
					style="float: left;padding: 15px 15px;
	             font-size: 18px;line-height: 20px;font-weight:bold;height: 50px;color:#FFF">
					<c:if test="${sessionScope.userType==1||sessionScope.userType==2}">新增人数：${sessionScope.addPersonNum}</c:if>
					<c:if test="${sessionScope.userType==2&&sessionScope.isCloseThreeLevelInstitution!=1}"> 代金券：${sessionScope.bonus}.00 <i class="icon-money"></i></c:if></div>
			<!-- user dropdown ends -->
		</div>
	</div>
	<!-- topbar ends -->


	<!--/ä¿ççå¯¼èªæ å¼å§-->
	<div class="ch-container">
		<div class="row">

			<!-- left menu starts -->
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header">Main</li>
							<li><a class="ajax-link" href="index.do"><i
									class="glyphicon glyphicon-home"></i><span> 我的信息</span></a></li>
							<c:if test="${sessionScope.userType==0}">
							<li><a class="ajax-link" href="mainproxy.do"><i
									class="glyphicon glyphicon-eye-open"></i><span>总代管理</span></a></li>
							</c:if>
							<c:if test="${sessionScope.userType==1||sessionScope.userType==0}">
							<li><a class="ajax-link" href="proxy.do"><i
									class="glyphicon glyphicon-edit"></i><span>代理管理</span></a></li>
							</c:if>
							<li><a class="ajax-link" href="cardRecord.do"><i
									class="glyphicon glyphicon-list-alt"></i><span>售卡记录</span></a></li>
							<li><a class="ajax-link" href="playerMag.do"><i
									class="glyphicon glyphicon-font"></i><span>玩家管理</span></a></li>
						<!-- 	<li><a class="ajax-link" href="#"><i
									class="glyphicon glyphicon-picture"></i><span>通知管理</span></a></li> -->
							<c:if
								test="${sessionScope.isCloseThreeLevelInstitution!=1&&sessionScope.userType==2}">
							<li><a class="ajax-link" href="bonusShop.do"><i
									class="glyphicon glyphicon-cog"></i><span>积分商城</span></a></li>
							</c:if>
							<li><a class="ajax-link" href="editPassword.jsp"><i
									class="glyphicon glyphicon-align-justify"></i><span>修改密码</span></a></li>
						<!-- 	<li class="accordion"><a href="#"><i
									class="glyphicon glyphicon-plus"></i><span>修改IP</span></a>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">Child Menu 1</a></li>
									<li><a href="#">Child Menu 2</a></li>
								</ul></li> -->

						</ul>
					</div>
				</div>
			</div>
			<!--/span-->
			<!-- left menu ends -->

			<noscript>
				<div class="alert alert-block col-md-12">
					<h4 class="alert-heading">Warning!</h4>

					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>

			<div id="content" class="col-lg-10 col-sm-10">
				<!-- content starts -->
				<!--/å¯¼èªæ ç»æ-->

				<!--/ä¸»ç¨åºæ¡æ¶-->
				<div class="row">
					<div class="box col-md-12">
						<div class="box-inner">
							<div class="box-header well" data-original-title="">
								<h2 style="font-size: 20px">
									<i class="glyphicon glyphicon-asterisk"></i>总代列表
								</h2>

								<div class="box-icon" style="position: absolute;right: 300px">
									 <input type=button value="添加总代" style=" font-weight:normal; font-family:宋体;background-color:#7264BA;color: white;font-size:12px;padding:8px 8px 8px 8px;border:none;margin-bottom: 20px" onclick="location.href='mainProxyRecommend.jsp'";> 
								</div>
							</div>
							<div class="box-content">
								<table class="table table-bordered table-striped responsive">
									<tbody>

										<!-- content -->

										<tr>
											<td>ID：</td>
											<td><input type="text" name="userId"
												value="${userId}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
											</td>
										</tr>

										<tr>
											<td>名称：</td>
											<td><input type="text" name="username" 
												value="${username}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
										</tr>
										<tr>
											<td>联系电话：</td>
											<td><input type="text" name="contactPhone" 
												value="${contactPhone}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
										</tr>
										<tr>
											<td>紧急联系电话：</td>
											<td><input type="text" name="emergencyPhone" 
												value="${emergencyPhone}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
										</tr>
										
										<tr>
											<td>限时房卡数量：</td>
											<td><input type="text" name="cardLCount"
												value="${cardLCount}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
										</tr>
										<tr>
											<td>永久房卡数量：</td>
											<td><input type="text" name="cardFCount"
												value="${cardFCount}"
												style="border:1px solid #b4b4b4;width:180px"
												disabled="disabled" /></td>
										</tr>
										<form action="sellCardHandle.do" class="testform" method="post" onsubmit="return sumbit_sure()">
										<input type="hidden" name="buyerId" value="${userId}"></input>
										<input type="hidden" name="buyerName" value="${username}"></input>
										<input type="hidden" name="toType" value="2"></input>
										<tr>
											<td>售卖类型：</td>
											<td><input type="radio" name="sellType" value="0"
												checked>售卖</input> <input type="radio" name="sellType"
												value="1">赠送</td>
										</tr>

										<tr>
											<td>增加房卡数：</td>
											<td><input type="number" id="addCardCount" name="addCardCount" value="0"
												style="border:1px solid #b4b4b4;width:180px" /></td>
										</tr>
										<tr>
											<td>入账金额：</td>
											<td><input type="number" id="income" name="income" value="0"
												style="border:1px solid #b4b4b4;width:180px" /></td>
										</tr>
										<tr>
											<td>备注：</td>
											<td><input type="text" name="memo" value=""
												style="border:1px solid #b4b4b4;width:180px" /></td>
										</tr>
										<tr>
												<td colspan="2" style="text-align:center"><br /> <input
													type="submit" value="保存" /></td>
										</tr>
										</form>
										<!-- content  end -->





									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--/span-->

				</div>





				<!-- content ends -->
			</div>
			<!--/#content.col-md-0-->
		</div>
		<!--/fluid-row-->

		<!-- Ad, you can remove it -->

		<!-- Ad ends -->

		<hr>



	<footer class="row">
			<p class="col-md-9 col-sm-9 col-xs-12 copyright">
				&copy; <a href="#" target="_blank">QuYou GoPlayUS Beijing Technology Co., Ltd
</a>
				2007 ~ 2018
			</p>

			
		</footer>

	</div>
	<!--/.fluid-container-->
	</div>
	<!-- external javascript -->

		<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- data table plugin -->
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<script language="javascript">
		function sumbit_sure() {
		 var p0 = document.getElementById("addCardCount").value; //获取密码框的值
		  var p1 = document.getElementById("income").value; //获取密码框的值
		  if(p0<0||p1<0){
		     alert("请输入正确的房卡数和金额");
		     return false;
		  }
			if (window.confirm("确定要提交?")) {
				return true;
			}
			return false;
	
		}
	</script>
</body>
</html>
