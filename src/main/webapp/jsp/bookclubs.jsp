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
			PreparedStatement pstmt=null;
			ResultSet rs=null;
				
			String sql="select c.clubname, c.booktitle, c.president, c.capacity, to_char(c.duedate,'YYYY-MM-DD'), c.way, c.region, c.representimg, b.theme from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and rownum<=3 order by timestamp desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String clubname=rs.getString(1);
				String booktitle=rs.getString(2);
				String president=rs.getString(3);
				int capacity=rs.getInt(4);
				String duedate=rs.getString(5);
				String way=rs.getString(6);
				String region=rs.getString(7);
				String representimg=rs.getString(8);
				String theme=rs.getString(9);

		%>
		<a href="bookclub.jsp?clubname=<%=clubname%>&booktitle=<%=booktitle%>" class="bc_container">
			<img src="<%=request.getContextPath()%>/thumbnail/<%=representimg%>" class="bcs_thumbnail">
			<h2 class="clubname"><%=clubname%></h2>		
			<table class="bctab">
				<tr>
					<th colspan=2 class="booktitle"><%=booktitle %></th>
				</tr>				
				<tr>
					<th>클럽장</th>
					<td><%=president%></td>
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
					<td colspan=2 class="clubsthemetab">
					<% 
						String TH[]=theme.split(",");
						for (int i=0;i<TH.length;i++){
					%>		
							<a href="../jsp/search.jsp?keyword=<%=TH[i] %>" class="theme_butt"><%=TH[i]%></a>												
					<%
						}								
					%>
					</td>
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