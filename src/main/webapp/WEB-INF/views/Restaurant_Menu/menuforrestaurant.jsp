<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>菜單</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="assets/css/icons.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/red-color.css">
<link rel="stylesheet" href="assets/css/yellow-color.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="stylesheet" href="css/yu.css">
<style>
textarea {
  resize : none;
}
</style>
</head>

<body itemscope>
	<header>
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
	</header>

	       <header class="stick">
            <div class="topbar">
                <div class="container">
                    <div class="topbar-register">
                        <!-- <a class="log-popup-btn" href="#" title="Login" itemprop="url">登入</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">註冊</a>
                         <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>-->
                        
                        <c:choose>
                            <c:when test="${user.username == null}">
                                <a  href="<c:url value='/login' />" title="Login" itemprop="url">登入</a>
                                <a  href="<c:url value='/register' />" title="Register" itemprop="url">註冊</a>
                                <a  href="<c:url value='/seller/home' />" title="sellerhome" itemprop="url">賣家中心</a>
                            </c:when>
                            <c:otherwise>
                                <span>${user.getUsername()}</span>&nbsp&nbsp&nbsp
                               <span class="">
                                <form action="<c:url value='/logout' />" method="post" style="display:inline;font-size:13px">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit" value="登出" style="color:white;background:#161616;">
                                </form> 
                            </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="social1" style="margin-top:16px;!important">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                        <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <!-- Topbar -->
            <div class="logo-menu-sec">
               <div class="container" style="margin-left: 220px;">
				<div class="logo" style="margin:12px 0 0 0 ;!important">
				<h1 itemprop="headline">
					<a href="index.html" title="Home" itemprop="url">
						<img style="width:150px;" src="assets/images/icon_get_together.png" alt="Logo.png" itemprop="image">
					</a>
				</h1>
					</div>
                    <nav>
                        <div class="menu-sec">
                            <ul>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/GroupOneHome' />" title="GroupOneHome" itemprop="url"><span class="red-clr"></span>首頁</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/searchallrestaurant' />" title="RESTAURANTS" itemprop="url"><span class="red-clr"></span>餐廳</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/customerSearch' />" title="customerSearch" itemprop="url"><span class="red-clr"></span>團購</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/ActivityPage' />" title="Activity" itemprop="url"><span class="red-clr"></span>活動</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="<c:url value='/ShowArticlesGuest' />" title="ShowArticlesGuest" itemprop="url"><span class="red-clr"></span>討論區</a>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="CartList" itemprop="url"><span class="red-clr"></span>購物車</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="<c:url value='/user/CartList/food' />" title="food" itemprop="url">訂餐</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value='/user/CartList/coupon' />" title="coupon" itemprop="url">團購</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#" title="#" itemprop="url"><span class="red-clr"></span>會員中心</a>
                                    <ul class="sub-dropdown">
                                        <li>
                                            <a href="<c:url value='/user/AllCarts' />" itemprop="url">訂單紀錄</a>
                                        </li>
                                    </ul>
                                </li>
                                
                            </ul>

                        </div>
                    </nav>
                    <!-- Navigation -->
                </div>
            </div>
            <!-- Logo Menu Section -->
        </header>
        <!-- Header -->
	<section>
		<div class="block">
			<div class="fixed-bg"
				style="background-image: url(assets/images/topbg.jpg);"></div>
			<div class="page-title-wrapper text-center">
				<div class="col-md-12 col-sm-12 col-lg-12">
					<div class="page-title-inner">
						<h1 itemprop="headline">菜單</h1>						
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="bread-crumbs-wrapper">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="./searchallrestaurant" title=" " itemprop="url">餐廳列表</a></li>
				<li class="breadcrumb-item active">菜單</li>
			</ol>
		</div>
	</div>
	<section>
		
						<div class="block less-spacing gray-bg top-padd30">
							<div class="container">
								<div class="row">
									<div class="col-md-12 col-sm-12 col-lg-12">
										<div class="sec-box">
											<div class="remove-ext">
												<div class="row">
													<c:forEach var='menu' items='${productName}'>
														<div class="col-md-4 col-sm-6 col-lg-4">
															<div class="popular-dish-box style2 wow fadeIn"
																data-wow-delay="0.2s">
															<form action="./user/OrderForm" method="GET">
															
															<input type="hidden" id="rstName" name="rstName" value="${menu.rstName}">
															<input type="hidden" id="id" name="id" value="${menu.id}">																
 															<img src="<c:url value='/getMenuPicture/${menu.id}'/>" class="rounded" width='350' height='250'>
 															
															<input type="text" id="productName" name="productName" style="font-size:150% ;text-align:float " value="${menu.productName}" readonly> <br>
															
															<textarea name="remark" id="remark" cols="25" rows="2" readonly>${menu.remark}</textarea><br>
															
															NTD $ <input type="text" id="price" name="price" style="font-size:120%"" value="${menu.price}" readonly><br>
															
															數量：<input type="number" id="number" name="number" value="" style="width:120px; border:3px double;"><br>															
															<input type="submit" name="submit" value="加入購物車"  class="brd-rd4" style="float:right; color:white; background-color:black"><br>
															</form>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
			
	</section>

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
													src="assets/images/logo.png" alt="logo.png"
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>