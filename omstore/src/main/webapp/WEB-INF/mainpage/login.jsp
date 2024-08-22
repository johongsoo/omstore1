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
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<!-- ========================================================================================= -->

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
    <link rel="icon" href="${path}/assets/images/favicon.ico" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/icon/icofont/css/icofont.css">
    <link rel="stylesheet" type="text/css" href="${path}/assets/css/style.css">
<!-- ========================================================================================= -->
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="stylesheet" href="${path}/css/login.css">
<style>

</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
    var msg = "${msg}";

    if(msg && msg !== "") { 
        alert(msg);
        if(msg === "로그인 성공"){
            // Redirect to MainPage
            window.location.href = "${path}/MainPage"; 
        }
    }
});
</script>
</head>
<body class="fix-menu">
    <!-- Pre-loader start -->
    <div class="theme-loader">
    <div class="ball-scale">
        <div class='contain'>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
            <div class="ring"><div class="frame"></div></div>
        </div>
    </div>
</div>
    <!-- Pre-loader end -->

    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                            <div class="text-center" >
                                <img src="${path }/image/logoimg.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
								    <div class="row m-b-20">
								        <div class="col-md-12">
								            <h3 class="text-left txt-primary">Login</h3>
								        </div>
								    </div>
								    <hr/>
								<form method="post" action="loginPage">
								    <div class="input-group">
								        <input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userid" required>
								        <span class="md-line"></span>
								    </div>
								    <div class="input-group">
								        <input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="pwd" required>
								        <span class="md-line"></span>
								    </div>
								    <div class="row m-t-25 text-left">
								        <div class="col-sm-7 col-xs-12">
								            <div class="checkbox-fade fade-in-primary">
											    <label>
											        <input type="checkbox" name="rememberMe">
											        <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
											        <span class="text-inverse">아이디 저장</span>
											    </label>
											</div>
								        </div>
								        <div class="col-sm-5 col-xs-12 forgot-phone text-right">
								            <a href="auth-reset-password.html" class="text-right f-w-600 text-inverse"> 아이디/비밀번호 찾기</a>
								        </div>
								    </div>
								    <div class="row m-t-30">
								        <div class="col-md-12">
								            <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">
								            로그인</button>
								        </div>
								    </div>
								</form>
                                <hr/>
                                <div class="row">
                                    <div id="rowtext">
                                        <p class="text-inverse text-left m-b-0"><a href="register" style="text-decoration:none; color:black;">회원가입</a></p>
                                        <p class="text-inverse text-left"><b>저희 사이트를 찾아주셔서 감사합니다</b></p>
                                    </div>
                                    <div class="">
                                        <img src="${path}/image/logoimg.png" id="logo"  alt="small-logo.png">
                                    </div>
                      			 </div>
                           </div>
                    </div>
                    
                    <!-- Authentication card end -->
              		
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    <!-- Warning Section Starts -->
    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
    <!-- Warning Section Ends -->
    <!-- Required Jquery -->
    <script type="text/javascript" src="${path}/assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${path}/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="${path}/assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="${path}/assets/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="${path}/assets/js/common-pages.js"></script>
    
<script type="text/javascript">
$(document).ready(function() {
    
    var storedUserId = getCookie("rememberedUserId");
    if (storedUserId) {
        $("input[name='userid']").val(storedUserId);
        $("input[type='checkbox'][name='rememberMe']").prop('checked', true);
    }
    $("form").on("submit", function() {
        var rememberMe = $("input[type='checkbox'][name='rememberMe']").is(":checked");
        var userId = $("input[name='userid']").val();

        if (rememberMe) {
            setCookie("rememberedUserId", userId, 7); 
        } else {
            deleteCookie("rememberedUserId"); 
        }
    });

    function setCookie(name, value, days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }

    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    function deleteCookie(name) {
        document.cookie = name + "=; Max-Age=-99999999;";
    }
});
</script>
    
</body>
</html>