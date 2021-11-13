<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                <meta name="description" content="" />
                <meta name="keywords" content="" />
                <title>聚點時刻 - 會員忘記密碼</title>

                <!--     <link rel="shortcut icon" href="../../assets/images/favicon.png" type="image/x-icon"> -->
                <link rel="shortcut icon" href="<c:url value='/assets/images/favicon.png'/>" type="image/x-icon">
                <!--     <link rel="stylesheet" href="../../assets/css/icons.min.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/icons.min.css'/>">
                <!--     <link rel="stylesheet" href="../../assets/css/bootstrap.min.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css'/>">
                <!--     <link rel="stylesheet" href="../../assets/css/main.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/main.css'/>">
                <!--     <link rel="stylesheet" href="../../assets/css/red-color.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/red-color.css'/>">
                <!--     <link rel="stylesheet" href="../../assets/css/yellow-color.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/yellow-color.css'/>">
                <!--     <link rel="stylesheet" href="../../assets/css/responsive.css"> -->
                <link rel="stylesheet" href="<c:url value='/assets/css/responsive.css'/>">


                <!--設計HTML測試用-->
                <!-- ====================================================================================================== -->
                <link rel="shortcut icon" href="../../../../resources/static/assets/images/favicon.png" type="image/x-icon">
                <link rel="stylesheet" href="../../../../resources/static/assets/css/icons.min.css">
                <link rel="stylesheet" href="../../../../resources/static/css/bootstrap.min.css">
                <link rel="stylesheet" href="../../../../resources/static/assets/css/main.css">
                <link rel="stylesheet" href="../../../../resources/static/assets/css/red-color.css">
                <link rel="stylesheet" href="../../../../resources/static/assets/css/yellow-color.css">
                <link rel="stylesheet" href="../../../../resources/static/assets/css/responsive.css">
                <!-- ====================================================================================================== -->
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
                                            <a href="<c:url value='/register' />" title="Register" itemprop="url">註冊</a>
                                            <a href="<c:url value='/seller/home' />" title="sellerhome" itemprop="url">賣家中心</a>
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

                    <div class="responsive-header ">
                        <div class="responsive-topbar ">
                            <div class="select-wrp "><select data-placeholder="Feel Like Eating ">
                        <option>FEEL LIKE EATING</option>
                        <option>Burger</option>
                        <option>Pizza</option>
                        <option>Fried Rice</option>
                        <option>Chicken Shots</option>
                    </select></div>
                            <div class="select-wrp "><select data-placeholder="Choose Location ">
                        <option>CHOOSE LOCATION</option>
                        <option>New york</option>
                        <option>Washington</option>
                        <option>Chicago</option>
                        <option>Los Angeles</option>
                    </select></div>
                        </div>
                        <div class="responsive-logomenu ">
                            <div class="logo ">
                                <h1 itemprop="headline ">
                                    <a href="index.html " title="Home " itemprop="url "><img src="../../assets/images/logo.png " alt="logo.png " itemprop="image "></a>
                                </h1>
                            </div><span class="menu-btn yellow-bg brd-rd4 "><i class="fa fa-align-justify "></i></span>
                        </div>
                        <div class="responsive-menu "><span class="menu-close red-bg brd-rd3 "><i class="fa fa-close "></i></span>
                            <div class="menu-lst ">
                                <ul>
                                    <li class="menu-item-has-children "><a href="# " title="HOMEPAGES " itemprop="url "><span
                                    class="yellow-clr ">FOOD ORDERING</span>HOMEPAGES</a>
                                        <ul class="sub-dropdown ">
                                            <li><a href="index.html " title="HOMEPAGE 1 " itemprop="url ">HOMEPAGE 1</a></li>
                                            <li><a href="index2.html " title="HOMEPAGE 2 " itemprop="url ">HOMEPAGE 2</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children "><a href="# " title="RESTAURANTS " itemprop="url "><span
                                    class="yellow-clr ">REAL FOOD</span>RESTAURANTS</a>
                                        <ul class="sub-dropdown ">
                                            <li><a href="restaurant-found.html " title="RESTAURANT 1 " itemprop="url ">RESTAURANT 1</a>
                                            </li>
                                            <li><a href="restaurant-found2.html " title="RESTAURANT 2 " itemprop="url ">RESTAURANT
                                        2</a></li>
                                            <li><a href="restaurant-detail.html " title="RESTAURANT DETAILS " itemprop="url ">RESTAURANT DETAILS</a></li>
                                            <li><a href="restaurant-detail.html " title="RESTAURANT DETAILS " itemprop="url ">RESTAURANT DETAILS</a></li>
                                            <li><a href="food-recipes.html " title="RESTAURANT DETAILS " itemprop="url ">FOOD
                                        RECIPES</a></li>
                                            <li><a href="our-articles.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                        ARTICLES</a></li>
                                            <li><a href="our-menu.html " title="RESTAURANT DETAILS " itemprop="url ">OUR MENU</a></li>
                                            <li><a href="our-services.html " title="RESTAURANT DETAILS " itemprop="url ">OUR
                                        SERVICES</a></li>
                                        </ul>
                                    </li>
                                    <li class="menu-item-has-children "><a href="# " title="PAGES " itemprop="url "><span
                                    class="yellow-clr ">REAL FOOD</span>PAGES</a>
                                        <ul class="sub-dropdown ">
                                            <li class="menu-item-has-children "><a href="# " title="BLOG " itemprop="url ">BLOG</a>
                                                <ul class="sub-dropdown ">
                                                    <li class="menu-item-has-children "><a href="# " title="BLOG LAYOUTS " itemprop="url ">BLOG LAYOUTS</a>
                                                        <ul class="sub-dropdown ">
                                                            <li><a href="blog-right-sidebar.html " title="BLOG WITH RIGHT SIDEBAR " itemprop="url ">BLOG (W.R.S)</a></li>
                                                            <li><a href="blog-left-sidebar.html " title="BLOG WITH LEFT SIDEBAR " itemprop="url ">BLOG (W.L.S)</a></li>
                                                            <li><a href="blog.html " title="BLOG WITH NO SIDEBAR " itemprop="url ">BLOG</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children "><a href="# " title="BLOG DETAIL " itemprop="url ">BLOG DETAIL</a>
                                                        <ul class="sub-dropdown ">
                                                            <li><a href="blog-detail-right-sidebar.html " title="BLOG DETAIL WITH RIGHT SIDEBAR " itemprop="url ">BLOG
                                                        DETAIL (W.R.S)</a></li>
                                                            <li><a href="blog-detail-left-sidebar.html " title="BLOG DETAIL WITH LEFT SIDEBAR " itemprop="url ">BLOG DETAIL
                                                        (W.L.S)</a></li>
                                                            <li><a href="blog-detail.html " title="BLOG DETAIL WITH NO SIDEBAR " itemprop="url ">BLOG DETAIL</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="menu-item-has-children "><a href="# " title="BLOG FORMATES " itemprop="url ">BLOG FORMATES</a>
                                                        <ul class="sub-dropdown ">
                                                            <li><a href="blog-detail-video.html " title="BLOG DETAIL WITH VIDEO " itemprop="url ">BLOG DETAIL (VIDEO)</a></li>
                                                            <li><a href="blog-detail-audio.html " title="BLOG DETAIL WITH AUDIO " itemprop="url ">BLOG DETAIL (AUDIO)</a></li>
                                                            <li><a href="blog-detail-carousel.html " title="BLOG DETAIL WITH CAROUSEL " itemprop="url ">BLOG DETAIL
                                                        (CAROUSEL)</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children "><a href="# " title="SPECIAL PAGES " itemprop="url ">SPECIAL PAGES</a>
                                                <ul class="sub-dropdown ">
                                                    <li><a href="404.html " title="404 ERROR " itemprop="url ">404 ERROR</a></li>
                                                    <li><a href="search-found.html " title="SEARCH FOUND " itemprop="url ">SEARCH
                                                FOUND</a></li>
                                                    <li><a href="search-not-found.html " title="SEARCH NOT FOUND " itemprop="url ">SEARCH NOT FOUND</a></li>
                                                    <li><a href="coming-soon.html " title="COMING SOON " itemprop="url ">COMING
                                                SOON</a></li>
                                                    <li><a href="login-register.html " title="LOGIN & REGISTER " itemprop="url ">LOGIN
                                                & REGISTER</a></li>
                                                    <li><a href="price-table.html " title="PRICE TABLE " itemprop="url ">PRICE
                                                TABLE</a></li>
                                                </ul>
                                            </li>
                                            <li class="menu-item-has-children "><a href="# " title="GALLERY " itemprop="url ">GALLERY</a>
                                                <ul class="sub-dropdown ">
                                                    <li><a href="gallery.html " title="FOOD GALLERY " itemprop="url ">FOOD GALLERY</a>
                                                    </li>
                                                    <li><a href="gallery-detail.html " title="GALLERY DETAIL " itemprop="url ">GALLERY
                                                DETAIL</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="register-reservation.html " title="REGISTER RESERVATION " itemprop="url ">REGISTER RESERVATION</a></li>
                                            <li><a href="how-it-works.html " title="HOW IT WORKS " itemprop="url ">HOW IT WORKS</a>
                                            </li>
                                            <li><a href="dashboard.html " title="USER PROFILE " itemprop="url ">USER PROFILE</a></li>
                                            <li><a href="about-us.html " title="ABOUT US " itemprop="url ">ABOUT US</a></li>
                                            <li><a href="food-detail.html " title="FOOD DETAIL " itemprop="url ">FOOD DETAIL</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html " title="CONTACT US " itemprop="url "><span class="yellow-clr ">REAL
                                    FOOD</span>CONTACT US</a></li>
                                </ul>
                            </div>
                            <div class="topbar-register "><a class="log-popup-btn " href="# " title="Login " itemprop="url ">LOGIN</a>/
                                <a class="sign-popup-btn " href="# " title="Register " itemprop="url ">REGISTER</a></div>
                            <div class="social1 "><a href="# " title="Facebook " itemprop="url " target="_blank "><i
                            class="fa fa-facebook-square "></i></a><a href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i></a><a href="# " title="Google Plus " itemprop="url " target="_blank "><i class="fa fa-google-plus "></i></a></div>
                            <div class="register-btn "><a class="yellow-bg brd-rd4 " href="register-reservation.html " title="Register " itemprop="url ">REGISTER RESTAURANT</a></div>
                        </div>
                        <!-- Responsive Menu -->
                    </div>
                    <!-- Responsive Header -->
                    <section>
                        <div class="block ">
                            <!--                 <div class="fixed-bg " style="background-image: url(../../assets/images/topbg.jpg); "></div> -->
                            <div class="fixed-bg " style="background-image: url(<c:url value='/assets/images/topbg.jpg'/>); "></div>
                            <div class="page-title-wrapper text-center ">
                                <div class="col-md-12 col-sm-12 col-lg-12 ">
                                    <div class="page-title-inner ">
                                        <h1 itemprop="headline ">管理密碼專區</h1>
                                        <!-- <span style="font-size: 50px;">Enjoy Food Together</span> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <div class="bread-crumbs-wrapper ">
                        <div class="container ">
                            <ol class="breadcrumb ">
                                <li class="breadcrumb-item "><a href="# " title=" " itemprop="url ">首頁</a></li>
                                <li class="breadcrumb-item active ">忘記及重設密碼</li>
                            </ol>
                        </div>
                    </div>
                    <section>
                        <div class="block top-padd30" style="margin-left: 300px;">
                            <div class="container">
                                <div class="row ">
                                    <div class="col-md-12 col-sm-12 col-lg-12 ">
                                        <div class="login-register-wrapper ">
                                            <div class="row ">

                                                <div class="col-md-6 col-sm-12 col-lg-6 ">
                                                    <div class="sign-popup-wrapper brd-rd5 ">
                                                        <div class="sign-popup-inner brd-rd5 ">
                                                            <div class="sign-popup-title text-center ">
                                                                <h4 itemprop="headline ">會員忘記密碼專區</h4>
                                                                <span>請根據以下指示填入email</span>
                                                            </div>
                                                            <div class="popup-social text-center ">
                                                                <!--                                                 	<a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "> -->
                                                                <!-- <a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url ">
                                                        <i class="fa fa-facebook "></i>Facebook
                                                    </a> -->
                                                                <!--                                                 	<a class="google brd-rd3 " href="/oauth2/authorization/google" title="Google Plus " itemprop="url " target="_blank "> -->
                                                                <!-- <a class="google brd-rd3 " href="/oauth2/authorization/google" title="Google Plus " itemprop="url ">
                                                        <i class="fa fa-google-plus "></i>Google
                                                    </a> -->
                                                                <!--                                                 	<a class="github brd-rd3 " href="# " title="GitHub " itemprop="url " target="_blank "> -->
                                                                <!-- <a class="github brd-rd3 " href="# " title="GitHub " itemprop="url ">
                                                        <i class="fa fa-github "></i>GitHub
                                                    </a>
                                                </div>
                                                <span class="popup-seprator text-center "><i
                                                        class="brd-rd50 ">or</i></span> -->
                                                                <!-- <form class="sign-form " action="<c:url value='/login'/>" method="POST"> -->
                                                                <div class="sign-form ">
                                                                    <div class="row">

                                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3" style="font-size: 15px;" type="text" name="username" id="username" placeholder="帳號" required="required">
                                                        </div> -->
                                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3" style="font-size: 15px;" type="email" placeholder="Email ">
                                                        </div> -->
                                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 ">
                                                            <input class="brd-rd3" style="font-size: 15px;" type="password" name="password" id="password" placeholder="密碼" required="required">
                                                        </div> -->
                                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><button class="yellow-bg brd-rd3" style="font-size: 20px;" id="button" type="submit ">返回首頁</button></div> -->



                                                                        <!-- reminder message after email verification complete -->
                                                                        <div class=" col-sm-12 col-sm-12 col-lg-12 col-xs-12 " style="font-size: 25px; margin-bottom: 15px; color: red; text-align: center; background-color: rgb(247, 214, 217);">
                                                                            <!--                                                         	style="font-size: 25px; margin-bottom: 15px; border-radius: 5px; border: hidden; background-color: rgb(247, 214, 217); color: rgb(132, 56, 64); text-align: center;" > -->
                                                                            <h3>

                                                                                <c:if test="${error != null}">
                                                                                    <div>
                                                                                        <p class="text-danger">
                                                                                            <c:out value="${error}" />
                                                                                        </p>
                                                                                    </div>
                                                                                </c:if>

                                                                                <c:if test="${message != null}">
                                                                                    <div>
                                                                                        <p class="text-warning">
                                                                                            <c:out value="${message}" />
                                                                                        </p>
                                                                                    </div>

                                                                                </c:if>
                                                                                <form action="<c:url value='/forgot_password'/>" method="post" style="max-width: 420px; margin: 0 auto;">
                                                                                    <div class="border border-secondary rounded p-3">
                                                                                        <div>
                                                                                            <p>我們將透過e-mail寄送專屬的重設密碼連結到您的信箱</p>
                                                                                        </div>
                                                                                        <div>
                                                                                            <p>
                                                                                                <input type="email" name="email" class="form-control" placeholder="請輸入您的 e-mail" required="required" autofocus="autofocus" />
                                                                                            </p>
                                                                                            <p class="text-center">
                                                                                                <input type="submit" value="Send" class="btn btn-primary" />
                                                                                            </p>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>
                                                                            </h3>
                                                                        </div>

                                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " style="text-align: center;">
                                                                            <a href="<c:url value='/login'/>"><button class="red-bg brd-rd3" style="font-size: 20px;" id="button" type="button "><i
                                                                class="fa fa-user"></i> 點我進登入頁面</button></a>
                                                                        </div>


                                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " style="text-align: center;">
                                                                            <a href="<c:url value='/' />" title="" itemprop="url"><button class="yellow-bg brd-rd3" style="font-size: 20px;" id="button" type="button "><i
                                                            class="fa fa-home"></i> 返回首頁</button></a>
                                                                        </div>

                                                                    </div>




                                                                    <!-- ====================================================================================================== -->
                                                                    <!--Google Recaptcha驗證是否機器人-->
                                                                    <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " style="text-align: center;"> -->
                                                                    <!-- Google captcha (I'm not robot checkbox) -->
                                                                    <!-- SITE_KEY - Represents the site_key generated by the Google reCaptcha service -->
                                                                    <!-- <div class="g-recaptcha" data-sitekey="6Lf9CB0dAAAAAMWlYhbDJXMIcVxY4JU1pjizwTUi" id="recaptcha"></div>
                                                                <div>
                                                                    <span id="captcha-error" style="color:red"></span>
                                                                </div>
                                                            </div> -->

                                                                    <!-- Spring Security登出必須加入隱藏的csrf資訊 -->
                                                                    <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 " style="text-align: center;">
                                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <input type="button" class="btn btn-info" value="管理員一鍵輸入" onclick='quickInput();'>
                                                        </div> -->

                                                                    <!--註冊和忘記密碼超連結-->
                                                                    <!-- <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "> -->
                                                                    <!-- <a class="sign-btn " href="# " title=" " itemprop="url " style="font-size: 15px;">已經註冊了嗎？ 登入</a> -->
                                                                    <!-- <a class="sign-btn " href="<c:url value='/register'/>" title=" " itemprop="url " style="font-size: 15px;">還沒註冊嗎？ 註冊</a>
                                                                <a class="recover-btn " href="<c:url value='/forgot_password'/>" title=" " itemprop="url " style="font-size: 15px;">忘記密碼</a>
                                                            </div> -->
                                                                    <!-- ====================================================================================================== -->



                                                                </div>
                                                                <!-- </form> -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- <div class="col-md-6 col-sm-12 col-lg-6 ">
                                        <div class="sign-popup-wrapper brd-rd5 ">
                                            <div class="sign-popup-inner brd-rd5 ">
                                                <div class="sign-popup-title text-center ">
                                                    <h4 itemprop="headline ">SIGN UP</h4><span>with your social
                                                        network</span>
                                                </div>
                                                <div class="popup-social text-center "><a class="facebook brd-rd3 " href="# " title="Facebook " itemprop="url " target="_blank "><i
                                                            class="fa fa-facebook "></i>Facebook</a><a class="google brd-rd3 " href="# " title="Google Plus " itemprop="url " target="_blank "><i
                                                            class="fa fa-google-plus "></i>Google</a><a class="twitter brd-rd3 " href="# " title="Twitter " itemprop="url " target="_blank "><i class="fa fa-twitter "></i>Twitter</a></div>
                                                <span class="popup-seprator text-center "><i
                                                        class="brd-rd50 ">or</i></span>
                                                <form class="sign-form ">
                                                    <div class="row ">
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><input class="brd-rd3 " type="text " placeholder="Username ">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><input class="brd-rd3 " type="email " placeholder="Email "></div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><input class="brd-rd3 " type="password " placeholder="Password ">
                                                        </div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><button class="red-bg brd-rd3 " type="submit ">REGISTER
                                                                NOW</button></div>
                                                        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12 "><a class="sign-btn " href="# " title=" " itemprop="url ">Already Registered? Sign in</a><a class="recover-btn " href="# " title="
                " itemprop="url ">Recover my password</a></div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <footer>
                        <!-- footer -->
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
                                                                <a href="#" title="Home" itemprop="url"><img src="assets/images/icon_get_together.png" alt="logo.png" itemprop="image"></a>
                                                            </h1>
                                                        </div>
                                                        <p itemprop="description">聚點食刻，共享美食每一刻！
                                                            <p>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-lg-3">
                                                    <div class="widget information_links wow fadeIn" data-wow-delay="0.2s">
                                                        <h4 class="widget-title" itemprop="headline">購物流程</h4>
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
                                                                <a href="#" title="" itemprop="url">hello@yourdomain.com</a>
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
                </main>
                <!-- Main Wrapper -->
                <!--     <script src="../../assets/js/jquery.min.js "></script> -->
                <script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
                <!--     <script src="../../assets/js/bootstrap.min.js "></script> -->
                <script src="<c:url value='/assets/js/bootstrap.min.js'/>"></script>
                <!--     <script src="../../assets/js/plugins.js "></script> -->
                <script src="<c:url value='/assets/js/plugins.js'/>"></script>
                <!--     <script src="../../assets/js/main.js "></script> -->
                <script src="<c:url value='/assets/js/main.js'/>"></script>


                <!--設計HTML測試用-->
                <!-- ====================================================================================================== -->
                <script src="../../../../resources/static/assets/js/jquery.min.js "></script>
                <script src="../../../../resources/static/assets/js/bootstrap.min.js "></script>
                <script src="../../../../resources/static/assets/js/plugins.js "></script>
                <script src="../../../../resources/static/assets/js/main.js "></script>
                <!-- ====================================================================================================== -->




            </body>

            </html>