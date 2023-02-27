<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="wrapper">
		<nav>
	        <%@include file="../jsp/nav.jsp" %>
	    </nav>
	    <header>
	    	<%@include file="../jsp/DBConn.jsp" %>
	    	<%
				ResultSet rs=null;
				PreparedStatement pstmt=null;
				String keyword=request.getParameter("keyword");
				int cnt=0;
			%>
	        <!-- 로고 -->
    <a href="../jsp/index.jsp" class="logo"><img src="../images/KakaoTalk_20230129_165221377.png"></a>
		    <!-- 검색 -->
		    <form name="searchform" method="post" class="searchform" action="../jsp/search.jsp" onsubmit="return check()">
		    	<input type="text" class="in_search" name="keyword" value="<%=keyword%>" onfocus="this.value=''">
		    	<input type="submit" class="search_submit" value="">
		    </form>
	    </header>		
	    <section>
	   	 	<div class="search_section">	    	
			<%
				try{
					String sql="select count(*) from bc_bookclub where clubname like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
					cnt=rs.getInt(1);
					}
				}catch(Exception e){
					System.out.println("클럽 목록을 불러오는 데 실패하였습니다.");
					e.printStackTrace();
					}
			%>
			<h2>클럽명 검색결과</h2>
			<p class="search_cnt"> 조회 결과 : <%=cnt %>건</p>
			<div class="search_wrap">
			<%
				try {
					String sql="select c.clubname, c.capacity, b.theme, c.booktitle, to_char(c.duedate,'YYYY-MM-DD'), c.description, c.timestamp from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and c.clubname like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String clubname=rs.getString(1);						
						int capacity=rs.getInt(2);
						String theme=rs.getString(3);
						String booktitle=rs.getString(4);						
						String duedate=rs.getString(5);						
						String description=rs.getString(6);						
						String timestamp=rs.getString(7);
						
				%>				
					<a href="../jsp/bookclub.jsp?clubname=<%=clubname%>">
						<table border=1 class="search_tab">
							<tr>
								<th colspan=4><%=clubname %></th>
							</tr>
							<tr>
								<th>도서명</th>
								<td><%=booktitle %></td>
								<th>모집기한</th>
								<td><%=duedate %></td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td><%=capacity %></td>
								<th>마감여부</th>
								<td></td>
							</tr>
							<tr>
								<td colspan=4><%=description %></td>
							</tr>
							<tr>
								<td colspan=4 class="no_hover">
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
					}catch(Exception e) {
						System.out.println("DB 오류");
						e.printStackTrace();
					}
				%>
				</div>
				<%
				int cnt2=0;
				try{
					String sql="select count(*) from bc_bookclub where booktitle like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
					cnt2=rs.getInt(1);
					}
				}catch(Exception e){
					System.out.println("도서명을 불러오는 데 실패하였습니다.");
					e.printStackTrace();
					}
				%>
				<h2>도서명 검색결과</h2>
				<p class="search_cnt"> 조회 결과 : <%=cnt2 %>건</p>
				<div class="search_wrap">
				<%
				try {
					String sql="select c.clubname, c.capacity, b.theme, c.booktitle, to_char(c.duedate,'YYYY-MM-DD'), c.description, c.timestamp from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and c.booktitle like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String clubname=rs.getString(1);						
						int capacity=rs.getInt(2);
						String theme=rs.getString(3);
						String booktitle=rs.getString(4);						
						String duedate=rs.getString(5);						
						String description=rs.getString(6);						
						String timestamp=rs.getString(7);
						
				%>				
					<a href="../jsp/bookclub.jsp?clubname=<%=clubname%>">
						<table border=1 class="search_tab">
							<tr>
								<th colspan=4><%=booktitle %></th>
							</tr>
							<tr>
								<th>클럽명</th>
								<td><%=clubname %></td>
								<th>모집기한</th>
								<td><%=duedate %></td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td><%=capacity %></td>
								<th>마감여부</th>
								<td></td>
							</tr>
							<tr>
								<td colspan=4><%=description %></td>
							</tr>
							<tr>
								<td colspan=4 class="no_hover">
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
					}catch(Exception e) {
						System.out.println("DB 오류");
						e.printStackTrace();
					}
				%>
				</div>	
				<%
				int cnt3=0;
				try{
					String sql="select count(*) from bc_book where theme like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()){
					cnt3=rs.getInt(1);
					}
				}catch(Exception e){
					System.out.println("주제를 불러오는 데 실패하였습니다.");
					e.printStackTrace();
					}
				%>
				<h2>주제 검색결과</h2>
				<p class="search_cnt"> 조회 결과 : <%=cnt3 %>건</p>
				<div class="search_wrap">
				<%
				try {
					String sql="select c.clubname, c.capacity, b.theme, c.booktitle, to_char(c.duedate,'YYYY-MM-DD'), c.description, c.timestamp from bc_bookclub c, bc_book b where c.clubname=b.clubname and c.booktitle=b.booktitle and b.theme like '%"+keyword+"%'";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String clubname=rs.getString(1);						
						int capacity=rs.getInt(2);
						String theme=rs.getString(3);
						String booktitle=rs.getString(4);						
						String duedate=rs.getString(5);						
						String description=rs.getString(6);						
						String timestamp=rs.getString(7);				
				%>
				
					<a href="../jsp/bookclub.jsp?clubname=<%=clubname%>">
						<table border=1 class="search_tab">
							<tr>
								<td colspan=4 class="no_hover">
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
							<tr>
								<th colspan=4><%=clubname %></th>
							</tr>
							<tr>
								<th>도서명</th>
								<td><%=booktitle %></td>
								<th>모집기한</th>
								<td><%=duedate %></td>
							</tr>
							<tr>
								<th>모집인원</th>
								<td><%=capacity %></td>
								<th>마감여부</th>
								<td></td>
							</tr>
							<tr>
								<td colspan=4><%=description %></td>
							</tr>						
						</table>
					</a>
				
				<%
						}
					}catch(Exception e) {
						System.out.println("DB 오류");
						e.printStackTrace();
					}
				%>
				</div>
			</div>
	    </section>
	    <footer>
			<%@include file="../jsp/footer.jsp" %>
	    </footer>
    </div>
</body>
</html>