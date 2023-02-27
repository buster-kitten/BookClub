<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	
	String clubname=request.getParameter("clubname");
	String booktitle=request.getParameter("booktitle");
	String idx=request.getParameter("idx");
	String region=request.getParameter("region");
	String resume=request.getParameter("resume");
	
	try {
		String sql="insert into bc_clubmember values (?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,idx);
		pstmt.setString(2,clubname);
		pstmt.setString(3,booktitle);	
		pstmt.setString(4,resume);
		pstmt.setString(5,region);
		pstmt.executeUpdate();
		%>
		<script>
		alert("가입신청이 완료되었습니다.");
		location.href="bookclub.jsp?clubname=<%=clubname%>&booktitle=<%=booktitle%>";
		</script>
		<%
		
	}catch(Exception e) {
		System.out.println("가입신청 실패");
		e.printStackTrace();
	}
%>