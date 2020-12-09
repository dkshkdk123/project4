<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.lang.*, java.net.*, java.util.*, java.text.*" %>
<%@ page import ="test4.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	String str = request.getParameter("custno");
	String ustr = URLDecoder.decode(str, "UTF-8");
	int custno = Integer.parseInt(ustr);
	
	String custname, phone, address, joindate, grade, city;
	try{
		conn = DBcon.getConnection();
		String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		pstmt.setInt(7, custno);
		rs = pstmt.executeQuery();
				
				
	}catch(Exception e){
		System.out.println("join error:"+e);
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			%>
			<script>
			alert("회원 수정 완료!");
			location.href="memberList.jsp";
			</script>
			<% 
		}catch(Exception e){
			System.out.println("DBcon error:"+e);
		}
	}
%>
</body>
</html>