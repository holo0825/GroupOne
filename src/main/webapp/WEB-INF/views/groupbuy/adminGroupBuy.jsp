<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="../css/yu.css">
<link rel="stylesheet" href="../focus2/css/style.css">
</head>
<title>聚點時刻 管理員端-餐廳管理系統</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('tbody').on('click', '#del', function () { //刪除
		$(this).closest('tr').remove();
		var id = $(this).closest('tr').children().eq(0).text();  //eq(0)欄位		
		console.log(id);
			$.ajax({
				async:true,
				url: './updateSellerAdmin', //控制器網址+控制器 刪除的rstName,
				type: "delete",
				data: "id=" +id,
				success : function() {
					// 				$("#result").html(data);
					console.log("Done");
				},
				error : function() {
					//				 					$("#ajaxDelete").prop('disabled', false).text('Error');
					console.log("Error");
				},
				complete : function() {
				}
			});
		});
	});
</script>

<!-- 前端畫面for管理員 管理餐廳 -->

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
                    <span class="line"></span><span class="line"></span><span class="line"></span>
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

                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                
                           </li>
							<li class="nav-item dropdown header-profile"><a
								class="nav-link" href="#" role="button" data-toggle="dropdown">
									<i class="mdi mdi-account"></i>
							</a>
								<div class="dropdown-menu dropdown-menu-right">
									<a href="./page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">
                                            <form action="<c:url value='/logout' />" method="post" style="display:inline;">
                                                <input type="hidden"
                                                 name="${_csrf.parameterName}"
                                                 value="${_csrf.token}"/>
                                               <input type="submit" value="登出" style="background-color: #fff; border: none;">
                                            </form> 
                                        </span>
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
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">團購列表</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped table-responsive-sm"  style="color:black; font-size:120%">
									<thead>
										<tr>
											<th>#</th>
											<th>團購發起人編號</th>
											<th>團購名稱</th>
											<th>價格</th>
											<th>起始日~截止日</th>
											<th>人數</th>
											<th>編輯</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var='pro' items='${Products}'>
											<tr>
												<td>${pro.id}</td>
												<td>${pro.sellerId}</td>
												<td>${pro.name}</td>
												<td>${pro.price}</td>
												<td>${pro.start}~${pro.date}</td>
												<td>${pro.peopleNow}/${pro.people}</td>
												<td><input type="submit" class="del" id="del" name="del" value="團購中止"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--*******
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

</body>

</html>


