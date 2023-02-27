<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<!-- 로고 -->
    <a href="../jsp/index.jsp" class="logo"><img src="../images/KakaoTalk_20230129_165221377.png"></a>
    <!-- 검색 -->
    <%String keyword=request.getParameter("keyword");
    	System.out.println(keyword);
    %>
    <form name="searchform" method="post" class="searchform" action="../jsp/search.jsp" onsubmit="return check()">
    	<input type="text" class="in_search" name="keyword" placeholder="">
    	<input type="submit" class="search_submit" value="">
    </form>
</body>
</html>