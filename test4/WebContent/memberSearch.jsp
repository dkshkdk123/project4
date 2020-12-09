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
		<h1 class="tit">회원매출조회</h1>
		<div class="page_help">
			<table border="1" class="tb">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>회원성명</th>
						<th>고객등급</th>
						<th>매출</th>
					</tr>
				</thead>
				<tbody>
				<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	
	String custno, custname, grade, total;
	try{
		conn = DBcon.getConnection();
		String sql = "select a.custno, a.custname, a.grade, sum(b.price) as total ";
		sql +="from member_tbl_02 a join money_tbl_02 b  ON a.custno = b.custno ";
		sql +="group by(a.custno, a.custname, a.grade) order by total desc ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while(rs.next()){
			custno = rs.getString("custno");
			custname = rs.getString("custname");
			grade = rs.getString("grade");
			total = rs.getString("total");
		%>
					<tr>
						<td><%=custno %></td>
						<td><%=custname %></td>
						<td><%=grade %></td>
						<td><%=total %></td>
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