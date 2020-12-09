<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*, java.net.*, java.util.*, java.text.*" %>
<%@ page import ="test4.DBcon" %>


<header class="hd">
		<div class="hd_main">
			<h1 class="title">쇼핑몰 회원관리 ver 1.0</h1>
		</div>
	</header>
	<nav class="gnb">
		<ul class="lst">
			<li><a href="memberIns.jsp">회원등록</a></li>
			<li><a href="memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="memberSearch.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>