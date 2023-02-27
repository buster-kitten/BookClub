<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%
	String sessionMail = (String)session.getAttribute("sessionMail");
	%>
<title>개인정보 수정</title>
</head>
<body>
	<div class="wrapper">
	<nav>
		<%@include file="../jsp/nav.jsp" %>
    </nav>
	<header>
        <%@include file="../jsp/header.jsp" %>
    </header>
	<%@ include file="../jsp/DBConn.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
		String sql="select * from bc_member where email=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,sessionMail);
		rs=pstmt.executeQuery();
		while(rs.next()) {
	%>
	<div class="memUdWrap">
		<form name="form" method="post" class="memUdForm" action="memberUpdateProcess.jsp">
			<table class="memUdTab">
				<tr>
					<th>이메일</th>
					<td>
					<%=sessionMail %>
					<input type="hidden" name="email" value="<%=sessionMail %>">
					</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><%=rs.getString("name") %></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname"  class="short_in" value="<%=rs.getString("nickname") %>" onfocus="this.value=''"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"  class="short_in" value="<%=rs.getString("phone") %>" onfocus="this.value=''"></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>
						<select name="region" id="region" class="short_sel">
							<option value="서울" <%if (rs.getString("region").equals("서울")) {%> selected<%}%>>서울</option>
							<option value="부산" <%if (rs.getString("region").equals("부산")) {%> selected<%}%>>부산</option>
							<option value="대구" <%if (rs.getString("region").equals("대구")) {%> selected<%}%>>대구</option>
							<option value="인천" <%if (rs.getString("region").equals("인천")) {%> selected<%}%>>인천</option>
							<option value="광주" <%if (rs.getString("region").equals("광주")) {%> selected<%}%>>광주</option>
							<option value="대전" <%if (rs.getString("region").equals("대전")) {%> selected<%}%>>대전</option>
							<option value="울산" <%if (rs.getString("region").equals("울산")) {%> selected<%}%>>울산</option>
							<option value="세종" <%if (rs.getString("region").equals("세종")) {%> selected<%}%>>세종</option>
							<option value="경기" <%if (rs.getString("region").equals("경기")) {%> selected<%}%>>경기</option>
							<option value="강원" <%if (rs.getString("region").equals("강원")) {%> selected<%}%>>강원</option>
							<option value="충북" <%if (rs.getString("region").equals("충북")) {%> selected<%}%>>충북</option>
							<option value="충남" <%if (rs.getString("region").equals("충남")) {%> selected<%}%>>충남</option>
							<option value="전북" <%if (rs.getString("region").equals("전북")) {%> selected<%}%>>전북</option>
							<option value="전남" <%if (rs.getString("region").equals("전남")) {%> selected<%}%>>전남</option>
							<option value="경북" <%if (rs.getString("region").equals("경북")) {%> selected<%}%>>경북</option>
							<option value="경남" <%if (rs.getString("region").equals("경남")) {%> selected<%}%>>경남</option>
							<option value="제주" <%if (rs.getString("region").equals("제주")) {%> selected<%}%>>제주</option>
							<option value="해외" <%if (rs.getString("region").equals("해외")) {%> selected<%}%>>해외</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="joinin_button2" value="수정">
						<input type="reset" class="jcancel_button" value="취소">
					</td>
				</tr>
			</table>	
		</form>
	</div>
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
	<footer>
		<%@include file="../jsp/footer.jsp" %>
	</footer>
	</div>
</body>
</html>