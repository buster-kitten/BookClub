<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String email=request.getParameter("email");
	String nickname=request.getParameter("nickname");
	String phone=request.getParameter("phone");
	String region=request.getParameter("region");
	
	try {
		String sql="update bc_member set nickname=?,phone=?,region=? where email=?";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1,nickname);
		pstmt.setString(2,phone);
		pstmt.setString(3,region);
		pstmt.setString(4,email);
		pstmt.executeUpdate();
		%>
		<script>
		alert("회원정보 수정에 성공하였습니다.");
		location.href="../member/memberUpdate.jsp";
		</script>
		<%
	}catch(Exception e) {
		System.out.println("저장 실패");
		e.printStackTrace();
	}
%>