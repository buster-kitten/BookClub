<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<% 
String clubname=request.getParameter("clubname");  
String booktitle=request.getParameter("booktitle");
String president=request.getParameter("president");
%>
<title><%=clubname %> 관리 화면</title>
<script>

</script>
</head>
<body>
	<div class="wrapper">
		<nav>
	        <%@include file="../jsp/nav.jsp" %>
	    </nav>
		<header>
	        <%@include file="../jsp/header.jsp" %>
	    </header>
		<section>
			<%@include file="../jsp/DBConn.jsp" %>
			<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;		
						
			String sql="select c.memberlist, c.capacity, c.cycle, c.unit, c.plan, to_char(c.duedate,'YYYY-MM-DD'), c.recentdate, c.way, c.region, c.representimg, c.description, b.author, b.publisher, b.progress, b.theme from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and c.clubname=? and c.booktitle=? and c.president=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,clubname);
			pstmt.setString(2,booktitle);
			pstmt.setString(3,president);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String memberlist=rs.getString(1);
				int capacity=rs.getInt(2);
				int cycle=rs.getInt(3);
				String unit=rs.getString(4);
				String plan=rs.getString(5);
				String duedate=rs.getString(6);
				String recentdate=rs.getString(7);
				String way=rs.getString(8);
				String region=rs.getString(9);
				String representimg=rs.getString(10);
				String description=rs.getString(11);
				String author=rs.getString(12);
				String publisher=rs.getString(13);
				String progress=rs.getString(14);
				String theme=rs.getString(15);			
			%>
			<div class="bc_wrap2">
				<div class="themediv">
					<% 
						String TH[]=theme.split(",");
						for (int i=0;i<TH.length;i++){
					%>		
							<a href="../jsp/search.jsp?keyword=<%=TH[i] %>" class="theme_butt"><%=TH[i]%></a>												
					<%
						}								
					%>
				</div>
				<div class="bc_wrap2_top">						
				<img src="<%=request.getContextPath()%>/thumbnail/<%=representimg%>" class="club_thumnail">
				<table class="bctab2">
					<tr>
						<th colspan=2 class="club_clubname"><%=clubname %></th>
					</tr>
					<tr>
						<th>클럽장</th>
						<td><%=president %></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><%=booktitle %></td>
					</tr>
					<tr>
						<th>저자</th>
						<td><%=author %></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td><%=publisher %></td>
					</tr>
					<tr>
						<th>마감</th>
						<td><%=duedate %></td>
					</tr>
					<tr>
						<th colspan=2>
							<a href="../jsp/updateClub.jsp?clubname=<%=clubname %>&booktitle=<%=booktitle %>&president=<%=president %>" class="top_updateclub_butt">수정하기</a>
							<a href="../clubmember/clubMember.jsp?clubname=<%=clubname %>&booktitle=<%=booktitle %>&president=<%=president %>" class="top_clubmember_butt">회원관리</a>
						</th>
					</tr>
				</table>
				</div>	
				<table class="bctab3">		
					<tr>
						<th>주기</th>
						<td><%=cycle %>일</td>
					</tr>
					<tr>
						<th>방식</th>
						<td><%=way %></td>
					</tr>
					<tr>
						<th>지역</th>
						<td><%=region %></td>
					</tr>
					<tr>
						<th>정원</th>
						<td><%=capacity %></td>
					</tr>
					<tr>
						<td colspan="2" class="club_description">
							<p><%=description %></p>
							<div class="made_bbarea">
								<a href="../jsp/updateClub.jsp?clubname=<%=clubname %>&booktitle=<%=booktitle %>&president=<%=president %>" class="updateclub_butt">수정하기</a>
								<a href="../jsp/clubMember.jsp?clubname=<%=clubname %>&booktitle=<%=booktitle %>&president=<%=president %>" class="clubmember_butt">회원관리</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan=2 class="club_theme">
						<% 
						for (int i=0;i<TH.length;i++){
						%>
							<a href="../jsp/search.jsp?keyword=<%=TH[i] %>" class="theme_butt"><%=TH[i]%></a>								
						<%
						}								
						%>
						</td>
					</tr>				
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
				</table>
			</div>
		</section>
		<footer>
	        <%@include file="../jsp/footer.jsp" %>
	    </footer>
    </div>
</body>
</html>