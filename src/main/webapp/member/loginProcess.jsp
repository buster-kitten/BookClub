<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String recentURI = request.getParameter("from");
	
	String PASS="";
	try {
		String sql="select password,nickname,idx from bc_member where email=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			PASS=rs.getString(1);
			String nickname=rs.getString(2);
			int idx=rs.getInt(3);
			
			if(password.equals(PASS)) {
				session.setAttribute("sessionNick",nickname);
				session.setAttribute("sessionMail",email);
				session.setAttribute("sessionIdx",idx);
				response.sendRedirect(recentURI);
			}else {
				%>
				<script>
				alert("패스워드가 일치하지 많습니다.");
				history.back(-1);
				</script>
				<%
			}
		}else {
			%>
			<script>
				alert("등록되지 않은 id입니다.");
				history.back(-1);
			</script>
			<%
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>