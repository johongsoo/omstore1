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
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form id="registration-form" method="post" action="registerUser">
                        	<input type="hidden" id="verification-status" value=""/>
                            <div class="text-center">
                                <img src="path/to/logo.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">회원가입</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="title input-group mt-5">
                                    <input type="text" class="form-control" name="userid" id="id" placeholder="아이디를 입력해주세요">
                                    <label id="label1"></label>
                                </div>
                                <p id="id-message" class="error-message">이미 사용 중인 아이디입니다.</p>
                                <div class="input-group">
                                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="check-password">
                                    <div class="input-group">
                                        <input type="password" id="password" name="pwd" class="form-control" placeholder="비밀번호를 입력해주세요">
                                        <span class="md-line"></span>
                                    </div>
                                    <div class="pwd input-group">
                                        <input type="password" id="confirm-password" class="form-control" placeholder="비밀번호를 입력해주세요" style="margin-bottom:0; padding-bottom:0;">
                                        <span class="md-line"></span>
                                        <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" id="check-password">확 인</button>
                                    </div>
                                    <label id="password-message" class="error-message">비밀번호가 일치하지 않습니다.</label>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="birthdate" class="form-control" placeholder="생일을 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="phone" class="form-control" placeholder="핸드폰번호를 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="email input-group">
                                    <input id="firstemail" type="email" name="email" class="form-control" placeholder="이메일을 입력해주세요">
                                    <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" id="email-check" style="margin-bottom:0; padding-bottom:0;">인증번호 받기</button>
                                    <span class="md-line"></span>
                                </div>
                                <div class="emailcheck input-group">
                                    <input id="lastemail" type="text" class="form-control" placeholder="인증번호를 입력해주세요" style="margin-bottom:0; padding-bottom:0;">
                                    <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" id="verify-code" style="margin-bottom:0; padding-bottom:0;">인증번호 확인</button>
                                    <span class="md-line"></span>
                                </div>
                                <div class="ads input-group">
                                    <input id="sample6_postcode" type="text" name="address" class="form-control" placeholder="우편 번호" readonly>
                                    <button type="button" class="btn btn-primary btn-md waves-effect m-b-20" onclick="sample6_execDaumPostcode()">주소 검색</button>
                                    <span class="md-line"></span>
                                </div>
                                <div class="adre input-group">
                                    <input id="address" type="text" name="address1" class="form-control" placeholder="주소를 입력해주세요">
                                    <input id="sample6_detailAddress" name="address2" type="text" class="form-control" placeholder="상세주소를 입력해주세요">
                                    <input id="sample6_extraAddress" type="hidden" class="form-control" placeholder="참고항목" readonly>
                                </div>
                                <div class="input-group">
                                    <input type="hidden" class="form-control" name="point" value="0" placeholder="포인트 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="hidden" class="form-control" name="rating" value="일반회원" placeholder="등급 입력해주세요">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">회원 등록</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr/>
                        <div class="row">
                            <div class="col-md-10">
                                <p class="text-inverse text-left"><b>저희 사이트를 찾아주셔서 감사합니다</b></p>
                            </div>
                            <div class="col-md-2">
                                <img src="path/to/small-logo.png" alt="small-logo.png">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        // ID 중복 확인
