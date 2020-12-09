<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*, java.net.*, java.util.*, java.text.*" %>
<%@ page import ="test4.DBcon" %>

<link rel="stylesheet" href="./css/header.css" />
<link rel="stylesheet" href="./css/footer.css" />
<%@ include file = "header.jsp" %>

<style>
	.content{width: 100%; height: 830px; background: yellow;}
	.page{clear: both; width: 1280px; margin: 0 auto;}
	.tit{font-size:24px; font-weight:bold; text-align:center; padding: 20px;}
	table{width: 960px; margin: 25px auto;}
	.tb td{padding: 20px; text-align:center;}
	.tb2{text-align:left;}
	input{height: 40px; width: 200px;}
	button{width: 150px; height: 50px; margin: 25px auto;text-align:center;}
</style>
</head>
<body>

<%@ include file = "nav.jsp" %>


<main class="content">
	<section class="page">
		<h1 class="tit">홈쇼핑 회원 정보조회</h1>
		<div class="page_help">
			<table border="1" class="tb">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>회원성명</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>거래일자</th>
						<th>고객등급</th>
						<th>거주지역</th>
					</tr>
				</thead>
				<tbody>
				<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	
	String custno,custname, phone, address, joindate, grade, city;
	try{
		conn = DBcon.getConnection();
		String sql = "select * from member_tbl_02 ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while(rs.next()){
			custno = rs.getString("custno");
			custname = rs.getString("custname");
			phone = rs.getString("phone");
			address = rs.getString("address");
			joindate = rs.getString("joindate");
			grade = rs.getString("grade");
			city = rs.getString("city");
			joindate = joindate.substring(0, 10);
		%>
					<tr>
						<td><a href="memberEdit.jsp?custno=<%=custno%>"><%=custno %></a></td>
						<td><%=custname %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=joindate %></td>
						<td><%=grade %></td>
						<td><%=city %></td>
					</tr>
					
					<%
		}
					%>
				</tbody>
			</table>
		</div>
	</section>
</main>
				<% 
	}catch(Exception e){
		System.out.println("join error:"+e);
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(Exception e){
			System.out.println("DBcon error:"+e);
		}
	}
%>
<%@ include file = "footer.jsp" %>