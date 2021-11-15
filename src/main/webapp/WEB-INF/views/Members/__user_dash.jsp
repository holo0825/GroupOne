<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>聚點時刻 | 個人檔案</title>
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../assets/css/icons.min.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css">
    <link rel="stylesheet" href="../assets/css/red-color.css">
    <link rel="stylesheet" href="../assets/css/yellow-color.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">

    <style>

    </style>
    <script>
        // 偵測圖片上傳的事件，並且顯示圖片在網頁上
        var loadFile = function(event) {
            var image = document.getElementById('output');
            image.src = URL.createObjectURL(event.target.files[0]);
        };

        // 	設定date的max屬性為today
        /*
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
	
		if (dd < 10) {
		   dd = '0' + dd;
		}
	
		if (mm < 10) {
		   mm = '0' + mm;
		} 
		    
		today = yyyy + '-' + mm + '-' + dd;
		
		document.getElementById("datefield").setAttribute("max", today);
		*/



        // maxDate計算生日對應年紀為18歲以上
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear() - 18;
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }

        maxDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById("datefield").setAttribute("max", maxDate);

        // minDate計算生日對應年紀為18歲以上
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear() - 100;
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }

        minDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById("datefield").setAttribute("min", minDate);
    </script>
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
                                    <input type="submit" value="登出" style="color:white;background:#a59292;">
                                </form> 
                            </span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- <div class="social1" style="margin-top:16px;!important"> -->
                    <div class="social1">
                        <a href="#" title="Facebook" itemprop="url" target="_blank"><i class="fa fa-facebook-square"></i></a>
                        <a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>
            <!-- Topbar -->
            <div class="logo-menu-sec">
                <div class="container" style="margin-left: 220px;">
                    <div class="logo" style="margin:12px 0 0 0 ; !important">
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
                                            <a href="<c:url value='/user/UserEditProfile' />" itemprop="url">個人檔案</a>
                                        </li>
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
        <div class="responsive-header">
            <div class="responsive-topbar">
                <div class="select-wrp"><select data-placeholder="Feel Like Eating">
                        <option>FEEL LIKE EATING</option>
                        <option>Burger</option>
                        <option>Pizza</option>
                        <option>Fried Rice</option>
                        <option>Chicken Shots</option>
                    </select></div>
                <div class="select-wrp"><select data-placeholder="Choose Location">
                        <option>CHOOSE LOCATION</option>
                        <option>New york</option>
                        <option>Washington</option>
                        <option>Chicago</option>
                        <option>Los Angeles</option>
                    </select></div>
            </div>
            <div class="responsive-logomenu">
                <div class="logo">
                    <h1 itemprop="headline">
                        <a href="index.html" title="Home" itemprop="url"><img src="../assets/images/logo.png" alt="logo.png" itemprop="image"></a>
                    </h1>
                </div><span class="menu-btn yellow-bg brd-rd4"><i class="fa fa-align-justify"></i></span>
            </div>
            <div class="responsive-menu"><span class="menu-close red-bg brd-rd3"><i class="fa fa-close"></i></span>
                <div class="menu-lst">
                    <ul>
                        <li class="menu-item-has-children"><a href="#" title="HOMEPAGES" itemprop="url"><span
                                    class="yellow-clr">FOOD ORDERING</span>HOMEPAGES</a>
                            <ul class="sub-dropdown">
                                <li><a href="index.html" title="HOMEPAGE 1" itemprop="url">HOMEPAGE 1</a></li>
                                <li><a href="index2.html" title="HOMEPAGE 2" itemprop="url">HOMEPAGE 2</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children"><a href="#" title="RESTAURANTS" itemprop="url"><span
                                    class="yellow-clr">REAL FOOD</span>RESTAURANTS</a>
                            <ul class="sub-dropdown">
                                <li><a href="restaurant-found.html" title="RESTAURANT 1" itemprop="url">RESTAURANT 1</a>
                                </li>
                                <li><a href="restaurant-found2.html" title="RESTAURANT 2" itemprop="url">RESTAURANT
                                        2</a></li>
                                <li><a href="restaurant-detail.html" title="RESTAURANT DETAILS" itemprop="url">RESTAURANT DETAILS</a></li>
                                <li><a href="restaurant-detail.html" title="RESTAURANT DETAILS" itemprop="url">RESTAURANT DETAILS</a></li>
                                <li><a href="food-recipes.html" title="RESTAURANT DETAILS" itemprop="url">FOOD
                                        RECIPES</a></li>
                                <li><a href="our-articles.html" title="RESTAURANT DETAILS" itemprop="url">OUR
                                        ARTICLES</a></li>
                                <li><a href="our-menu.html" title="RESTAURANT DETAILS" itemprop="url">OUR MENU</a></li>
                                <li><a href="our-services.html" title="RESTAURANT DETAILS" itemprop="url">OUR
                                        SERVICES</a></li>
                            </ul>
                        </li>
                        <li class="menu-item-has-children"><a href="#" title="PAGES" itemprop="url"><span
                                    class="yellow-clr">REAL FOOD</span>PAGES</a>
                            <ul class="sub-dropdown">
                                <li class="menu-item-has-children"><a href="#" title="BLOG" itemprop="url">BLOG</a>
                                    <ul class="sub-dropdown">
                                        <li class="menu-item-has-children"><a href="#" title="BLOG LAYOUTS" itemprop="url">BLOG LAYOUTS</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-right-sidebar.html" title="BLOG WITH RIGHT SIDEBAR" itemprop="url">BLOG (W.R.S)</a></li>
                                                <li><a href="blog-left-sidebar.html" title="BLOG WITH LEFT SIDEBAR" itemprop="url">BLOG (W.L.S)</a></li>
                                                <li><a href="blog.html" title="BLOG WITH NO SIDEBAR" itemprop="url">BLOG</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="BLOG DETAIL" itemprop="url">BLOG DETAIL</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-detail-right-sidebar.html" title="BLOG DETAIL WITH RIGHT SIDEBAR" itemprop="url">BLOG
                                                        DETAIL (W.R.S)</a></li>
                                                <li><a href="blog-detail-left-sidebar.html" title="BLOG DETAIL WITH LEFT SIDEBAR" itemprop="url">BLOG DETAIL
                                                        (W.L.S)</a></li>
                                                <li><a href="blog-detail.html" title="BLOG DETAIL WITH NO SIDEBAR" itemprop="url">BLOG DETAIL</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children"><a href="#" title="BLOG FORMATES" itemprop="url">BLOG FORMATES</a>
                                            <ul class="sub-dropdown">
                                                <li><a href="blog-detail-video.html" title="BLOG DETAIL WITH VIDEO" itemprop="url">BLOG DETAIL (VIDEO)</a></li>
                                                <li><a href="blog-detail-audio.html" title="BLOG DETAIL WITH AUDIO" itemprop="url">BLOG DETAIL (AUDIO)</a></li>
                                                <li><a href="blog-detail-carousel.html" title="BLOG DETAIL WITH CAROUSEL" itemprop="url">BLOG DETAIL
                                                        (CAROUSEL)</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="SPECIAL PAGES" itemprop="url">SPECIAL PAGES</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="404.html" title="404 ERROR" itemprop="url">404 ERROR</a></li>
                                        <li><a href="search-found.html" title="SEARCH FOUND" itemprop="url">SEARCH
                                                FOUND</a></li>
                                        <li><a href="search-not-found.html" title="SEARCH NOT FOUND" itemprop="url">SEARCH NOT FOUND</a></li>
                                        <li><a href="coming-soon.html" title="COMING SOON" itemprop="url">COMING
                                                SOON</a></li>
                                        <li><a href="login-register.html" title="LOGIN & REGISTER" itemprop="url">LOGIN
                                                & REGISTER</a></li>
                                        <li><a href="price-table.html" title="PRICE TABLE" itemprop="url">PRICE
                                                TABLE</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children"><a href="#" title="GALLERY" itemprop="url">GALLERY</a>
                                    <ul class="sub-dropdown">
                                        <li><a href="gallery.html" title="FOOD GALLERY" itemprop="url">FOOD GALLERY</a>
                                        </li>
                                        <li><a href="gallery-detail.html" title="GALLERY DETAIL" itemprop="url">GALLERY
                                                DETAIL</a></li>
                                    </ul>
                                </li>
                                <li><a href="register-reservation.html" title="REGISTER RESERVATION" itemprop="url">REGISTER RESERVATION</a></li>
                                <li><a href="how-it-works.html" title="HOW IT WORKS" itemprop="url">HOW IT WORKS</a>
                                </li>
                                <li><a href="dashboard.html" title="USER PROFILE" itemprop="url">USER PROFILE</a></li>
                                <li><a href="about-us.html" title="ABOUT US" itemprop="url">ABOUT US</a></li>
                                <li><a href="food-detail.html" title="FOOD DETAIL" itemprop="url">FOOD DETAIL</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html" title="CONTACT US" itemprop="url"><span class="yellow-clr">REAL
                                    FOOD</span>CONTACT US</a></li>
                    </ul>
                </div>
                <div class="topbar-register"><a class="log-popup-btn" href="#" title="Login" itemprop="url">LOGIN</a>/
                    <a class="sign-popup-btn" href="#" title="Register" itemprop="url">REGISTER</a></div>
                <div class="social1"><a href="#" title="Facebook" itemprop="url" target="_blank"><i
                            class="fa fa-facebook-square"></i></a><a href="#" title="Twitter" itemprop="url" target="_blank"><i class="fa fa-twitter"></i></a><a href="#" title="Google Plus" itemprop="url" target="_blank"><i class="fa fa-google-plus"></i></a></div>
                <div class="register-btn"><a class="yellow-bg brd-rd4" href="register-reservation.html" title="Register" itemprop="url">REGISTER RESTAURANT</a></div>
            </div>
            <!-- Responsive Menu -->
        </div>
        <!-- Responsive Header -->
        <section>
            <div class="block">
                <div class="fixed-bg" style="background-image: url(../assets/images/topbg.jpg);"></div>
                <div class="page-title-wrapper text-center">
                    <div class="col-md-12 col-sm-12 col-lg-12">
                        <div class="page-title-inner">
                            <!-- <h1 itemprop="headline">Dashboard</h1><span>A Greate Restaurant Website</span> -->
                            <h1 itemprop="headline">一般會員個人檔案</h1><span>查看或編輯個人資料</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="bread-crumbs-wrapper">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#" title="" itemprop="url">首頁</a></li>
                    <li class="breadcrumb-item active">個人檔案</li>
                </ol>
            </div>
        </div>
        <section>
            <div class="block less-spacing gray-bg top-padd30">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-12">
                            <div class="sec-box">
                                <div class="dashboard-tabs-wrapper">
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12 col-lg-4">
                                            <div class="profile-sidebar brd-rd5 wow fadeIn" data-wow-delay="0.2s">
                                                <div class="profile-sidebar-inner brd-rd5">
                                                    <div class="user-info red-bg">
                                                        <img class="brd-rd50" src="../assets/images/resource/user-avatar.jpg" alt="user-avatar.jpg" itemprop="image">
                                                        <!-- src="<c:url value='/getMemberImage?username=${user.username}' />" -->
                                                        <div class="user-info-inner">
                                                            <h5 itemprop="headline"><a href="#" title="" itemprop="url">${user.username}</a>
                                                            </h5>
                                                            <span>
                                                                <a href="#" title="" itemprop="url">${user.email}</a>
                                                            </span>
                                                            <!-- <a class="brd-rd3 sign-out-btn yellow-bg" href="#" title="" itemprop="url"> -->
                                                            <form action="<c:url value='/logout' />" method="post">
                                                                <a class="brd-rd3 sign-out-btn yellow-bg">
                                                                    <!-- <i class="fa fa-sign-out"></i> 登出 -->
                                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                                    <input type="submit" value="登出" id="logout" class="brd-rd3 sign-out-btn yellow-bg" ">
                                                                </a>
                                                            </form>
                                                            <!-- </a> -->
                                                        </div>
                                                    </div>
                                                    <ul class="nav nav-tabs ">
