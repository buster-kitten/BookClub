<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@ include file="../jsp/DBConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북클럽 수정</title>
<link rel="stylesheet" href="../css/style.css">
<script src="../js/jquery-3.6.1.min.js"></script>
<script>
function getCheckboxValue()  {
	  const query = 'input[name="theme"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  let result = '';
	  selectedEls.forEach((el) => {
	    result += '#'+el.value + ' ';	    
	  });

	  document.getElementById('result').innerText
	    = result;
	}
	
function printName()  {
	  const theme2 = document.getElementById('themetext').value;
	  document.getElementById("result2").innerText += ' #'+theme2;
	  document.getElementById("theme2").value += theme2+',';
	}
	
$(document).ready(function() {
	$("input:checkbox").on('click', function() {
	      if ( $(this).prop('checked') ) {
	        $(this).next().css({"background-color":"#ddd"});
	      } else {
	    	  $(this).next().css({"background-color":"#fff"});
	      }
	    });
	});
</script>
</head>
<body>
	<div class="addClubback2">
		<%
		request.setCharacterEncoding("UTF-8");

		String filename="";
		String realFolder="D:\\bookclub\\bookclub\\src\\main\\webapp\\thumbnail";
		String encType="utf-8";
		int maxSize=10*1024*1024;

		MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

		@SuppressWarnings("rawtypes")
		Enumeration files=multi.getFileNames();
		String fname=(String)files.nextElement();
		String representimg=multi.getFilesystemName(fname);
				
		String sessionMail = (String)session.getAttribute("sessionMail");
		
		String clubname=multi.getParameter("clubname");
		String booktitle=multi.getParameter("booktitle");
		String president=multi.getParameter("president");
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select description from bc_bookclub where clubname=? and booktitle=? and president=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,clubname);
			pstmt.setString(2,booktitle);
			pstmt.setString(3,president);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String description=rs.getString(1);
				
		%>
		<form name="newClub"  method="post" action="updateClubProcess.jsp" class="addClubform" enctype="multipart/form-data" onsubmit="return check()">
			<h2>클럽 수정</h2>
			<div class="addClubInfo">
				<label for="description" class="jointit">클럽 소개</label>
				<textarea name="description" id="description" cols="10" rows="10" class="basic_textarea" onfocus="this.value=''"><%=description %></textarea>
			</div>
			<div class="addClubInfo">
				<p class="jointit">주제</p>
				<fieldset class="myinterest">
				<legend>&nbsp;&nbsp;내 관심사에서 가져오기&nbsp;&nbsp;</legend>
				<%			
				
				try {
					sql="select interest from bc_member where email=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, sessionMail);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String theme=rs.getString(1);					
						String interest[]=theme.split(",");
						for (int i=0;i<interest.length;i++){							
				%>
					<input type="checkbox" name="theme" id="<%=interest[i] %>" value="<%=interest[i] %>" onclick='getCheckboxValue(event)'><label for="<%=interest[i] %>"><%=interest[i] %></label>&nbsp;
				<%
							}
						}
					}catch(Exception e){
						System.out.println("테마를 불러오는 데 실패하였습니다.");
						e.printStackTrace();
					}
				%>
				</fieldset>		
			
			<fieldset class="inputinterest">
			<legend>&nbsp;&nbsp;직접 입력하기&nbsp;&nbsp;</legend>
				<input type="text" name="themetext" id="themetext" onchange='printName()' onfocus="this.value=''" class="basic_in2">
				<input type="hidden" name="theme2" id="theme2">
			</fieldset>
			<div class="hashtaglist">
				<p>
				<span id="result"></span>
				<span id="result2"></span>
				</p>				
			</div>
			</div>
			<div class="addClubInfo">
				<input type="hidden" name="clubname" value="<%=multi.getParameter("clubname") %>">
				<input type="hidden" name="capacity" value="<%=multi.getParameter("capacity") %>">
				<input type="hidden" name="booktitle" value="<%=multi.getParameter("booktitle") %>">
				<input type="hidden" name="representimg" value="<%=representimg %>">
				<input type="hidden" name="author" value="<%=multi.getParameter("author") %>">
				<input type="hidden" name="publisher" value="<%=multi.getParameter("publisher") %>">
				<input type="hidden" name="cycle" value="<%=multi.getParameter("cycle") %>">
				<input type="hidden" name="unit" value="<%=multi.getParameter("unit") %>">
				<input type="hidden" name="plan" value="<%=multi.getParameter("plan") %>">
				<input type="hidden" name="duedate" value="<%=multi.getParameter("duedate") %>">
				<input type="hidden" name="recentdate" value="<%=multi.getParameter("recentdate") %>">				
				<input type="hidden" name="way" value="<%=multi.getParameter("way") %>">
				<input type="hidden" name="region" value="<%=multi.getParameter("region") %>">
				<input type="hidden" name="president" value="<%=multi.getParameter("president") %>">
				<input type="hidden" name="memberlist" value="<%=multi.getParameter("memberlist") %>">
				<input type="submit" class="joinin_button2" value="완료">
				<input type="reset" value="취소" class="jcancel_button">
			<%			
			System.out.println(multi.getParameter("clubname")+"/"+multi.getParameter("capacity")+"/"
			+multi.getParameter("booktitle")+"/"+multi.getParameter("author")+"/"+multi.getParameter("publisher")+"/"+representimg+"/"+multi.getParameter("cycle")+"/"
			+multi.getParameter("unit")+"/"+multi.getParameter("plan")+"/"+multi.getParameter("recentdate")+"/"+multi.getParameter("duedate")+"/"
			+multi.getParameter("way")+"/"+multi.getParameter("region")+"/"+multi.getParameter("president")+"/"
			+multi.getParameter("memberlist"));
			%>
			</div>
		</form>
		<%
				}
			}catch(Exception e) {
				System.out.println("수정 실패");
				e.printStackTrace();
			}
		%>
	</div>
</body>
</html>