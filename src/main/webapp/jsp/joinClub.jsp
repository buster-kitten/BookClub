<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북클럽 가입</title>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-3.6.1.min.js"></script>
<script>
</script>
</head>
<body>
	<div class="joinclubback">
		<%@include file="../jsp/DBConn.jsp" %>
		<%
		String clubname=request.getParameter("clubname");
		String sessionNick = (String)session.getAttribute("sessionNick");
		String sessionMail = (String)session.getAttribute("sessionMail");
		int sessionIdx = (int)session.getAttribute("sessionIdx");

			if(sessionNick==null) {		
		%>
		<script>
			alert("먼저 로그인 하십시오.")
			location.href="../member/login.jsp?from=../jsp/index.jsp";
			/*
			location.href="../member/login.jsp?from=../jsp/joinClub.jsp?clubname=<%=clubname%>";
			*/
		</script>
		<%}else {
				session.setMaxInactiveInterval(1800);
		%> 
		<div class="joinclubWrap">
			<%
			PreparedStatement pstmt=null;
			ResultSet rs=null;		
						
			String sql="select * from bc_bookclub where clubname=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,clubname);
			rs=pstmt.executeQuery();
			while(rs.next()) {
					String booktitle=rs.getString("booktitle");
					String way=rs.getString("way");
					String c_region=rs.getString("region");
			%>
			<form name="joinClub" method="post" action="joinClubProcess.jsp" class="joinclubform" onsubmit="return check()">
				<h2>가입 신청서</h2>
				<div class="addClubInfo">
				<span class="jointit">클럽명</span><p><%=clubname %></p>
				</div>
				<div class="addClubInfo">
				<span class="jointit">도서명</span><p><%=booktitle %></p>
				</div>
				<div class="addClubInfo">
				<span class="jointit">방식</span><p id="way"><%=way%></p>
				</div>
				<div class="addClubInfo">
				<span class="jointit">지역</span><p><%=c_region%></p>
				</div>
				<div class="addClubInfo">
					<label for="nickname" class="jointit">닉네임</label>
					<input type="text" name="nickname" id="nickname" class="basic_in" value="<%=sessionNick%>" readonly>
					<input type="hidden" name="idx" value="<%=sessionIdx%>">
				</div>
				<div class="addClubInfo" id="regionarea">
					<%
					sql="select region from bc_member where idx=? and email=? and nickname=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1,sessionIdx);
					pstmt.setString(2,sessionMail);
					pstmt.setString(3,sessionNick);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						String region=rs.getString(1);
					%>
					<label for="region" class="jointit">거주지역</label>
					<select name="region" id="region" class="basic_sel">
						<option value="서울" <%if (region.equals("서울")) {%> selected<%}%>>서울</option>
						<option value="부산" <%if (region.equals("부산")) {%> selected<%}%>>부산</option>
						<option value="대구" <%if (region.equals("대구")) {%> selected<%}%>>대구</option>
						<option value="인천" <%if (region.equals("인천")) {%> selected<%}%>>인천</option>
						<option value="광주" <%if (region.equals("광주")) {%> selected<%}%>>광주</option>
						<option value="대전" <%if (region.equals("대전")) {%> selected<%}%>>대전</option>
						<option value="울산" <%if (region.equals("울산")) {%> selected<%}%>>울산</option>
						<option value="세종" <%if (region.equals("세종")) {%> selected<%}%>>세종</option>
						<option value="경기" <%if (region.equals("경기")) {%> selected<%}%>>경기</option>
						<option value="강원" <%if (region.equals("강원")) {%> selected<%}%>>강원</option>
						<option value="충북" <%if (region.equals("충북")) {%> selected<%}%>>충북</option>
						<option value="충남" <%if (region.equals("충남")) {%> selected<%}%>>충남</option>
						<option value="전북" <%if (region.equals("전북")) {%> selected<%}%>>전북</option>
						<option value="전남" <%if (region.equals("전남")) {%> selected<%}%>>전남</option>
						<option value="경북" <%if (region.equals("경북")) {%> selected<%}%>>경북</option>
						<option value="경남" <%if (region.equals("경남")) {%> selected<%}%>>경남</option>
						<option value="제주" <%if (region.equals("제주")) {%> selected<%}%>>제주</option>
						<option value="제주" <%if (region.equals("해외")) {%> selected<%}%>>해외</option>
					</select>
					<%
					}
					%>
				</div>
				<div class="addClubInfo">
					<label for="resume" class="jointit">가입 신청</label>
					<textarea name="resume" id="resume" cols="10" rows="10" class="basic_textarea" onfocus="this.value=''">'<%=clubname %>'에 가입하고 싶습니다.</textarea>
				</div>
				<div class="addClubInfo">
					<input type="hidden" name="clubname" value="<%=clubname%>">
					<input type="hidden" name="booktitle" value="<%=booktitle%>">
					<input type="submit" class="joinin_button2" value="가입신청">
					<input type="reset" value="취소" class="jcancel_button">
				</div>
			</form>
		</div>
		<%
			}
		}
		%>
	</div>
</body>
</html>