<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*, java.net.*, java.util.*, java.text.*" %>
<%@ page import ="test4.DBcon" %>

<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<%@ include file = "header.jsp" %>
<style>
	
	.content{clear: both; width: 100%; height: 830px; background: yellow;}
	.page{clear: both;width: 2000px; margin: 0 auto;}
	.tit{padding: 20px; font-size:20px; font-weight:bold; text-align:center;}
	.text{font-size:16px; font-weight:bold; line-height:50px;}
	.lst2{font-size:14px; font-weight:bold;}

</style>
</head>
<body>

<%@ include file = "nav.jsp" %>
	
	<main class="content">
		<section class="page">
			<h1 class="tit">쇼핑몰 회원관리 프로그램</h1>
			<div class="page_help">
				<p class="text">쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.</p>
				<p class="text">프로그램 작성순서</p>
				<ol class="lst2">
					<li>회원정보 테이블을 작성한다.</li>
					<li>매출정보 테이블을 생성한다.</li>
					<li>회원정보,매출정보 테이블을 제시된 문제지의 참조데이터를 추가 생성한다.</li>
					<li>회원정보 입력 화면 프로그램을 작성한다.</li>
					<li>회원정보 조회 프로그램을 작성한다.</li>
					<li>회원매출정보 조회 프로그램을 작성한다.</li>
				</ol>
			</div>
		</section>
	</main>

<%@ include file = "footer.jsp" %>