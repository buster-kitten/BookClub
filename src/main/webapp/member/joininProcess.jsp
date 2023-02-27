<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phone=request.getParameter("phone");
	String password=request.getParameter("password");
	String nickname=request.getParameter("nickname");
	String region=request.getParameter("region");
	String interest=request.getParameter("interest");
	String joinedclub=request.getParameter("joinedclub");
	
	try {
		String sql="insert into bc_member values (?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,idx);
		pstmt.setString(2,email);
		pstmt.setString(3,name);	
		pstmt.setString(4,phone);
		pstmt.setString(5,password);
		pstmt.setString(6,nickname);
		pstmt.setString(7,region);
		pstmt.setString(8,interest);
		pstmt.setString(9,joinedclub);
		pstmt.executeUpdate();
		%>
		<script>
		alert("회원가입이 완료되었습니다. 관심분야를 선택해보세요.");
		location.href="../member/joinin2.jsp?email=<%=email%>";
		</script>
		<%
		
	}catch(Exception e) {
		System.out.println("저장 실패");
		e.printStackTrace();
	}
%>