<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String sessionNick = (String)session.getAttribute("sessionNick");
			if(sessionNick==null) {
%>
	<script>
		alert("먼저 로그인 하십시오.")
		location.href="../member/login.jsp?from=../member/mypage.jsp";
	</script>
<%}else {
	session.setMaxInactiveInterval(1800);
%> 
<title><%=sessionNick %>님의 마이페이지</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<div class="wrapper">
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
	<div class="mypage_frame">
		<ul class="mypage_top">
			<li><a href="../member/pass_ud.jsp" class="mp_user"><p>내 정보</p><img src="../images/user-solid.svg"></a></li>
			<li><a href="../member/myclub.jsp" class="mp_myclub"><p>내 클럽 관리</p><img src="../images/users-rectangle-solid.svg"></a></li>
			
		</ul>
		<ul class="mypage_bottom">
			<li><a href="../like/likedclub.jsp" class="mp_interest"><p>관심 클럽 관리</p><img src="../images/bookmark-regular.svg"></a></li>
			<li><a href="../member/readlist.jsp" class="mp_readlist"><p>독서 목록</p><img src="../images/book-solid.svg"></a></li>
		</ul>
	</div>
	<footer>
		<%@include file="../jsp/footer.jsp" %>
	</footer>
	<%}%>
	</div>
</body>
</html>