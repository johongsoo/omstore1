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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .top-navbar{
        	display: flex;
            justify-content: right;
            background-color: #ffffff;
            padding: 10px 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-bottom : 1px solid black;
        }
        .middle-navbar{
        	display: flex;
        	background-color:orange;
        	padding: 10px 20px;
        	box-shadow: 0 2px 4px rgba(0,0,0,0,1);
            border-top: 1px solid black;
            border-bottom : 1px solid black;
        }
        
        .top-navbar a,
        .middle-navbar a {
            color: #333;
            text-decoration: none;
            padding: 10px;
            font-size: 14px;
        }
        .top-navbar a:hover,
        .middle-navbar a:hover {
        	background-color:gray;
            color: #ff6347;
         }
                 .top {
         height : 15vh;

        }
        
        .header{
       	    height: 100%;
        	display:flex;
        	justify-content: space-between;
        	align-items: center;
        }
        .logo {
        border:1px solid black;
            display: flex;
            align-items: center;
            margin-left: 120px;
            
        }
        .logo img {
            height: 40px;
            margin-right: 10px;
        }
        .logo span {
            font-size: 18px;
            font-weight: bold;
        }
        .search-bar {
            flex-grow: 1;
            width : 40%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-bar input {
            width: 30%;
            padding: 10px;
            border-radius: 25px 0 0 25px;
            outline: none;
            border : 1px solid orange;
            border-right: none;
        }
        .search-bar img {
            padding: 10px 20px;
            border: 1px solid orange;
            border-left: none;
            border-radius: 0 25px 25px 0;
            background-color: #fff;
            cursor: pointer;
        }

        .icons {
            display: flex;
            align-items: center;
            margin-right: 100px;
        }
        .icons img {
            width: 24px;
            height: 24px;
            margin-left: 20px;
            cursor: pointer;
        }
        .tab > div,ul,li{
        		margin:0;
        		padding:0;
        }
        .tab > ul,li{
        	list-style:none;
        }
        
        .tab {
        	margin : 70px;
        	margin-left : 200px;
        	float:left; 
        	width:1000px; 
        	hight: 70vh;
        }
        
        .tabnav{
        	font-size:20px;
        	width:600px; 
            border:1px solid #ddd;
         }
         
		.tabnav li{
			display: inline-block;  
			height:46px; text-align:center; 
			border-right:1px solid #ddd;
		}
		
		.tabnav li a:before{
			content:""; 
			position:absolute; 
			left:0; top:0px; 
			width:100%; 
			height:3px; 
		}
		.tabnav li a.active:before{
			background:#7ea21e;
		}
		.tabnav li a.active{
			border-bottom:1px solid #fff;
		}
		.tabnav li a{ 
			position:relative; 
			display:block; 
			background: #f8f8f8; 
			color: #000; 
			padding:0 30px; 
			line-height:46px; 
			text-decoration:none; 
			font-size:16px;
		}
		.tabnav li a:hover,
		.tabnav li a.active{
			background:#fff; 
			color:#FFA500; 
		}
		.tabcontent{
			padding: 20px; 
			height:100%; 
			border:1px solid #ddd;
			border-top:none;
	    }
	    
	    .tabcontent > #tab01 > .anncmnt{
	    	width : 100%;
	    	height : 100%;
	    }
	    .tabcontent > #tab02 > .anncmnt{
	    	width : 100%;
	    	height : 100%;
	    }
	    .tabcontent > #tab03 > .anncmnt{
	    	width : 100%;
	    	height : 100%;
	    }
	    .tabcontent > #tab04 > .anncmnt{
	    	width : 100%;
	    	height : 100%;
	    }
	    #tabcategori{
	    	margin : 50px;
	    	padding : 20px;
	    }
	    
	    .anncmrt > h2{
	    	color:black;
	    	font-size:50px;
	    }
	    
	    .tab > hr {
	    	margin-top:10px;
	    	margin-bottom:10px;
	    }
	    
	    .board{
	    	width : 90%;
	    	margin-left:50px;
	    	margin-right:50px; 
	    }
	    
	    .boardlist{
	    	display:flex;
	    	border:1px solid black;
	    	padding:15px;
	    }
	    .board >first:child{
	    	padding:5px;
	    }
	    
	    .boardlist #no{
	    	width:5%
	    }
	    .boardlist #title{
	    	width:39%
	    }
	    .boardlist #user{
	    	width:10%
	    }
	    .boardlist #registration{
	    	width:20%
	    }
	    .boardlist #correction{
	    	width:20%
	    }
	    .boardlist #recnt{
	    	width:6%
	    }
	    
	    .boardlist:hover{
	    	background-color:#EBE2CE;
	    	border : 1px solid #FFB619;
	    }
	    
	    .insbtn{
	    	width:80px;
	    	height:40px;
	    	background-color:#FFB619;
	    	border:none;
	    	margin:5px;
	    	float:right;
	    	border-radius:50px 50px 50px 50px;
	    }
	    .insbtn:hover{
	    	background-color:black;
	    	color:white;
	    }
	    .insbtn>img{
	    	width:40px;
	    	height:40px;
	    }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(function(){
			  $('.tabcontent > div').hide();
			  $('.tabnav a').click(function () {
			    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
			    $('.tabnav a').removeClass('active');
			    $(this).addClass('active');
			    return false;
			  }).filter(':eq(0)').click();
	  });
	});
