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
    
    	<!-- Cart -->
<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">
                장바구니
            </span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>
        
        <div class="header-cart-content flex-w js-pscroll">
            <c:forEach var="cart" items="${cartItems2}">
                <ul class="header-cart-wrapitem w-full">
                    <li class="header-cart-item flex-w flex-t m-b-12">
                        <div class="header-cart-item-img">
                            <img src="${cart.product_img}" alt="IMG">
                        </div>

                        <div class="header-cart-item-txt p-t-8">
                            <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                                ${cart.product_name}
                            </a>

                            <span class="header-cart-item-info">
                                ${cart.quantity} X ${cart.product_price} 원
                            </span>
                        </div>
                    </li>
                </ul>
            </c:forEach>
            <!-- 총 금액 계산 -->
            <c:set var="totalAmount" value="0" scope="page"/>
            <c:forEach var="cart" items="${cartItems}">
                <c:set var="totalAmount" value="${totalAmount + (cart.product_price * cart.quantity)}" scope="page"/>
            </c:forEach>

            <div class="w-full">
                <div class="header-cart-total w-full p-tb-40">
                    총 금액: ${totalAmount} 원
                </div>

                <div class="header-cart-buttons flex-w w-full">
                    <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        구 매
                    </a>

                    <a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                        장바구니 이동
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

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
<script>
document.addEventListener('DOMContentLoaded', function() {
    // 모든 수량 입력 요소와 버튼 요소를 선택합니다.
    const quantityInputs = document.querySelectorAll('input.num-product');
    const increaseButtons = document.querySelectorAll('.btn-num-product-up');
    const decreaseButtons = document.querySelectorAll('.btn-num-product-down');

    // 수량 변경 시 총 금액 업데이트
    function updateTotalPrice(input) {
        const price = parseFloat(input.dataset.price);
        let quantity = parseInt(input.value, 10);

        // 수량이 유효한지 확인하고 최소값 1로 설정
        if (isNaN(quantity) || quantity < 1) {
            quantity = 1;
        }

        // 총 금액 계산
        const totalPriceElement = input.closest('tr').querySelector('.total-price');
        const totalPrice = price * quantity;
        totalPriceElement.textContent = totalPrice.toLocaleString() + '원';

        // 입력 필드의 값을 업데이트
        input.value = quantity;
    }

    // 페이지 로딩 시 초기 값으로 총 금액 업데이트
    quantityInputs.forEach(input => {
        updateTotalPrice(input);

        // 입력 필드 값이 변경될 때
        input.addEventListener('change', function() {
            updateTotalPrice(this);
        });
    });

    // 증가 버튼 클릭 시 수량 증가
    increaseButtons.forEach(button => {
        button.addEventListener('click', function() {
            const input = this.closest('.wrap-num-product').querySelector('input.num-product');
            let quantity = parseInt(input.value, 10);
            if (!isNaN(quantity)) {
                input.value = quantity; // 수량을 1 증가
                updateTotalPrice(input); // 총 금액을 업데이트
            }
        });
    });

    // 감소 버튼 클릭 시 수량 감소
    decreaseButtons.forEach(button => {
        button.addEventListener('click', function() {
            const input = this.closest('.wrap-num-product').querySelector('input.num-product');
            let quantity = parseInt(input.value, 10);
            if (!isNaN(quantity) && quantity > 1) {
                input.value = quantity; // 수량을 1 감소
                updateTotalPrice(input); // 총 금액을 업데이트
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // 체크박스와 수량 입력 필드, 총계를 표시할 요소를 선택합니다.
    const checkboxes = document.querySelectorAll('.cart-checkbox');
    const quantityInputs = document.querySelectorAll('input.num-product');
    const totalAmountElement = document.getElementById('totalAmount');
    

    // 총계를 업데이트하는 함수
    function updateTotalAmount() {
        let total = 0;

        // 체크된 항목의 가격을 모두 더합니다.
        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                const row = checkbox.closest('tr');
                const totalPriceElement = row.querySelector('.total-price');
                const totalPrice = parseFloat(totalPriceElement.textContent.replace('원', '').replace(/,/g, ''));
                total += totalPrice;
            }
        });

        // 총계를 표시합니다.
        totalAmountElement.textContent = total.toLocaleString() + '원';
    }

    // 수량 입력 필드 변경 시 총계를 업데이트하는 함수
    function updatePriceOnQuantityChange() {
        quantityInputs.forEach(input => {
            input.addEventListener('change', function() {
                const price = parseFloat(this.dataset.price);
                let quantity = parseInt(this.value, 10);

                // 유효한 수량으로 총계를 업데이트합니다.
                if (!isNaN(quantity) && quantity > 0) {
                    const totalPriceElement = this.closest('tr').querySelector('.total-price');
                    totalPriceElement.textContent = (price * quantity).toLocaleString() + '원';
                    updateTotalAmount();  // 수량 변경 후 총계를 업데이트
                }
            });
        });
    }

    // 체크박스 상태가 변경될 때 총계를 업데이트합니다.
    function addCheckboxChangeListener() {
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', updateTotalAmount);
        });
    }

    // 페이지 로딩 시 초기 총계를 업데이트합니다.
    updateTotalAmount();

    // 수량 입력 필드의 이벤트 리스너 설정
    updatePriceOnQuantityChange();

    // 체크박스 상태 변경 리스너 추가
    addCheckboxChangeListener();
});

</script>
</body>
</html>
