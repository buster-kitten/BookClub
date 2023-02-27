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
		<div class="my_joinedclub">
			<h2>가입한 클럽</h2>
			<div class="mc_wrap">
			<%@include file="../jsp/DBConn.jsp" %>
			<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select joinedclub from bc_member where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sessionMail);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String joinedclub=rs.getString(1);
				String JC[]=joinedclub.split(",");
				
				for (int i=0;i<JC.length;i++){
					sql="select capacity,booktitle,to_char(duedate,'YYYY-MM-DD'),way,region,representimg from bc_bookclub where clubname=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,JC[i]);
					rs=pstmt.executeQuery();
					while(rs.next()) {				
						int capacity=rs.getInt(1);
						String booktitle=rs.getString(2);
						String duedate=rs.getString(3);
						String way=rs.getString(4);
						String region=rs.getString(5);
						String representimg=rs.getString(6);
					%>
					
					<a href="../member/madeclub.jsp?clubname=<%=JC[i]%>&booktitle=<%=booktitle%>&president=<%=sessionNick %>">
					<div class="mc_container">
					<img src="<%=request.getContextPath()%>/thumbnail/<%=representimg%>" class="mbcs_thumbnail">
					<table class="mctab">
						<tr>
							<th colspan=2 class="mc_clubname"><%=JC[i]%></th>
						</tr>
						<tr>
							<th colspan=2 class="mc_booktitle"><%=booktitle %></th>
						</tr>				
						<tr>
							<th>정원</th>
							<td><%=capacity %></td>
						</tr>
						<tr>
							<th>모집 마감</th>
							<td><%=duedate%></td>
						</tr>
						<tr>
							<th>참여방식</th>
							<td><%=way%></td>
						</tr>
						<tr>
							<th>지역</th>
							<%
							if(region==null) {
								region="-";
							}
							%>
							<td><%=region %></td>
						</tr>
					</table>
					</div>
				</a>		
					
					
					
					<%
					
					
				}
			}
			}
			
			%>
			
			
			</div>
		</div>
		<div class="my_madeclub">
			<h2>만든 클럽</h2>
			<div class="mc_wrap">			
			<%
			sql="select nickname from bc_member where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sessionMail);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String nickname=rs.getString(1);
				
				sql="select clubname, capacity,booktitle,to_char(duedate,'YYYY-MM-DD'),way,region,representimg from bc_bookclub where president=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,nickname);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					String clubname=rs.getString(1);					
					int capacity=rs.getInt(2);
					String booktitle=rs.getString(3);
					String duedate=rs.getString(4);
					String way=rs.getString(5);
					String region=rs.getString(6);
					String representimg=rs.getString(7);
			%>
			<a href="../member/madeclub.jsp?clubname=<%=clubname%>&booktitle=<%=booktitle%>&president=<%=nickname %>">
			<div class="mc_container">
			<img src="<%=request.getContextPath()%>/thumbnail/<%=representimg%>" class="mbcs_thumbnail">	
			<table class="mctab">
				<tr>
					<th colspan=2 class="mc_clubname"><%=clubname%></th>
				</tr>
				<tr>
					<th colspan=2 class="mc_booktitle"><%=booktitle %></th>
				</tr>				
				<tr>
					<th>정원</th>
					<td><%=capacity %></td>
				</tr>
				<tr>
					<th>모집 마감</th>
					<td><%=duedate%></td>
				</tr>
				<tr>
					<th>참여방식</th>
					<td><%=way%></td>
				</tr>
				<tr>
					<th>지역</th>
					<%
					if(region==null) {
						region="-";
					}
					%>
					<td><%=region %></td>
				</tr>
				<tr>

					</td>
				</tr>
			</table>
			</div>
		</a>				
		<%
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