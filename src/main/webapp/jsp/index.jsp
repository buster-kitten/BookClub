<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="../css/style.css">
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
	    	<div class="banner">
	    		<img src="../images/KakaoTalk_20230129_165220978.png" class="banner_img">
	    		<h2>BOOKCLUB이란?</h2>
	    		<p>: 언제 어디서나 간편하게<br>독서 모임 조직 및 문영을 돕는 서비스</p>
	    	</div>
		    <div class="newclub">
		    	<a href="../jsp/addClub.jsp">
		    		<img src="../images/KakaoTalk_20230129_165220374.png" class="newclub_img">
		    		<p>새로운 북클럽 만들기</p>
		    	</a>
		    </div>
		    <div class="club_list">
		        <%@include file="../jsp/bookclubs.jsp" %>
		    </div>
	    </section>
	    <footer>
			<%@include file="../jsp/footer.jsp" %>
	    </footer>
    </div>
</body>
</html>