<!--                                                         <li class="active "><a href="#dashboard " data-toggle="tab "><i -->
<!--                                                                     class="fa fa-dashboard "></i>個人首頁</a></li> -->
<!--                                                         <li><a href="#my-bookings " data-toggle="tab "><i -->
<!--                                                                     class="fa fa-file-text "></i>我的餐券</a></li> -->
<!--                                                         <li><a href="#my-reviews " data-toggle="tab "><i
<!--                                                                     class="fa fa-comments "></i>MY REVIEWS</a></li> --> 
<!--                                                         <li><a href="#my-orders " data-toggle="tab "><i -->
<!--                                                                     class="fa fa-shopping-basket "></i>我的訂單</a></li> -->
                                                        <!-- <li><a href="#shortlists " data-toggle="tab "><i
                                                                    class="fa fa-heart "></i>SHORTLISTS</a></li>
                                                        <li><a href="#statement " data-toggle="tab "><i
                                                                    class="fa fa-wpforms "></i>STATEMENT</a></li> -->
                                                        <li><a href="#account-settings " data-toggle="tab "><i
                                                                    class="fa fa-cog "></i>帳號設定</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-sm-12 col-lg-8 ">
                                            <div class="tab-content ">
                                                <div class="tab-pane fade in active " id="dashboard ">
                                                    <div class="dashboard-wrapper brd-rd5 ">
                                                        <div class="welcome-note yellow-bg brd-rd5 " style="padding-top: 25px; ">
                                                            <h3 itemprop="headline " style="color: white; ">親愛的用戶歡迎回來</h3>
                                                            <p itemprop="description " style="font-size: 20px; ">
                                                                總是在想每天要吃什麼想到抉擇障礙嗎？ 聚點時刻貼心為推薦您精選的優質餐廳， 讓您輕鬆選、輕鬆點。
                                                            </p><img src="../assets/images/resource/welcome-note-img.png " alt="welcome-note-img.png " itemprop="image ">
                                                            <a class="remove-noti " href="# " title=" " itemprop="url "><img src="../assets/images/close-icon.png " alt="close-icon.png " itemprop="image "></a>
                                                        </div>
