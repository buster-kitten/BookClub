<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../jsp/DBConn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String idx=request.getParameter("idx");
	String clubname=request.getParameter("clubname");
	String booktitle=request.getParameter("booktitle");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
		String sql="delete from bc_clubmember where idx=? and clubname=? and booktitle=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.setString(2, clubname);
		pstmt.setString(3, booktitle);
		rs=pstmt.executeQuery();
		pstmt.executeUpdate();
		%>
		<script>
				alert("삭제 성공")
				history.back(-1);
		</script>
		<%
	}catch(Exception e) {
		System.out.println("삭제 실패");
		e.printStackTrace();
	}
%>
