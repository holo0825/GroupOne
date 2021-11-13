<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>聚點時刻 管理員端-商家會員管理系統</title>
    <!-- Favicon icon -->
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png">
    <link rel="stylesheet" type="text/css" href="<c:url value='../focus2/css/style.css'/>" >
    <!-- Datatable -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.dataTables.min.css'/>" >
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="<c:url value='../css/style.css'/>" >
    <!-- ========================================================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
    <script src="<c:url value='/js/jquery.dataTables.min.js' />"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('tbody').on('click', '.delete', function() { //刪除
                $(this).closest('tr').remove();
                var sellerId = $(this).closest('tr').children().eq(0).text();
                console.log(sellerId);
                $.ajax({
                    async: true,
                    url: './ajaxdeleteseller/' + sellerId,
                    type: "delete",
                    success: function() {
                        // 				$("#result").html(data);
                        console.log("Done");
                    },
                    error: function() {
                        // 					$("#ajaxDelete").prop('disabled', false).text('Error');
                        console.log("Error");
                    },
                    complete: function() {}
                });
            });

            $('.findAll').on('click', function() { //查詢
                $.ajax({
                    async: true,
                    url: './ajaxlistseller',
                    type: "get",
                    success: function() {
                        // 				$("#result").html(data);
                        console.log("Done");
                    },
                    error: function() {
                        console.log("Error");
                    },
                    complete: function() {
                        console.log('clicked findAll button');
                    }
                });
            });

        });
        
        
        $(document).ready( function () {
            $('#example').DataTable();
        } );
    </script>
</head>


<!-- 前端畫面for管理員 管理菜單 -->
<!-- 前端畫面for管理員 非法食品?特殊食品? -->

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
            <a href="index.html" class="brand-logo"> <img class="logo-abbr" src="../images/logo.png" alt=""> <img class="logo-compact" src="../images/logo-text.png" alt=""> <img class="brand-title" src="../images/logo-text.png" alt="">
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
                            <!--                             <div class="search_bar dropdown"> -->
                            <!--                                 <span class="search_icon p-3 c-pointer" data-toggle="dropdown"> -->
                            <!--                                     <i class="mdi mdi-magnify"></i> -->
                            <!--                                 </span> -->
                            <!--                                 <div class="dropdown-menu p-0 m-0"> -->
                            <!--                                     <form> -->
                            <!--                                         <input class="form-control" type="search" placeholder="Search" aria-label="Search"> -->
                            <!--                                     </form> -->
                            <!--                                 </div> -->
                            <!--                             </div> -->
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <!-- <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div> -->
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
						<a href="<c:url value='/' />">>返回首頁</a>
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
                            <!-- <h4>Hi, welcome back</h4> -->
                            <h4>親愛的管理員，歡迎回到管理後台</h4>
                            <!-- <span class="ml-1">Datatable</span> -->
                            <span class="ml-1">${admin.fullname} | ${admin.email}</span>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <!-- <li class="breadcrumb-item"><a href="javascript:void(0)">Table</a></li> -->
                            <li class="breadcrumb-item"><a href="javascript:void(0)">管理用戶</a></li>
                            <!-- <li class="breadcrumb-item active"><a href="javascript:void(0)">Datatable</a></li> -->
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">所有商家用戶</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">商家會員資料總攬</h4>
                            </div>
                            <div class="card-body" style="padding-top: 5px;">
                                <div class="table-responsive table-bordered table-hover table-striped" >
                                    <a href=".\newseller" class="btn btn-success" style="margin-bottom: 10px;">
                                        新增商家會員
                                    </a> &nbsp;&nbsp;
                                    <a href=".\listseller" class="btn btn-success" style="margin-bottom: 10px;">
                                        查詢所有商家會員
                                    </a>
                                    <table id="example" class="display" style="min-width: 845px; color:purple; border: groove 2px; padding: 0 0; font-size:15px;">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>帳號</th>
                                                <th>姓名</th>
                                                <th>出生年月日</th>
                                                <th>性別</th>
                                                <th>email</th>
                                                <th>手機號碼</th>
                                                <th>公司電話</th>
                                                <th>分機號碼</th>
                                                <th>公司名稱</th>
                                                <th>公司地址</th>
<!--                                                 <th>營業登記證明</th> -->
<!--                                                 <th>審核狀態</th> -->
                                                <th>編輯選項</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--   for (Todo todo: todos) {  -->
                                            <c:forEach var="seller" items="${listSeller}">
                                                <tr>
                                                    <td>
                                                        <c:out value="${seller.id}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.username}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.fullname}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.dob}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.gender}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.email}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.phoneNumber}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.telephoneNumber}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.extensionNumber}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.companyName}" />
                                                    </td>
                                                    <td>
                                                        <c:out value="${seller.companyAddress}" />
                                                    </td>
<!--                                                     <td> -->
<!--                                                         <c:out value="${seller.deleted}" /> -->
<!--                                                     </td> -->
                                                    <td>
                                                        <a href=".\editseller\<c:out value='${seller.id}' />">
                                                            <button class="btn btn-warning" onclick="return confirm('請確認是否編輯該筆賣家資料');">
                                                                <!-- 編輯 -->
<!--                                                                 <img src="./mySvg/eye.svg"> -->
                                                                <img src="<c:url value='/mySvg/eye.svg'/>">
                                                            </button>
                                                        </a>
                                                        &nbsp;&nbsp;

                                                        <a href=".\deleteseller\<c:out value='${seller.id}' />">
                                                            <button class="btn btn-danger" onclick="return confirm('請確認是否刪除該筆買家資料');">
                                                                <!-- 刪除 -->
<!--                                                                 <img src="./mySvg/trash-2.svg"> -->
                                                                <img src="<c:url value='/mySvg/trash-2.svg'/>">
                                                            </button>
                                                        </a>
                                                    </td>
<!--                                                     <td> -->
<!--                                                         <button type="button" class="btn btn-primary delete"> -->
<!--                                                             AjaxDelete -->
<!--                                                             <img src="./mySvg/trash-2.svg"> -->
<!--                                                         </button> -->
<!--                                                     </td> -->
                                                </tr>
                                            </c:forEach>
                                            <!-- } -->
                                        </tbody>
                                        <!-- <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>帳號</th>
                                                <th>姓名</th>
                                                <th>出生年月日</th>
                                                <th>性別</th>
                                                <th>email</th>
                                                <th>手機號碼</th>
                                                <th>公司電話</th>
                                                <th>分機號碼</th>
                                                <th>公司名稱</th>
                                                <th>公司地址</th>
                                                <th>營業登記證明</th>
                                                <th>審核狀態</th>
                                                <th>編輯選項</th>
                                            </tr>
                                        </tfoot> -->
                                    </table>
                                </div>
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
                    Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019
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
    <script>
// 	    $(document).ready( function () {
// 		      $('#example').DataTable({
// // 		      responsive: true
// 		    });
// 		} );
	    
	    
	    if ( $.fn.dataTable.isDataTable( '#example' ) ) {
	        table = $('#example').DataTable();
	    }
	    else {
	        table = $('#example').DataTable( {
	            paging: false
	        } );
	    }
	</script>

    <!-- Datatable -->
    <script src="../focus2/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../focus2/js/plugins-init/datatables.init.js"></script>
    
</body>

</html>