<!--                                                         <div class="dashboard-title "> -->
<!--                                                             <h4 itemprop="headline ">精選優質餐廳</h4> -->
<!--                                                             <span>Define <a class="red-clr " href="# " title=" "
<!--                                                                     itemprop="url ">Search criteria</a>to search for -->
<!--                                                                 specific</span> --> -->
<!--                                                         </div> -->
<!--                                                         <div class="restaurants-list "> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 wow fadeInUp " data-wow-delay="0.2s "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-1.png " alt="restaurant-logo1-1.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">台東縣太麻里鄉太麻里街92號</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">日上三竿</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>最低NT$109元起</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><span class="red-bg brd-rd4 post-likes "><i -->
<!--                                                                             class="fa fa-heart-o "></i>12</span><a class="brd-rd3 " href="# " title=" " itemprop="url ">查看菜單</a></div> -->
<!--                                                             </div> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 wow fadeInUp " data-wow-delay="0.3s "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-2.png " alt="restaurant-logo1-2.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">新竹縣竹東鎮中興路一段195號</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">淇浬澌</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>最低NT$99元起</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><span class="red-bg brd-rd4 post-likes "><i -->
<!--                                                                             class="fa fa-heart-o "></i>20</span><a class="brd-rd3 " href="# " title=" " itemprop="url ">查看菜單</a></div> -->
<!--                                                             </div> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 wow fadeInUp " data-wow-delay="0.4s "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-1.png " alt="restaurant-logo1-1.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">新北市淡水區北新路182巷36號1F</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">吃呼義料</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>最低NT$89元起</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><span class="red-bg brd-rd4 post-likes "><i -->
<!--                                                                             class="fa fa-heart-o "></i>15</span><a class="brd-rd3 " href="# " title=" " itemprop="url ">查看菜單</a></div> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="tab-pane fade " id="my-bookings "> -->
<!--                                                     <div class="tabs-wrp brd-rd5 "> -->
<!--                                                         <h4 itemprop="headline ">我的餐券</h4> -->
<!--                                                         <div class="select-wrap-inner "> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>選擇訂單狀態</option> -->
<!--                                                                     <option>Select Booking Status</option> -->
<!--                                                                     <option>Select Booking Status</option> -->
<!--                                                                 </select></div> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>選擇日期區間</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                 </select></div> -->
<!--                                                         </div> -->
<!--                                                         <div class="booking-table "> -->
<!--                                                             <table> -->
<!--                                                                 <thead> -->
<!--                                                                     <tr> -->
<!--                                                                         <th>餐廳名稱</th> -->
<!--                                                                         <th>品項</th> -->
<!--                                                                         <th>日期</th> -->
<!--                                                                         <th>訂單狀態</th> -->
<!--                                                                     </tr> -->
<!--                                                                 </thead> -->
<!--                                                                 <tbody> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <h5 itemprop="headline "> -->
<!--                                                                                 <a href="# " title=" " itemprop="url ">漢堡王</a> -->
<!--                                                                             </h5> -->
<!--                                                                         </td> -->
<!--                                                                         <td>2021-11-15</td> -->
<!--                                                                         <td><span class="brd-rd3 processing ">處理中</span><a class="detail-link brd-rd50 " href="# " title=" " itemprop="url "><i -->
<!--                                                                                     class="fa fa-chain "></i></a></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <h5 itemprop="headline "> -->
<!--                                                                                 <a href="# " title=" " itemprop="url ">王品牛排</a> -->
<!--                                                                             </h5> -->
<!--                                                                         </td> -->
<!--                                                                         <td>2021-11-13</td> -->
<!--                                                                         <td><span class="brd-rd3 processing ">處理中</span><a class="detail-link brd-rd50 " href="# " title=" " itemprop="url "><i -->
<!--                                                                                     class="fa fa-chain "></i></a></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <h5 itemprop="headline "> -->
<!--                                                                                 <a href="# " title=" " itemprop="url ">五花馬水餃</a> -->
<!--                                                                             </h5> -->
<!--                                                                         </td> -->
<!--                                                                         <td>2021-11-14</td> -->
<!--                                                                         <td><span class="brd-rd3 completed ">完成</span><a class="detail-link brd-rd50 " href="# " title=" " itemprop="url "><i -->
<!--                                                                                     class="fa fa-chain "></i></a></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <h5 itemprop="headline "> -->
<!--                                                                                 <a href="# " title=" " itemprop="url ">繼光香香雞</a> -->
<!--                                                                             </h5> -->
<!--                                                                         </td> -->
<!--                                                                         <td>2021-11-11</td> -->
<!--                                                                         <td><span class="brd-rd3 processing ">處理中</span><a class="detail-link brd-rd50 " href="# " title=" " itemprop="url "><i -->
<!--                                                                                     class="fa fa-chain "></i></a></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td> -->
<!--                                                                             <h5 itemprop="headline "> -->
<!--                                                                                 <a href="# " title=" " itemprop="url ">老四川</a> -->
<!--                                                                             </h5> -->
<!--                                                                         </td> -->
<!--                                                                         <td>2021-11-02</td> -->
<!--                                                                         <td><span class="brd-rd3 completed ">完成</span><a class="detail-link brd-rd50 " href="# " title=" " itemprop="url "><i -->
<!--                                                                                     class="fa fa-chain "></i></a></td> -->
<!--                                                                     </tr> -->
<!--                                                                 </tbody> -->
<!--                                                             </table> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="tab-pane fade " id="my-reviews "> -->
<!--                                                     <div class="tabs-wrp brd-rd5 "> -->
<!--                                                         <h4 itemprop="headline ">MY REVIEWS</h4> -->
<!--                                                         <div class="select-wrap-inner "> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>Newest Reviews</option> -->
<!--                                                                     <option>Newest Reviews</option> -->
<!--                                                                     <option>Newest Reviews</option> -->
<!--                                                                 </select></div> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                 </select></div> -->
<!--                                                         </div> -->
<!--                                                         <div class="review-list "> -->
<!--                                                             <div class="review-box brd-rd5 "> -->
<!--                                                                 <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">RESTAURANT DEMO</a></h4> -->
<!--                                                                 <div class="ratings "><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star off "></i><i class="fa fa-star off "></i></div> -->
<!--                                                                 <p itemprop="description ">FoodBakery order today. So great to be able to order food and not have to talk to anyone.</p> -->
<!--                                                                 <div class="review-info "><img class="brd-rd50 " src="../assets/images/resource/reviewr-img1.jpg " alt="reviewr-img1.jpg " itemprop="image "> -->
<!--                                                                     <div class="review-info-inner "> -->
<!--                                                                         <h5 itemprop="headline ">QLARK JAKSON</h5><i class="red-clr ">2 months Ago</i> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="review-box brd-rd5 "> -->
<!--                                                                 <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">RESTAURANT DEMO</a></h4> -->
<!--                                                                 <div class="ratings "><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star off "></i></div> -->
<!--                                                                 <p itemprop="description ">FoodBakery order today. So great to be able to order food and not have to talk to anyone.</p> -->
<!--                                                                 <div class="review-info "><img class="brd-rd50 " src="../assets/images/resource/reviewr-img2.jpg " alt="reviewr-img2.jpg " itemprop="image "> -->
<!--                                                                     <div class="review-info-inner "> -->
<!--                                                                         <h5 itemprop="headline ">QLARK JAKSON</h5><i class="red-clr ">2 months Ago</i> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="review-box brd-rd5 "> -->
<!--                                                                 <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">RESTAURANT DEMO</a></h4> -->
<!--                                                                 <div class="ratings "><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i><i class="fa fa-star on "></i></div> -->
<!--                                                                 <p itemprop="description ">FoodBakery order today. So great to be able to order food and not have to talk to anyone.</p> -->
<!--                                                                 <div class="review-info "><img class="brd-rd50 " src="../assets/images/resource/reviewr-img3.jpg " alt="reviewr-img3.jpg " itemprop="image "> -->
<!--                                                                     <div class="review-info-inner "> -->
<!--                                                                         <h5 itemprop="headline ">QLARK JAKSON</h5><i class="red-clr ">2 months Ago</i> -->
<!--                                                                     </div> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
                                                        <!-- Review List -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="tab-pane fade " id="my-orders "> -->
