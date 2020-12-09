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
	.tb td{padding: 10px; text-align:center;}
	.tb2{text-align:left;}
	input{height: 40px; width: 200px;}
	button{width: 150px; height: 50px; margin: 25px auto;text-align:center;}
</style>
</head>
<body>

<%@ include file = "nav.jsp" %>

<main class="content">
	<section class="page">
		<h1 class="tit">홈쇼핑 회원 정보 수정</h1>
		<div class="page_help">
			<form action="memberEditPro.jsp" id="register" name="register" method="post">
				<table border="1" class="tb">
					<tbody>
					<%
					request.setCharacterEncoding("utf-8");
				
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs;
					
					String custno = request.getParameter("custno");
					String custname, phone, address, joindate, grade, city;
					try{
						conn = DBcon.getConnection();
						String sql = "select * from member_tbl_02 where custno=? ";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, custno);
						rs = pstmt.executeQuery();
								
						while(rs.next()){
							custname = rs.getString("custname");
							phone = rs.getString("phone");
							address = rs.getString("address");
							joindate = rs.getString("joindate");
							grade = rs.getString("grade");
							city = rs.getString("city");
							joindate = joindate.substring(0, 10);
						
					%>
						<tr>
							<td><label for="custno">회원번호</label></td>
							<td><input type="text" id="custno" name="custno" value="<%=custno %>"/></td>
						</tr>
						<tr>
							<td><label for="custname">회원성명</label></td>
							<td><input type="text" id="custname" name="custname" value="<%=custname %>"/></td>
						</tr>
						<tr>
							<td><label for="phone">회원전화</label></td>
							<td><input type="text" id="phone" name="phone" value="<%=phone %>"/></td>
						</tr>
							<tr>
							<td><label for="address">회원주소</label></td>
							<td><input type="text" id="address" name="address" value="<%=address %>"/></td>
						</tr>
						<tr>
							<td><label for="joindate">가입일자</label></td>
							<td><input type="text" id="joindate" name="joindate" value="<%=joindate %>"/></td>
						</tr>
						<tr>
							<td><label for="grade">고객등급[A:VIP,B:일반,C:직원]</label></td>
							<td><input type="text" id="grade" name="grade" value="<%=grade %>"/></td>
						</tr>
						<tr>
							<td><label for="city">도시코드</label></td>
							<td><input type="text" id="city" name="city" value="<%=city %>"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="submit_btn" name="submit_btn">수정</button>
								<button type="button" id="search_btn" name="search_btn">조회</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</form>
			<script> 
				var form = document.register;
				var submit_btn = document.getElementById("submit_btn");
				var search_btn = document.getElementById("search_btn");
				var custno = form.custno;
				var custname = form.custname;
				var phone = form.phone;
				var address = form.address;
				var grade = form.grade;
				var city = form.city;
				 
				
				submit_btn.addEventListener("click",function(){
					if(custno.value==""){
						alert("회원번호가 입력되지 않았습니다.");
						custno.focus();
						return;
					}
					if(custname.value==""){
						alert("회원성명이 입력되지 않았습니다.");
						custname.focus();
						return;
					}
					if(phone.value==""){
						alert("전화번호가 입력되지 않았습니다.");
						phone.focus();
						return;
					}
					if(address.value==""){
						alert("주소가 입력되지 않았습니다.");
						address.focus();
						return;
					}
					if(grade.value==""){
						alert("등급이 입력되지 않았습니다.");
						grade.focus();
						return;
					}
					if(city.value==""){
						alert("도시코드가 입력되지 않았습니다.");
						city.focus();
						return;
					}
					if(custno.value!="" && custname.value!="" && phone.value!="" && address.value!="" && grade.value!="" && city.value!=""){
						form.submit();
					}	
				});
				search_btn.addEventListener("click",function(){
					location.href="memberList.jsp";
				});
			</script>
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