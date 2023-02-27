<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ include file="../jsp/DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="D:\\bookclub\\bookclub\\src\\main\\webapp\\thumbnail";
	String encType="utf-8";
	int maxSize=10*1024*1024;

	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

	String clubname=multi.getParameter("clubname");
	String president=multi.getParameter("president");
	String memberlist=multi.getParameter("memberlist");
	String capacity=multi.getParameter("capacity");	
	String booktitle=multi.getParameter("booktitle");
	String cycle=multi.getParameter("cycle");
	String unit=multi.getParameter("unit");
	String plan=multi.getParameter("plan");
	String duedate=multi.getParameter("duedate");
	String recentdate=multi.getParameter("recentdate");
	String way=multi.getParameter("way");
	String region=multi.getParameter("region");
	String representimg=multi.getParameter("representimg");
	String description=multi.getParameter("description");
	
	String author=multi.getParameter("author");
	String publisher=multi.getParameter("publisher");
	String progress="0";	
	
	String [] val=multi.getParameterValues("theme");
	String theme1="";
	if(val!=null) {
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)) {
				theme1+=val[i];
			}else {
				theme1+=val[i] + ",";
			}
		}
	}
	
	String theme2=multi.getParameter("theme2");	
	String theme=theme2+theme1;

	System.out.println(theme);
	
	try {
	String sql="update bc_bookclub set capacity=?,cycle=?,unit=?,plan=?,duedate=?,recentdate=?,way=?,region=?,representimg=?,description=? where clubname=? and booktitle=? and president=?";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1,capacity);	
	pstmt.setString(2,cycle);
	pstmt.setString(3,unit);
	pstmt.setString(4,plan);
	pstmt.setString(5,duedate);
	pstmt.setString(6,recentdate);
	pstmt.setString(7,way);
	pstmt.setString(8,region);
	pstmt.setString(9,representimg);
	pstmt.setString(10,description);
	pstmt.setString(11,clubname);
	pstmt.setString(12,booktitle);
	pstmt.setString(13,president);
	pstmt.executeUpdate();
	
	sql="update bc_book set representimg=?,author=?,publisher=?,progress=?,theme=? where clubname=? and booktitle=?";
	pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1,representimg);
	pstmt.setString(2,author);
	pstmt.setString(3,publisher);
	pstmt.setString(4,progress);
	pstmt.setString(5,theme);
	pstmt.setString(6,clubname);
	pstmt.setString(7,booktitle);
	pstmt.executeUpdate();
	
	response.sendRedirect("index.jsp");
	%>
	<script>
	alert("저장 성공");
	</script>
	<%
	}catch(Exception e) {
		System.out.println("저장 실패");
		e.printStackTrace();
	}
%>
