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
	<%
	String sessionNick = (String)session.getAttribute("sessionNick");
	if(sessionNick==null) {
	%>
	<ul>
    	<li><a href="../member/login.jsp?from=../jsp/index.jsp">로그인</a></li>
    	<li><a href="../member/joinin.jsp">회원가입</a></li>
    </ul>
    <%}else {
			session.setMaxInactiveInterval(1800);
	%> 
	<ul>
		<li><%=sessionNick%>님 환영합니다.</li>
		<li><a href="../member/logout.jsp">로그아웃</a></li>
		<li><a href="../member/mypage.jsp">마이페이지</a></li>	
	<%}%>
	</ul>
</body>
</html>