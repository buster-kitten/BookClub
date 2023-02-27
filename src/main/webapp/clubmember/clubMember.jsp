<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css"/>
<meta charset="UTF-8">
<%
String clubname=request.getParameter("clubname");
String booktitle=request.getParameter("booktitle");
%>
<title><%=clubname %>회원관리</title>
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
		<div class="cm_container">
			<h2><span class="cn_color"><%=clubname %></span> 회원관리</h2>
			<div>
				<p class="cn_subtitle">가입신청회원</p>
				<table border=1 class="cn_tab">
					<tr>
						<th>닉네임</th>
						<th>거주지역</th>
						<th>소개</th>
						<th>관리</th>
					</tr>
					<%@include file="../jsp/DBConn.jsp" %>
					<%
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					String sql="select b.nickname, b.region, b.idx, c.resume from bc_clubmember c, bc_member b where c.idx=b.idx and c.clubname=? and c.booktitle=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,clubname);
					pstmt.setString(2,booktitle);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						String nickname=rs.getString(1);
						String region=rs.getString(2);
						String idx=rs.getString(3);
						String resume=rs.getString(4);
					%>
					<tr>
						<td><%=nickname %></td>
						<td><%=region %></td>
						<td><%=resume %></td>
						<td>
							<a href="../clubmember/permitMemberRequest.jsp?idx=<%=idx %>&clubname=<%=clubname %>&booktitle=<%=booktitle %>" class="permit_butt" onClick="if(!confirm('정말로 승인하시겠습니까?')) return false;">가입승인</a>
							<a href="../clubmember/deleteMemberRequest.jsp?idx=<%=idx %>&clubname=<%=clubname %>&booktitle=<%=booktitle %>" class="deny_butt" onClick="if(!confirm('정말로 거부하시겠습니까?')) return false;">가입거부</a>
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
			<div>
				<p class="cn_subtitle">회원목록</p>
				<table border=1 class="cn_tab2">
					<tr>
						<th>닉네임</th>
						<th>거주지역</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>관리</th>
					</tr>
					<%
					sql="select memberlist from bc_bookclub where clubname=? and booktitle=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,clubname);
					pstmt.setString(2,booktitle);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						String memberlist=rs.getString(1);
						 
						String ML[]=memberlist.split(",");
						for (int i=0;i<ML.length;i++){
							String idx=ML[i];
							sql="select * from bc_member where idx=?";
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1,idx);
							rs=pstmt.executeQuery();
							while(rs.next()) {
								String nickname=rs.getString("nickname");
								String email=rs.getString("email");
								String phone=rs.getString("phone");
								String region=rs.getString("region");							
						%>
						<tr>
							<td><%=nickname %></td>
							<td><%=region %></td>
							<td><%=email %></td>
							<td><%=phone %></td>
							<td>
							<a href="../clubmember/deleteMember.jsp?idx=<%=idx %>&clubname=<%=clubname %>&booktitle=<%=booktitle %>" class="deny_butt">탈퇴처리</a>
						</td>
						</tr>		
						<%
							}
						}								
						
						
					%>
					
					<%
					}
					%>
				</table>
			</div>			
		<%
		}	
		%>
		</div>
	</section>
	</div>
</body>
</html>