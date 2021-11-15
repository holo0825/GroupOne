<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="" />
                <meta name="keywords" content="" />
                <title>團購商品購買</title>
                <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
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

                    <section>
                        <div class="block">
                            <div class="fixed-bg" style="background-image: url(../assets/images/topbg.jpg);"></div>
                            <div class="page-title-wrapper text-center">
                                <div class="col-md-12 col-sm-12 col-lg-12">
                                    <div class="page-title-inner">
                                        <h1 itemprop="headline">商品資訊</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="bread-crumbs-wrapper">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#" title="" itemprop="url">首頁</a></li>
                                <li class="breadcrumb-item"><a href="#" title="" itemprop="url">搜尋</a></li>
                                <li class="breadcrumb-item active">商品資訊</li>
                            </ol>
                        </div>
                    </div>
                    <section>
                        <div class="block gray-bg bottom-padd210 top-padd30">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="sec-box">
                                            <div class="sec-wrapper">
                                                <div class="col-md-8 col-sm-12 col-lg-8">
                                                    <div class="restaurant-detail-wrapper">
                                                        <div class="restaurant-detail-info">
                                                            <div class="restaurant-detail-thumb">
                                                                <ul class="restaurant-detail-img-carousel">
                                                                    <li><img class="brd-rd3"
                                                                            src="<c:url value='/getPictureSeller/${Product.id}'/>"
                                                                            alt="restaurant-detail-big-img1-1.jpg"
                                                                            itemprop="image">
                                                                    </li>

                                                                </ul>

                                                            </div>
                                                            <div class="restaurant-detail-title">
                                                                <h1 itemprop="headline">${Product.name}</h1>
                                                                <div class="info-meta">
                                                                    <span>${Product.start} ~ ${Product.date}</span>
                                                                </div>
                                                                <div class="rating-wrapper"><a
                                                                        class="gradient-brd brd-rd2" href="#" title=""
                                                                        itemprop="url"><i class="fa fa-star"></i>Rate
                                                                        <i>4.0</i></a>
                                                                    <div class="rate-share brd-rd5">
                                                                        <div class="rating-box-wrapper">
                                                                            <span>Rate</span>
                                                                            <div class="rating-box"><span
                                                                                    class="brd-rd2 clr1 on"></span><span
                                                                                    class="brd-rd2 clr2 on"></span><span
                                                                                    class="brd-rd2 clr3 on"></span><span
                                                                                    class="brd-rd2 clr4 on"></span><span
                                                                                    class="brd-rd2 clr5 on"></span><span
                                                                                    class="brd-rd2 clr6 on"></span><span
                                                                                    class="brd-rd2 clr7 off"></span><span
                                                                                    class="brd-rd2 clr8 off"></span><i>4.0</i>
                                                                            </div>
                                                                        </div>
                                                                        <div class="share-wrapper">
                                                                            <div class="fb-share"><label
                                                                                    class="switch"><input
                                                                                        type="checkbox"><span
                                                                                        class="switch-slider brd-rd30"></span></label><a
                                                                                    class="facebook brd-rd2" href="#"
                                                                                    title="" itemprop="url"><i
                                                                                        class="fa fa-facebook-square"></i>Share
                                                                                    on
                                                                                    Facebook</a></div>
                                                                            <div class="fb-share"><label
                                                                                    class="switch"><input
                                                                                        type="checkbox"><span
                                                                                        class="switch-slider brd-rd30"></span></label><a
                                                                                    class="twitter brd-rd2" href="#"
                                                                                    title="" itemprop="url"><i
                                                                                        class="fa fa-twitter"></i>Share
                                                                                    on
                                                                                    Twitter</a></div>
                                                                        </div>
                                                                    </div>
                                                                </div><span class="price">$ ${Product.price}</span>

                                                                <form:form
                                                                    action="${pageContext.request.contextPath}/user/customerForm"
                                                                    method="post" enctype="multipart/form-data"
                                                                    modelAttribute="product">
                                                                    <input type="text" id="id" name="id" value="${Product.id}" hidden>

                                                                    <div class="qty-wrap"><input class="qty" type="text"
                                                                        id="number" name="number" value="1">
                                                                    </div>
                                                                    <p itemprop="description">
                                                                        ${Product.introduceProduct}</p>


                                                                    <div class="step-buttons">
                                                                        <button class="brd-rd3 red-bg" type="submit">
                                                                            訂購</button>
                                                                    </div>
                                                                </form:form>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-12 col-lg-4">
                                                    <div class="order-wrapper">
                                                        <div class="order-inner gradient-brd">
                                                            <h4 itemprop="headline">Your List</h4>
                                                            <div class="order-list-wrapper">
                                                                <ul class="order-list-inner">
                                                                <c:forEach var="cart" items="${carts}">
                                                                    <li>
                                                                        <div class="dish-name"><i>${cart.number}x</i>
                                                                            <h6 itemprop="headline">${cart.productName}</h6>
                                                                            <span class="price">$${cart.price}</span>
                                                                        </div>
                                                                        
                                                                       
                                                                    </li>
                                                                   </c:forEach>
                                                                   
                                                                </ul>
                                                                                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- Section Box -->
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
                                        <div class="widget about_widget wow fadeIn" data-wow-delay="0.1s">
                                            <div class="logo">
                                                <h1 itemprop="headline">
                                                    <a href="#" title="Home" itemprop="url"><img src="../assets/images/logo.png" alt="logo.png" itemprop="image"></a>
                                                </h1>
                                            </div>
                                            <p itemprop="description">聚點食刻，共享美食每一刻！
                                                <p>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget information_links wow fadeIn" data-wow-delay="0.2s">
                                            <h4 class="widget-title" itemprop="headline">About Shop</h4>
                                            <ul>
                                                <li>
                                                    <a href="#" title="" itemprop="url">購物須知</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">退換貨政策</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">付款方式</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget customer_care wow fadeIn" data-wow-delay="0.3s">
                                            <h4 class="widget-title" itemprop="headline">關於我們</h4>
                                            <ul>
                                                <li>
                                                    <a href="#" title="" itemprop="url">會員條款</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">隱私權保護政策</a>
                                                </li>
                                                <li>
                                                    <a href="#" title="" itemprop="url">關於聚點食刻</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-lg-3">
                                        <div class="widget get_in_touch wow fadeIn" data-wow-delay="0.4s">
                                            <h4 class="widget-title" itemprop="headline">聯絡我們</h4>
                                            <ul>
                                                <li>
                                                    <i class="fa fa-envelope"></i>
                                                    <a href="#" title="" itemprop="url">eattogether@food.com</a>
                                                </li>
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
                    &copy; 2021
                    <a class="red-clr" href="http://www.bootstrapmb.com" title="Webinane" itemprop="url" target="_blank"></a>聚點食刻. All Rights Reserved
                </p>
            </div>
        </div>
                    <!-- <div class="payment-popup-wrapper cash-method text-center"><div class="payment-popup-inner" style="background-image: url(assets/images/payment-popup-bg.jpg);"><a class="payment-close-btn" href="#" title="" itemprop="url"><i class="fa fa-close"></i></a><h4 class="payment-popup-title" itemprop="headline"><i class="fa fa-money red-clr"></i>Cash Payment</h4><div class="payment-popup-info"><h5 itemprop="headline">Billing Details</h5><form class="payment-popup-info-inner"><div class="row"><div class="col-md-6 col-sm-6 col-lg-6"><ul class="payment-info-list"><li><span>Name:</span>John Smith</li><li><span>Email:</span>john@domain.com</li><li><span>Phone:</span>0231456879</li><li><span>Country:</span>India</li><li><span>Address:</span>121 King Street Melbourne Victoria Austrailia <a class="red-clr" href="#" title="" itemprop="url"><i class="fa fa-pencil"></i>Edit</a></li></ul></div><div class="col-md-6 col-sm-6 col-lg-6"><label>Order Note <sup>*</sup></label><textarea class="brd-rd3" placeholder="Description..."></textarea></div></div></form></div><div class="confrm-order red-bg"><ul class="order-total"><li><span>SubTotal</span><i>$158</i></li><li><span>Delivery fee</span><i>$70</i></li><li><span>Tax</span><i>$12</i></li></ul><div class="confrm-order-btn"><a class="brd-rd3" href="#" title="" itemprop="url">CONFIRM ORDER</a></div></div></div></div>-->
                    <!-- <div class="payment-popup-wrapper card-method text-center"><div class="payment-popup-inner" style="background-image: url(assets/images/payment-popup-bg.jpg);"><a class="payment-close-btn" href="#" title="" itemprop="url"><i class="fa fa-close"></i></a><h4 class="payment-popup-title" itemprop="headline"><i class="fa fa-money red-clr"></i>Card Payment</h4><div class="payment-popup-info"><h5 itemprop="headline">Billing Details</h5><form class="payment-popup-info-inner"><div class="row"><div class="col-md-6 col-sm-6 col-lg-6"><ul class="payment-info-list"><li><span>Name:</span>John Smith</li><li><span>Email:</span>john@domain.com</li><li><span>Phone:</span>0231456879</li><li><span>Country:</span>India</li><li><span>Address:</span>121 King Street Melbourne Victoria Austrailia <a class="red-clr" href="#" title="" itemprop="url"><i class="fa fa-pencil"></i>Edit</a></li></ul><h5 itemprop="headline">Payment Method</h5><ul class="payment-method"><li><div class="radio-box"><input type="radio" name="mthd22" id="mthd2-1"><label for="mthd2-1"><img src="assets/images/card-img.jpg" alt="card-img.jpg" itemprop="image"></label></div></li><li><div class="radio-box"><input type="radio" name="mthd22" id="mthd2-2"><label for="mthd2-2"><img src="assets/images/bank-img.jpg" alt="bank-img.jpg" itemprop="image"></label></div></li></ul></div><div class="col-md-6 col-sm-6 col-lg-6"><label>Order Note <sup>*</sup></label><textarea class="brd-rd3" placeholder="Description..."></textarea></div></div></form></div><div class="confrm-order red-bg"><ul class="order-total"><li><span>SubTotal</span><i>$158</i></li><li><span>Delivery fee</span><i>$70</i></li><li><span>Tax</span><i>$12</i></li></ul><div class="confrm-order-btn"><a class="brd-rd3" href="#" title="" itemprop="url">CONFIRM ORDER</a></div></div></div></div>-->
                    <!-- <div class="payment-popup-wrapper thanks-message text-center"><div class="payment-popup-inner red-bg"><i><img src="assets/images/tick-icon.png" alt="tick-icon.png" itemprop="image"></i><h3 itemprop="headline">Thanks For Your Order</h3><p itemprop="description">You Will Receive an email Confirmation Shortly at <a href="#" title="" itemprop="url">info@domain.com</a></p><img class="thanks-message-mockup right" src="assets/images/resource/thanks-message-mockup.png" alt="thanks-message-mockup.png" itemprop="image"></div></div>-->
                </main><!-- Main Wrapper -->
                <script src="../assets/js/jquery.min.js"></script>
                <script src="../assets/js/bootstrap.min.js"></script>
                <script src="http://ditu.google.cn/maps/api/js?v=3.exp"></script>
                <script src="../assets/js/google-map-int2.js"></script>
                <script src="../assets/js/plugins.js"></script>
                <script src="../assets/js/main.js"></script>
            </body>

            </html>