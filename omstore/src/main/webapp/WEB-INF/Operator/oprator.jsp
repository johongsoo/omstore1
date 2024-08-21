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
<title>Insert title here</title>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .sidebar {
            width: 250px;
            background-color: #f8f8f8;
            padding: 20px;
            position: fixed;
            height: 100%;
            overflow: auto;
            transition: width 0.3s;
            display: flex;
            flex-direction: column;
        }
        .sidebar.collapsed {
            width: 60px;
        }
        .sidebar-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .sidebar h2 {
            font-size: 24px;
            margin: 0;
        }
        .sidebar.collapsed h2 {
            display: none;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
            flex-grow: 1;
        }
        .sidebar ul li {
            padding: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        .sidebar ul li:hover {
            background-color: #ddd;
        }
        .sidebar .submenu {
            display: none;
            padding-left: 20px;
        }
        .sidebar ul li .material-icons {
            margin-right: 10px;
        }
        .sidebar.collapsed ul li .text {
            display: none;
        }
        .toggle-btn {
            cursor: pointer;
            background-color: #333;
            color: #fff;
            padding: 10px;
            border-radius: 5px;
        }
        .main-content {
            margin-left: 270px;
            padding: 20px;
            transition: margin-left 0.3s;
        }
        .sidebar.collapsed ~ .main-content {
            margin-left: 80px;
        }
        .material-icons{
        	color:gray;
        }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://unpkg.com/vue" type="text/javascript"></script>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
        $('.menu-item').click(function() {
            $(this).children('.submenu').slideToggle();
        });

        $('.toggle-btn').click(function() {
            $('.sidebar').toggleClass('collapsed');
            $('.main-content').toggleClass('expanded');
        });
	});
</script>
</head>

<body>
<div>
     <div class="sidebar">
        <div class="sidebar-header">
            <h2>ghdtn</h2>
            <div class="toggle-btn">☰</div>
        </div>
        <ul>
            <li><i class="material-icons">home</i><span class="text">홈</span></li>
            <li class="menu-item"><i class="material-icons">shopping_cart</i>
            <span class="text">주문 관리</span>
                <ul class="submenu">
                    <li>결제 대기 중 (0)</li>
                    <li>주문 확인 중 (0)</li>
                    <li>배송 처리 (0)</li>
                    <li>배송 완료 (0)</li>
                    <li>취소 처리 (0)</li>
                    <li>반품 처리 (0)</li>
                    <li>교환 처리 (0)</li>
                    <li>완료된 주문 (0)</li>
                </ul>
            </li>
            <li class="menu-item"><i class="material-icons">inventory</i><span class="text">상품 관리</span></li>
            <li class="menu-item"><i class="material-icons">people</i><span class="text">고객 관리</span></li>
            <li class="menu-item"><i class="material-icons">rate_review</i><span class="text">리뷰/문의 관리</span></li>
            <li class="menu-item"><i class="material-icons">local_offer</i><span class="text">할인 관리</span></li>
            <li class="menu-item"><i class="material-icons">campaign</i><span class="text">마케팅</span></li>
            <li class="menu-item"><i class="material-icons">settings</i><span class="text">스토어 설정</span></li>
            <li class="menu-item"><i class="material-icons">web</i><span class="text">채널 관리</span>
                <ul class="submenu">
                    <li>웹사이트</li>
                    <li>마켓 통합 관리</li>
                    <li>채널 모두 보기</li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <!-- Main content goes here -->
    </div>
</div>
</body>
</html>