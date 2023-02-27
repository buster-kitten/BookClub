<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css"/>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="bc_wrap">
		<%@include file="../jsp/DBConn.jsp" %>
		<%
		String sessionNick = (String)session.getAttribute("sessionNick");
		String sessionMail = (String)session.getAttribute("sessionMail");
		if(sessionNick==null) {
		%>
			<script>
				alert("먼저 로그인 하십시오.")
				location.href="../member/login.jsp?from=../member/mypage.jsp";
			</script>
		<%}else {
			session.setMaxInactiveInterval(1800);
		%> 
		<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
				
			String sql="select * from bc_likedclub where email=?";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {

		%>
		<a href="bookclub.jsp?clubname=<%=rs.getString("clubname")%>" class="bc_container">
			<img src="<%=request.getContextPath()%>/thumbnail/<%=rs.getString("representimg")%>" class="bc_thumbnail">
					
			<h2><%=rs.getString("clubname") %></h2>		
			<table class="bctab">				
				<tr>
					<th>클럽장</th>
					<td><%=rs.getString("president") %></td>
				</tr>
				<tr>
					<th>정원</th>
					<td><%=rs.getString("capacity") %></td>
				</tr>
				<tr>
					<th>참여방식</th>
					<td><%=rs.getString("way") %></td>
				</tr>
				<tr>
					<th>지역</th>
					<%String region=rs.getString("region");
					if(region==null) {
						region="-";
					}
					%>
					<td><%=region %></td>
				</tr>
			</table>
		</a>					
		<%
			}
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(conn!=null){
				conn.close();
			}
		%>
	</div>
</body>
</html>