$("#id").on("focusout", function() {
    var userid = $("#id").val();

    if (userid === '' || userid.length === 0) {
        $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
        return false;
    }
    $("#label1").text("");

    $.ajax({
        url: '/ConfirmId', // 서버의 실제 URL 경로 확인
        type: 'POST',
        data: { userid: userid }, // 데이터 전송 형식
        success: function(result) {
            if (result === true) {
                $("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
            } else {
                $("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
                $("#id").val('');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX 요청 중 오류 발생:", status, error);
            console.error("응답 본문:", xhr.responseText);
        }
    });
});
        

// 비밀번호 확인
$('#check-password').on('click', function() {
    var password = $('#password').val();
    var confirmPassword = $('#confirm-password').val();
    var message = $('#password-message');

    if (password === confirmPassword) {
        message.hide();
        alert('비밀번호가 일치합니다.');
    } else {
        message.show();
    }
});
//이메일 인증 코드 발송
$("#email-check").on("click", function() {
    var email = $("#firstemail").val();

    if (!validateEmail(email)) {
        alert("유효한 이메일 주소를 입력해주세요.");
        return false;
    }

    $.ajax({
        url: '/sendVerificationEmail',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ email: email }), // JSON 형식으로 데이터 전송
        success: function(result) {
            alert(result); // 인증 코드 발송 성공 메시지
        },
        error: function(xhr, status, error) {
            alert("이메일 발송 실패");
            console.error("AJAX 요청 중 오류 발생:", status, error);
            console.error("응답 본문:", xhr.responseText);
        }
    });
});

// 인증번호 확인 버튼 클릭 시
$("#verify-code").on("click", function() {
    var email = $("#firstemail").val(); // 인증을 위한 이메일 주소
    var code = $("#lastemail").val();

    if (!validateEmail(email)) {
        alert("유효한 이메일 주소를 입력해 주세요.");
        return false;
    }

    if (!code) {
        alert("인증번호를 입력해 주세요.");
        return false;
    }

    $.ajax({
        url: '/verifyEmailCode',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ email: email, code: code }), // JSON 형식으로 데이터 전송
        success: function(result) {
            alert(result); // 인증 성공 메시지
            console.log(result==='인증 코드가 확인되었습니다.')
            if(result==='인증 코드가 확인되었습니다.')
            	$("#verification-status").val("verified"); // 상태 저장 (여기서 상태 저장 방식을 선택하세요)
        },
        error: function(xhr, status, error) {
            alert("인증 실패: " + xhr.responseText);
            console.error("AJAX 요청 중 오류 발생:", status, error);
            console.error("응답 본문:", xhr.responseText);
        }
    });
});

// 이메일 주소 유효성 검사 함수
function validateEmail(email) {
    var re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return re.test(email);
}

// 폼 제출
$('#registration-form').on('submit', function(event) {
    event.preventDefault(); // 폼의 기본 제출 동작 방지

    // 이메일 인증 확인
    if (!checkVerification()) {
        return false;
    }

    // 폼 제출 시 로딩 표시
    var submitButton = $(this).find('button[type="submit"]');
    submitButton.prop('disabled', true).text('등록 중...'); // 버튼을 비활성화하고 텍스트 변경

    var formData = $(this).serializeArray(); // 폼 데이터를 직렬화
    var jsonData = {}; // JSON 객체 생성

    $.each(formData, function(index, field) {
        jsonData[field.name] = field.value;
    });

    console.log("Serialized form data:", JSON.stringify(jsonData)); // JSON 데이터 확인

    $.ajax({
        url: '/registerUser',
        type: 'POST',
        contentType: 'application/json', // JSON 형식으로 데이터 전송
        data: JSON.stringify(jsonData), // JSON 데이터 전송
        success: function(response) {
            alert(response);
            window.location.href = '/loginPage'; // 회원가입 성공 후 로그인 페이지로 이동
        },
        error: function(xhr, status, error) {
            alert('회원가입 실패: ' + xhr.responseText); // 서버에서 전달된 에러 메시지 출력
            console.error("AJAX 요청 중 오류 발생:", status, error);
            console.error("응답 본문:", xhr.responseText);
        },
        complete: function() {
            submitButton.prop('disabled', false).text('회원 등록'); // 버튼을 다시 활성화하고 원래 텍스트로 변경
        }
    });
});

// 이메일 인증 여부 확인
function checkVerification() {
    var status = $("#verification-status").val(); // 이메일 인증 상태
    //alert(status)
    if (status !== "verified") {
        alert("이메일 인증을 완료해주세요.");
        return false;
    }
    return true;
}
    });

    // Daum 우편번호 검색
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("address").value = addr; // Update address field
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    </script>
</body>
</html>