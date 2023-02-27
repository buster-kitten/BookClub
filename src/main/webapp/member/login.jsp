<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<% String recentURI = request.getParameter("from"); 
	%>
	<div class="loginback">	
		<form name="form" method="post" action="loginProcess.jsp?from=<%=recentURI%>" class="loginform">
			<h2>로그인</h2>
			<input type="text" name="email" id="email" placeholder="이메일" class="login_in">
			<input type="password" name="password" id="password" placeholder="비밀번호" class="login_in">
			<input type="submit" class="login_button" value="로그인">
			<a href="joinin.jsp"  class="joinin_button1">회원가입</a>
		</form>
	</div>
</body>
</html>