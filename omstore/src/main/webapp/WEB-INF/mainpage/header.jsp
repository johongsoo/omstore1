<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    import="backweb.a04_database.*" 
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Title Here</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="${path}/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${path}/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="${path}/fonts/linearicons-v1.0.0/icon-font.min.css">
<link rel="stylesheet" href="${path}/vendor/animate/animate.css">
<link rel="stylesheet" href="${path}/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" href="${path}/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" href="${path}/vendor/select2/select2.min.css">
<link rel="stylesheet" href="${path}/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="${path}/vendor/slick/slick.css">
<link rel="stylesheet" href="${path}/vendor/MagnificPopup/magnific-popup.css">
<link rel="stylesheet" href="${path}/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${path}/css/util.css">
<link rel="stylesheet" href="${path}/css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">

<!-- Scripts -->
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        var msg = "${msg}";
        if(msg != "") { 
            alert(msg);
        }
    });
</script>
</head>

<body class="animsition">
    <header class="header-v4">
        <div class="container-menu-desktop">
            <!-- Topbar -->
            <div class="top-bar">
                <div class="content-topbar flex-sb-m h-full container">
                    <div class="left-top-bar">
                        20,000원 이상 구매 시 무료배송.
                    </div>

                    <div class="right-top-bar flex-w h-full">
						<c:choose>
						  <c:when test="${not empty sessionScope.users}">
						      <a class="flex-c-m trans-04 p-lr-25" style="color:#ABABAB">
						      어서오세요, ${sessionScope.users.userid} 님!</a>
						      <a href="${path}/logout" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						      <c:if test="${sessionScope.users.rating == '관리자'}">
						          <a href="${path}/adminDashboard" class="flex-c-m trans-04 p-lr-25">관리자 대시보드</a>
						      </c:if>
						      <c:if test="${sessionScope.users.rating == '일반회원'}">
						          <a href="${path}/mypage" class="flex-c-m trans-04 p-lr-25">마이 페이지</a>
						      </c:if>
						  </c:when>
						  <c:otherwise>
						      <a href="${path}/loginPage" class="flex-c-m trans-04 p-lr-25">로그인</a>
						      <a href="${path}/register" class="flex-c-m trans-04 p-lr-25">회원가입</a>
						  </c:otherwise>
						</c:choose>
                        <a href="cart" class="flex-c-m trans-04 p-lr-25">장바구니</a>
                        <a href="#" class="flex-c-m trans-04 p-lr-25">고객센터</a>
                    </div>
                </div>
            </div>

            <div class="wrap-menu-desktop how-shadow1">
                <nav class="limiter-menu-desktop container">
                    <a href="MainPage" class="logo">
                        <img src="${path}/image/logoimg.jpg" class="logoimg" alt="IMG-LOGO">
                    </a>
                    <div class="menu-desktop">
                        <ul class="main-menu">
                            <li><a href="${path}/MainPage">Home</a></li>
                            <li><a href="${path}/odunglist">오둥스토어</a></li>
                            <li><a href="${path}/mangbunglist">망붕스토어</a></li>
                            <li class="label1" data-label1="hot"><a href="${path}/ranklist">랭킹</a></li>
                            <li><a href="${path}/blog.html">게시판</a></li>
                            <li><a href="${path}/about.html">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="wrap-icon-header flex-w flex-r-m">
                        <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                            <i class="zmdi zmdi-search"></i>
                        </div>
                        <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
                            <i class="zmdi zmdi-shopping-cart"></i>
                        </div>
                        <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                            <i class="zmdi zmdi-favorite-outline"></i>
                        </a>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Mobile Header -->
        <div class="wrap-header-mobile">
            <div class="logo-mobile">
                <a href="${path}/"><img src="${path}/image/logoimg.jpg" alt="IMG-LOGO"></a>
            </div>
            <div class="wrap-icon-header flex-w flex-r-m m-r-15">
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
                    <i class="zmdi zmdi-search"></i>
                </div>
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
                    <i class="zmdi zmdi-shopping-cart"></i>
                </div>
                <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
                    <i class="zmdi zmdi-favorite-outline"></i>
                </a>
            </div>
            <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div class="menu-mobile">
            <ul class="topbar-mobile">
                <li>
                    <div class="left-top-bar">Free shipping for standard order over $100</div>
                </li>
                <li>
                    <div class="right-top-bar flex-w h-full">
                        <a href="#" class="flex-c-m p-lr-10 trans-04">Help & FAQs</a>
                        <a href="#" class="flex-c-m p-lr-10 trans-04">My Account</a>
                        <a href="#" class="flex-c-m p-lr-10 trans-04">EN</a>
                        <a href="#" class="flex-c-m p-lr-10 trans-04">USD</a>
                    </div>
                </li>
            </ul>
            <ul class="main-menu-m">
                <li><a href="${path}/index.html">Home</a>
                    <ul class="sub-menu-m">
                        <li><a href="${path}/index.html">Homepage 1</a></li>
                        <li><a href="${path}/home-02.html">Homepage 2</a></li>
                        <li><a href="${path}/home-03.html">Homepage 3</a></li>
                    </ul>
                    <span class="arrow-main-menu-m"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
                </li>
                <li><a href="${path}/product.html">Shop</a></li>
                <li><a href="${path}/shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a></li>
                <li><a href="${path}/blog.html">Blog</a></li>
                <li><a href="${path}/about.html">About</a></li>
                <li><a href="${path}/contact.html">Contact</a></li>
            </ul>
        </div>

        <!-- Modal Search -->
        <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
            <div class="container-search-header">
                <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                    <img src="${path}/images/icons/icon-close2.png" alt="CLOSE">
                </button>
                <form class="wrap-search-header flex-w p-l-15">
                    <button class="flex-c-m trans-04"><i class="zmdi zmdi-search"></i></button>
                    <input class="plh3" type="text" name="search" placeholder="Search...">
                </form>
            </div>
        </div>
    </header>

    <!-- Main content can go here -->

    <!-- JavaScript Libraries -->
    <script src="${path}/vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="${path}/vendor/animsition/js/animsition.min.js"></script>
    <script src="${path}/vendor/bootstrap/js/popper.js"></script>
    <script src="${path}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${path}/vendor/select2/select2.min.js"></script>
    <script src="${path}/vendor/daterangepicker/moment.min.js"></script>
    <script src="${path}/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="${path}/vendor/slick/slick.min.js"></script>
    <script src="${path}/js/slick-custom.js"></script>
    <script src="${path}/vendor/parallax100/parallax100.js"></script>
    <script src="${path}/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
    <script src="${path}/vendor/isotope/isotope.pkgd.min.js"></script>
    <script src="${path}/vendor/sweetalert/sweetalert.min.js"></script>
    <script src="${path}/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${path}/js/main.js"></script>
    <script>
document.querySelector('.js-addcart-detail').addEventListener('click', function() {
    var productName = document.querySelector('.js-name-detail').innerText;
    var productPrice = document.querySelector('.mtext-106').innerText;
    var productQuantity = document.querySelector('input[name="num-product"]').value;
    var userId = document.getElementById('userid').value;

    // Prepare the data to send
    var data = {
        name: productName,
        price: productPrice,
        quantity: productQuantity,
        userid: userId
    };

    // Send an AJAX request to the server
    fetch('/add-to-cart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        if(data.success) {
            alert('Product added to cart successfully!');
        } else {
            alert('Failed to add product to cart.');
        }
    })
    .catch((error) => {
        console.error('Error:', error);
    });
});
</script>
</body>
</html>
