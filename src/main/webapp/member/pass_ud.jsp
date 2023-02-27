<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script>
function checkpass() {
	if(document.form.PW.value!=document.form.password.value){
		alert("비밀번호를 확인하세요.");
		return false;
	}
	document.form.submit();
}
</script>
</head>
<body>
	<div class="wrapper">
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
	    <%@ include file="../jsp/DBConn.jsp" %>
		<%
		request.setCharacterEncoding("UTF-8");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String PASS="";	
		System.out.println(sessionMail);
		try {
			String sql="select password from bc_member where email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,sessionMail);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String password=rs.getString(1);
		%>
	<section>
		<div class="passudwrap"> 
		    <form name="form" method="post" class="passudform" action="memberUpdate.jsp" onsubmit="return check()">
		    	<label class="jointit">비밀번호 확인</label><br>
		    	<input type="hidden" name="email" value="<%=sessionMail%>">
		    	<input type="hidden" name="password" value="<%=password%>">
		    	<input type="password" name="PW" value="<%=PASS%>" class="short_in2"><br>
		    	<input type="button" value="확인" class="joinin_button2" onclick="checkpass()">
		    	<input type="reset" class="jcancel_button" value="취소">
		    </form>
	    </div>
	</section>
	    <% 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	    %>   
    <footer>
		<%@include file="../jsp/footer.jsp" %>
	</footer>
	<%}%>
	</div>
</body>
</html>