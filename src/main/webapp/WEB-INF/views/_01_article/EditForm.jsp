<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>

<title>編輯文章</title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../images/favicon.png">
<!-- Datatable -->
<link href="../../css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link href="../../focus2/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<script type="text/javascript">
	function confirmDelete(id) {
		var result = confirm("確定刪除此筆記錄(帳號:" + id.trim() + ")?");
		if (result) {
			document.forms[1].putOrDelete.name = "_method";
			document.forms[1].putOrDelete.value = "DELETE";
			document.forms[1].action = "<c:url value='/_01_article/articles/" + id + "' />";
			return true;
		}
		return false;
	}
	function confirmUpdate(id) {
		document.forms[1].putOrDelete.name = "_method";
		document.forms[1].putOrDelete.value = "PUT";
		document.forms[1].action = "<c:url value='/_01_article/articles/" + id + "' />";
		return true;
	}
</script>
</head>
<body>
<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<a href="index.html" class="brand-logo"> <img class="logo-abbr"
				src="../../images/logo.png" alt=""> <img class="logo-compact"
				src="../../images/logo-text.png" alt=""> <img class="brand-title"
				src="../../images/logo-text.png" alt="">
			</a>

			<div class="nav-control">
				<div class="hamburger">
					<span class="line"></span><span class="line"></span><span
						class="line"></span>
				</div>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content">
				<nav class="navbar navbar-expand">
					<div class="collapse navbar-collapse justify-content-between">
						<div class="header-left">
							<div class="search_bar dropdown">
								<span class="search_icon p-3 c-pointer" data-toggle="dropdown">
									<i class="mdi mdi-magnify"></i>
								</span>
								<div class="dropdown-menu p-0 m-0">
									<form>
										<input class="form-control" type="search" placeholder="Search"
											aria-label="Search">
									</form>
								</div>
							</div>
						</div>

						<ul class="navbar-nav header-right">
							<li class="nav-item dropdown notification_dropdown"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-bell"></i>
									<div class="pulse-css"></div>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<ul class="list-unstyled">
										<li class="media dropdown-item"><span class="success"><i
												class="ti-user"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Martin</strong> has added a <strong>customer</strong>
														Successfully
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="primary"><i
												class="ti-shopping-cart"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Jennifer</strong> purchased Light Dashboard 2.0.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="danger"><i
												class="ti-bookmark"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>Robin</strong> marked a <strong>ticket</strong> as
														unsolved.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="primary"><i
												class="ti-heart"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong>David</strong> purchased Light Dashboard 1.0.
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
										<li class="media dropdown-item"><span class="success"><i
												class="ti-image"></i></span>
											<div class="media-body">
												<a href="#">
													<p>
														<strong> James.</strong> has added a<strong>customer</strong>
														Successfully
													</p>
												</a>
											</div> <span class="notify-time">3:20 am</span></li>
									</ul>
									<a class="all-notification" href="#">See all notifications
										<i class="ti-arrow-right"></i>
									</a>
								</div></li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="../../home" class="dropdown-item"> <i
										class="icon-key"></i> <span class="ml-2">登出 </span>
									</a>
								</div></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="quixnav">
			<div class="quixnav-scroll">
				<ul class="metismenu" id="menu">
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">會員管理</span></a>
						<ul aria-expanded="false">
							<li><a href="<c:url value='/admin/listuser' />">一般會員管理</a></li>
							<li><a href="<c:url value='/admin/listseller' />">商家會員管理</a></li>
						</ul>
					</li>
					
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">餐廳管理</span></a>
						<ul aria-expanded="false">
							<li><a href="<c:url value='/admin/queryallrestaurant' />">餐廳總覽</a></li>
							<li><a href="<c:url value='/admin/queryallmenu' />" >菜單總覽</a></li>
						</ul>
					</li>
						
					<li><a class="has-arrow" href="javascript:void()"
                        aria-expanded="false"><i class="icon icon-single-04"></i><span
                            class="nav-text">團購餐券管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="<c:url value='/admin/adminGroupBuy' />">團購餐券總覽</a></li>
                        </ul>
                    </li>
					
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">銷售管理</span></a>
						<ul aria-expanded="false">
							<li><a href="<c:url value='/admin/AdminCart' />">訂單處理</a></li>
							<li><a href="<c:url value='/admin/Adminstatistics' />">商品統計</a></li>
						</ul>
					</li>
					
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                class="icon icon-single-04"></i><span class="nav-text">活動管理</span></a>
                        <ul aria-expanded="false">
                            <li><a href="<c:url value='/admin/ActivityRegister' />">活動管理 明細</a></li>
                            <li><a href="<c:url value='/admin/RecordParticipantBack' />">管理報名者 明細</a></li>
                        </ul>
                    </li>
					
					<li><a class="has-arrow" href="<c:url value='/_01_article/ShowArticles' />"
						aria-expanded="false"><i class="icon icon-single-04"></i><span
							class="nav-text">討論區管理</span></a>
					</li>

					<li class="nav-label first">其他</li>
					<ul>
						<a href="">返回首頁</a>
					</ul>
				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row page-titles mx-0">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
							<h4>討論區管理</h4>
							<span class="ml-1">編輯文章</span>
						</div>
					</div>
				</div>
				<!-- row -->
	<div align="center">
		<form:form method='POST' modelAttribute="articleBean"
			enctype="multipart/form-data">

			<input type="hidden" id='putOrDelete' value="">
			<c:if test='${articleBean.id != null}'>
				<form:hidden path="id" />
				<br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend style="color:black">編輯文章</legend>
				<table style="color:black">
					<tr>
						<td align='right'>標題：<br>&nbsp;
						</td>
						<td width='400'><form:input path="title" size="25"
								class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
							<form:errors path="title" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>使用者名稱：<br>&nbsp;
						</td>
						<td><form:input path="username" size="25"
								class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
							<form:errors path="username" cssClass="error" /></td>
					</tr>

					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:textarea path="content" size="30"
								class="form-control" id="exampleFormControlTextarea1" rows="3" /><br>&nbsp;
							<form:errors path="content" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>分類:<br>&nbsp;
						</td>
						<td><input type="radio" name="category" id="category1"
							value="中式" checked>中式 <input type="radio" name="category"
							id="category2" value="義式">義式 <input type="radio"
							name="category" id="category3" value="火鍋">火鍋 <input
							type="radio" name="category" id="category4" value="牛排">牛排
							<input type="radio" name="category" id="category6" value="速食">速食<br>
							<input type="radio" name="category" id="category5" value="飲料冰品">飲料冰品
							<input type="radio" name="category" id="category7" value="其他">其他
						</td>
					</tr>
					<tr>

						<td align='right'>圖片:<br>&nbsp;
						<td>
							<div class="form-group">
								<label class='control-label col-lg-2 col-lg-2'
									for="productImage"> </label>
								<div class='col-lg-10'>
									<form:input id="productImage" path="productImage" type='file'
										class='form:input-large' />
								</div>

							</div>
						</td>

					</tr>

					<tr>
						<td colspan='2' align='center'>
						<input type='submit'value='修改' name='updateBtn'
							onclick="return confirmUpdate('${articleBean.id}');">&nbsp;
						<input type='submit' value='刪除' name='deleteBtn'
							onclick="return confirmDelete('${articleBean.id}');"></td>
					</tr>

				</table>
			</fieldset>
		</form:form>
	</div>
	<!-- Required vendors -->
	<script src="../../focus2/vendor/global/global.min.js"></script>
	<script src="../../focus2/js/quixnav-init.js"></script>
	<script src="../../focus2/js/custom.min.js"></script>



	<!-- Datatable -->
	<script src="../../focus2/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="../../focus2/js/plugins-init/datatables.init.js"></script>
</body>
</html>