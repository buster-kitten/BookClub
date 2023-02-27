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

			String ML[]=memberlist_origin.split(",");
			
			for (int i=0;i<ML.length;i++){
				if(ML[i].equals(idx)){
					int index=memberlist_origin.indexOf(idx);
					int commaindex=index+1;
					
					String deletecomma = memberlist_origin.substring(index,commaindex+1)+"";			
					String delete = memberlist_origin.replaceFirst(idx, "");
					String new_memberlist = memberlist_origin.replaceFirst(deletecomma, "");

					
					try {
						sql="update bc_bookclub set memberlist=? where clubname=? and booktitle=?";
						pstmt=conn.prepareStatement(sql);
						
						pstmt.setString(1,new_memberlist);
						pstmt.setString(2,clubname);
						pstmt.setString(3,booktitle);				
						pstmt.executeUpdate();	
						
						%>
						<script>
						alert("탈퇴처리 성공")
						history.back(-1);
						</script>
						<%
						
					}catch(Exception e) {
						System.out.println("탈퇴처리 실패");
						e.printStackTrace();
					}
							
				}
			}

	}
%>