</script>
</head>

<body>
  <div class="top-navbar">
    <div>
        <a href="#">회원가입</a>
        <a href="#">Login</a>
        <a href="#">장바구니</a>
        <a href="#">고객센터</a>
    </div>
  </div>
  <div class="top">
    <div class="header">
        <div class="logo">
            <img src="marvel_logo.png" alt="Marvel Logo">
        </div>
        <div class="search-bar">
            <input type="text" placeholder="상품을 검색해 주세요...">
                <img src="search_icon.png"  alt="Search Icon"/>
        </div>
        <div class="icons">
            <img src="history_icon.png" alt="History Icon">
            <img src="profile_icon.png" alt="Profile Icon">
            <img src="cart_icon.png" alt="Cart Icon">

        </div>
    </div>
    	
  </div>
 
  <div class="middle-navbar">
     <div>
         <a href="#">카테고리</a>
         <a href="odunglist">오둥스토어</a>
         <a href="#">망붕스토어</a>
         <a href="#">랭킹</a>
         <a href="boardlist">게시판</a>
    </div>
 </div>
 <div class="tab">
   	<ul class="tabnav">
   		<li><a href="#tab01">공지사항</a></li>
   		<li><a href="#tab02">이벤트</a></li>
   		<li><a href="#tab03">자유게시판</a></li>
   		<li><a href="#tab04">QnA</a></li>
   	</ul>
   	<div class="tabcontent">
   		<div id="tab01">
   		<div id="tabcategori">
			<h2> 공지사항 </h2>
			<hr> 
		</div>
		<div class="board">
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
		<div> 
			<button class="insbtn"><img src="${path}/image/pencil-removebg.png"/></button>
		</div>
			
		</div>
		<div class="anncmnt">
			
		</div>
		</div>
   		<div id="tab02">
   		<div id="tabcategori">
			<h2> 이벤트 </h2>
			<hr> 
		</div>
			<div class="board">
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
		<div> 
			<button class="insbtn"><img src="${path}/image/pencil-removebg.png"/></button>
		</div>
			
		</div>
		</div>
   		<div id="tab03">
   		<div id="tabcategori">
   			<h2> 자유 게시판 </h2>
   			<hr>
   		</div>
   			<div class="board">
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
		<div> 
			<button class="insbtn"><img src="${path}/image/pencil-removebg.png"/></button>
		</div>
			
		</div> 

   		</div>
   		<div id="tab04">
   		<div id="tabcategori">
   			<h2> Q n A </h2>
   			<hr>
   		</div>
   			<div class="board">
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
			<div class="boardlist">
				<div id="no">No</div>
				<div id="title">제목</div>
				<div id="user">작성자</div>
				<div id="registration">등록일</div>
				<div id="correction">수정일</div>
				<div id="recnt">조회수</div>
			</div>
		<div> 
			<button class="insbtn"><img src="${path}/image/pencil-removebg.png"/></button>
		</div>
			
		</div> 
   	</div>
   	</div>	 
   	

 </div>
</body>
</html>