<!--                                                     <div class="tabs-wrp brd-rd5 "> -->
<!--                                                         <h4 itemprop="headline ">我的訂單</h4> -->
<!--                                                         <div class="select-wrap-inner "> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>選擇訂單狀態</option> -->
<!--                                                                     <option>Select Orders Status</option> -->
<!--                                                                     <option>Select Orders Status</option> -->
<!--                                                                 </select></div> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>選擇日期區間</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                 </select></div> -->
<!--                                                         </div> -->
<!--                                                         <div class="order-list "> -->
<!--                                                             <div class="order-item brd-rd5 "> -->
<!--                                                                 <div class="order-thumb brd-rd5 "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/order-img1.jpg " alt="order-img1.jpg " itemprop="image "></a><span class="post-rate yellow-bg brd-rd2 "><i -->
<!--                                                                             class="fa fa-star-o "></i>4.25</span></div> -->
<!--                                                                 <div class="order-info "> -->
<!--                                                                     <span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">烤雞肉串</a> -->
<!--                                                                     </h4><span class="price ">NT$45</span><span class="processing brd-rd3 ">處理中</span><a class="brd-rd2 " href="# " title=" " itemprop="url ">訂單詳情</a> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="order-item brd-rd5 "> -->
<!--                                                                 <div class="order-thumb brd-rd5 "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/order-img2.jpg " alt="order-img2.jpg " itemprop="image "></a><span class="post-rate yellow-bg brd-rd2 "><i -->
<!--                                                                             class="fa fa-star-o "></i>3.0</span></div> -->
<!--                                                                 <div class="order-info "> -->
<!--                                                                     <span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">手工巧克力餅乾</a> -->
<!--                                                                     </h4><span class="price ">NT$35</span><span class="completed brd-rd3 ">完成</span><a class="brd-rd2 " href="# " title=" " itemprop="url ">訂單詳情</a> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="order-item brd-rd5 "> -->
<!--                                                                 <div class="order-thumb brd-rd5 "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/order-img3.jpg " alt="order-img3.jpg " itemprop="image "></a><span class="post-rate yellow-bg brd-rd2 "><i -->
<!--                                                                             class="fa fa-star-o "></i>5.00</span></div> -->
<!--                                                                 <div class="order-info "> -->
<!--                                                                     <span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">泰式風味雞肉綠咖哩</a> -->
<!--                                                                     </h4><span class="price ">NT$120</span><span class="completed brd-rd3 ">完成</span><a class="brd-rd2 " href="# " title=" " itemprop="url ">訂單詳情</a> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                             <div class="order-item brd-rd5 "> -->
<!--                                                                 <div class="order-thumb brd-rd5 "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/order-img4.jpg " alt="order-img4.jpg " itemprop="image "></a><span class="post-rate yellow-bg brd-rd2 "><i -->
<!--                                                                             class="fa fa-star-o "></i>5.30</span></div> -->
<!--                                                                 <div class="order-info "> -->
<!--                                                                     <span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">紐約客牛排</a> -->
<!--                                                                     </h4><span class="price ">NT$300</span><span class="completed brd-rd3 ">完成</span><a class="brd-rd2 " href="# " title=" " itemprop="url ">訂單詳情</a> -->
<!--                                                                 </div> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                         <div class="pagination-wrapper text-center style2 "> -->
<!--                                                             <ul class="pagination justify-content-center "> -->
<!--                                                                 <li class="page-item prev "><a class="page-link brd-rd2 " href="# " itemprop="url ">PREV</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">1</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">2</a></li> -->
<!--                                                                 <li class="page-item active "><span class="page-link brd-rd2 ">3</span></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">4</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">5</a></li> -->
<!--                                                                 <li class="page-item ">........</li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">18</a></li> -->
<!--                                                                 <li class="page-item next "><a class="page-link brd-rd2 " href="# " itemprop="url ">NEXT</a></li> -->
<!--                                                             </ul> -->
<!--                                                         </div> -->
                                                        <!-- Pagination Wrapper -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="tab-pane fade " id="shortlists "> -->
