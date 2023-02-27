<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css"/>
<meta charset="UTF-8">
<title>독서목록</title>
</head>
<body>
	<div class="wrapper">
	<%
	String sessionNick = (String)session.getAttribute("sessionNick");
	String sessionMail = (String)session.getAttribute("sessionMail");
	if(sessionMail==null) {
	%>
		<script>
			alert("먼저 로그인 하십시오.")
			location.href="../member/login.jsp?from=../member/mypage.jsp";
		</script>
	<%}else {
		session.setMaxInactiveInterval(1800);
	%> 
	<nav>
		<ul>
	        <li><%=sessionNick%>님 환영합니다.</li>
			<li><a href="../member/logout.jsp">로그아웃</a></li>
			<li><a href="../member/mypage.jsp">마이페이지</a></li>	
		</ul>
    </nav>
	<header>
        <%@include file="../jsp/header.jsp" %>
    </header>
	<section>
		<div class="my_madeclub">
			<h2>독서 목록</h2>
			<div class="mc_wrap">
			<%@include file="../jsp/DBConn.jsp" %>
			<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select nickname from bc_member where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sessionMail);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String nickname=rs.getString(1);
				
				sql="select clubname, booktitle from bc_bookclub where president=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,nickname);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					String clubname=rs.getString(1);
					String booktitle=rs.getString(2);

					sql="select * from bc_book where clubname=? and booktitle=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,clubname);
					pstmt.setString(2,booktitle);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						String representimg=rs.getString(3);
						String author=rs.getString(4);
						String publisher=rs.getString(5);
						int progress=rs.getInt(6);
			%>
			<a href="../jsp/bookclub.jsp?clubname=<%=clubname%>&booktitle=<%=booktitle%>">
			<div class="mc_container">
			<img src="<%=request.getContextPath()%>/thumbnail/<%=representimg%>" class="mbcs_thumbnail">	
			<table class="mctab">
				<tr>
					<th colspan=2 class="mc_booktitle"><%=booktitle %></th>
				</tr>				
				<tr>
					<th>작가</th>
					<td><%=author %></td>
				</tr>
				<tr>
					<th>출판사</th>
					<td><%=publisher%></td>
				</tr>
				<tr>
					<th>진행도</th>
					<td><%=progress%>%</td>
				</tr>
			</table>
			</div>
		</a>				
		<%
					}
				}
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
		}	
		%>
		</div>
	</section>
	</div>
</body>
</html>