<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	String idx=request.getParameter("idx");
	String clubname=request.getParameter("clubname");
	String booktitle=request.getParameter("booktitle");

	PreparedStatement pstmt=null;
	ResultSet rs=null;		
				
	String sql="select memberlist from bc_bookclub where clubname=? and booktitle=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,clubname);
	pstmt.setString(2,booktitle);
	rs=pstmt.executeQuery();
	while(rs.next()) {
			String memberlist_origin=rs.getString("memberlist");
			String new_memberlist=memberlist_origin+idx+",";

		try {
			sql="update bc_bookclub set memberlist=? where clubname=? and booktitle=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,new_memberlist);
			pstmt.setString(2,clubname);
			pstmt.setString(3,booktitle);				
			pstmt.executeUpdate();
			
			sql="delete from bc_clubmember where idx=? and clubname=? and booktitle=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, clubname);
			pstmt.setString(3, booktitle);
			pstmt.executeUpdate();
			
			String joinedclub=clubname+",";
			sql="update bc_member set joinedclub=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, joinedclub);
			pstmt.setString(2, idx);
			
			%>
			<script>
			alert("가입승인 성공")
			history.back(-1);
			</script>
			<%
			
		}catch(Exception e) {
			System.out.println("가입승인 실패");
			e.printStackTrace();
		}
	}
%>