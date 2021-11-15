<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新增餐點</title>
<link rel="shortcut icon" href="../assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../assets/css/icons.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/main.css">
<link rel="stylesheet" href="../assets/css/red-color.css">
<link rel="stylesheet" href="../assets/css/yellow-color.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
<link rel="stylesheet" href="../css/yu.css">
</head>
<style>
table {
	margin: auto;
}

td, th {
	/* 兩個不同的標籤有相同的屬性 */
	border: 2px solid gray;
	/* 框粗細 */
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
<script>
	// 一鍵輸入註冊資料
	function quickInput() {
		document.getElementById('productName').value = '密制滷肉飯';
		document.getElementById('remark').value = '獨家醬汁，必點！';
		document.getElementById('price').value = '50';
	}
</script>

</head>

<!-- 前端畫面for賣家編輯(修改刪除)菜單 -->


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
			<div style="background-image: url(../assets/images/topbg.jpg);"
				class="fixed-bg"></div>
			<div class="restaurant-searching text-center">
				<div class="restaurant-searching-inner">
					<h2 itemprop="headline">
						新增菜單<br> New Your Dish!
					</h2>
				</div>

			</div>
		</div>
	</section>
	<div class="bread-crumbs-wrapper">
		<div class="container">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="./ManageMenu" title=" "
					itemprop="url">菜單管理</a></li>
				<li class="breadcrumb-item active">新建菜單</li>
			</ol>
		</div>
	</div>


	<section>
		<div class="block less-spacing gray-bg top-padd30">
			<div class="container">
				<div class="col-lg-12">
					<div class="card">
						<div class="sec-box">
							<form:form action="./addtomenu" method='POST'
								modelAttribute="menuBean" class='form-horizontal'
								enctype="multipart/form-data">
								<br>

								<fieldset>
									<legend>菜單 Menu</legend>
									<div class="st1">
										<label for="productName" class="t1">* 品名：</label>
										<form:input type="text" path="productName" name="productName"
											id="productName" value="" size="20" />
										<form:errors path="productName" cssClass="error" />
									</div>

									<div class="st1">
										<label class="t1">照片:</label>
										<form:input type="file" accept="image/*" path="coverImage"
											value="" id="coverImage" name="coverImage" />
									</div>

									<div class="st1">
										<label for="remark" class="t1">菜色描述： </label>
										<form:textarea name="remark" path="remark" id="remark"
											cols="25" rows="3" />
									</div>

									<div class="st1">
										<span id="pricesp">$NTD</span> <label for="price" class="t1">*單價：</label>
										<form:input type="text" path="price" id="price" name="price"
											value="" />
										<form:errors path="price" cssClass="error" />
									</div>

								</fieldset>

								<table>
									<thead>

									</thead>

									<tbody>

									</tbody>
								</table>

								<div class="sub">
									<input type="submit" name="submit" class="btn btn-info"
										value="新增"> <input type="reset" class="btn btn-info"
										value="清除"> <input type="button" class="btn btn-info"
										value="金手指" onclick='quickInput();'>
								</div>
							</form:form>
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
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>

