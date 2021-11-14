<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
    <meta charset="UTF-8">
    <title>聚點時刻 管理員端-一般會員管理系統</title>
    <!-- Favicon icon -->
    <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon.png">
    <link rel="stylesheet" type="text/css" href="<c:url value='/focus2/css/style.css'/>" >
    <!-- Datatable -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/jquery.dataTables.min.css'/>" >
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css'/>" >
    
    <!-- 引用Bootstrap CDN的CSS樣式 -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
    <!-- ========================================================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
    <script src="<c:url value='/js/jquery.dataTables.min.js' />"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('tbody').on('click', '.delete', function() { //刪除
                $(this).closest('tr').remove();
                var userId = $(this).closest('tr').children().eq(0).text();
                console.log(userId);
                $.ajax({
                    async: true,
                    url: './ajaxdeleteuser/' + userId,
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
                    url: './ajaxlistuser',
                    type: "get",
                    success: function(data) {
                        // 				$("#result").html(data);
                        console.log("Done");
                        console.log(data);
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
            <a href="index.html" class="brand-logo"> <img class="logo-abbr" src="../../images/logo.png" alt=""> <img class="logo-compact" src="/images/logo-text.png" alt=""> <img class="brand-title" src="../../images/logo-text.png" alt="">
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
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
<!--                             <h4>親愛的管理員，歡迎回到管理後台</h4> -->
<%--                             <span class="ml-1">${admin.fullname} | ${admin.email}</span> --%>
                        
                        	<c:if test="${seller != null}">
	                            <h4>管理員 ${admin.fullname}</h4>
	                            <span class="ml-1">正在<b>修改</b>商家會員資料...</span>
		            			
		            		</c:if>
							<c:if test="${seller == null}">
	                            <h4>管理員 ${admin.fullname}</h4>
	                            <span class="ml-1">正在<b>新增</b>商家會員資料...</span>
		            		</c:if>
                        
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        <ol class="breadcrumb">
                            <!-- <li class="breadcrumb-item"><a href="javascript:void(0)">Table</a></li> -->
                            <li class="breadcrumb-item"><a href="javascript:void(0)">管理用戶</a></li>
                            <!-- <li class="breadcrumb-item active"><a href="javascript:void(0)">Datatable</a></li> -->
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">商家用戶</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">商家會員資料</h4>
                            </div>
                            <div class="card-body" style="padding: 20px 50px 20px 50px;">
<!--                                
				<!-- c:if tag判斷seller是否存在，決定顯示選項為insert或update -->
				<c:if test="${seller != null}">
<!-- 					<form action=".\SellerAll?action=updateseller" method="post" > -->
<!-- 					<form action="..\..\SellerAll\updateseller" method="get" > -->
<!-- 					<form action="..\..\SellerAll\ajaxupdateseller" method="post" onsubmit="return confirm('請確認是否變更賣家用戶資料');"> -->
					<form action="..\ajaxupdateseller" method="post" onsubmit="return confirm('請確認是否變更賣家用戶資料');">
					<input type="hidden" name="_method" value="put" />					
				</c:if>
				<c:if test="${seller == null}">
<!-- 					<form action=".\SellerAll?action=insertseller" method="post" > -->
<!-- 					<form action="..\SellerAll\insertseller" method="get" > -->
<!-- 					<form action="..\SellerAll\ajaxinsertseller" method="post" onsubmit="return confirm('請確認是否新增賣家用戶資料');"> -->
					<form action=".\ajaxinsertseller" method="post" onsubmit="return confirm('請確認是否新增賣家用戶資料');">
				</c:if>
				<!-- c:if tag判斷seller是否存在，決定顯示選項為edit或add -->
				<caption>
					<h2>
					<c:if test="${seller != null}">
            			修改商家會員資料
            		</c:if>
					<c:if test="${seller == null}">
            			新增商家會員資料
            		</c:if>
					</h2>
				</caption>
				<!-- seller存在時，印出user id -->
				<c:if test="${seller != null}">
					<input type="hidden" name="id" value="<c:out value='${seller.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>帳號</label> <input type="text"
						value="<c:out value='${seller.username}' />" class="form-control"
						name="username" maxlength="20" required="required" autofocus >
				</fieldset>

				<fieldset class="form-group">
					<label>密碼</label> <input type="password"
						value="<c:out value='${seller.password}' />" class="form-control"
						name="password" required maxlength="20" autocomplete="off">
				</fieldset>

				<fieldset class="form-group">
					<label>姓名</label> <input type="text"
						value="<c:out value='${seller.fullname}' />" class="form-control"
						name="fullname" placeholder="李小龍" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>出生年月日</label> <input type="date"
						value="<c:out value='${seller.dob}' />" id="datefield" class="form-control"
						name="dob" min="1900-01-01" max="2050-12-31" maxlength="10">
				</fieldset>

				<fieldset class="form-group">
					<label>性別</label> <input type="text"
						value="<c:out value='${seller.gender}' />" class="form-control"
						name="gender" maxlength="1">
				</fieldset>

				<fieldset class="form-group">
					<label>email</label> <input type="email"
						value="<c:out value='${seller.email}' />" class="form-control"
						name="email" maxlength="20" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>手機號碼</label> <input type="tel"
						value="<c:out value='${seller.phoneNumber}' />" class="form-control"
						name="phoneNumber" placeholder="0988888888" pattern="[0]{1}[9]{1}[0-9]{8}" required="required" maxlength="10">
				</fieldset>

				<fieldset class="form-group">
					<label>公司電話</label> <input type="text"
						value="<c:out value='${seller.telephoneNumber}' />" class="form-control"
						name="telephoneNumber" placeholder="0288888888" maxlength="10">
				</fieldset>

				<fieldset class="form-group">
					<label>分機號碼</label> <input type="text"
						value="<c:out value='${seller.extensionNumber}' />" class="form-control"
						name="extensionNumber" placeholder="#1234" pattern="[#]{1}[0-9]{4}" maxlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>公司名稱</label> <input type="text"
						value="<c:out value='${seller.companyName}' />" class="form-control"
						name="companyName" maxlength="20" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>公司地址</label> <input type="text"
						value="<c:out value='${seller.companyAddress}' />" class="form-control"
						name="companyAddress" maxlength="50" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>營業登記證明</label> 
<!-- 					<input type="text" -->
<%-- 						value="<c:out value='${seller.memberImage}' />" class="form-control" --%>
<!-- 						name="businessCert1" readonly> -->
						
<!-- 						<input type="file" name="businessCert" accept=".pdf" > -->
<!--                 		<br> -->
<!--                 		<span style="margin: 20px; text-decoration: underline;"><b>(PDF格式)</b></span> -->
						<div style="text-align: center; ">
		                <img height='200px' width='400px' style="object-fit: cover;"
	                            src="
	                    <c:if test="${!empty seller.id}">
	                            <c:url value='/getMemberImage?username=${seller.username}'/>
	                    </c:if>">
		                </div>
		            </div>
		            <div class="st1" style="text-align: center;">
		                <input type="file" name="file1" accept="image/*" name="memberMultipartFile" id="file" onchange="loadFile(event)" >
		                <br>
		                <span style="margin: 20px; text-decoration: underline;"><b>(任何圖片格式)</b></span>
		            </div>
				</fieldset>

				<button type="submit" class="btn btn-success">儲存變更</button>
				<!-- <input type="reset"> -->
				</form>



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
    <script src="<c:url value='/focus2/vendor/global/global.min.js' />"></script>
    <script src="<c:url value='/focus2/js/quixnav-init.js' />"></script>
    <script src="<c:url value='/focus2/js/custom.min.js' />"></script>
	<script>
// 		$(document).ready( function () {
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
		
		//========================================================================
		
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
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear()-18;
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		maxDate = yyyy+'-'+mm+'-'+dd;
		document.getElementById("datefield").setAttribute("max", maxDate);

		// minDate計算生日對應年紀為18歲以上
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear()-100;
		 if(dd<10){
		        dd='0'+dd
		    } 
		    if(mm<10){
		        mm='0'+mm
		    } 

		minDate = yyyy+'-'+mm+'-'+dd;
		document.getElementById("datefield").setAttribute("min", minDate);
	</script>

    <!-- Datatable -->
    <script src="<c:url value='/focus2/vendor/datatables/js/jquery.dataTables.min.js' />"></script>
    <script src="<c:url value='/focus2/js/plugins-init/datatables.init.js' />"></script>
</body>

</html>