<!--                                                     <div class="tabs-wrp brd-rd5 "> -->
<!--                                                         <h4 itemprop="headline ">SHORTLISTS</h4> -->
<!--                                                         <div class="restaurants-list "> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-1.png " alt="restaurant-logo1-1.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">Domino's Pizza</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>Min order $50</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><a class="brd-rd3 " href="# " title=" " itemprop="url ">View Menu</a></div> -->
<!--                                                             </div> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-2.png " alt="restaurant-logo1-2.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">Pizza Hut</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>Min order $40</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><a class="brd-rd3 " href="# " title=" " itemprop="url ">View Menu</a></div> -->
<!--                                                             </div> -->
<!--                                                             <div class="featured-restaurant-box style3 brd-rd5 "> -->
<!--                                                                 <div class="featured-restaurant-thumb "> -->
<!--                                                                     <a href="# " title=" " itemprop="url "><img src="../assets/images/resource/restaurant-logo1-3.png " alt="restaurant-logo1-3.png " itemprop="image "></a> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="featured-restaurant-info "><span class="red-clr ">5th Avenue New York 68</span> -->
<!--                                                                     <h4 itemprop="headline "><a href="# " title=" " itemprop="url ">Burger King</a></h4> -->
<!--                                                                     <ul class="post-meta "> -->
<!--                                                                         <li><i class="fa fa-check-circle-o "></i>Min order $100</li> -->
<!--                                                                         <li><i class="flaticon-transport "></i>30min</li> -->
<!--                                                                     </ul> -->
<!--                                                                 </div> -->
<!--                                                                 <div class="view-menu-liks "><a class="brd-rd3 " href="# " title=" " itemprop="url ">View Menu</a></div> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                         <div class="pagination-wrapper text-center style2 "> -->
<!--                                                             <ul class="pagination justify-content-center "> -->
<!--                                                                 <li class="page-item prev "><a class="page-link brd-rd2 " href="# " itemprop="url ">PREV</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">1</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">2</a></li> -->
<!--                                                                 <li class="page-item active "><span class="page-link brd-rd2 ">3</span></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">4</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">5</a></li> -->
<!--                                                                 <li class="page-item ">........</li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">18</a></li> -->
<!--                                                                 <li class="page-item next "><a class="page-link brd-rd2 " href="# " itemprop="url ">NEXT</a></li> -->
<!--                                                             </ul> -->
<!--                                                         </div> -->
                                                        <!-- Pagination Wrapper -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="tab-pane fade " id="statement "> -->
