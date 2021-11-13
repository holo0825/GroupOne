<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>新增貼文</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../assets/images/favicon.png">
<!-- Datatable -->
<link href="../focus2/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/jquery.dataTables.min.css' />">
<!-- Custom Stylesheet -->
<link href="./css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
	<script>
function quickInput(){
	document.getElementById('exampleFormControlInput1').value='聖誕跨年特輯 | 台北聖誕節大餐';
	document.getElementById('exampleFormControlInput1 username').value='admin';
	document.getElementById('exampleFormControlTextarea1').value='由知名調酒師 Nick Wu 領軍的 「Bar Mood Taipei」 吧沐 ，擁有超多實力堅強的Bartender，調酒好喝自然不在話下！這家近幾年才剛開幕的酒吧，隱身於台北東區的巷弄中，店內共分為2個區域，分別是high bar和mood bar，high bar讓顧客們站著享用調酒，而在往內走的mood bar則是結合開放式廚房、座位和吧台，運用精緻花藝來呈現空間的質感調性，享用調酒的同時，還能品嚐變化豐富的創意餐點，不管是家人小聚還是情侶約會，選這家準沒錯。';
	
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
				src="../images/logo.png" alt=""> <img class="logo-compact"
				src="../images/logo-text.png" alt=""> <img class="brand-title"
				src="../images/logo-text.png" alt="">
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
									 <a href="../home" class="dropdown-item"> <i
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
							<span class="ml-1">新增貼文</span>
						</div>
					</div>
				</div>
				<!-- row -->


				<div align="center">
					<form:form method='POST' modelAttribute="articleBean"
						action='articles' enctype="multipart/form-data">
						<c:if test='${article.id != null}'>
							<form:hidden path="customerId" />
							<br>&nbsp;
			</c:if>
						<fieldset class="fieldset-auto-width">
							<legend style="color:black">新增貼文</legend>
							<table style="color:black">

								<tr>
									<td align='right'>標題：<br>&nbsp;
									</td>
									<td width='280'><form:input path="title" size="25"
											class="form-control" id="exampleFormControlInput1" /><br>&nbsp;
										<form:errors path="title" cssClass="error" /></td>
								</tr>
								<tr>
									<td align='right'>使用者名稱：<br>&nbsp;
									</td>
									<td width='280'><form:input path="username" size="25"
											class="form-control" id="exampleFormControlInput1 username" /><br>&nbsp;
										<form:errors path="username" cssClass="error" /></td>
								</tr>
								<tr>
									<td align='right'>內容：<br>&nbsp;
									</td>
									<td><form:textarea path="content" class="form-control"
											id="exampleFormControlTextarea1" rows="3" /><br>&nbsp;
										<form:errors path="content" cssClass="error" /></td>
								</tr>

								<tr>
									<td align='right'>分類：<br>&nbsp;
									</td>

									<td><input type="radio" name="category" id="category1"
										value="中式">中式 <input type="radio" name="category"
										id="category2" value="義式">義式 <input type="radio"
										name="category" id="category3" value="火鍋">火鍋 <input
										type="radio" name="category" id="category4" value="牛排">牛排
										<input type="radio" name="category" id="category6" value="速食">速食<br>
										<input type="radio" name="category" id="category5"
										value="飲料冰品">飲料冰品 <input type="radio" name="category"
										id="category7" value="其他">其他</td>
								</tr>
								<tr>

									<td align='right'>圖片:<br>&nbsp;
									<td>
										<div class="form-group">
											<label class='control-label col-lg-2 col-lg-2'
												for="productImage"> </label>
											<div class='col-lg-10'>
												<form:input id="productImage" path="productImage"
													type='file' class='form:input-large' />
											</div>

										</div>
									</td>

								</tr>
								<br>

								<tr >
									<td colspan='2' align='center'><input type='submit' value='提交'></td>
									<td><input type='button' value='一鍵輸入' onclick='quickInput()'></td>
								</tr>
							</table>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="footer">
			<div class="copyright">
				<p>
					Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
					2019
				</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<script src="../focus2/vendor/global/global.min.js"></script>
	<script src="../focus2/js/quixnav-init.js"></script>
	<script src="../focus2/js/custom.min.js"></script>



	<!-- Datatable -->
	<script src="../focus2/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="../focus2/js/plugins-init/datatables.init.js"></script>
</body>

</html>