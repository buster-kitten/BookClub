[memberUpdateProcess.jsp]
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String [] val=request.getParameterValues("interest");
	String interest="";
	if(val!=null) {
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)) {
				interest+=val[i];
			}else {
				interest+=val[i] + ",";
			}
		}
	}
	
	String email=request.getParameter("email");
	
	try {
		String sql="update bc_member set interest=? where email=?";
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1,interest);
		System.out.println(interest);
		pstmt.setString(2,email);
		pstmt.executeUpdate();
		%>
		<script>
		alert("로그인해주세요.");
		location.href="../member/login.jsp";
		</script>
		<%
	}catch(Exception e) {
		System.out.println("저장 실패");
		e.printStackTrace();
	}
%>