<!--                                                     <div class="tabs-wrp brd-rd5 "> -->
<!--                                                         <h4 itemprop="headline ">STATEMENTS</h4> -->
<!--                                                         <div class="select-wrap-inner "> -->
<!--                                                             <div class="select-wrp2 "></div> -->
<!--                                                             <div class="select-wrp2 "><select> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                     <option>Select Date Range</option> -->
<!--                                                                 </select></div> -->
<!--                                                         </div> -->
<!--                                                         <div class="statement-table "> -->
<!--                                                             <table> -->
<!--                                                                 <thead> -->
<!--                                                                     <tr> -->
<!--                                                                         <th>TRANSACTION ID</th> -->
<!--                                                                         <th>ORDER ID</th> -->
<!--                                                                         <th>DATE</th> -->
<!--                                                                         <th>DETAIL</th> -->
<!--                                                                         <th>AMOUNT</th> -->
<!--                                                                     </tr> -->
<!--                                                                 </thead> -->
<!--                                                                 <tbody> -->
<!--                                                                     <tr> -->
<!--                                                                         <td>#30737723</td> -->
<!--                                                                         <td>8720</td> -->
<!--                                                                         <td>Aug 17,2017</td> -->
<!--                                                                         <td>Order - Misumisu Thai</td> -->
<!--                                                                         <td><span class="red-clr ">$35.97</span></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td>#30737723</td> -->
<!--                                                                         <td>8720</td> -->
<!--                                                                         <td>Aug 17,2017</td> -->
<!--                                                                         <td>Order - Jet's Kitchen</td> -->
<!--                                                                         <td><span class="red-clr ">$35.97</span></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td>#30737723</td> -->
<!--                                                                         <td>8720</td> -->
<!--                                                                         <td>Aug 17,2017</td> -->
<!--                                                                         <td>Order - Misumisu Thai</td> -->
<!--                                                                         <td><span class="red-clr ">$35.97</span></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td>#30737723</td> -->
<!--                                                                         <td>8720</td> -->
<!--                                                                         <td>Aug 17,2017</td> -->
<!--                                                                         <td>Order - Misumisu Thai</td> -->
<!--                                                                         <td><span class="red-clr ">$35.97</span></td> -->
<!--                                                                     </tr> -->
<!--                                                                     <tr> -->
<!--                                                                         <td>#30737723</td> -->
<!--                                                                         <td>8720</td> -->
<!--                                                                         <td>Aug 17,2017</td> -->
<!--                                                                         <td>Order - Misumisu Thai</td> -->
<!--                                                                         <td><span class="red-clr ">$35.97</span></td> -->
<!--                                                                     </tr> -->
<!--                                                                 </tbody> -->
<!--                                                             </table> -->
<!--                                                         </div> -->
                                                        <!-- Statement Table -->
