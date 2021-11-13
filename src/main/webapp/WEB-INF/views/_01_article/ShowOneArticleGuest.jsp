<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- <link rel="stylesheet" -->
<!-- 	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" -->
<!-- 	 /> -->
<link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>${article.title}</title>
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../assets/css/icons.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/animate.min.css">
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
                    <c:choose>
                        <c:when test="${empty user}">
                          <a  href="<c:url value="/login" />" title="Login" itemprop="url">登入</a>
                            <a href="<c:url value="/register" />" title="Register" itemprop="url">註冊</a>
                            <a class="sign-popup-btn" href="#" title="Register" itemprop="url">賣家中心</a>
                        </c:when>
                        <c:otherwise>
                            <span>${user.getUsername()}</span>&nbsp&nbsp&nbsp
<!--                             <a class="sign-popup-btn" href="#" title="Register" itemprop="url">登出</a> -->
                            <span class="">
                                <form action="<c:url value='/logout' />" method="post" style="display:inline;font-size:15px">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit" value="登出" style="color:white;background:#161616;">
                                </form> 
                            </span>

                        </c:otherwise>
                    </c:choose>
                    </div>
					<div class="social1" style="margin-top:12px;!important">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                        <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                    </div>
				</div>
			</div>
			<!-- Topbar -->
			<div class="logo-menu-sec">
				<div class="container" >
					<div class="logo" style="margin:12px 0 0 0 ;!important">
				<h1 itemprop="headline">
					<a href="index.html" title="Home" itemprop="url">
						<img style="width:150px;" src="../assets/images/icon_get_together.png" alt="Logo.png" itemprop="image">
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
					style="background-image: url(../assets/images/topbg.jpg);"></div>
				<div class="page-title-wrapper text-center">
					<div class="col-md-12 col-sm-12 col-lg-12">
						<div class="page-title-inner">
							<h1 itemprop="headline">
								討論區<br>Enjoy Food Together
							</h1>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="bread-crumbs-wrapper">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="../home" title=""
						itemprop="url">首頁</a></li>
					<li class="breadcrumb-item"><a href="../ShowArticlesGuest"
						title="" itemprop="url">討論區</a></li>
					<li class="breadcrumb-item active">${article.title}</li>
				</ol>
			</div>
		</div>
		<section>

			<div class="block less-spacing gray-bg top-padd30">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="sec-box">
								<div class="col-md-9 col-sm-12 col-lg-9">
									<div class="blog-detail-wrapper">
										<div class="blog-detail-thumb wow fadeIn"
											data-wow-delay="0.2s">
											<!-- 
											<img src="../assets/images/resource/i3.jpg"
												alt="blog-detial-img2-1.jpg" itemprop="image">
										 -->
											<img src="<c:url value='/getPicture/${article.id}'/>" />
										</div>

										<div class="blog-detail-info">
											<span class="post-detail-date red-clr"><i
												class="fa fa-clock-o"></i>${article.registerTime}</span>

										</div>
										<h1 itemprop="headline">${article.title}</h1>
										<p itemprop="description">${article.content}</p>
										<div class="post-cate red-clr">
											<span>Author:</span><a href="#" title="username"
												itemprop="url">${article.username}</a>
										</div>
										<div class="post-cate red-clr">
											<span>Category:</span><a href="#" title="Italian cuisine"
												itemprop="url">${article.category}</a>
										</div>
									</div>
								</div>
								<div class="col-md-3 col-sm-12 col-lg-3">
									<div class="sidebar right">
										<div class="widget style2 Search_filters wow fadeIn"
											data-wow-delay="0.2s">
											<h4 class="widget-title2 sudo-bg-red" itemprop="headline">Search
												Filters</h4>
											<div class="widget-data">
												<ul>
													<li><a href="/ShowArticlesByCategory" title=""
														itemprop="url">中式</a></li>
													<li><a href="#" title="" itemprop="url">義式 </a>
													<li><a href="#" title="" itemprop="url">火鍋</a></li>
													<li><a href="#" title="" itemprop="url">牛排</a></li>
													<li><a href="#" title="" itemprop="url">速食</a></li>
													<li><a href="#" title="" itemprop="url">飲料冰品</a></li>
													<li><a href="#" title="" itemprop="url">其他</a></li>

												</ul>
											</div>
											<!-- Section Box -->
										</div>
										<c:choose>
                                        <c:when test="${article.username == user.username}">
                                        <a href="<c:url value='/user/articlesUser/${article.id}' />"><font
												size='5'><i class="fas fa-edit"></i>編輯貼文</font></a>
                                        
                                        </c:when>
                                        </c:choose>
										
										
									</div>
								</div>
							</div>
		</section>
		<section></section>

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
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/plugins.js"></script>
		<script src="../assets/js/main.js"></script>
	</main>
</body>
</html>