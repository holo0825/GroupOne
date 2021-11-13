<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>討論區</title>
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="assets/css/icons.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/red-color.css">
<link rel="stylesheet" href="assets/css/yellow-color.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
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
				<div style="background-image: url(assets/images/topbg.jpg);"
					class="fixed-bg"></div>
				<div class="restaurant-searching text-center">
					<div class="restaurant-searching-inner">
						<h2 itemprop="headline">
							討論區<br> Enjoy Food Together
						</h2>
					</div>
				</div>
				<!-- Restaurant Searching -->
			</div>
		</section>
		<div class="bread-crumbs-wrapper">
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="./home" title=""
						itemprop="url">首頁</a></li>
					<li class="breadcrumb-item active">討論區</li>
				</ol>
			</div>
		</div>
		<div align='center'>
			<hr>
			 <section>
            <div class="block less-spacing gray-bg top-padd30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="sec-box">
                                <div class="col-md-9 col-sm-12 col-lg-9">
                                    <div class="blog-detail-wrapper">
											<c:choose>
												<c:when test="${not empty articleBeanList}">
													<c:forEach var='article' items="${articleBeanList}">
														<div class="col-md-4 col-sm-6 col-lg-4">
															<div class="news-box wow fadeIn" data-wow-delay="0.1s">
													 			<div class="news-thumb">
																	
																	<img width='100' height='200' 
    																	 src="<c:url value='/getPicture/${article.id}' />" />
  
																	<div class="news-btns">
																		<a class="post-date red-bg" href="#" title=""
																			itemprop="url">${article.registerTime}</a><a
																			class="read-more"
																			href="<c:url value='/_01_article/ShowOneArticleGuest?id=${article.id}'/>"
																			itemprop="url">READ MORE</a>
																	</div>
																</div>
																<div class="news-info">
																	<h4 itemprop="headline">
																		<a
																			href="<c:url value='/_01_article/ShowOneArticleGuest?id=${article.id}'/>"
																			title="" itemprop="url">${article.title}</a>
																	</h4>
																	<p itemprop="description" class="JQellipsis">${article.content}</p>
																</div>
															</div>

														</div>

													</c:forEach>
												</c:when>
												<c:otherwise>
													查無文章資料
													</c:otherwise>
											</c:choose>


										</div>
									</div>
									<div class="col-md-3 col-sm-12 col-lg-3">
                                    <div class="sidebar right">
                                        <div class="widget style2 Search_filters wow fadeIn" data-wow-delay="0.2s">
                                            <h4 class="widget-title2 sudo-bg-red" itemprop="headline">Search Filters
                                            </h4>
                                            <div class="widget-data">
                                                <ul>
                                                    <li><a href="/ShowArticlesByCategory" title="" itemprop="url">中式</a>
                                                    </li>
                                                    <li><a href="#" title="" itemprop="url">義式
                                                    </a>
                                                    <li><a href="#" title="" itemprop="url">火鍋</a>
                                                    </li>
                                                    <li><a href="#" title="" itemprop="url">牛排</a>
                                                    </li>
                                                    <li><a href="#" title="" itemprop="url">速食</a>
                                                    </li>
                                                    <li><a href="#" title="" itemprop="url">飲料冰品</a></li>
                                                    <li><a href="#" title="" itemprop="url">其他</a>
                                                    </li>
                                                    
                                                </ul>
                                                
                                                <div>
                                                <c:forEach var='category' items="${categoryList}">
                                                <a href="<c:url value="/ShowArticlesGuest/${category}" />">${category}</a><br>
                                                </c:forEach>
                                                </div>
                                                
                                            </div>
                                        </div>
                                        <c:choose>
                                        <c:when test="${!empty user}">
                                        <a href="<c:url value='/user/insertArticleUser' />"><font
												size='5'><i class="fas fa-edit"></i>新增貼文</font></a>
                                        
                                        </c:when>
                                        </c:choose>
                                        </div>
                                        </div>
									<div class="pagination-wrapper text-center">
										<ul class="pagination justify-content-center">
											<li class="page-item prev"><a class="page-link brd-rd2"
												href="#" itemprop="url">PREVIOUS</a></li>
											<li class="page-item active"><span
												class="page-link brd-rd2">1</span></li>
											</li>
											<li class="page-item"><a class="page-link brd-rd2"
												href="#" itemprop="url">2</a></li>
											<li class="page-item"><a class="page-link brd-rd2"
												href="#" itemprop="url">3</a>
											<li class="page-item"><a class="page-link brd-rd2"
												href="#" itemprop="url">4</a></li>
											<li class="page-item"><a class="page-link brd-rd2"
												href="#" itemprop="url">5</a></li>
											<li class="page-item">........</li>
											<li class="page-item"><a class="page-link brd-rd2"
												href="#" itemprop="url">18</a></li>
											<li class="page-item next"><a class="page-link brd-rd2"
												href="#" itemprop="url">NEXT</a></li>
										</ul>
									</div>
									<!-- Pagination Wrapper -->
								</div>
							</div>
						</div>
					</div>
				</div>


			</section>
		</div>

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
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/plugins.js"></script>
		<script src="assets/js/main.js"></script>
		<script>
			$(function() {
				var len = 15; // 超過60個字以"..."取代
				$(".JQellipsis").each(
						function(i) {
							if ($(this).text().length > len) {
								$(this).attr("title", $(this).text());
								var text = $(this).text().substring(0, len - 1)
										+ "...";
								$(this).text(text);
							}
						});
			});
		</script>
		
	</main>
</body>
</html>