<!--                                                         <div class="pagination-wrapper text-center style2 "> -->
<!--                                                             <ul class="pagination justify-content-center "> -->
<!--                                                                 <li class="page-item prev "><a class="page-link brd-rd2 " href="# " itemprop="url ">PREV</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">1</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">2</a></li> -->
<!--                                                                 <li class="page-item active "><span class="page-link brd-rd2 ">3</span></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">4</a></li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">5</a></li> -->
<!--                                                                 <li class="page-item ">........</li> -->
<!--                                                                 <li class="page-item "><a class="page-link brd-rd2 " href="# " itemprop="url ">18</a></li> -->
<!--                                                                 <li class="page-item next "><a class="page-link brd-rd2 " href="# " itemprop="url ">NEXT</a></li> -->
<!--                                                             </ul> -->
<!--                                                         </div> -->
                                                        <!-- Pagination Wrapper -->
<!--                                                     </div> -->
<!--                                                 </div> -->
                                                <div class="dashboard-title " id="account-settings ">
                                                    <div class="tabs-wrp account-settings brd-rd5 ">
                                                        <h4 itemprop="headline " style="margin-left: 61px; ">帳號設定</h4>
                                                        <div class="account-settings-inner ">
                                                            <div class="row ">
                                                                <div class="col-md-4 col-sm-4 col-lg-4 ">
                                                                    <div class="profile-info text-center ">
                                                                        <div class="profile-thumb brd-rd50 "><img id="profile-display " src="../assets/images/resource/profile-img1.jpg " alt="profile-img1.jpg " itemprop="image ">
                                                                        </div>
                                                                        <!-- <a class="red-clr change-password " href="# " title=" " itemprop="url ">
                                                                                變更密碼
                                                                            </a> -->
                                                                        <div class="profile-img-upload-btn ">
                                                                            <label class="fileContainer brd-rd5 yellow-bg ">
                                                                                上傳照片
