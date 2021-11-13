<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Food Ordering HTML Template</title>
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../assets/css/icons.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/main.css">
<link rel="stylesheet" href="../assets/css/red-color.css">
<link rel="stylesheet" href="../assets/css/yellow-color.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
</head>

<body itemscope>
	<main>
		<div class="preloader">
			<div id="cooking">
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div id="area">
					<div id="sides">
						<div id="pan"></div>
						<div id="handle"></div>
					</div>
					<div id="pancake">
						<div id="pastry"></div>
					</div>
				</div>
			</div>
		</div>
		<header class="stick">
			<div class="topbar">
				<div class="container">
					<div class="topbar-register">
						<!-- <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>-->

						<c:choose>
							<c:when test="${user.username == null}">
								<a href="<c:url value='/login' />" title="Login" itemprop="url">登入</a>
								<a href="<c:url value='/register' />" title="Register"
									itemprop="url">註冊</a>
								<a href="<c:url value='/seller/home' />" title="sellerhome"
									itemprop="url">賣家中心</a>
							</c:when>
							<c:otherwise>
								<span>${user.getUsername()}</span>&nbsp&nbsp&nbsp
                               <span class="">
									<form action="<c:url value='/logout' />" method="post"
										style="display: inline; font-size: 13px">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <input type="submit" value="登出"
											style="color: white; background: #161616;">
									</form>
								</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="social1" style="margin-top: 16px;!important">
						<a href="#" title="Facebook" itemprop="url" target="_blank"><i
							class="fa fa-facebook-square"></i></a> <a href="#"
							title="Google Plus" itemprop="url" target="_blank"><i
							class="fa fa-google-plus"></i></a>
					</div>
				</div>
			</div>
			<!-- Topbar -->
			<div class="logo-menu-sec">
				<div class="container" style="margin-left: 220px;">
					<div class="logo" style="margin: 12px 0 0 0;!important">
						<h1 itemprop="headline">
							<a href="index.html" title="Home" itemprop="url"> <img
								style="width: 150px;" src="../assets/images/icon_get_together.png"
								alt="Logo.png" itemprop="image">
							</a>
						</h1>
					</div>
					<nav>
						<div class="menu-sec">
							<ul>
								<li class="menu-item-has-children"><a
									href="<c:url value='/GroupOneHome' />" title="GroupOneHome"
									itemprop="url"><span class="red-clr"></span>首頁</a></li>
								<li class="menu-item-has-children"><a
									href="<c:url value='/searchallrestaurant' />"
									title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
								</li>
								<li class="menu-item-has-children"><a
									href="<c:url value='/customerSearch' />" title="customerSearch"
									itemprop="url"><span class="red-clr"></span>團購</a></li>
								<li class="menu-item-has-children"><a
									href="<c:url value='/ActivityPage' />" title="Activity"
									itemprop="url"><span class="red-clr"></span>活動</a></li>
								<li class="menu-item-has-children"><a
									href="<c:url value='/ShowArticlesGuest' />"
									title="ShowArticlesGuest" itemprop="url"><span
										class="red-clr"></span>討論區</a></li>
								<li class="menu-item-has-children"><a href="#"
									title="CartList" itemprop="url"><span class="red-clr"></span>購物車</a>
									<ul class="sub-dropdown">
										<li><a href="<c:url value='/user/CartList/food' />"
											title="food" itemprop="url">訂餐</a></li>
										<li><a href="<c:url value='/user/CartList/coupon' />"
											title="coupon" itemprop="url">團購</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#" title="#"
									itemprop="url"><span class="red-clr"></span>會員中心</a>
									<ul class="sub-dropdown">
										<li><a href="<c:url value='/user/AllCarts' />"
											itemprop="url">訂單紀錄</a></li>
									</ul></li>

							</ul>

						</div>
					</nav>
					<!-- Navigation -->
				</div>
			</div>
			<!-- Logo Menu Section -->
		</header>

		<section>
			<div class="block">
				<div class="fixed-bg"
					style="background-image: url(../assets/images/topbg.jpg);"></div>
				<div class="page-title-wrapper text-center">
					<div class="col-md-12 col-sm-12 col-lg-12">
						<div class="page-title-inner">
							<h1 itemprop="headline">商品目錄</h1>

						</div>
					</div>
				</div>
			</div>
		</section>


		<div class="bread-crumbs-wrapper">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#" title=""
						itemprop="url">首頁</a></li>
					<li class="breadcrumb-item active">商品目錄</li>
				</ol>
			</div>
		</div>
		<section>

			<div class="container">
				<div id="statement">
					<div class="tabs-wrp brd-rd5">
						<h4 itemprop="headline">管理清單</h4>

						<button type="button" class="btn btn-danger">
							<a href="${pageContext.request.contextPath}/seller/sellerCreate">新增</a>
						</button>

						<div class="statement-table">
							<table>
								<thead>
									<tr>
										<th>名稱</th>
										<th>價格</th>
										<th>品項</th>
										<th>當前人數</th>
										<th>目標人數</th>
										<th>起始日~截止日</th>
										<th>簡介</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									
									<c:forEach var="product" items="${Products}">
										<tr>

											<td>${product.name}</td>
											<td><span class="red-clr">${product.price}</span></td>
											<td>${product.item}</td>
											<td>${product.peopleNow}</td>
											<td>${product.people}</td>
											<td>${product.start}~${product.date}</td>
											<td>${product.introduceProduct}</td>
											<td><a
												href="${pageContext.request.contextPath}/seller/sellerProductEdit?id=<c:out value='${product.id}' />">Edit</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="${pageContext.request.contextPath}/seller/sellerProductDelete?id=<c:out value='${product.id}' />">Delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- Statement Table -->
					</div>
				</div>
			</div>






		</section>
		<section></section>
		<!-- red section -->
		<footer>
			<div class="block top-padd80 bottom-padd80 dark-bg">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-sm-12 col-lg-12">
							<div class="footer-data">
								<div class="row">
									<div class="col-md-3 col-sm-6 col-lg-3">
										<div class="widget about_widget wow fadeIn"
											data-wow-delay="0.1s">
											<div class="logo">
												<h1 itemprop="headline">
													<a href="#" title="Home" itemprop="url"><img
														src="../assets/images/logo.png" alt="logo.png"
														itemprop="image"></a>
												</h1>
											</div>
											<p itemprop="description">聚點食刻，共享美食每一刻！
											<p>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-lg-3">
										<div class="widget information_links wow fadeIn"
											data-wow-delay="0.2s">
											<h4 class="widget-title" itemprop="headline">About Shop</h4>
											<ul>
												<li><a href="#" title="" itemprop="url">購物須知</a></li>
												<li><a href="#" title="" itemprop="url">退換貨政策</a></li>
												<li><a href="#" title="" itemprop="url">付款方式</a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-lg-3">
										<div class="widget customer_care wow fadeIn"
											data-wow-delay="0.3s">
											<h4 class="widget-title" itemprop="headline">關於我們</h4>
											<ul>
												<li><a href="#" title="" itemprop="url">會員條款</a></li>
												<li><a href="#" title="" itemprop="url">隱私權保護政策</a></li>
												<li><a href="#" title="" itemprop="url">關於聚點食刻</a></li>
											</ul>
										</div>
									</div>
									<div class="col-md-3 col-sm-6 col-lg-3">
										<div class="widget get_in_touch wow fadeIn"
											data-wow-delay="0.4s">
											<h4 class="widget-title" itemprop="headline">聯絡我們</h4>
											<ul>
												<li><i class="fa fa-envelope"></i> <a href="#" title=""
													itemprop="url">eattogether@food.com</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- Footer Data -->
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="bottom-bar dark-bg text-center">
			<div class="container">
				<p itemprop="description">
					&copy; 2021 <a class="red-clr" href="http://www.bootstrapmb.com"
						title="Webinane" itemprop="url" target="_blank"></a>聚點食刻. All
					Rights Reserved
				</p>
			</div>
		</div>
	</main>
	<!-- Main Wrapper -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
</body>

</html>