<!--                                                                                 <input id="profile-upload " type="file " /> -->
                                                                            </label>
                                                                        </div>
                                                                        <!-- <p itemprop="description ">請上傳您的個人照片或從以下選擇一張照片</p>
                                                                        <div class="default-img-lst "><img class="brd-rd50 " src="assets/images/resource/profile-thumb1.jpg " alt="profile-thumb1.jpg " itemprop="image "><img class="brd-rd50 " src="assets/images/resource/profile-thumb2.jpg "
                                                                                alt="profile-thumb2.jpg " itemprop="image "><img class="brd-rd50 " src="assets/images/resource/profile-thumb3.jpg " alt="profile-thumb3.jpg " itemprop="image
                                                                        "><img class="brd-rd50 "
                                                                                src="assets/images/resource/profile-thumb4.jpg " alt="profile-thumb4.jpg " itemprop="image "><img class="brd-rd50 " src="assets/images/resource/profile-thumb5.jpg
                                                                        " alt="profile-thumb5.jpg "
                                                                                itemprop="image ">
                                                                        </div> -->
                                                                    </div>
                                                                </div>
                                                                <!--帳號設定-->
                                                                <div class="col-md-8 col-sm-8 col-lg-8 ">
                                                                    <div class="profile-info-form-wrap ">
                                                                        <form class="profile-info-form " action="<c:out value='/user/UpdateUserProfile' />" method="POST">
                                                                    <div class="row mrg20">
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <!-- <label>ID
                                                                                        <sup>*</sup></label> -->
                                                                            <input class="brd-rd3" type="text" name="id" placeholder="您的ID" value="<c:out value='${user.id}' />" readonly="readonly" hidden="hidden">
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <label>帳號
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text" name="username" placeholder="請輸入帳號"
                                                                                value="<c:out value='${user.username}' />" readonly="readonly" style="background-color: rgb(235, 235, 235); box-shadow: rgb(245, 245, 245);">
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <label>密碼
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="password" name="password" placeholder="請輸入密碼"
                                                                                value="<c:out value='${user.password}' />" required="required">
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <label>確認密碼
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="password" name="password1" placeholder="請確認密碼"
                                                                                value="<c:out value='${user.password}' />" required="required">
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <label>姓名
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text" name="fullname" placeholder="請輸入姓名"
                                                                                value="<c:out value='${user.fullname}' />" required="required">
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-lg-6">
                                                                            <label>出生年月日
                                                                                        <sup>*</sup>
                                                                                    </label>
                                                                            <input class="brd-rd3" id="datefield" type="date" name="dob" min="1900-01-01" max="2050-12-31" maxlength="10" required="required" placeholder="請輸入生日" value="<c:out value='${user.dob}' />">
                                                                        </div>
                                                                        <!-- <div class="col-md-6 col-sm-6 col-lg-6">
                                                                                    <label>性別
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="email" placeholder="請選擇性別">
                                                                                </div> -->
                                                                        <div class="col-md-6 col-sm-6 col-lg-6">
                                                                            <label>性別 <sup>*</sup></label>
                                                                            <div class="select-wrp">
                                                                                <select>
                                                                                            <option>男</option>
                                                                                            <option>女</option>
                                                                                        </select>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <label>Email
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="email" name="email" placeholder="請輸入email"
                                                                                value="<c:out value='${user.email}' />" required="required">
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-lg-6">
                                                                            <label>手機號碼
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text" name="phoneNumber" placeholder="0988888888"
                                                                                value="<c:out value='${user.phoneNumber}' />" required="required" maxlength="10">
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-lg-6">
                                                                            <label>家裡電話
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text" name="homeNUmber" placeholder="0288888888"
                                                                                value="<c:out value='${user.homeNumber}' />" maxlength="10">
                                                                        </div>

                                                                        <!-- <div class="col-md-12 col-sm-12 col-lg-12">
                                                                                    <label>Country <sup>*</sup></label>
                                                                                    <div class="select-wrp"><select>
                                                                                            <option>Pakistan</option>
                                                                                            <option>India</option>
                                                                                            <option>USA</option>
                                                                                        </select></div>
                                                                                </div> -->
                                                                        <div class="col-md-6 col-sm-6 col-lg-6">
                                                                            <label>紅利點數
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text" name="bonusPoint" value="<c:out value='${user.bonusPoint}' />"
                                                                                readonly="readonly" style="background-color: rgb(235, 235, 235); box-shadow: rgb(245, 245, 245);">
                                                                        </div>

                                                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                                                            <!-- <input class="brd-rd3 red-bg" type="submit" value="確認送出"> -->
                                                                            <!-- <input class="btn btn-success" type="submit" value="確認送出"> -->
                                                                            <button class="btn btn-danger" style="width:363.33px; height:50px;" type="submit">確認送出</button>
                                                                        </div>
                                                                    </div>


                                                                    <!-- <div class="col-md-6 col-sm-6 col-lg-6">
                                                                                    <label>State
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text">
                                                                                </div>
                                                                                <div class="col-md-6 col-sm-6 col-lg-6">
                                                                                    <label>City <sup>*</sup></label>
                                                                                    <div class="select-wrp"><select>
                                                                                            <option>Karachi</option>
                                                                                            <option>Multan</option>
                                                                                            <option>Lahore</option>
                                                                                        </select></div>
                                                                                </div>
                                                                                <div class="col-md-6 col-sm-6 col-lg-6">
                                                                                    <label>Latitude
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text">
                                                                                </div>
                                                                                <div class="col-md-6 col-sm-6 col-lg-6">
                                                                                    <label>Longitude
                                                                                        <sup>*</sup></label><input class="brd-rd3" type="text">
                                                                                </div> -->
                                                        </div>
                                                        </form>
                                                    </div>
                                                </div>

                                                <!-- <div class="col-md-12 col-sm-12 col-lg-12">
                                                                    <div class="loc-map2">
                                                                        <div class="loc-map brd-rd3" id="loc-map"></div>
                                                                        <div class="loc-srch"><input class="brd-rd3" type="text" placeholder="Type Your Address"><button class="brd-rd3 red-bg" type="submit">Search Now</button></div>
                                                                    </div>
                                                                </div> -->


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Section Box -->
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
                                                    <a href="#" title="Home" itemprop="url"><img src="../assets/images/icon_get_together.png" alt="logo.png" itemprop="image"></a>
                                                </h1>
                                            </div>
                                            <p itemprop="description" style="text-align: center;">聚點食刻，共享美食每一刻！
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
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/plugins.js"></script>
    <script src="http://ditu.google.cn/maps/api/js?v=3.exp"></script>
    <script src="../assets/js/google-map-int.js"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script src="../assets/js/main.js"></script>
</body>

</html>